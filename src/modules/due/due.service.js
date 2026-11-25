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
  const startOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  return prisma.due.findMany({
    where: {
      status: { in: ['PENDING', 'MISSED'] },
      dueDate: { lt: startOfDay },
    },
    include: { loan: { include: { customer: true } } },
    orderBy: { loan: { loanNumber: 'asc' } },
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
 * Also restores any mistakenly MISSED future/today dues to PENDING.
 * Synchronizes loan OVERDUE/ACTIVE statuses accordingly.
 */
async function markOverdueDues() {
  const now = new Date();
  const startOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate());

  // 1. Mark dues as MISSED only if their due date is strictly in the past (before today)
  const result = await prisma.due.updateMany({
    where: { status: 'PENDING', dueDate: { lt: startOfDay } },
    data: { status: 'MISSED' },
  });

  // 2. Self-heal: If any due has dueDate >= startOfDay (today or future), it must be PENDING, never MISSED
  await prisma.due.updateMany({
    where: { status: 'MISSED', dueDate: { gte: startOfDay } },
    data: { status: 'PENDING' },
  });

  // 3. Find all active/overdue loans that currently have at least one MISSED due
  const overdueLoanDues = await prisma.due.findMany({
    where: { status: 'MISSED' },
    select: { loanId: true },
    distinct: ['loanId'],
  });
  const overdueIds = overdueLoanDues.map((d) => d.loanId);

  // 4. Update loans with missed dues to OVERDUE (if they are not CLOSED or COMPLETED)
  if (overdueIds.length > 0) {
    await prisma.loan.updateMany({
      where: {
        id: { in: overdueIds },
        status: { notIn: ['CLOSED', 'COMPLETED'] },
      },
      data: { status: 'OVERDUE' },
    });
  }

  // 5. Update loans that have NO missed dues back to ACTIVE (if they were marked OVERDUE)
  await prisma.loan.updateMany({
    where: {
      id: { notIn: overdueIds },
      status: 'OVERDUE',
    },
    data: { status: 'ACTIVE' },
  });

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
    orderBy: { loan: { loanNumber: 'asc' } },
  });
}

/**
 * Returns all pending/missed dues grouped by customer.
 * Each item includes customer info and a count + list of their pending dues.
 */
async function getDuesByCustomer() {
  const now = new Date();
  const endOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 23, 59, 59, 999);

  const dues = await prisma.due.findMany({
    where: { 
      status: { in: ['PENDING', 'MISSED'] },
      dueDate: { lte: endOfDay }
    },
    include: { loan: { include: { customer: { select: { id: true, name: true, phone: true } } } } },
    orderBy: { loan: { loanNumber: 'asc' } },
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
        loanId: due.loan?.id || null,
        loanNumber: due.loan?.loanNumber || null,
        pendingCount: 0,
        totalAmount: 0,
        dues: [],
      };
    }
    grouped[customer.id].pendingCount += 1;
    grouped[customer.id].totalAmount += Number(due.amount);
    grouped[customer.id].dues.push(due);
  }

  // Sort by loan number numerically
  return Object.values(grouped).sort((a, b) => {
    const numA = a.loanNumber ? parseInt(a.loanNumber.replace(/\D/g, ''), 10) : Infinity;
    const numB = b.loanNumber ? parseInt(b.loanNumber.replace(/\D/g, ''), 10) : Infinity;
    return numA - numB;
  });
}

module.exports = { listDues, getUpcoming, getOverdue, getDueById, markOverdueDues, getTodaysDues, getDuesByCustomer };

