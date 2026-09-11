/**
 * myChit.controller.js
 * Customer-facing read-only endpoints for chit fund membership.
 */
const prisma = require('../../config/database');
const ApiResponse = require('../../utils/apiResponse');
const ApiError = require('../../utils/apiError');

// Helper: get customer from authenticated user
async function getCustomerFromUser(userId) {
  const customer = await prisma.customer.findUnique({ where: { userId } });
  if (!customer) throw ApiError.notFound('Customer profile not found');
  return customer;
}

// GET /my/chits — list all my chit memberships
async function listMyChits(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const memberships = await prisma.chitMember.findMany({
      where: { customerId: customer.id, status: { in: ['ACTIVE', 'INACTIVE'] } },
      include: {
        chit: {
          select: {
            id: true, name: true, status: true, startDate: true,
            monthlyContribution: true, regularAuctionAmount: true, currentMonth: true,
          },
        },
      },
      orderBy: { joinedAt: 'asc' },
    });

    // Count chit memberships per customer for badge display
    const chitCount = memberships.length;
    const enriched = memberships.map((m, idx) => ({
      ...m,
      membershipLabel: chitCount > 1 ? `${idx + 1}` : null,
    }));

    return ApiResponse.success(res, { data: enriched });
  } catch (err) { next(err); }
}

// GET /my/chits/:chitId — chit overview for customer
async function getMyChitDetail(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const membership = await prisma.chitMember.findFirst({
      where: { chitId: req.params.chitId, customerId: customer.id },
      include: {
        chit: {
          include: {
            _count: { select: { members: true, auctions: true } },
          },
        },
      },
    });
    if (!membership) throw ApiError.notFound('You are not a member of this chit fund');

    return ApiResponse.success(res, { data: membership });
  } catch (err) { next(err); }
}

// GET /my/chits/:chitId/payments — my payment history
async function getMyPayments(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const membership = await prisma.chitMember.findFirst({
      where: { chitId: req.params.chitId, customerId: customer.id },
    });
    if (!membership) throw ApiError.forbidden('Access denied');

    const payments = await prisma.chitMemberPayment.findMany({
      where: { memberId: membership.id },
      include: {
        month: { select: { monthNumber: true, periodStart: true } },
      },
      orderBy: { createdAt: 'desc' },
    });

    return ApiResponse.success(res, { data: payments });
  } catch (err) { next(err); }
}

// GET /my/chits/:chitId/auctions — auction list (winner names hidden until settled)
async function getMyAuctions(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const membership = await prisma.chitMember.findFirst({
      where: { chitId: req.params.chitId, customerId: customer.id },
    });
    if (!membership) throw ApiError.forbidden('Access denied');

    const auctions = await prisma.chitAuction.findMany({
      where: { chitId: req.params.chitId },
      include: {
        winner: {
          include: { customer: { select: { name: true } } },
        },
        month: { select: { monthNumber: true, periodStart: true } },
      },
      orderBy: { auctionNumber: 'asc' },
    });

    // Show winner name and payout only if settled or if this member won
    const filtered = auctions.map((a) => {
      const isMyWin = a.winnerId === membership.id;
      return {
        id: a.id,
        auctionNumber: a.auctionNumber,
        auctionType: a.auctionType,
        auctionDate: a.auctionDate,
        auctionAmount: Number(a.auctionAmount),
        status: a.status,
        month: a.month,
        myWin: isMyWin,
        winnerName: a.status === 'SETTLED' ? a.winner?.customer?.name || null : null,
        winnerPayout: isMyWin ? Number(a.winnerPayout || 0) : null,
        winningBid: a.status === 'SETTLED' ? Number(a.winningBid || 0) : null,
      };
    });

    return ApiResponse.success(res, { data: filtered });
  } catch (err) { next(err); }
}

// GET /my/chits/:chitId/loans — my admin-created chit loans
async function getMyLoans(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const membership = await prisma.chitMember.findFirst({
      where: { chitId: req.params.chitId, customerId: customer.id },
    });
    if (!membership) throw ApiError.forbidden('Access denied');

    const loans = await prisma.chitLoan.findMany({
      where: { memberId: membership.id },
      orderBy: { createdAt: 'desc' },
    });

    return ApiResponse.success(res, { data: loans });
  } catch (err) { next(err); }
}

// GET /my/chits/:chitId/loans/:loanId — my loan detail
async function getMyLoanDetail(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const membership = await prisma.chitMember.findFirst({
      where: { chitId: req.params.chitId, customerId: customer.id },
    });
    if (!membership) throw ApiError.forbidden('Access denied');

    const loan = await prisma.chitLoan.findFirst({
      where: { id: req.params.loanId, memberId: membership.id },
      include: { transactions: { orderBy: { transactionDate: 'asc' } } },
    });
    if (!loan) throw ApiError.notFound('Loan not found');

    return ApiResponse.success(res, { data: loan });
  } catch (err) { next(err); }
}

// GET /my/chits/:chitId/ledger — fund ledger visible to customer
async function getMyLedger(req, res, next) {
  try {
    const customer = await getCustomerFromUser(req.user.id);
    const membership = await prisma.chitMember.findFirst({
      where: { chitId: req.params.chitId, customerId: customer.id },
    });
    if (!membership) throw ApiError.forbidden('Access denied');

    // Fetch the member's own loan IDs
    const myLoans = await prisma.chitLoan.findMany({
      where: { memberId: membership.id },
      select: { id: true },
    });
    const myLoanIds = myLoans.map((l) => l.id);

    // Show: auction winning bids (public) + this member's loan transactions
    const entries = await prisma.chitFundLedger.findMany({
      where: {
        chitId: req.params.chitId,
        OR: [
          // Public auction entries (winning bids, additional auction allocations)
          { loanId: null },
          // This member's own loan transactions
          ...(myLoanIds.length > 0 ? [{ loanId: { in: myLoanIds } }] : []),
        ],
      },
      select: {
        id: true,
        transactionType: true,
        amount: true,
        direction: true,
        balanceAfter: true,
        description: true,
        createdAt: true,
        auction: { select: { auctionNumber: true, auctionType: true } },
      },
      orderBy: { createdAt: 'asc' },
    });

    return ApiResponse.success(res, { data: entries });
  } catch (err) { next(err); }
}

module.exports = {
  listMyChits,
  getMyChitDetail,
  getMyPayments,
  getMyAuctions,
  getMyLoans,
  getMyLoanDetail,
  getMyLedger,
};
