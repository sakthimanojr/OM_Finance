const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const customerService = require('../customer/customer.service');
const weeklyCalc = require('./calculators/weeklyLoan.calculator');
const monthlyCalc = require('./calculators/monthlyEmiLoan.calculator');
const highValueCalc = require('./calculators/highValueLoan.calculator');
const { round2 } = require('../../utils/currencyFormatter');

async function createLoan(payload) {
  let customer;

  // 1. Look up by customerId if provided (uuid, phone, or name)
  if (payload.customerId && String(payload.customerId).trim().length > 0) {
    const rawId = String(payload.customerId).trim();
    const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(rawId);
    if (isUuid) {
      customer = await prisma.customer.findUnique({ where: { id: rawId } });
    }
    if (!customer) {
      customer = await prisma.customer.findFirst({
        where: {
          OR: [
            { phone: rawId },
            { name: { equals: rawId, mode: 'insensitive' } },
          ],
        },
      });
    }
  }

  // 2. If customer object provided (new customer or recognized by phone for 2nd loan)
  if (!customer && payload.customer) {
    const phone = payload.customer.phone ? String(payload.customer.phone).trim() : null;
    if (phone) {
      customer = await prisma.customer.findFirst({ where: { phone } });
    }

    if (!customer) {
      // Auto-create new customer profile
      customer = await customerService.createCustomer(payload.customer);
    }
  }

  if (!customer) throw ApiError.notFound('Customer details required or customer not found');
  if (customer.status !== 'ACTIVE') throw ApiError.badRequest('Customer is not active');
  payload.customerId = customer.id;

  // 3. Auto-generate loan number if not provided
  if (!payload.loanNumber || !String(payload.loanNumber).trim()) {
    payload.loanNumber = await getNextLoanNumber();
  } else {
    payload.loanNumber = String(payload.loanNumber).trim();
    const existingLoan = await prisma.loan.findUnique({ where: { loanNumber: payload.loanNumber } });
    if (existingLoan) throw ApiError.conflict('A loan with this loan number already exists');
  }

  const startDate = new Date(payload.startDate);
  let calcResult;

  if (payload.type === 'WEEKLY') {
    calcResult = weeklyCalc.calculate({
      principal: payload.principal,
      interestRate: payload.interestRate,
      agreementFee: payload.agreementFee || 0,
      termCount: payload.termCount,
      startDate,
    });
  } else if (payload.type === 'MONTHLY') {
    calcResult = monthlyCalc.calculate({
      principal: payload.principal,
      interestRate: payload.interestRate !== undefined ? payload.interestRate : 15,
      agreementFee: payload.agreementFee !== undefined ? payload.agreementFee : 100,
      termCount: payload.termCount || 5,
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
        disbursementMethod: (payload.disbursementMethod && String(payload.disbursementMethod).toUpperCase().includes('BANK')) ? 'BANK' : 'CASH',
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

  // Verify and self-heal loan status based on actual dues
  if (!['CLOSED', 'COMPLETED'].includes(loan.status) && Array.isArray(loan.dues)) {
    const now = new Date();
    const startOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    const hasOverdueDues = loan.dues.some(
      (d) => d.status === 'MISSED' || (d.status === 'PENDING' && new Date(d.dueDate) < startOfDay)
    );
    const allPaid = loan.dues.length > 0 && loan.dues.every((d) => d.status === 'PAID');

    let correctStatus = loan.status;
    if (allPaid) {
      correctStatus = 'COMPLETED';
    } else if (hasOverdueDues) {
      correctStatus = 'OVERDUE';
    } else {
      correctStatus = 'ACTIVE';
    }

    if (correctStatus !== loan.status) {
      loan.status = correctStatus;
      prisma.loan.update({ where: { id: loan.id }, data: { status: correctStatus } }).catch(() => {});
    }
  }

  return loan;
}

async function listLoans({ customerId, status, type, page, limit }) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 500;
  const where = {};
  if (customerId) where.customerId = customerId;
  if (status) {
    const s = status.toUpperCase();
    if (s === 'ACTIVE') {
      where.status = { in: ['ACTIVE', 'OVERDUE'] };
    } else if (s === 'CLOSED') {
      where.status = { in: ['CLOSED', 'COMPLETED'] };
    } else if (s === 'ALL') {
      // Return all non-closed loans
      where.status = { not: 'CLOSED' };
    } else {
      where.status = status;
    }
  } else {
    // Default: all non-closed loans
    where.status = { not: 'CLOSED' };
  }
  if (type) where.type = type;

  const [items, total] = await Promise.all([
    prisma.loan.findMany({
      where,
      include: {
        customer: { select: { id: true, name: true, phone: true } },
        dues: { orderBy: { dueNumber: 'asc' } },
      },
      orderBy: { loanNumber: 'asc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.loan.count({ where }),
  ]);

  const now = new Date();
  const startOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate());

  for (const loan of items) {
    if (!['CLOSED', 'COMPLETED'].includes(loan.status) && Array.isArray(loan.dues)) {
      const hasOverdueDues = loan.dues.some(
        (d) => d.status === 'MISSED' || (d.status === 'PENDING' && new Date(d.dueDate) < startOfDay)
      );
      const allPaid = loan.dues.length > 0 && loan.dues.every((d) => d.status === 'PAID');

      let correctStatus = loan.status;
      if (allPaid) {
        correctStatus = 'COMPLETED';
      } else if (hasOverdueDues) {
        correctStatus = 'OVERDUE';
      } else {
        correctStatus = 'ACTIVE';
      }

      if (correctStatus !== loan.status) {
        loan.status = correctStatus;
        prisma.loan.update({ where: { id: loan.id }, data: { status: correctStatus } }).catch(() => {});
      }
    }
  }

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

    return updated;
  });
}

async function updateLoan(id, payload) {
  const loan = await getLoanById(id);
  if (['COMPLETED', 'CLOSED'].includes(loan.status)) {
    throw ApiError.badRequest(`Cannot edit a loan with status ${loan.status}`);
  }

  const newPrincipal = payload.principal !== undefined ? Number(payload.principal) : Number(loan.principal);
  const newInterestRate = payload.interestRate !== undefined ? Number(payload.interestRate) : Number(loan.interestRate);
  const newAgreementFee = payload.agreementFee !== undefined ? Number(payload.agreementFee) : (Number(loan.agreementFee) || 0);
  const newTermCount = payload.termCount !== undefined ? Number(payload.termCount) : loan.termCount;
  const newStartDate = payload.startDate ? new Date(payload.startDate) : new Date(loan.startDate);

  const paidDues = loan.dues.filter((d) => d.status === 'PAID');
  const unpaidDues = loan.dues.filter((d) => d.status !== 'PAID');

  await prisma.$transaction(async (tx) => {
    if (paidDues.length === 0) {
      // Clean slate: recalculate entire due schedule
      let calcResult;
      if (loan.type === 'WEEKLY') {
        calcResult = weeklyCalc.calculate({
          principal: newPrincipal,
          interestRate: newInterestRate,
          agreementFee: newAgreementFee,
          termCount: newTermCount,
          startDate: newStartDate,
        });
      } else if (loan.type === 'MONTHLY') {
        calcResult = monthlyCalc.calculate({
          principal: newPrincipal,
          interestRate: newInterestRate !== undefined ? newInterestRate : 15,
          agreementFee: newAgreementFee !== undefined ? newAgreementFee : 100,
          termCount: newTermCount || 5,
          startDate: newStartDate,
        });
      } else if (loan.type === 'HIGH_VALUE') {
        calcResult = highValueCalc.calculate({
          principal: newPrincipal,
          interestRate: newInterestRate,
          startDate: newStartDate,
        });
      }

      // Delete existing dues and create new due schedule
      await tx.due.deleteMany({ where: { loanId: id } });
      await tx.due.createMany({
        data: calcResult.dueSchedule.map((d) => ({
          loanId: id,
          dueNumber: d.dueNumber,
          dueDate: d.dueDate,
          amount: d.amount,
          status: 'PENDING',
        })),
      });

      await tx.loan.update({
        where: { id },
        data: {
          principal: newPrincipal,
          interestRate: newInterestRate,
          agreementFee: newAgreementFee,
          disbursedAmount: calcResult.disbursedAmount,
          installmentAmount: calcResult.installmentAmount,
          endDate: calcResult.endDate || null,
          termCount: newTermCount || null,
          startDate: newStartDate,
          updatedAt: new Date(),
        },
      });
    } else {
      // Some dues already paid: preserve paid dues and adjust remaining unpaid dues
      if (loan.type === 'HIGH_VALUE') {
        const paidPrincipalSoFar = loan.totalCollection ? Number(loan.totalCollection) : 0;
        const newOutstanding = Math.max(0, round2(newPrincipal - paidPrincipalSoFar));
        const newMonthlyInterest = highValueCalc.recalculateInterest({
          outstandingPrincipal: newOutstanding,
          interestRate: newInterestRate,
        });

        await tx.due.updateMany({
          where: { loanId: id, status: { not: 'PAID' } },
          data: { amount: newMonthlyInterest },
        });

        await tx.loan.update({
          where: { id },
          data: {
            principal: newPrincipal,
            interestRate: newInterestRate,
            disbursedAmount: newPrincipal,
            installmentAmount: newMonthlyInterest,
            updatedAt: new Date(),
          },
        });
      } else {
        // WEEKLY or MONTHLY — update ALL dues (paid + unpaid) to a uniform
        // installment = principal ÷ termCount.  This ensures no mixed amounts
        // appear in the due schedule regardless of when the edit happens.
        let disbursedAmount = newPrincipal;
        if (loan.type === 'WEEKLY' || loan.type === 'MONTHLY') {
          const interestAmount = round2((newPrincipal * newInterestRate) / 100);
          disbursedAmount = round2(newPrincipal - interestAmount - newAgreementFee);
        }

        const allDues = loan.dues.sort((a, b) => a.dueNumber - b.dueNumber);
        const effectiveTermCount = newTermCount || allDues.length;
        const baseInstallment = round2(newPrincipal / effectiveTermCount);

        // Distribute across ALL dues; last due absorbs rounding remainder
        let runningSum = 0;
        for (let i = 0; i < allDues.length; i++) {
          const due = allDues[i];
          const isLast = i === allDues.length - 1;
          const amt = isLast
            ? round2(newPrincipal - runningSum)
            : baseInstallment;
          runningSum = round2(runningSum + amt);
          await tx.due.update({
            where: { id: due.id },
            data: { amount: amt },
          });
        }

        await tx.loan.update({
          where: { id },
          data: {
            principal: newPrincipal,
            interestRate: newInterestRate,
            agreementFee: newAgreementFee,
            disbursedAmount,
            installmentAmount: baseInstallment,
            termCount: effectiveTermCount,
            updatedAt: new Date(),
          },
        });
      }
    }
  });

  return getLoanById(id);
}

/// Returns the next suggested loan number, e.g. LN-042 (one more than the
/// highest existing numeric loan number).
async function getNextLoanNumber() {
  const loans = await prisma.loan.findMany({ select: { loanNumber: true } });
  let maxNum = 0;
  for (const l of loans) {
    if (l.loanNumber) {
      const n = parseInt(l.loanNumber.replace(/\D/g, ''), 10);
      if (!isNaN(n) && n > maxNum) maxNum = n;
    }
  }
  const next = maxNum + 1;
  return `LN-${String(next).padStart(3, '0')}`;
}

module.exports = { createLoan, updateLoan, getLoanById, listLoans, closeLoan, repayPrincipal, getNextLoanNumber };

