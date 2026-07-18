const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');

async function listDues({ loanId, customerId, status, fromDate, toDate, page = 1, limit = 20 }) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 20;
  const where = {};
  if (loanId) where.loanId = loanId;
  if (status) where.status = status;
  if (customerId) where.loan = { customerId };
  if (fromDate || toDate) {
    where.dueDate = {};
    if (fromDate) where.dueDate.gte = new Date(fromDate);
    if (toDate) where.dueDate.lte = new Date(toDate);
  }

  const [items, total] = await Promise.all([
    prisma.due.findMany({
      where,
      include: { loan: { include: { customer: { select: { id: true, name: true, phone: true } } } } },
      orderBy: { dueDate: 'asc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.due.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function getUpcoming(days = 7) {
  const now = new Date();
  const future = new Date();
  future.setDate(now.getDate() + days);

  return prisma.due.findMany({
    where: { status: 'PENDING', dueDate: { gte: now, lte: future } },
    include: { loan: { include: { customer: true } } },
    orderBy: { dueDate: 'asc' },
  });
}

async function getOverdue() {
  const now = new Date();
  return prisma.due.findMany({
    where: { status: { in: ['PENDING', 'MISSED'] }, dueDate: { lt: now } },
    include: { loan: { include: { customer: true } } },
    orderBy: { dueDate: 'asc' },
  });
}

async function getDueById(id) {
  const due = await prisma.due.findUnique({
    where: { id },
    include: { loan: { include: { customer: true } } },
  });
  if (!due) throw ApiError.notFound('Due not found');
  return due;
}

/**
 * Marks all PENDING dues past their due date as MISSED.
 * Called by the overdueChecker cron job daily.
 */
async function markOverdueDues() {
  const now = new Date();
  const result = await prisma.due.updateMany({
    where: { status: 'PENDING', dueDate: { lt: now } },
    data: { status: 'MISSED' },
  });

  // Loans with any MISSED due should be flagged OVERDUE
  const overdueLoanIds = await prisma.due.findMany({
    where: { status: 'MISSED' },
    select: { loanId: true },
    distinct: ['loanId'],
  });

  if (overdueLoanIds.length > 0) {
    await prisma.loan.updateMany({
      where: { id: { in: overdueLoanIds.map((d) => d.loanId) }, status: 'ACTIVE' },
      data: { status: 'OVERDUE' },
    });
  }

  return { updatedCount: result.count };
}

/**
 * Returns all pending/missed dues due exactly today.
 */
async function getTodaysDues() {
  const now = new Date();
  const startOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const endOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59, 59, 999);

  return prisma.due.findMany({
    where: {
      status: { in: ['PENDING', 'MISSED'] },
      dueDate: { gte: startOfDay, lte: endOfDay },
    },
    include: { loan: { include: { customer: { select: { id: true, name: true, phone: true } } } } },
    orderBy: { dueDate: 'asc' },
  });
}

/**
 * Returns all pending/missed dues grouped by customer.
 * Each item includes customer info and a count + list of their pending dues.
 */
async function getDuesByCustomer() {
  const dues = await prisma.due.findMany({
    where: { status: { in: ['PENDING', 'MISSED'] } },
    include: { loan: { include: { customer: { select: { id: true, name: true, phone: true } } } } },
    orderBy: { dueDate: 'asc' },
  });

  // Group by customer
  const grouped = {};
  for (const due of dues) {
    const customer = due.loan?.customer;
    if (!customer) continue;
    if (!grouped[customer.id]) {
      grouped[customer.id] = {
        customerId: customer.id,
        customerName: customer.name,
        customerPhone: customer.phone,
        pendingCount: 0,
        totalAmount: 0,
        dues: [],
      };
    }
    grouped[customer.id].pendingCount += 1;
    grouped[customer.id].totalAmount += Number(due.amount);
    grouped[customer.id].dues.push(due);
  }

  return Object.values(grouped).sort((a, b) => b.pendingCount - a.pendingCount);
}

module.exports = { listDues, getUpcoming, getOverdue, getDueById, markOverdueDues, getTodaysDues, getDuesByCustomer };

