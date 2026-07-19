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

  let totalPrincipalPaid = 0;
  let totalInterestPaid = 0;

  for (const loan of loans) {
    const collected = Number(loan.totalCollection || 0);

    if (loan.type === 'HIGH_VALUE') {
      const interestPaid = loan.dues
        .filter((d) => d.status === 'PAID')
        .reduce((s, d) => s + Number(d.paidAmount || d.amount), 0);
      const principalPaid = Math.max(0, collected - interestPaid);
      totalPrincipalPaid += principalPaid;
      totalInterestPaid += interestPaid;
    } else {
      const principalPart = Number(loan.disbursedAmount);
      const duesSum = loan.dues.reduce((s, d) => s + Number(d.amount), 0);
      
      if (duesSum > 0) {
        const ratio = principalPart / duesSum;
        const principalPaid = collected * ratio;
        const interestPaid = collected * (1 - ratio);
        totalPrincipalPaid += principalPaid;
        totalInterestPaid += interestPaid;
      } else {
        totalPrincipalPaid += collected;
      }
    }
  }

  const totalAmountRepaid = totalPrincipalPaid + totalInterestPaid;

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
    totalPrincipalPaid,
    totalInterestPaid,
    totalAmountRepaid,
    loanHistory,
    nextDue: nextDue || null,
  };
}

module.exports = { getAdminSummary, getCustomerSummary };
