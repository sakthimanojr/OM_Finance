const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');

/**
 * Creates a full snapshot of a loan when it gets closed/completed.
 * Stores customer details, loan details, full payment history and due schedule.
 */
async function createSnapshot(loanId) {
  // Check if already archived
  const existing = await prisma.closedLoan.findUnique({ where: { loanId } });
  if (existing) return existing;

  const loan = await prisma.loan.findUnique({
    where: { id: loanId },
    include: {
      customer: { select: { id: true, name: true, phone: true } },
      dues: { orderBy: { dueNumber: 'asc' } },
      payments: {
        include: { receipt: true },
        orderBy: { createdAt: 'asc' },
      },
    },
  });

  if (!loan) throw ApiError.notFound('Loan not found');

  const closedLoan = await prisma.closedLoan.create({
    data: {
      loanId: loan.id,
      customerId: loan.customerId,
      customerName: loan.customer.name,
      customerPhone: loan.customer.phone,
      loanType: loan.type,
      loanNumber: loan.loanNumber || null,
      principal: loan.principal,
      interestRate: loan.interestRate,
      disbursedAmount: loan.disbursedAmount,
      totalCollected: loan.totalCollection,
      startDate: loan.startDate,
      endDate: loan.endDate,
      paymentHistory: loan.payments.map((p) => ({
        id: p.id,
        amount: p.amount,
        method: p.method,
        status: p.status,
        paidAt: p.paidAt,
        upiRefNumber: p.upiRefNumber,
        receiptNumber: p.receipt?.receiptNumber || null,
      })),
      dueSchedule: loan.dues.map((d) => ({
        dueNumber: d.dueNumber,
        dueDate: d.dueDate,
        amount: d.amount,
        status: d.status,
        paidDate: d.paidDate,
        paidAmount: d.paidAmount,
        paymentMethod: d.paymentMethod,
      })),
    },
  });

  return closedLoan;
}

async function listClosedLoans({ page = 1, limit = 20, customerName } = {}) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 20;
  const where = {};
  if (customerName) {
    where.customerName = { contains: customerName, mode: 'insensitive' };
  }

  const [items, total] = await Promise.all([
    prisma.closedLoan.findMany({
      where,
      orderBy: { closedAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.closedLoan.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function getClosedLoan(id) {
  const closedLoan = await prisma.closedLoan.findUnique({ where: { id } });
  if (!closedLoan) throw ApiError.notFound('Closed loan not found');
  return closedLoan;
}

module.exports = { createSnapshot, listClosedLoans, getClosedLoan };
