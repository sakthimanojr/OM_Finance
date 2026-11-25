const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { round2 } = require('../../utils/currencyFormatter');

let tableEnsured = false;
async function ensureDailyRecordsTable() {
  if (tableEnsured) return;
  try {
    await prisma.$executeRawUnsafe(`
      CREATE TABLE IF NOT EXISTS "daily_records" (
        "id" TEXT NOT NULL,
        "recordDate" DATE NOT NULL,
        "openingBalance" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "openingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "openingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "billIncome" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "billIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "billIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "otherIncome1Label" TEXT,
        "otherIncome1Amount" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "otherIncome2Label" TEXT,
        "otherIncome2Amount" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "expenses" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "expensesBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "expensesBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "expensesDetails" JSONB,
        "loansGivenCount" INTEGER NOT NULL DEFAULT 0,
        "loansGivenPrincipal" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenPrincipalBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenPrincipalBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenIncome" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenNetDisbursed" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenNetDisbursedBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "loansGivenNetDisbursedBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "closingBalance" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "closingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "closingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
        "notes" TEXT,
        "updatedBy" TEXT,
        "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updatedAt" TIMESTAMP(3) NOT NULL,
        CONSTRAINT "daily_records_pkey" PRIMARY KEY ("id")
      );
    `);
    await prisma.$executeRawUnsafe(`
      CREATE UNIQUE INDEX IF NOT EXISTS "daily_records_recordDate_key" ON "daily_records"("recordDate");
    `);

    // Ensure columns exist on loans and daily_records if tables were created earlier
    await prisma.$executeRawUnsafe(`ALTER TABLE "loans" ADD COLUMN IF NOT EXISTS "disbursementMethod" TEXT NOT NULL DEFAULT 'CASH';`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "openingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "openingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "billIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "billIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenPrincipalBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenPrincipalBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenNetDisbursedBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenNetDisbursedBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "expensesBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "expensesBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "closingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0;`);
    await prisma.$executeRawUnsafe(`ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "closingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0;`);

    tableEnsured = true;
  } catch (err) {
    console.error('ensureDailyRecordsTable failed:', err.message);
  }
}

function isBankPayment(method) {
  if (!method) return false;
  const m = String(method).toUpperCase();
  return m === 'BANK_TRANSFER' || m === 'UPI' || m === 'ONLINE' || m === 'GATEWAY' || m === 'GPAY' || m === 'PHONEPE';
}

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
  await ensureDailyRecordsTable();
  const { dateStr, startOfDay, endOfDay } = parseDateOnly(queryDate);

  // 1. Live Payments collected today (Finance loan repayments only)
  let paymentsToday = [];
  try {
    paymentsToday = await prisma.payment.findMany({
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
  } catch (err) {
    console.warn('dailyRecord.getDailyRecord payments error:', err.message);
  }

  let autoBillIncomeBag = 0;
  let autoBillIncomeBank = 0;

  const paymentsList = paymentsToday.map((p) => {
    const isBank = isBankPayment(p.method);
    const amt = Number(p.amount);
    if (isBank) {
      autoBillIncomeBank += amt;
    } else {
      autoBillIncomeBag += amt;
    }
    return {
      id: p.id,
      amount: amt,
      method: p.method,
      channel: isBank ? 'ACCOUNT' : 'BAG',
      channelLabel: isBank ? 'Cash in Account (Bank / UPI)' : 'Cash in Bag (Hand)',
      customerName: p.customer?.name || 'Customer',
      customerPhone: p.customer?.phone || '',
      loanNumber: p.loan?.loanNumber || '',
      loanType: p.loan?.type || '',
      dueNumber: p.due?.dueNumber || null,
      paidAt: p.paidAt,
    };
  });

  autoBillIncomeBag = round2(autoBillIncomeBag);
  autoBillIncomeBank = round2(autoBillIncomeBank);
  const autoBillIncome = round2(autoBillIncomeBag + autoBillIncomeBank);

  // 2. Live Loans given out today (startDate on this day or createdAt on this day)
  let loansToday = [];
  try {
    loansToday = await prisma.loan.findMany({
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
  } catch (err) {
    console.warn('dailyRecord.getDailyRecord loans error:', err.message);
  }

  // Deduplicate by loan ID in case both conditions match
  const uniqueLoansMap = new Map();
  for (const l of loansToday) {
    if (!uniqueLoansMap.has(l.id)) uniqueLoansMap.set(l.id, l);
  }
  const uniqueLoans = Array.from(uniqueLoansMap.values());

  let autoLoansGivenPrincipalBag = 0;
  let autoLoansGivenPrincipalBank = 0;
  let autoLoansGivenIncomeBag = 0;
  let autoLoansGivenIncomeBank = 0;
  let autoLoansGivenNetDisbursedBag = 0;
  let autoLoansGivenNetDisbursedBank = 0;

  const loansGivenList = uniqueLoans.map((l) => {
    const principal = Number(l.principal);
    const disbursedAmount = Number(l.disbursedAmount);
    const upfrontIncome = Math.max(0, round2(principal - disbursedAmount));
    const isBank = l.disbursementMethod && String(l.disbursementMethod).toUpperCase().includes('BANK');
    const method = isBank ? 'BANK' : 'CASH';

    if (isBank) {
      autoLoansGivenPrincipalBank += principal;
      autoLoansGivenIncomeBank += upfrontIncome;
      autoLoansGivenNetDisbursedBank += disbursedAmount;
    } else {
      autoLoansGivenPrincipalBag += principal;
      autoLoansGivenIncomeBag += upfrontIncome;
      autoLoansGivenNetDisbursedBag += disbursedAmount;
    }

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
      disbursementMethod: method,
      disbursementChannel: isBank ? 'ACCOUNT' : 'BAG',
      disbursementLabel: isBank ? 'Cash in Account (Bank)' : 'Cash in Bag (Hand)',
      startDate: l.startDate,
      createdAt: l.createdAt,
    };
  });

  autoLoansGivenPrincipalBag = round2(autoLoansGivenPrincipalBag);
  autoLoansGivenPrincipalBank = round2(autoLoansGivenPrincipalBank);
  autoLoansGivenIncomeBag = round2(autoLoansGivenIncomeBag);
  autoLoansGivenIncomeBank = round2(autoLoansGivenIncomeBank);
  autoLoansGivenNetDisbursedBag = round2(autoLoansGivenNetDisbursedBag);
  autoLoansGivenNetDisbursedBank = round2(autoLoansGivenNetDisbursedBank);

  const autoLoansGivenCount = loansGivenList.length;
  const autoLoansGivenPrincipal = round2(autoLoansGivenPrincipalBag + autoLoansGivenPrincipalBank);
  const autoLoansGivenIncome = round2(autoLoansGivenIncomeBag + autoLoansGivenIncomeBank);
  const autoLoansGivenNetDisbursed = round2(autoLoansGivenNetDisbursedBag + autoLoansGivenNetDisbursedBank);

  // 3. Check for existing saved DailyRecord
  let savedRecord = null;
  try {
    savedRecord = await prisma.dailyRecord.findFirst({
      where: {
        recordDate: {
          gte: startOfDay,
          lte: endOfDay,
        },
      },
    });
  } catch (err) {
    console.warn('dailyRecord.findFirst error:', err.message);
  }

  // 4. Fetch previous day's closing balance
  let previousRecord = null;
  try {
    previousRecord = await prisma.dailyRecord.findFirst({
      where: { recordDate: { lt: startOfDay } },
      orderBy: { recordDate: 'desc' },
    });
  } catch (err) {
    console.warn('dailyRecord.previousRecord error:', err.message);
  }

  const previousDayClosingBag = previousRecord ? Number(previousRecord.closingBalanceBag ?? previousRecord.closingBalance ?? 0) : 0;
  const previousDayClosingBank = previousRecord ? Number(previousRecord.closingBalanceBank ?? 0) : 0;
  const previousDayClosing = round2(previousDayClosingBag + previousDayClosingBank);

  // Active opening balances
  const openingBalanceBag = savedRecord
    ? Number(savedRecord.openingBalanceBag ?? savedRecord.openingBalance ?? 0)
    : previousDayClosingBag;
  const openingBalanceBank = savedRecord
    ? Number(savedRecord.openingBalanceBank ?? 0)
    : previousDayClosingBank;
  const openingBalance = round2(openingBalanceBag + openingBalanceBank);

  // Active bill incomes
  const billIncomeBag = savedRecord ? Number(savedRecord.billIncomeBag ?? savedRecord.billIncome ?? 0) : autoBillIncomeBag;
  const billIncomeBank = savedRecord ? Number(savedRecord.billIncomeBank ?? 0) : autoBillIncomeBank;
  const billIncome = round2(billIncomeBag + billIncomeBank);

  // Active other incomes
  const otherIncome1Label = savedRecord?.otherIncome1Label || '';
  const otherIncome1Amount = savedRecord ? Number(savedRecord.otherIncome1Amount) : 0;
  const otherIncome2Label = savedRecord?.otherIncome2Label || '';
  const otherIncome2Amount = savedRecord ? Number(savedRecord.otherIncome2Amount) : 0;

  // Active expenses
  const expensesBag = savedRecord ? Number(savedRecord.expensesBag ?? savedRecord.expenses ?? 0) : 0;
  const expensesBank = savedRecord ? Number(savedRecord.expensesBank ?? 0) : 0;
  const expenses = round2(expensesBag + expensesBank);
  const expensesDetails = savedRecord?.expensesDetails || [];

  // Active loans given
  const loansGivenCount = savedRecord ? savedRecord.loansGivenCount : autoLoansGivenCount;
  const loansGivenPrincipalBag = savedRecord
    ? Number(savedRecord.loansGivenPrincipalBag ?? savedRecord.loansGivenPrincipal ?? 0)
    : autoLoansGivenPrincipalBag;
  const loansGivenPrincipalBank = savedRecord
    ? Number(savedRecord.loansGivenPrincipalBank ?? 0)
    : autoLoansGivenPrincipalBank;
  const loansGivenPrincipal = round2(loansGivenPrincipalBag + loansGivenPrincipalBank);

  const loansGivenIncomeBag = savedRecord
    ? Number(savedRecord.loansGivenIncomeBag ?? savedRecord.loansGivenIncome ?? 0)
    : autoLoansGivenIncomeBag;
  const loansGivenIncomeBank = savedRecord
    ? Number(savedRecord.loansGivenIncomeBank ?? 0)
    : autoLoansGivenIncomeBank;
  const loansGivenIncome = round2(loansGivenIncomeBag + loansGivenIncomeBank);

  const loansGivenNetDisbursedBag = savedRecord
    ? Number(savedRecord.loansGivenNetDisbursedBag ?? (loansGivenPrincipalBag - loansGivenIncomeBag))
    : autoLoansGivenNetDisbursedBag;
  const loansGivenNetDisbursedBank = savedRecord
    ? Number(savedRecord.loansGivenNetDisbursedBank ?? (loansGivenPrincipalBank - loansGivenIncomeBank))
    : autoLoansGivenNetDisbursedBank;
  const loansGivenNetDisbursed = round2(loansGivenNetDisbursedBag + loansGivenNetDisbursedBank);

  // Closing balances:
  // Bag: OpeningBag + BillIncomeBag + UpfrontIncomeBag + OtherIncome1 - PrincipalBag - ExpensesBag
  const closingBalanceBag = round2(
    openingBalanceBag +
      billIncomeBag +
      loansGivenIncomeBag +
      otherIncome1Amount -
      loansGivenPrincipalBag -
      expensesBag
  );

  // Bank: OpeningBank + BillIncomeBank + UpfrontIncomeBank + OtherIncome2 - PrincipalBank - ExpensesBank
  const closingBalanceBank = round2(
    openingBalanceBank +
      billIncomeBank +
      loansGivenIncomeBank +
      otherIncome2Amount -
      loansGivenPrincipalBank -
      expensesBank
  );

  const closingBalance = round2(closingBalanceBag + closingBalanceBank);

  return {
    date: dateStr,
    isSaved: !!savedRecord,
    savedRecordId: savedRecord?.id || null,

    // Combined & Breakdown Opening
    openingBalance,
    openingBalanceBag,
    openingBalanceBank,
    previousDayClosing,
    previousDayClosingBag,
    previousDayClosingBank,

    // Combined & Breakdown Bill Income
    billIncome,
    billIncomeBag,
    billIncomeBank,
    autoBillIncome,
    autoBillIncomeBag,
    autoBillIncomeBank,
    paymentsCount: paymentsList.length,
    paymentsList,

    // Other Incomes
    otherIncome1Label,
    otherIncome1Amount,
    otherIncome2Label,
    otherIncome2Amount,

    // Combined & Breakdown Expenses
    expenses,
    expensesBag,
    expensesBank,
    expensesDetails,

    // Combined & Breakdown Loans Given
    loansGivenCount,
    loansGivenPrincipal,
    loansGivenPrincipalBag,
    loansGivenPrincipalBank,
    loansGivenIncome,
    loansGivenIncomeBag,
    loansGivenIncomeBank,
    loansGivenNetDisbursed,
    loansGivenNetDisbursedBag,
    loansGivenNetDisbursedBank,
    loansGivenList,

    // Combined & Breakdown Closing
    closingBalance,
    closingBalanceBag,
    closingBalanceBank,

    notes: savedRecord?.notes || '',
    updatedBy: savedRecord?.updatedBy || null,
    updatedAt: savedRecord?.updatedAt || null,
  };
}

/**
 * Saves (upserts) the daily record for a given date.
 */
async function saveDailyRecord(payload, adminUserId = null) {
  await ensureDailyRecordsTable();
  const { dateStr, startOfDay } = parseDateOnly(payload.date);

  const openingBalanceBag = round2(Number(payload.openingBalanceBag) || 0);
  const openingBalanceBank = round2(Number(payload.openingBalanceBank) || 0);
  const openingBalance = round2(
    payload.openingBalance !== undefined
      ? Number(payload.openingBalance)
      : (openingBalanceBag + openingBalanceBank)
  );

  const billIncomeBag = round2(Number(payload.billIncomeBag) || 0);
  const billIncomeBank = round2(Number(payload.billIncomeBank) || 0);
  const billIncome = round2(
    payload.billIncome !== undefined
      ? Number(payload.billIncome)
      : (billIncomeBag + billIncomeBank)
  );

  const otherIncome1Label = payload.otherIncome1Label ? String(payload.otherIncome1Label).trim() : null;
  const otherIncome1Amount = round2(Number(payload.otherIncome1Amount) || 0);
  const otherIncome2Label = payload.otherIncome2Label ? String(payload.otherIncome2Label).trim() : null;
  const otherIncome2Amount = round2(Number(payload.otherIncome2Amount) || 0);

  const expensesBag = round2(Number(payload.expensesBag) || 0);
  const expensesBank = round2(Number(payload.expensesBank) || 0);
  const expenses = round2(
    payload.expenses !== undefined
      ? Number(payload.expenses)
      : (expensesBag + expensesBank)
  );
  const expensesDetails = payload.expensesDetails || null;

  const loansGivenCount = parseInt(payload.loansGivenCount, 10) || 0;
  const loansGivenPrincipalBag = round2(Number(payload.loansGivenPrincipalBag) || 0);
  const loansGivenPrincipalBank = round2(Number(payload.loansGivenPrincipalBank) || 0);
  const loansGivenPrincipal = round2(
    payload.loansGivenPrincipal !== undefined
      ? Number(payload.loansGivenPrincipal)
      : (loansGivenPrincipalBag + loansGivenPrincipalBank)
  );

  const loansGivenIncomeBag = round2(Number(payload.loansGivenIncomeBag) || 0);
  const loansGivenIncomeBank = round2(Number(payload.loansGivenIncomeBank) || 0);
  const loansGivenIncome = round2(
    payload.loansGivenIncome !== undefined
      ? Number(payload.loansGivenIncome)
      : (loansGivenIncomeBag + loansGivenIncomeBank)
  );

  const loansGivenNetDisbursedBag = round2(
    payload.loansGivenNetDisbursedBag !== undefined
      ? Number(payload.loansGivenNetDisbursedBag)
      : (loansGivenPrincipalBag - loansGivenIncomeBag)
  );
  const loansGivenNetDisbursedBank = round2(
    payload.loansGivenNetDisbursedBank !== undefined
      ? Number(payload.loansGivenNetDisbursedBank)
      : (loansGivenPrincipalBank - loansGivenIncomeBank)
  );
  const loansGivenNetDisbursed = round2(loansGivenNetDisbursedBag + loansGivenNetDisbursedBank);

  const closingBalanceBag = round2(
    openingBalanceBag +
      billIncomeBag +
      loansGivenIncomeBag +
      otherIncome1Amount -
      loansGivenPrincipalBag -
      expensesBag
  );

  const closingBalanceBank = round2(
    openingBalanceBank +
      billIncomeBank +
      loansGivenIncomeBank +
      otherIncome2Amount -
      loansGivenPrincipalBank -
      expensesBank
  );

  const closingBalance = round2(closingBalanceBag + closingBalanceBank);

  const record = await prisma.dailyRecord.upsert({
    where: { recordDate: startOfDay },
    create: {
      recordDate: startOfDay,
      openingBalance,
      openingBalanceBag,
      openingBalanceBank,
      billIncome,
      billIncomeBag,
      billIncomeBank,
      otherIncome1Label,
      otherIncome1Amount,
      otherIncome2Label,
      otherIncome2Amount,
      expenses,
      expensesBag,
      expensesBank,
      expensesDetails,
      loansGivenCount,
      loansGivenPrincipal,
      loansGivenPrincipalBag,
      loansGivenPrincipalBank,
      loansGivenIncome,
      loansGivenIncomeBag,
      loansGivenIncomeBank,
      loansGivenNetDisbursed,
      loansGivenNetDisbursedBag,
      loansGivenNetDisbursedBank,
      closingBalance,
      closingBalanceBag,
      closingBalanceBank,
      notes: payload.notes || null,
      updatedBy: adminUserId,
    },
    update: {
      openingBalance,
      openingBalanceBag,
      openingBalanceBank,
      billIncome,
      billIncomeBag,
      billIncomeBank,
      otherIncome1Label,
      otherIncome1Amount,
      otherIncome2Label,
      otherIncome2Amount,
      expenses,
      expensesBag,
      expensesBank,
      expensesDetails,
      loansGivenCount,
      loansGivenPrincipal,
      loansGivenPrincipalBag,
      loansGivenPrincipalBank,
      loansGivenIncome,
      loansGivenIncomeBag,
      loansGivenIncomeBank,
      loansGivenNetDisbursed,
      loansGivenNetDisbursedBag,
      loansGivenNetDisbursedBank,
      closingBalance,
      closingBalanceBag,
      closingBalanceBank,
      notes: payload.notes || null,
      updatedBy: adminUserId,
      updatedAt: new Date(),
    },
  });

  return {
    record,
    closingBalance,
    closingBalanceBag,
    closingBalanceBank,
    message: `Daily record for ${dateStr} saved successfully`,
  };
}

module.exports = {
  getDailyRecord,
  saveDailyRecord,
};
