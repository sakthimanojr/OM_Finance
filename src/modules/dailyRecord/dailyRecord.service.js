const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { round2 } = require('../../utils/currencyFormatter');

/**
 * Normalizes a YYYY-MM-DD string into a start-of-day UTC Date.
 */
function parseDateOnly(dateStr) {
  if (!dateStr || typeof dateStr !== 'string') {
    const today = new Date();
    const y = today.getFullYear();
    const m = String(today.getMonth() + 1).padStart(2, '0');
    const d = String(today.getDate()).padStart(2, '0');
    dateStr = `${y}-${m}-${d}`;
  }
  const parts = dateStr.split('-');
  if (parts.length !== 3) throw ApiError.badRequest('Invalid date format. Expected YYYY-MM-DD');
  const y = parseInt(parts[0], 10);
  const m = parseInt(parts[1], 10) - 1;
  const d = parseInt(parts[2], 10);

  const startOfDay = new Date(Date.UTC(y, m, d, 0, 0, 0, 0));
  const endOfDay = new Date(Date.UTC(y, m, d, 23, 59, 59, 999));
  return { dateStr, startOfDay, endOfDay };
}

/**
 * Fetches daily record for a date along with live database stats (payments & loans).
 */
async function getDailyRecord(queryDate) {
  const { dateStr, startOfDay, endOfDay } = parseDateOnly(queryDate);

  // 1. Live Payments collected today (Finance loan repayments only)
  const paymentsToday = await prisma.payment.findMany({
    where: {
      status: 'SUCCESS',
      paidAt: { gte: startOfDay, lte: endOfDay },
    },
    include: {
      customer: { select: { id: true, name: true, phone: true } },
      loan: { select: { id: true, loanNumber: true, type: true } },
      due: { select: { dueNumber: true } },
    },
    orderBy: { paidAt: 'asc' },
  });

  const autoBillIncome = round2(
    paymentsToday.reduce((sum, p) => sum + Number(p.amount), 0)
  );

  const paymentsList = paymentsToday.map((p) => ({
    id: p.id,
    amount: Number(p.amount),
    method: p.method,
    customerName: p.customer?.name || 'Customer',
    customerPhone: p.customer?.phone || '',
    loanNumber: p.loan?.loanNumber || '',
    loanType: p.loan?.type || '',
    dueNumber: p.due?.dueNumber || null,
    paidAt: p.paidAt,
  }));

  // 2. Live Loans given out today (startDate on this day or createdAt on this day)
  const loansToday = await prisma.loan.findMany({
    where: {
      OR: [
        { startDate: { gte: startOfDay, lte: endOfDay } },
        { createdAt: { gte: startOfDay, lte: endOfDay } },
      ],
      status: { not: 'CLOSED' },
    },
    include: {
      customer: { select: { id: true, name: true, phone: true } },
    },
    orderBy: { createdAt: 'asc' },
  });

  // Deduplicate by loan ID in case both conditions match
  const uniqueLoansMap = new Map();
  for (const l of loansToday) {
    if (!uniqueLoansMap.has(l.id)) uniqueLoansMap.set(l.id, l);
  }
  const uniqueLoans = Array.from(uniqueLoansMap.values());

  const loansGivenList = uniqueLoans.map((l) => {
    const principal = Number(l.principal);
    const disbursedAmount = Number(l.disbursedAmount);
    const upfrontIncome = Math.max(0, round2(principal - disbursedAmount));
    return {
      id: l.id,
      loanNumber: l.loanNumber,
      customerName: l.customer?.name || 'Customer',
      customerPhone: l.customer?.phone || '',
      type: l.type,
      principal,
      interestRate: Number(l.interestRate),
      agreementFee: Number(l.agreementFee),
      disbursedAmount,
      upfrontIncome,
      startDate: l.startDate,
      createdAt: l.createdAt,
    };
  });

  const autoLoansGivenCount = loansGivenList.length;
  const autoLoansGivenPrincipal = round2(
    loansGivenList.reduce((sum, l) => sum + l.principal, 0)
  );
  const autoLoansGivenIncome = round2(
    loansGivenList.reduce((sum, l) => sum + l.upfrontIncome, 0)
  );
  const autoLoansGivenNetDisbursed = round2(
    loansGivenList.reduce((sum, l) => sum + l.disbursedAmount, 0)
  );

  // 3. Check for existing saved DailyRecord
  const savedRecord = await prisma.dailyRecord.findUnique({
    where: { recordDate: startOfDay },
  });

  // 4. Fetch previous day's closing balance (most recent record prior to this date)
  const previousRecord = await prisma.dailyRecord.findFirst({
    where: { recordDate: { lt: startOfDay } },
    orderBy: { recordDate: 'desc' },
  });
  const previousDayClosing = previousRecord ? Number(previousRecord.closingBalance) : 0;

  // Decide current active figures
  const openingBalance = savedRecord
    ? Number(savedRecord.openingBalance)
    : previousDayClosing;

  const billIncome = savedRecord
    ? Number(savedRecord.billIncome)
    : autoBillIncome;

  const otherIncome1Label = savedRecord?.otherIncome1Label || '';
  const otherIncome1Amount = savedRecord ? Number(savedRecord.otherIncome1Amount) : 0;
  const otherIncome2Label = savedRecord?.otherIncome2Label || '';
  const otherIncome2Amount = savedRecord ? Number(savedRecord.otherIncome2Amount) : 0;

  const expenses = savedRecord ? Number(savedRecord.expenses) : 0;
  const expensesDetails = savedRecord?.expensesDetails || [];

  const loansGivenCount = savedRecord ? savedRecord.loansGivenCount : autoLoansGivenCount;
  const loansGivenPrincipal = savedRecord
    ? Number(savedRecord.loansGivenPrincipal)
    : autoLoansGivenPrincipal;
  const loansGivenIncome = savedRecord
    ? Number(savedRecord.loansGivenIncome)
    : autoLoansGivenIncome;
  const loansGivenNetDisbursed = savedRecord
    ? Number(savedRecord.loansGivenNetDisbursed)
    : autoLoansGivenNetDisbursed;

  // Calculated closing in-hand balance:
  // Opening + Bill Income + Upfront Loan Income + Other Incomes - Full Loans Given - Day Expenses
  const closingBalance = round2(
    openingBalance +
      billIncome +
      loansGivenIncome +
      otherIncome1Amount +
      otherIncome2Amount -
      loansGivenPrincipal -
      expenses
  );

  return {
    date: dateStr,
    isSaved: !!savedRecord,
    savedRecordId: savedRecord?.id || null,
    openingBalance,
    previousDayClosing,
    billIncome,
    autoBillIncome,
    paymentsCount: paymentsList.length,
    paymentsList,
    otherIncome1Label,
    otherIncome1Amount,
    otherIncome2Label,
    otherIncome2Amount,
    expenses,
    expensesDetails,
    loansGivenCount,
    loansGivenPrincipal,
    loansGivenIncome,
    loansGivenNetDisbursed,
    loansGivenList,
    closingBalance,
    notes: savedRecord?.notes || '',
    updatedBy: savedRecord?.updatedBy || null,
    updatedAt: savedRecord?.updatedAt || null,
  };
}

/**
 * Saves (upserts) the daily record for a given date.
 */
async function saveDailyRecord(payload, adminUserId = null) {
  const { dateStr, startOfDay } = parseDateOnly(payload.date);

  const openingBalance = round2(Number(payload.openingBalance) || 0);
  const billIncome = round2(Number(payload.billIncome) || 0);
  const otherIncome1Label = payload.otherIncome1Label ? String(payload.otherIncome1Label).trim() : null;
  const otherIncome1Amount = round2(Number(payload.otherIncome1Amount) || 0);
  const otherIncome2Label = payload.otherIncome2Label ? String(payload.otherIncome2Label).trim() : null;
  const otherIncome2Amount = round2(Number(payload.otherIncome2Amount) || 0);
  const expenses = round2(Number(payload.expenses) || 0);
  const expensesDetails = payload.expensesDetails || null;

  const loansGivenCount = parseInt(payload.loansGivenCount, 10) || 0;
  const loansGivenPrincipal = round2(Number(payload.loansGivenPrincipal) || 0);
  const loansGivenIncome = round2(Number(payload.loansGivenIncome) || 0);
  const loansGivenNetDisbursed = round2(
    Number(payload.loansGivenNetDisbursed) || (loansGivenPrincipal - loansGivenIncome)
  );

  const closingBalance = round2(
    openingBalance +
      billIncome +
      loansGivenIncome +
      otherIncome1Amount +
      otherIncome2Amount -
      loansGivenPrincipal -
      expenses
  );

  const record = await prisma.dailyRecord.upsert({
    where: { recordDate: startOfDay },
    create: {
      recordDate: startOfDay,
      openingBalance,
      billIncome,
      otherIncome1Label,
      otherIncome1Amount,
      otherIncome2Label,
      otherIncome2Amount,
      expenses,
      expensesDetails,
      loansGivenCount,
      loansGivenPrincipal,
      loansGivenIncome,
      loansGivenNetDisbursed,
      closingBalance,
      notes: payload.notes || null,
      updatedBy: adminUserId,
    },
    update: {
      openingBalance,
      billIncome,
      otherIncome1Label,
      otherIncome1Amount,
      otherIncome2Label,
      otherIncome2Amount,
      expenses,
      expensesDetails,
      loansGivenCount,
      loansGivenPrincipal,
      loansGivenIncome,
      loansGivenNetDisbursed,
      closingBalance,
      notes: payload.notes || null,
      updatedBy: adminUserId,
      updatedAt: new Date(),
    },
  });

  return {
    record,
    closingBalance,
    message: `Daily record for ${dateStr} saved successfully`,
  };
}

module.exports = {
  getDailyRecord,
  saveDailyRecord,
};
