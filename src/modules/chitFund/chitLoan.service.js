/**
 * chitLoan.service.js
 * Admin-created advances from the accumulated fund to chit members.
 *
 * RULES:
 * - Interest = principal × 3% (flat, one-time)
 * - Loan amount must not exceed available fund balance
 * - Loan disbursement → LOAN_DISBURSEMENT debit ledger entry
 * - Principal repayment → LOAN_PRINCIPAL_REPAYMENT credit entry
 * - Interest repayment → LOAN_INTEREST_CREDIT credit entry
 * - Admin-created loans automatically appear in user's My Chit Fund view
 */
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { getAvailableBalance } = require('./chitFund.service');
const notificationService = require('../notification/notification.service');

// ─── Create Loan ──────────────────────────────────────────────────────────────

async function createLoan(chitId, payload, adminUserId) {
  const chit = await prisma.chitFund.findUnique({ where: { id: chitId } });
  if (!chit) throw ApiError.notFound('Chit fund not found');
  if (chit.status === 'COMPLETED') throw ApiError.badRequest('Chit fund is completed');

  const member = await prisma.chitMember.findFirst({
    where: { id: payload.memberId, chitId },
    include: { customer: true },
  });
  if (!member) throw ApiError.notFound('Member not found in this chit fund');
  if (member.status !== 'ACTIVE') throw ApiError.badRequest('Member is not active');

  const principal = Math.round(Number(payload.principalAmount) * 100) / 100;
  const interestRate = Number(chit.interestRate); // e.g. 3.00
  const interestAmount = Math.round(principal * (interestRate / 100) * 100) / 100;
  const totalRepayment = Math.round((principal + interestAmount) * 100) / 100;

  // RULE: Cannot disburse more than available balance
  const availableBalance = await getAvailableBalance(chitId);
  if (principal > availableBalance) {
    throw ApiError.badRequest(
      `Insufficient fund. Available: ₹${availableBalance.toFixed(2)}, ` +
        `Requested: ₹${principal.toFixed(2)}`
    );
  }

  const loan = await prisma.$transaction(async (tx) => {
    // Recheck balance inside transaction to prevent race conditions
    const ledger = await tx.chitFundLedger.findMany({ where: { chitId } });
    const balance = ledger.reduce((acc, e) => {
      return e.direction === 'CREDIT' ? acc + Number(e.amount) : acc - Number(e.amount);
    }, 0);
    const lockedBalance = Math.round(balance * 100) / 100;

    if (principal > lockedBalance) {
      throw ApiError.badRequest(
        `Insufficient fund (locked check). Available: ₹${lockedBalance.toFixed(2)}`
      );
    }

    const created = await tx.chitLoan.create({
      data: {
        chitId,
        memberId: member.id,
        principalAmount: principal,
        interestRate,
        interestAmount,
        totalRepayment,
        amountPaid: 0,
        remainingAmount: totalRepayment,
        loanDate: new Date(payload.loanDate),
        dueDate: new Date(payload.dueDate),
        status: 'ACTIVE',
        createdById: adminUserId,
      },
    });

    const balanceAfter = Math.round((lockedBalance - principal) * 100) / 100;
    await tx.chitFundLedger.create({
      data: {
        chitId,
        loanId: created.id,
        transactionType: 'LOAN_DISBURSEMENT',
        amount: principal,
        direction: 'DEBIT',
        balanceAfter,
        description: `Loan to ${member.customer.name} (LN-${created.id.slice(-6).toUpperCase()})`,
        createdById: adminUserId,
      },
    });

    return created;
  });

  // Notify customer
  try {
    await notificationService.sendManual(
      member.customer.id,
      `A chit fund loan of ₹${principal.toFixed(2)} has been created for you. ` +
        `Interest: ₹${interestAmount.toFixed(2)}. Total repayment: ₹${totalRepayment.toFixed(2)}. ` +
        `Due date: ${new Date(payload.dueDate).toLocaleDateString('en-IN')}.`,
      'SMS'
    );
  } catch (_) {}

  return getLoanById(loan.id);
}

// ─── Repay Loan ───────────────────────────────────────────────────────────────

async function repayLoan(loanId, payload, adminUserId) {
  const loan = await prisma.chitLoan.findUnique({
    where: { id: loanId },
    include: {
      member: { include: { customer: true } },
      chit: true,
    },
  });
  if (!loan) throw ApiError.notFound('Loan not found');
  if (loan.status === 'PAID') throw ApiError.badRequest('Loan is already fully paid');

  const principalPaying = Math.round(Number(payload.principalAmount) * 100) / 100;
  const interestPaying = Math.round(Number(payload.interestAmount) * 100) / 100;
  const totalPaying = Math.round((principalPaying + interestPaying) * 100) / 100;

  const existingPaid = Number(loan.amountPaid);
  const remaining = Number(loan.remainingAmount);

  if (totalPaying > remaining) {
    throw ApiError.badRequest(
      `Payment (₹${totalPaying.toFixed(2)}) exceeds remaining balance (₹${remaining.toFixed(2)})`
    );
  }

  await prisma.$transaction(async (tx) => {
    const ledger = await tx.chitFundLedger.findMany({ where: { chitId: loan.chitId } });
    const currentBalance = ledger.reduce(
      (acc, e) => (e.direction === 'CREDIT' ? acc + Number(e.amount) : acc - Number(e.amount)),
      0
    );

    const newAmountPaid = Math.round((existingPaid + totalPaying) * 100) / 100;
    const newRemaining = Math.round((remaining - totalPaying) * 100) / 100;
    const newStatus = newRemaining <= 0 ? 'PAID' : newAmountPaid > 0 ? 'PARTIALLY_PAID' : loan.status;

    // Update loan record
    await tx.chitLoan.update({
      where: { id: loanId },
      data: {
        amountPaid: newAmountPaid,
        remainingAmount: newRemaining,
        status: newStatus,
      },
    });

    // Record transaction
    await tx.chitLoanTransaction.create({
      data: {
        loanId,
        transactionType: 'REPAYMENT',
        principalAmount: principalPaying,
        interestAmount: interestPaying,
        totalAmount: totalPaying,
        paymentReference: payload.paymentReference || null,
        transactionDate: payload.transactionDate ? new Date(payload.transactionDate) : new Date(),
        createdById: adminUserId,
      },
    });

    // Principal repayment → CREDIT to fund
    if (principalPaying > 0) {
      const afterPrincipal = Math.round((currentBalance + principalPaying) * 100) / 100;
      await tx.chitFundLedger.create({
        data: {
          chitId: loan.chitId,
          loanId,
          transactionType: 'LOAN_PRINCIPAL_REPAYMENT',
          amount: principalPaying,
          direction: 'CREDIT',
          balanceAfter: afterPrincipal,
          description: `Principal repayment for loan to ${loan.member.customer.name}`,
          createdById: adminUserId,
        },
      });
    }

    // Interest repayment → CREDIT to fund (grows the accumulated fund)
    if (interestPaying > 0) {
      const latestBalance = Math.round((currentBalance + principalPaying + interestPaying) * 100) / 100;
      await tx.chitFundLedger.create({
        data: {
          chitId: loan.chitId,
          loanId,
          transactionType: 'LOAN_INTEREST_CREDIT',
          amount: interestPaying,
          direction: 'CREDIT',
          balanceAfter: latestBalance,
          description: `Interest repayment for loan to ${loan.member.customer.name}`,
          createdById: adminUserId,
        },
      });
    }
  });

  // Notify customer
  try {
    await notificationService.sendManual(
      loan.member.customer.id,
      `Your chit loan repayment of ₹${totalPaying.toFixed(2)} has been recorded. ` +
        `Remaining balance: ₹${Math.max(0, Number(loan.remainingAmount) - totalPaying).toFixed(2)}.`,
      'SMS'
    );
  } catch (_) {}

  return getLoanById(loanId);
}

// ─── Query ────────────────────────────────────────────────────────────────────

async function getLoanById(loanId) {
  const loan = await prisma.chitLoan.findUnique({
    where: { id: loanId },
    include: {
      member: {
        include: { customer: { select: { id: true, name: true, phone: true, email: true } } },
      },
      chit: { select: { id: true, name: true } },
      transactions: { orderBy: { transactionDate: 'asc' } },
    },
  });
  if (!loan) throw ApiError.notFound('Loan not found');
  return loan;
}

async function listLoans(chitId, { memberId, status, page, limit } = {}) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 20;
  const where = { chitId };
  if (memberId) where.memberId = memberId;
  if (status) where.status = status;

  const [items, total] = await Promise.all([
    prisma.chitLoan.findMany({
      where,
      include: {
        member: {
          include: { customer: { select: { id: true, name: true, phone: true } } },
        },
      },
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.chitLoan.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

module.exports = { createLoan, repayLoan, getLoanById, listLoans };
