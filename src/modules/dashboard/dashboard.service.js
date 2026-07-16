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

  return {
    totalLoans: loans.length,
    activeLoans: activeLoans.length,
    totalOutstanding,
    nextDue: nextDue || null,
  };
}

module.exports = { getAdminSummary, getCustomerSummary };
