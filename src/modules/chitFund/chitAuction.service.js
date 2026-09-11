/**
 * chitAuction.service.js
 * Handles auction creation, settlement, and fund ledger entries.
 *
 * CRITICAL RULES (enforced here):
 * - Regular auction amount is ALWAYS chit.regularAuctionAmount (never inflated)
 * - winner payout = auctionAmount - winningBid (server-calculated)
 * - winningBid → WINNING_BID_CREDIT ledger entry
 * - Additional auction → ADDITIONAL_AUCTION_ALLOCATION debit
 * - Each member wins at most once
 * - (chitId, auctionNumber) is unique
 */
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { getAvailableBalance } = require('./chitFund.service');
const notificationService = require('../notification/notification.service');

// ─── Create Auctions for a Month ─────────────────────────────────────────────

/**
 * Creates one or more auctions for a month.
 * Each auction entry must have: auctionNumber, auctionType, auctionDate,
 * winnerId (ChitMember.id), winningBid.
 */
async function createAuctions(chitId, { monthId, auctions: auctionInputs }, adminUserId) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');
  if (chit.status !== 'ACTIVE') throw ApiError.badRequest('Chit fund must be ACTIVE to create auctions');

  const month = await prisma.chitMonth.findFirst({ where: { id: monthId, chitId } });
  if (!month) throw ApiError.notFound('Month not found');
  if (month.status === 'CLOSED') throw ApiError.badRequest('Month is already closed');

  // Get current balance before processing
  let currentBalance = await getAvailableBalance(chitId);

  const results = [];

  // Process each auction sequentially inside a single transaction
  await prisma.$transaction(async (tx) => {
    for (const input of auctionInputs) {
      // 1. Validate auction number uniqueness for this chit
      const existing = await tx.chitAuction.findUnique({
        where: { chitId_auctionNumber: { chitId, auctionNumber: input.auctionNumber } },
      });
      if (existing) {
        throw ApiError.conflict(`Auction #${input.auctionNumber} already exists for this chit fund`);
      }

      // 2. Validate winner
      const winner = await tx.chitMember.findFirst({
        where: { id: input.winnerId, chitId },
        include: { customer: { select: { name: true, phone: true, email: true, id: true } } },
      });
      if (!winner) throw ApiError.notFound(`Winner member not found in this chit`);
      if (winner.status !== 'ACTIVE') throw ApiError.badRequest(`Winner member is not active`);
      if (!winner.auctionEligible) {
        throw ApiError.badRequest(
          `Member "${winner.customer.name}" is not eligible — they have already won an auction in this chit cycle`
        );
      }

      // 3. Determine auction amount
      // RULE: Regular auction is ALWAYS regularAuctionAmount, no carry-forward
      const auctionAmount = Number(chit.regularAuctionAmount);

      // 4. Validate for additional auctions
      if (input.auctionType === 'ADDITIONAL') {
        if (currentBalance < auctionAmount) {
          throw ApiError.badRequest(
            `Insufficient accumulated fund for additional auction. ` +
              `Available: ₹${currentBalance.toFixed(2)}, Required: ₹${auctionAmount.toFixed(2)}`
          );
        }
      }

      // 5. Validate winning bid
      const winningBid = Number(input.winningBid);
      if (winningBid < 0) throw ApiError.badRequest('Winning bid cannot be negative');
      if (winningBid >= auctionAmount) {
        throw ApiError.badRequest(`Winning bid (₹${winningBid}) must be less than auction amount (₹${auctionAmount})`);
      }
      if (winningBid < Number(chit.startingBid)) {
        throw ApiError.badRequest(
          `Winning bid (₹${winningBid}) is below minimum starting bid (₹${Number(chit.startingBid)})`
        );
      }

      // 6. Calculate winner payout (server-side — admin cannot override)
      const winnerPayout = Math.round((auctionAmount - winningBid) * 100) / 100;

      // 7. Create the auction
      const auction = await tx.chitAuction.create({
        data: {
          chitId,
          monthId,
          auctionNumber: input.auctionNumber,
          auctionType: input.auctionType,
          auctionDate: new Date(input.auctionDate),
          auctionAmount,
          startingBid: Number(chit.startingBid),
          winningBid,
          winnerId: winner.id,
          winnerPayout,
          status: 'SETTLED',
          createdById: adminUserId,
        },
      });

      // 8. Create payout record
      await tx.chitPayout.create({
        data: {
          chitId,
          auctionId: auction.id,
          winnerId: winner.id,
          auctionAmount,
          winningBid,
          payoutAmount: winnerPayout,
          status: 'PENDING',
        },
      });

      // 9. Update winner member record
      await tx.chitMember.update({
        where: { id: winner.id },
        data: {
          hasWonAuction: true,
          auctionEligible: false,
          wonAuctionId: auction.id,
          wonAuctionNumber: input.auctionNumber,
        },
      });

      // 10. Ledger entries
      if (input.auctionType === 'ADDITIONAL') {
        // Debit the fund for the auction allocation
        const newBalance = Math.round((currentBalance - auctionAmount) * 100) / 100;
        await tx.chitFundLedger.create({
          data: {
            chitId,
            auctionId: auction.id,
            transactionType: 'ADDITIONAL_AUCTION_ALLOCATION',
            amount: auctionAmount,
            direction: 'DEBIT',
            balanceAfter: newBalance,
            description: `Additional Auction #${input.auctionNumber} allocation`,
            createdById: adminUserId,
          },
        });
        currentBalance = newBalance;
      }

      // Credit winning bid into accumulated fund (both REGULAR and ADDITIONAL)
      const balanceAfterCredit = Math.round((currentBalance + winningBid) * 100) / 100;
      await tx.chitFundLedger.create({
        data: {
          chitId,
          auctionId: auction.id,
          transactionType: 'WINNING_BID_CREDIT',
          amount: winningBid,
          direction: 'CREDIT',
          balanceAfter: balanceAfterCredit,
          description: `Auction #${input.auctionNumber} winning bid by ${winner.customer.name}`,
          createdById: adminUserId,
        },
      });
      currentBalance = balanceAfterCredit;

      // 11. Update chit fund counters
      await tx.chitFund.update({
        where: { id: chitId },
        data: {
          completedAuctionCount: { increment: 1 },
        },
      });

      results.push({ auction, winnerName: winner.customer.name, winnerPayout });
    }

    // 12. Check if all required winners have now been assigned → complete the chit
    const chit2 = await tx.chitFund.findUnique({ where: { id: chitId } });
    const uniqueWinners = await tx.chitMember.count({
      where: { chitId, hasWonAuction: true },
    });
    if (uniqueWinners >= chit2.requiredWinnerCount) {
      await tx.chitFund.update({
        where: { id: chitId },
        data: { status: 'COMPLETED' },
      });
    }
  });

  // 13. Send winner notifications (outside transaction)
  for (const { auction, winnerName, winnerPayout } of results) {
    try {
      const member = await prisma.chitMember.findFirst({
        where: { id: auction.winnerId },
        include: { customer: true },
      });
      if (member?.customer) {
        await notificationService.sendManual(
          member.customer.id,
          `Congratulations ${winnerName}! You have won Chit Auction #${auction.auctionNumber}. ` +
            `Amount received: ₹${winnerPayout.toFixed(2)}. Please continue your monthly contributions.`,
          'SMS'
        );
      }
    } catch (_) {
      // Notification failure should not fail the request
    }
  }

  return results.map((r) => r.auction);
}

// ─── List Auctions ─────────────────────────────────────────────────────────────

async function listAuctions(chitId, { monthId, page, limit } = {}) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 50;
  const where = { chitId };
  if (monthId) where.monthId = monthId;

  const [items, total] = await Promise.all([
    prisma.chitAuction.findMany({
      where,
      include: {
        winner: {
          include: { customer: { select: { id: true, name: true, phone: true } } },
        },
        month: { select: { monthNumber: true, periodStart: true } },
      },
      orderBy: { auctionNumber: 'asc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.chitAuction.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function getAuctionById(auctionId) {
  const auction = await prisma.chitAuction.findUnique({
    where: { id: auctionId },
    include: {
      winner: {
        include: { customer: { select: { id: true, name: true, phone: true } } },
      },
      month: true,
      payout: true,
      ledger: true,
    },
  });
  if (!auction) throw ApiError.notFound('Auction not found');
  return auction;
}

async function markPayoutPaid(auctionId, paymentReference) {
  const payout = await prisma.chitPayout.findUnique({ where: { auctionId } });
  if (!payout) throw ApiError.notFound('Payout not found');
  if (payout.status === 'PAID') return payout;

  return prisma.chitPayout.update({
    where: { auctionId },
    data: {
      status: 'PAID',
      paymentReference: paymentReference || null,
      paidAt: new Date(),
    },
  });
}

// ─── Fund Ledger ──────────────────────────────────────────────────────────────

async function getLedger(chitId, { page, limit } = {}) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 100;

  const [items, total] = await Promise.all([
    prisma.chitFundLedger.findMany({
      where: { chitId },
      include: {
        auction: { select: { auctionNumber: true, auctionType: true } },
        loan: { select: { id: true, member: { select: { customer: { select: { name: true } } } } } },
        createdBy: { select: { id: true, phone: true } },
      },
      orderBy: { createdAt: 'asc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.chitFundLedger.count({ where: { chitId } }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

module.exports = {
  createAuctions,
  listAuctions,
  getAuctionById,
  markPayoutPaid,
  getLedger,
};
