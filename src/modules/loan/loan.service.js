const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const weeklyCalc = require('./calculators/weeklyLoan.calculator');
const monthlyCalc = require('./calculators/monthlyEmiLoan.calculator');
const highValueCalc = require('./calculators/highValueLoan.calculator');
const { round2 } = require('../../utils/currencyFormatter');

async function createLoan(payload) {
  const customer = await prisma.customer.findUnique({ where: { id: payload.customerId } });
  if (!customer) throw ApiError.notFound('Customer not found');
  if (customer.status !== 'ACTIVE') throw ApiError.badRequest('Customer is not active');

  const startDate = new Date(payload.startDate);
  let calcResult;

  if (payload.type === 'WEEKLY') {
    calcResult = weeklyCalc.calculate({
      principal: payload.principal,
      interestRate: payload.interestRate,
      termCount: payload.termCount,
      startDate,
    });
  } else if (payload.type === 'MONTHLY') {
    calcResult = monthlyCalc.calculate({
      principal: payload.principal,
      interestRate: payload.interestRate,
      agreementFee: payload.agreementFee || 0,
      termCount: payload.termCount,
      startDate,
    });
  } else if (payload.type === 'HIGH_VALUE') {
    calcResult = highValueCalc.calculate({
      principal: payload.principal,
      interestRate: payload.interestRate,
      startDate,
    });
  } else {
    throw ApiError.badRequest('Unsupported loan type');
  }

  const loan = await prisma.$transaction(async (tx) => {
    const created = await tx.loan.create({
      data: {
        customerId: payload.customerId,
        loanNumber: payload.loanNumber || null,
        type: payload.type,
        principal: payload.principal,
        interestRate: payload.interestRate,
        agreementFee: payload.agreementFee || 0,
        disbursedAmount: calcResult.disbursedAmount,
        startDate,
        endDate: calcResult.endDate || null,
        termCount: payload.termCount || null,
        installmentAmount: calcResult.installmentAmount,
        status: 'ACTIVE',
      },
    });

    await tx.due.createMany({
      data: calcResult.dueSchedule.map((d) => ({
        loanId: created.id,
        dueNumber: d.dueNumber,
        dueDate: d.dueDate,
        amount: d.amount,
        status: 'PENDING',
      })),
    });

    return created;
  });

  return getLoanById(loan.id);
}

async function getLoanById(id) {
  const loan = await prisma.loan.findUnique({
    where: { id },
    include: {
      customer: { select: { id: true, name: true, phone: true, email: true } },
      dues: { orderBy: { dueNumber: 'asc' } },
    },
  });
  if (!loan) throw ApiError.notFound('Loan not found');
  return loan;
}

async function listLoans({ customerId, status, type, page, limit }) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 20;
  const where = {};
  if (customerId) where.customerId = customerId;
  if (status) {
    where.status = status;
  } else {
    where.status = { notIn: ['COMPLETED', 'CLOSED'] };
  }
  if (type) where.type = type;

  const [items, total] = await Promise.all([
    prisma.loan.findMany({
      where,
      include: { customer: { select: { id: true, name: true, phone: true } } },
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.loan.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function closeLoan(id, remarks) {
  const loan = await getLoanById(id);
  const pendingDues = loan.dues.filter((d) => d.status === 'PENDING');
  if (pendingDues.length > 0) {
    throw ApiError.badRequest('Cannot close loan with pending dues. Settle all dues first.');
  }
  return prisma.loan.update({
    where: { id },
    data: { status: 'CLOSED', updatedAt: new Date() },
  });
}

/**
 * Handles a partial/full principal repayment on a HIGH_VALUE loan.
 * Recalculates future interest-only dues based on new outstanding principal.
 */
async function repayPrincipal(id, amount, paymentMethod) {
  const loan = await getLoanById(id);
  if (loan.type !== 'HIGH_VALUE') {
    throw ApiError.badRequest('Principal repayment is only applicable to high-value loans');
  }

  const paidPrincipalSoFar = loan.totalCollection ? Number(loan.totalCollection) : 0;
  const outstanding = round2(Number(loan.principal) - paidPrincipalSoFar);
  if (amount > outstanding) {
    throw ApiError.badRequest(`Amount exceeds outstanding principal of ${outstanding}`);
  }

  const newOutstanding = round2(outstanding - amount);
  const newTotalCollection = round2(paidPrincipalSoFar + amount);

  return prisma.$transaction(async (tx) => {
    const updated = await tx.loan.update({
      where: { id },
      data: {
        totalCollection: newTotalCollection,
        status: newOutstanding <= 0 ? 'COMPLETED' : loan.status,
      },
    });

    if (newOutstanding > 0) {
      const newMonthlyInterest = highValueCalc.recalculateInterest({
        outstandingPrincipal: newOutstanding,
        interestRate: Number(loan.interestRate),
      });

      // Update all future PENDING dues to reflect new interest amount
      await tx.due.updateMany({
        where: { loanId: id, status: 'PENDING' },
        data: { amount: newMonthlyInterest },
      });
    } else {
      // Fully repaid — cancel remaining pending interest dues
      await tx.due.updateMany({
        where: { loanId: id, status: 'PENDING' },
        data: { status: 'PAID', paidDate: new Date(), paidAmount: 0, remarks: 'Waived — loan closed early' },
      });
    }

    return { loan: updated, newOutstandingPrincipal: newOutstanding, paymentMethod };
  });
}

module.exports = { createLoan, getLoanById, listLoans, closeLoan, repayPrincipal };
