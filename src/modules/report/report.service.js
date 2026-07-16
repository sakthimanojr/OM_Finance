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

module.exports = { collectionsReport, loanPortfolioReport, overdueReport };
