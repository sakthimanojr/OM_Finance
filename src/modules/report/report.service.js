const ExcelJS = require('exceljs');
const prisma = require('../../config/database');

async function collectionsReport(fromDate, toDate) {
  const where = {};
  if (fromDate || toDate) {
    where.paidAt = {};
    if (fromDate) where.paidAt.gte = new Date(fromDate);
    if (toDate) where.paidAt.lte = new Date(toDate);
  }
  where.status = 'SUCCESS';

  const payments = await prisma.payment.findMany({
    where,
    include: { customer: true, loan: true, due: true },
    orderBy: { paidAt: 'asc' },
  });

  const workbook = new ExcelJS.Workbook();
  const sheet = workbook.addWorksheet('Collections');
  sheet.columns = [
    { header: 'Date', key: 'date', width: 14 },
    { header: 'Customer', key: 'customer', width: 25 },
    { header: 'Phone', key: 'phone', width: 15 },
    { header: 'Loan Type', key: 'loanType', width: 14 },
    { header: 'Due #', key: 'dueNumber', width: 8 },
    { header: 'Amount', key: 'amount', width: 14 },
    { header: 'Method', key: 'method', width: 10 },
    { header: 'UPI Ref', key: 'upiRef', width: 20 },
  ];

  payments.forEach((p) => {
    sheet.addRow({
      date: p.paidAt ? p.paidAt.toLocaleDateString('en-IN') : '',
      customer: p.customer.name,
      phone: p.customer.phone,
      loanType: p.loan.type,
      dueNumber: p.due.dueNumber,
      amount: Number(p.amount),
      method: p.method,
      upiRef: p.upiRefNumber || '',
    });
  });

  sheet.getRow(1).font = { bold: true };
  return workbook;
}

async function loanPortfolioReport() {
  const loans = await prisma.loan.findMany({
    include: { customer: true, dues: true },
    orderBy: { createdAt: 'desc' },
  });

  const workbook = new ExcelJS.Workbook();
  const sheet = workbook.addWorksheet('Loan Portfolio');
  sheet.columns = [
    { header: 'Loan ID', key: 'id', width: 36 },
    { header: 'Customer', key: 'customer', width: 25 },
    { header: 'Type', key: 'type', width: 12 },
    { header: 'Principal', key: 'principal', width: 14 },
    { header: 'Disbursed', key: 'disbursed', width: 14 },
    { header: 'Collected', key: 'collected', width: 14 },
    { header: 'Status', key: 'status', width: 12 },
    { header: 'Pending Dues', key: 'pendingDues', width: 14 },
    { header: 'Start Date', key: 'startDate', width: 14 },
  ];

  loans.forEach((loan) => {
    sheet.addRow({
      id: loan.id,
      customer: loan.customer.name,
      type: loan.type,
      principal: Number(loan.principal),
      disbursed: Number(loan.disbursedAmount),
      collected: Number(loan.totalCollection),
      status: loan.status,
      pendingDues: loan.dues.filter((d) => d.status !== 'PAID').length,
      startDate: loan.startDate.toLocaleDateString('en-IN'),
    });
  });

  sheet.getRow(1).font = { bold: true };
  return workbook;
}

async function overdueReport() {
  const dues = await prisma.due.findMany({
    where: { status: { in: ['MISSED', 'PENDING'] }, dueDate: { lt: new Date() } },
    include: { loan: { include: { customer: true } } },
    orderBy: { dueDate: 'asc' },
  });

  const workbook = new ExcelJS.Workbook();
  const sheet = workbook.addWorksheet('Overdue');
  sheet.columns = [
    { header: 'Customer', key: 'customer', width: 25 },
    { header: 'Phone', key: 'phone', width: 15 },
    { header: 'Loan Type', key: 'loanType', width: 12 },
    { header: 'Due #', key: 'dueNumber', width: 8 },
    { header: 'Due Date', key: 'dueDate', width: 14 },
    { header: 'Amount', key: 'amount', width: 14 },
    { header: 'Days Overdue', key: 'daysOverdue', width: 14 },
  ];

  const now = new Date();
  dues.forEach((due) => {
    const daysOverdue = Math.floor((now - new Date(due.dueDate)) / (1000 * 60 * 60 * 24));
    sheet.addRow({
      customer: due.loan.customer.name,
      phone: due.loan.customer.phone,
      loanType: due.loan.type,
      dueNumber: due.dueNumber,
      dueDate: due.dueDate.toLocaleDateString('en-IN'),
      amount: Number(due.amount),
      daysOverdue,
    });
  });

  sheet.getRow(1).font = { bold: true };
  return workbook;
}

module.exports = { collectionsReport, loanPortfolioReport, overdueReport, monthlyCollections, loanPortfolioJson, interestProfitSummary, overdueDetailJson, disbursementSummary };

// ─────────────────────────────────────────────────────────────────────────────
// JSON Report Functions (for interactive Flutter screens)
// ─────────────────────────────────────────────────────────────────────────────

/** Monthly collections — grouped by year-month */
async function monthlyCollections() {
  const payments = await prisma.payment.findMany({
    where: { status: 'SUCCESS' },
    include: {
      customer: { select: { id: true, name: true, phone: true } },
      loan: { select: { loanNumber: true, type: true } },
      due: { select: { dueNumber: true } },
    },
    orderBy: { paidAt: 'asc' },
  });

  const monthMap = {};
  for (const p of payments) {
    if (!p.paidAt) continue;
    const key = `${p.paidAt.getFullYear()}-${String(p.paidAt.getMonth() + 1).padStart(2, '0')}`;
    if (!monthMap[key]) monthMap[key] = { month: key, total: 0, count: 0, payments: [] };
    monthMap[key].total += Number(p.amount);
    monthMap[key].count += 1;
    monthMap[key].payments.push({
      id: p.id,
      date: p.paidAt,
      customerName: p.customer.name,
      customerPhone: p.customer.phone,
      loanNumber: p.loan.loanNumber,
      loanType: p.loan.type,
      dueNumber: p.due.dueNumber,
      amount: Number(p.amount),
      method: p.method,
      upiRef: p.upiRefNumber || null,
    });
  }

  const months = Object.values(monthMap).sort((a, b) => b.month.localeCompare(a.month));
  const grandTotal = months.reduce((s, m) => s + m.total, 0);
  return { grandTotal, months };
}

/** Full loan portfolio as JSON */
async function loanPortfolioJson() {
  const loans = await prisma.loan.findMany({
    include: {
      customer: { select: { id: true, name: true, phone: true } },
      dues: { select: { status: true, amount: true, dueDate: true } },
    },
    orderBy: { createdAt: 'desc' },
  });

  const items = loans.map((l) => {
    const pendingDues = l.dues.filter((d) => d.status !== 'PAID');
    const pendingAmount = pendingDues.reduce((s, d) => s + Number(d.amount), 0);
    const interestProfit = Number(l.totalCollection) - Number(l.disbursedAmount);
    const nextDue = pendingDues
      .filter((d) => d.status === 'PENDING')
      .sort((a, b) => new Date(a.dueDate) - new Date(b.dueDate))[0];

    return {
      id: l.id,
      loanNumber: l.loanNumber,
      customerName: l.customer.name,
      customerPhone: l.customer.phone,
      customerId: l.customer.id,
      type: l.type,
      principal: Number(l.principal),
      disbursedAmount: Number(l.disbursedAmount),
      totalCollection: Number(l.totalCollection),
      interestRate: Number(l.interestRate),
      interestProfit: Math.max(0, interestProfit),
      status: l.status,
      pendingDuesCount: pendingDues.length,
      pendingAmount,
      startDate: l.startDate,
      endDate: l.endDate,
      nextDueDate: nextDue?.dueDate || null,
    };
  });

  const summary = {
    totalLoans: items.length,
    activeLoans: items.filter((i) => i.status === 'ACTIVE').length,
    overdueLoans: items.filter((i) => i.status === 'OVERDUE').length,
    completedLoans: items.filter((i) => i.status === 'COMPLETED').length,
    totalDisbursed: items.reduce((s, i) => s + i.disbursedAmount, 0),
    totalCollected: items.reduce((s, i) => s + i.totalCollection, 0),
    totalInterestProfit: items.reduce((s, i) => s + i.interestProfit, 0),
    totalPendingAmount: items.reduce((s, i) => s + i.pendingAmount, 0),
  };

  return { summary, loans: items };
}

/** Interest profit summary — by month and loan type */
async function interestProfitSummary() {
  const loans = await prisma.loan.findMany({
    select: {
      loanNumber: true,
      type: true,
      principal: true,
      disbursedAmount: true,
      totalCollection: true,
      interestRate: true,
      startDate: true,
      status: true,
      customer: { select: { name: true, phone: true } },
    },
    orderBy: { startDate: 'asc' },
  });

  const monthMap = {};
  let totalDisbursed = 0;
  let totalCollected = 0;

  const loanItems = loans.map((l) => {
    const disbursed = Number(l.disbursedAmount);
    const collected = Number(l.totalCollection);
    const profit = Math.max(0, collected - disbursed);
    totalDisbursed += disbursed;
    totalCollected += collected;

    const key = `${l.startDate.getFullYear()}-${String(l.startDate.getMonth() + 1).padStart(2, '0')}`;
    if (!monthMap[key]) monthMap[key] = { month: key, disbursed: 0, collected: 0, profit: 0, count: 0 };
    monthMap[key].disbursed += disbursed;
    monthMap[key].collected += collected;
    monthMap[key].profit += profit;
    monthMap[key].count += 1;

    return {
      loanNumber: l.loanNumber,
      customerName: l.customer.name,
      type: l.type,
      interestRate: Number(l.interestRate),
      disbursedAmount: disbursed,
      totalCollected: collected,
      interestProfit: profit,
      status: l.status,
    };
  });

  const byType = {};
  for (const l of loanItems) {
    if (!byType[l.type]) byType[l.type] = { type: l.type, disbursed: 0, collected: 0, profit: 0, count: 0 };
    byType[l.type].disbursed += l.disbursedAmount;
    byType[l.type].collected += l.totalCollected;
    byType[l.type].profit += l.interestProfit;
    byType[l.type].count += 1;
  }

  return {
    summary: { totalDisbursed, totalCollected, totalProfit: Math.max(0, totalCollected - totalDisbursed) },
    byMonth: Object.values(monthMap).sort((a, b) => b.month.localeCompare(a.month)),
    byType: Object.values(byType),
    loans: loanItems,
  };
}

/** Overdue detail — customers with missed dues */
async function overdueDetailJson() {
  const now = new Date();
  const dues = await prisma.due.findMany({
    where: { status: { in: ['MISSED', 'PENDING'] }, dueDate: { lt: now } },
    include: {
      loan: {
        select: {
          loanNumber: true,
          type: true,
          customer: { select: { id: true, name: true, phone: true } },
        },
      },
    },
    orderBy: { dueDate: 'asc' },
  });

  // Group by customer
  const customerMap = {};
  for (const due of dues) {
    const cid = due.loan.customer.id;
    const daysOverdue = Math.floor((now - new Date(due.dueDate)) / (1000 * 60 * 60 * 24));
    if (!customerMap[cid]) {
      customerMap[cid] = {
        customerId: cid,
        customerName: due.loan.customer.name,
        customerPhone: due.loan.customer.phone,
        totalOverdueAmount: 0,
        missedDuesCount: 0,
        maxDaysOverdue: 0,
        dues: [],
      };
    }
    customerMap[cid].totalOverdueAmount += Number(due.amount);
    customerMap[cid].missedDuesCount += 1;
    customerMap[cid].maxDaysOverdue = Math.max(customerMap[cid].maxDaysOverdue, daysOverdue);
    customerMap[cid].dues.push({
      id: due.id,
      loanNumber: due.loan.loanNumber,
      loanType: due.loan.type,
      dueNumber: due.dueNumber,
      dueDate: due.dueDate,
      amount: Number(due.amount),
      status: due.status,
      daysOverdue,
    });
  }

  const customers = Object.values(customerMap).sort((a, b) => b.totalOverdueAmount - a.totalOverdueAmount);
  const grandTotal = customers.reduce((s, c) => s + c.totalOverdueAmount, 0);
  return { grandTotal, totalCustomers: customers.length, customers };
}

/** Disbursement summary — loans issued by month */
async function disbursementSummary() {
  const loans = await prisma.loan.findMany({
    select: {
      loanNumber: true,
      type: true,
      principal: true,
      disbursedAmount: true,
      startDate: true,
      status: true,
      customer: { select: { name: true, phone: true } },
    },
    orderBy: { startDate: 'desc' },
  });

  const monthMap = {};
  for (const l of loans) {
    const key = `${l.startDate.getFullYear()}-${String(l.startDate.getMonth() + 1).padStart(2, '0')}`;
    if (!monthMap[key]) monthMap[key] = { month: key, count: 0, totalDisbursed: 0, byType: {}, loans: [] };
    monthMap[key].count += 1;
    monthMap[key].totalDisbursed += Number(l.disbursedAmount);
    if (!monthMap[key].byType[l.type]) monthMap[key].byType[l.type] = { count: 0, amount: 0 };
    monthMap[key].byType[l.type].count += 1;
    monthMap[key].byType[l.type].amount += Number(l.disbursedAmount);
    monthMap[key].loans.push({
      loanNumber: l.loanNumber,
      customerName: l.customer.name,
      customerPhone: l.customer.phone,
      type: l.type,
      disbursedAmount: Number(l.disbursedAmount),
      status: l.status,
    });
  }

  const months = Object.values(monthMap).sort((a, b) => b.month.localeCompare(a.month));
  const grandTotal = months.reduce((s, m) => s + m.totalDisbursed, 0);
  return { grandTotal, totalLoans: loans.length, months };
}
