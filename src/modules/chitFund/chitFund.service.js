/**
 * chitFund.service.js
 * Handles chit fund creation, member management, and month management.
 * ALL financial calculations use exact Decimal arithmetic (Prisma returns
 * Decimal objects; we use Number() only for comparison, never storage).
 */
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');

// ─── Helpers ──────────────────────────────────────────────────────────────────

/** Get current fund balance from ledger — the only source of truth */
async function getAvailableBalance(chitId, tx = prisma) {
  const ledger = await tx.chitFundLedger.findMany({ where: { chitId } });
  const balance = ledger.reduce((acc, entry) => {
    const amt = Number(entry.amount);
    return entry.direction === 'CREDIT' ? acc + amt : acc - amt;
  }, 0);
  return Math.round(balance * 100) / 100;
}

/** Get total outstanding loan principal for a chit */
async function getLoansOutstanding(chitId, tx = prisma) {
  const activeLoans = await tx.chitLoan.findMany({
    where: { chitId, status: { in: ['ACTIVE', 'PARTIALLY_PAID', 'OVERDUE'] } },
    select: { principalAmount: true, amountPaid: true },
  });
  const outstanding = activeLoans.reduce((acc, l) => {
    return acc + (Number(l.principalAmount) - Number(l.amountPaid));
  }, 0);
  return Math.round(outstanding * 100) / 100;
}

// ─── Chit Fund CRUD ───────────────────────────────────────────────────────────

async function createChitFund(payload, adminUserId) {
  const regularAuctionAmount =
    Math.round(Number(payload.memberCount) * Number(payload.monthlyContribution) * 100) / 100;

  return prisma.chitFund.create({
    data: {
      name: payload.name,
      description: payload.description || null,
      memberCount: payload.memberCount,
      monthlyContribution: payload.monthlyContribution,
      regularAuctionAmount,
      startingBid: payload.startingBid,
      interestRate: payload.interestRate ?? 3,
      loanPeriodRule: payload.loanPeriodRule || null,
      startDate: new Date(payload.startDate),
      paymentDueDay: payload.paymentDueDay ?? 1,
      requiredWinnerCount: payload.memberCount,
      status: 'DRAFT',
      createdById: adminUserId,
    },
  });
}

async function listChitFunds({ status, page, limit } = {}) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 20;
  const where = {};
  if (status) where.status = status;

  const [items, total] = await Promise.all([
    prisma.chitFund.findMany({
      where,
      include: {
        _count: { select: { members: true, auctions: true } },
      },
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.chitFund.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function getChitFundById(id) {
  const chit = await prisma.chitFund.findUnique({
    where: { id },
    include: {
      members: {
        include: { customer: { select: { id: true, name: true, phone: true } } },
        orderBy: { joinedAt: 'asc' },
      },
      _count: { select: { auctions: true } },
    },
  });
  if (!chit) throw ApiError.notFound('Chit fund not found');
  return chit;
}

async function updateChitFund(id, payload) {
  const existing = await prisma.chitFund.findUnique({ where: { id } });
  if (!existing) throw ApiError.notFound('Chit fund not found');
  if (existing.status === 'COMPLETED') {
    throw ApiError.badRequest('Cannot edit a completed chit fund');
  }
  return prisma.chitFund.update({ where: { id }, data: payload });
}

// ─── Member Management ────────────────────────────────────────────────────────

async function addMember(chitId, customerId, adminUserId) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');
  if (chit.status === 'COMPLETED') throw ApiError.badRequest('Chit is completed');

  const customer = await prisma.customer.findUnique({
    where: { id: customerId },
    include: { user: true },
  });
  if (!customer) throw ApiError.notFound('Customer not found');
  if (customer.status !== 'ACTIVE') throw ApiError.badRequest('Customer is not active');

  const activeCount = await prisma.chitMember.count({
    where: { chitId, status: { in: ['ACTIVE', 'INACTIVE'] } },
  });
  if (activeCount >= chit.memberCount) {
    throw ApiError.badRequest(`Chit fund is full (${chit.memberCount} members)`);
  }

  const existing = await prisma.chitMember.findUnique({
    where: { chitId_userId: { chitId, userId: customer.userId } },
  });
  if (existing && existing.status !== 'REMOVED') {
    throw ApiError.conflict('This customer is already a member of this chit fund');
  }

  // How many chits does this customer already have?
  const chitCount = await prisma.chitMember.count({
    where: { customerId, status: { in: ['ACTIVE', 'INACTIVE'] } },
  });

  if (existing && existing.status === 'REMOVED') {
    // Re-activate removed member
    return prisma.chitMember.update({
      where: { id: existing.id },
      data: {
        status: 'ACTIVE',
        auctionEligible: true,
        hasWonAuction: false,
        wonAuctionId: null,
        wonAuctionNumber: null,
        joinedAt: new Date(),
      },
    });
  }

  return prisma.chitMember.create({
    data: {
      chitId,
      userId: customer.userId,
      customerId,
      monthlyContribution: chit.monthlyContribution,
      status: 'ACTIVE',
      auctionEligible: true,
      hasWonAuction: false,
    },
  });
}

async function removeMember(chitId, memberId) {
  const member = await prisma.chitMember.findFirst({
    where: { id: memberId, chitId },
  });
  if (!member) throw ApiError.notFound('Member not found in this chit fund');
  if (member.hasWonAuction) {
    throw ApiError.badRequest('Cannot remove a member who has won an auction — they must continue paying');
  }

  return prisma.chitMember.update({
    where: { id: memberId },
    data: { status: 'REMOVED' },
  });
}

async function listMembers(chitId) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');

  const members = await prisma.chitMember.findMany({
    where: { chitId },
    include: {
      customer: { select: { id: true, name: true, phone: true, email: true } },
    },
    orderBy: { joinedAt: 'asc' },
  });

  // Annotate with chit membership count
  const enriched = await Promise.all(
    members.map(async (m) => {
      const chitCount = await prisma.chitMember.count({
        where: { customerId: m.customerId, status: { in: ['ACTIVE', 'INACTIVE'] } },
      });
      return { ...m, chitCount };
    })
  );

  return enriched;
}

// ─── Month Management ─────────────────────────────────────────────────────────

async function createMonth(chitId, payload) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');
  if (chit.status === 'DRAFT') throw ApiError.badRequest('Activate the chit fund before opening months');
  if (chit.status === 'COMPLETED') throw ApiError.badRequest('Chit fund is completed');

  const nextMonthNumber = chit.currentMonth + 1;

  // Check there's no already-open month
  const openMonth = await prisma.chitMonth.findFirst({
    where: { chitId, status: 'OPEN' },
  });
  if (openMonth) {
    throw ApiError.badRequest(`Month #${openMonth.monthNumber} is still open. Close it before opening a new one.`);
  }

  const activeMembers = await prisma.chitMember.findMany({
    where: { chitId, status: 'ACTIVE' },
  });
  const amountDue =
    Math.round(activeMembers.length * Number(chit.monthlyContribution) * 100) / 100;

  return prisma.$transaction(async (tx) => {
    const month = await tx.chitMonth.create({
      data: {
        chitId,
        monthNumber: nextMonthNumber,
        periodStart: new Date(payload.periodStart),
        periodEnd: payload.periodEnd ? new Date(payload.periodEnd) : null,
        amountDue,
        status: 'OPEN',
      },
    });

    // Create member payment obligations for all active members
    const dueDate = new Date(payload.periodStart);
    dueDate.setDate(chit.paymentDueDay);

    await tx.chitMemberPayment.createMany({
      data: activeMembers.map((m) => ({
        chitId,
        memberId: m.id,
        monthId: month.id,
        amountDue: Number(chit.monthlyContribution),
        dueDate,
        status: 'PENDING',
      })),
      skipDuplicates: true,
    });

    await tx.chitFund.update({
      where: { id: chitId },
      data: { currentMonth: nextMonthNumber },
    });

    return month;
  });
}

async function listMonths(chitId) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');
  return prisma.chitMonth.findMany({
    where: { chitId },
    include: {
      _count: { select: { auctions: true } },
    },
    orderBy: { monthNumber: 'asc' },
  });
}

async function closeMonth(chitId, monthId, adminUserId) {
  const month = await prisma.chitMonth.findFirst({
    where: { id: monthId, chitId },
    include: {
      auctions: true,
      payments: true,
    },
  });
  if (!month) throw ApiError.notFound('Month not found');
  if (month.status === 'CLOSED') throw ApiError.badRequest('Month is already closed');

  // Validation 1: All auctions must be settled
  const unsettledAuctions = month.auctions.filter((a) => a.status === 'PENDING');
  if (unsettledAuctions.length > 0) {
    throw ApiError.badRequest(
      `${unsettledAuctions.length} auction(s) not yet settled. Settle all auctions before closing the month.`
    );
  }

  // Validation 2: No duplicate winners in this month
  const winners = month.auctions
    .filter((a) => a.winnerId)
    .map((a) => a.winnerId);
  const uniqueWinners = new Set(winners);
  if (winners.length !== uniqueWinners.size) {
    throw ApiError.badRequest('Duplicate winner detected in this month\'s auctions');
  }

  // Validation 3: Settled auctions must have corresponding ledger entries
  const settledAuctions = month.auctions.filter((a) => a.status === 'SETTLED');
  if (settledAuctions.length > 0) {
    const ledgerEntries = await prisma.chitFundLedger.findMany({
      where: {
        chitId,
        auctionId: { in: settledAuctions.map((a) => a.id) },
        transactionType: 'WINNING_BID_CREDIT',
      },
    });
    const auctionsWithLedger = new Set(ledgerEntries.map((e) => e.auctionId));
    const missing = settledAuctions.filter((a) => !auctionsWithLedger.has(a.id));
    if (missing.length > 0) {
      throw ApiError.badRequest(
        `${missing.length} settled auction(s) missing fund ledger entries (Auction #${missing.map((a) => a.auctionNumber).join(', #')}). ` +
          `Ledger integrity check failed.`
      );
    }
  }

  // Validation 4: Payment records must be consistent
  const invalidPayments = month.payments.filter((p) => {
    const paid = Number(p.amountPaid);
    const due = Number(p.amountDue);
    return paid < 0 || due < 0;
  });
  if (invalidPayments.length > 0) {
    throw ApiError.badRequest(
      `${invalidPayments.length} payment record(s) have invalid amounts. Fix payment records before closing the month.`
    );
  }

  return prisma.chitMonth.update({
    where: { id: monthId },
    data: { status: 'CLOSED', periodEnd: month.periodEnd || new Date() },
  });
}

async function getMonthSummary(chitId, monthId) {
  const month = await prisma.chitMonth.findFirst({
    where: { id: monthId, chitId },
    include: {
      auctions: {
        include: {
          winner: {
            include: { customer: { select: { name: true } } },
          },
        },
      },
      payments: true,
    },
  });
  if (!month) throw ApiError.notFound('Month not found');

  const regularAuctions = month.auctions.filter((a) => a.auctionType === 'REGULAR' && a.status === 'SETTLED');
  const additionalAuctions = month.auctions.filter(
    (a) => a.auctionType === 'ADDITIONAL' && a.status === 'SETTLED'
  );

  const totalAuctionAmount = month.auctions
    .filter((a) => a.status === 'SETTLED')
    .reduce((s, a) => s + Number(a.auctionAmount), 0);
  const totalWinningBid = month.auctions
    .filter((a) => a.status === 'SETTLED')
    .reduce((s, a) => s + Number(a.winningBid || 0), 0);
  const totalWinnerPayout = month.auctions
    .filter((a) => a.status === 'SETTLED')
    .reduce((s, a) => s + Number(a.winnerPayout || 0), 0);

  const totalContributions = month.payments.reduce((s, p) => s + Number(p.amountPaid), 0);
  const paidCount = month.payments.filter((p) => p.status === 'PAID').length;
  const pendingCount = month.payments.filter((p) => p.status === 'PENDING').length;

  return {
    month,
    regularAuctionCount: regularAuctions.length,
    additionalAuctionCount: additionalAuctions.length,
    totalAuctionAmount: Math.round(totalAuctionAmount * 100) / 100,
    totalWinningBid: Math.round(totalWinningBid * 100) / 100,
    totalWinnerPayout: Math.round(totalWinnerPayout * 100) / 100,
    totalContributions: Math.round(totalContributions * 100) / 100,
    paidCount,
    pendingCount,
  };
}

// ─── Fund Summary ─────────────────────────────────────────────────────────────

async function getFundSummary(chitId) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');

  const availableBalance = await getAvailableBalance(chitId);
  const loansOutstanding = await getLoansOutstanding(chitId);
  const interestReceivable = await prisma.chitLoan
    .findMany({
      where: { chitId, status: { in: ['ACTIVE', 'PARTIALLY_PAID', 'OVERDUE'] } },
      select: { interestAmount: true, amountPaid: true, principalAmount: true },
    })
    .then((loans) =>
      loans.reduce((acc, l) => {
        // Interest receivable = interest not yet collected
        // We track it as: if amountPaid < principalAmount → full interest outstanding
        // If amountPaid >= principalAmount → interest portion outstanding
        const paid = Number(l.amountPaid);
        const principal = Number(l.principalAmount);
        const interest = Number(l.interestAmount);
        if (paid >= principal) {
          return acc + Math.max(0, interest - (paid - principal));
        }
        return acc + interest;
      }, 0)
    );

  const additionalAuctionCapacity = Math.floor(
    availableBalance / Number(chit.regularAuctionAmount)
  );

  return {
    chitId,
    regularAuctionAmount: Number(chit.regularAuctionAmount),
    totalAccumulatedFund: availableBalance + loansOutstanding,
    loansOutstanding,
    interestReceivable: Math.round(interestReceivable * 100) / 100,
    availableBalance,
    additionalAuctionCapacity,
    shortfallForNextAdditionalAuction: Math.max(
      0,
      Number(chit.regularAuctionAmount) - availableBalance
    ),
  };
}

module.exports = {
  createChitFund,
  listChitFunds,
  getChitFundById,
  updateChitFund,
  addMember,
  removeMember,
  listMembers,
  createMonth,
  listMonths,
  closeMonth,
  getMonthSummary,
  getFundSummary,
  getAvailableBalance,
};
