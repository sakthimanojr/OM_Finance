const prisma = require('../../config/database');

async function getAdminSummary() {
  const now = new Date();
  const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);

  const [
    totalCustomers,
    activeLoans,
    overdueLoans,
    totalDisbursedAgg,
    totalCollectedAgg,
    collectedThisMonthAgg,
    pendingDuesCount,
    overdueDuesCount,
  ] = await Promise.all([
    prisma.customer.count({ where: { status: 'ACTIVE' } }),
    prisma.loan.count({ where: { status: 'ACTIVE' } }),
    prisma.loan.count({ where: { status: 'OVERDUE' } }),
    prisma.loan.aggregate({ _sum: { disbursedAmount: true } }),
    prisma.loan.aggregate({ _sum: { totalCollection: true } }),
    prisma.payment.aggregate({
      _sum: { amount: true },
      where: { status: 'SUCCESS', paidAt: { gte: startOfMonth } },
    }),
    prisma.due.count({ where: { status: 'PENDING' } }),
    prisma.due.count({ where: { status: 'MISSED' } }),
  ]);

  return {
    totalCustomers,
    activeLoans,
    overdueLoans,
    totalDisbursed: totalDisbursedAgg._sum.disbursedAmount || 0,
    totalCollected: totalCollectedAgg._sum.totalCollection || 0,
    collectedThisMonth: collectedThisMonthAgg._sum.amount || 0,
    pendingDuesCount,
    overdueDuesCount,
  };
}

async function getCustomerSummary(customerId) {
  const loans = await prisma.loan.findMany({
    where: { customerId },
    include: { dues: true },
    orderBy: { createdAt: 'desc' },
  });

  // Also fetch total successful payments for this customer
  const totalPaymentsAgg = await prisma.payment.aggregate({
    _sum: { amount: true },
    where: { customerId, status: 'SUCCESS' },
  });

  const activeLoans = loans.filter((l) => l.status === 'ACTIVE' || l.status === 'OVERDUE');
  const totalOutstanding = activeLoans.reduce((sum, loan) => {
    const pendingAmount = loan.dues
      .filter((d) => d.status !== 'PAID')
      .reduce((s, d) => s + Number(d.amount), 0);
    return sum + pendingAmount;
  }, 0);

  const nextDue = activeLoans
    .flatMap((l) => l.dues.filter((d) => d.status === 'PENDING'))
    .sort((a, b) => new Date(a.dueDate) - new Date(b.dueDate))[0];

  // Total principal borrowed across all loans
  const totalPrincipalBorrowed = loans.reduce((sum, l) => sum + Number(l.principal), 0);

  // Total amount repaid (from successful payments)
  const totalAmountRepaid = Number(totalPaymentsAgg._sum.amount || 0);

  // Total interest paid: for completed loans, interest = totalCollection - principal
  // For active loans, we count what's been paid so far
  const totalInterestPaid = loans.reduce((sum, loan) => {
    const interestAmount = Number(loan.principal) * Number(loan.interestRate) / 100;
    // Only count interest that's actually been collected
    const collected = Number(loan.totalCollection || 0);
    const principalCollected = Math.min(collected, Number(loan.principal));
    const interestCollected = Math.max(0, collected - principalCollected);
    // For weekly/monthly: interest was deducted upfront, so it's interestAmount
    if (loan.type === 'WEEKLY' || loan.type === 'MONTHLY') {
      return sum + interestAmount;
    }
    // For high-value: interest is in the dues themselves
    return sum + interestCollected;
  }, 0);

  // Loan history — basic info for each loan
  const loanHistory = loans.map((l) => ({
    id: l.id,
    loanNumber: l.loanNumber,
    type: l.type,
    principal: l.principal,
    interestRate: l.interestRate,
    disbursedAmount: l.disbursedAmount,
    totalCollection: l.totalCollection,
    status: l.status,
    startDate: l.startDate,
    endDate: l.endDate,
    installmentAmount: l.installmentAmount,
    pendingDues: l.dues.filter((d) => d.status !== 'PAID').length,
    totalDues: l.dues.length,
  }));

  return {
    totalLoans: loans.length,
    activeLoans: activeLoans.length,
    totalOutstanding,
    totalPrincipalBorrowed,
    totalInterestPaid,
    totalAmountRepaid,
    loanHistory,
    nextDue: nextDue || null,
  };
}

module.exports = { getAdminSummary, getCustomerSummary };
