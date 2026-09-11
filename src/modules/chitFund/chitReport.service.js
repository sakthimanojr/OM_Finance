/**
 * chitReport.service.js
 * Generates admin reports: chit summary, monthly, auctions, loans, members.
 */
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { getAvailableBalance } = require('./chitFund.service');

async function getChitSummaryReport(chitId) {
  const chit = await prisma.chitFund.findUnique({
    where: { id: chitId },
    include: {
      members: { where: { status: { in: ['ACTIVE', 'INACTIVE'] } } },
    },
  });
  if (!chit) throw ApiError.notFound('Chit fund not found');

  const [auctions, loans, ledger] = await Promise.all([
    prisma.chitAuction.findMany({ where: { chitId, status: 'SETTLED' } }),
    prisma.chitLoan.findMany({ where: { chitId } }),
    prisma.chitFundLedger.findMany({ where: { chitId } }),
  ]);

  const regularAuctions = auctions.filter((a) => a.auctionType === 'REGULAR').length;
  const additionalAuctions = auctions.filter((a) => a.auctionType === 'ADDITIONAL').length;
  const uniqueWinners = chit.members.filter((m) => m.hasWonAuction).length;
  const remainingEligible = chit.members.filter((m) => m.auctionEligible && m.status === 'ACTIVE').length;

  const availableBalance = ledger.reduce(
    (acc, e) => (e.direction === 'CREDIT' ? acc + Number(e.amount) : acc - Number(e.amount)),
    0
  );
  const loansOutstanding = loans
    .filter((l) => ['ACTIVE', 'PARTIALLY_PAID', 'OVERDUE'].includes(l.status))
    .reduce((acc, l) => acc + (Number(l.principalAmount) - Number(l.amountPaid)), 0);
  const interestEarned = ledger
    .filter((e) => e.transactionType === 'LOAN_INTEREST_CREDIT' && e.direction === 'CREDIT')
    .reduce((acc, e) => acc + Number(e.amount), 0);

  return {
    chit: {
      id: chit.id,
      name: chit.name,
      status: chit.status,
      startDate: chit.startDate,
      memberCount: chit.memberCount,
      monthlyContribution: Number(chit.monthlyContribution),
      regularAuctionAmount: Number(chit.regularAuctionAmount),
    },
    totalMembers: chit.members.length,
    regularAuctions,
    additionalAuctions,
    totalAuctions: auctions.length,
    uniqueWinners,
    remainingEligible,
    accumulatedFund: Math.round(availableBalance * 100) / 100,
    loansOutstanding: Math.round(loansOutstanding * 100) / 100,
    interestEarned: Math.round(interestEarned * 100) / 100,
    financierBalance: Math.round((availableBalance - loansOutstanding) * 100) / 100,
  };
}

async function getMonthlyReport(chitId) {
  const months = await prisma.chitMonth.findMany({
    where: { chitId },
    include: {
      auctions: {
        include: {
          winner: { include: { customer: { select: { name: true } } } },
        },
      },
      payments: true,
    },
    orderBy: { monthNumber: 'asc' },
  });

  return months.map((month) => {
    const settledAuctions = month.auctions.filter((a) => a.status === 'SETTLED');
    const totalAuctionAmount = settledAuctions.reduce((s, a) => s + Number(a.auctionAmount), 0);
    const totalWinningBid = settledAuctions.reduce((s, a) => s + Number(a.winningBid || 0), 0);
    const totalWinnerPayout = settledAuctions.reduce((s, a) => s + Number(a.winnerPayout || 0), 0);
    const totalContributions = month.payments.reduce((s, p) => s + Number(p.amountPaid), 0);

    return {
      monthNumber: month.monthNumber,
      periodStart: month.periodStart,
      status: month.status,
      totalContributions: Math.round(totalContributions * 100) / 100,
      auctionCount: settledAuctions.length,
      auctions: settledAuctions.map((a) => ({
        auctionNumber: a.auctionNumber,
        type: a.auctionType,
        amount: Number(a.auctionAmount),
        winningBid: Number(a.winningBid || 0),
        payout: Number(a.winnerPayout || 0),
        winner: a.winner?.customer?.name || 'N/A',
      })),
      totalWinningBid: Math.round(totalWinningBid * 100) / 100,
      totalWinnerPayout: Math.round(totalWinnerPayout * 100) / 100,
    };
  });
}

async function getAuctionReport(chitId) {
  const auctions = await prisma.chitAuction.findMany({
    where: { chitId },
    include: {
      winner: { include: { customer: { select: { name: true, phone: true } } } },
      month: { select: { monthNumber: true, periodStart: true } },
    },
    orderBy: { auctionNumber: 'asc' },
  });

  return auctions.map((a) => ({
    auctionNumber: a.auctionNumber,
    type: a.auctionType,
    status: a.status,
    auctionDate: a.auctionDate,
    monthNumber: a.month.monthNumber,
    auctionAmount: Number(a.auctionAmount),
    winningBid: Number(a.winningBid || 0),
    winnerPayout: Number(a.winnerPayout || 0),
    winner: a.winner?.customer?.name || 'Pending',
    winnerPhone: a.winner?.customer?.phone || '',
  }));
}

async function getLoanReport(chitId) {
  const loans = await prisma.chitLoan.findMany({
    where: { chitId },
    include: {
      member: { include: { customer: { select: { name: true, phone: true } } } },
      transactions: { orderBy: { transactionDate: 'asc' } },
    },
    orderBy: { createdAt: 'asc' },
  });

  return loans.map((l) => ({
    loanRef: `LN-${l.id.slice(-6).toUpperCase()}`,
    memberName: l.member.customer.name,
    memberPhone: l.member.customer.phone,
    principal: Number(l.principalAmount),
    interestRate: Number(l.interestRate),
    interest: Number(l.interestAmount),
    totalRepayment: Number(l.totalRepayment),
    amountPaid: Number(l.amountPaid),
    remaining: Number(l.remainingAmount),
    status: l.status,
    loanDate: l.loanDate,
    dueDate: l.dueDate,
    repaymentCount: l.transactions.length,
  }));
}

async function getMemberReport(chitId) {
  const members = await prisma.chitMember.findMany({
    where: { chitId },
    include: {
      customer: { select: { id: true, name: true, phone: true } },
      payments: true,
      loans: true,
      payouts: true,
    },
    orderBy: { joinedAt: 'asc' },
  });

  return members.map((m) => {
    const totalContributions = m.payments.reduce((s, p) => s + Number(p.amountPaid), 0);
    const pendingPayments = m.payments.filter((p) => p.status === 'PENDING').length;
    const totalLoans = m.loans.reduce((s, l) => s + Number(l.principalAmount), 0);
    const outstandingLoan = m.loans
      .filter((l) => ['ACTIVE', 'PARTIALLY_PAID', 'OVERDUE'].includes(l.status))
      .reduce((s, l) => s + Number(l.remainingAmount), 0);
    const payout = m.payouts[0];

    return {
      memberId: m.id,
      customerName: m.customer.name,
      customerPhone: m.customer.phone,
      status: m.status,
      auctionEligible: m.auctionEligible,
      hasWonAuction: m.hasWonAuction,
      wonAuctionNumber: m.wonAuctionNumber,
      payoutAmount: payout ? Number(payout.payoutAmount) : null,
      totalContributions: Math.round(totalContributions * 100) / 100,
      pendingPaymentsCount: pendingPayments,
      totalLoans: Math.round(totalLoans * 100) / 100,
      outstandingLoan: Math.round(outstandingLoan * 100) / 100,
    };
  });
}

module.exports = {
  getChitSummaryReport,
  getMonthlyReport,
  getAuctionReport,
  getLoanReport,
  getMemberReport,
};
