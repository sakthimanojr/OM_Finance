const fs = require('fs');
const path = require('path');

const weeklyCalc = require('../src/modules/loan/calculators/weeklyLoan.calculator');
const monthlyCalc = require('../src/modules/loan/calculators/monthlyEmiLoan.calculator');

function parseDate(dateStr) {
  if (!dateStr) return new Date();
  const trimmed = dateStr.trim();
  if (trimmed.includes('/')) {
    const parts = trimmed.split('/');
    if (parts.length === 3) {
      const day = parseInt(parts[0], 10);
      const month = parseInt(parts[1], 10) - 1;
      const year = parseInt(parts[2], 10);
      return new Date(Date.UTC(year, month, day));
    }
  }
  const parsed = new Date(trimmed);
  return isNaN(parsed.getTime()) ? new Date() : parsed;
}

function cleanPhone(rawMobile, loanNo) {
  if (!rawMobile) return `91${String(loanNo).padStart(8, '0')}`;
  const digitsOnly = String(rawMobile).replace(/\D/g, '');
  if (digitsOnly.length === 10) return digitsOnly;
  return `91${String(loanNo).padStart(8, '0')}`;
}

function generateJson() {
  const csvPath = path.join(__dirname, '..', '..', 'OM_Finance_old_customers_97_PDF_verified.csv');
  const content = fs.readFileSync(csvPath, 'utf8');
  const lines = content.split(/\r?\n/).filter(line => line.trim().length > 0);
  const dataLines = lines.slice(1);

  const records = [];

  for (const line of dataLines) {
    const cols = line.split(',');
    if (cols.length < 5) continue;

    const legacyLoanNo = parseInt(cols[0].trim(), 10);
    if (isNaN(legacyLoanNo)) continue;

    const customerName = cols[1].trim() || `Customer ${legacyLoanNo}`;
    const rawMobile = cols[2]?.trim() || '';
    const dateStr = cols[3]?.trim() || '';
    const principal = parseFloat(cols[4]?.trim() || '0');
    const monthCol = cols[8]?.trim().toLowerCase() || '';

    if (isNaN(principal) || principal <= 0) continue;

    const isMonthly = monthCol === 'month';
    const loanType = isMonthly ? 'MONTHLY' : 'WEEKLY';
    const interestRate = isMonthly ? 15.0 : 10.0;
    const termCount = isMonthly ? 5 : 10;
    const agreementFee = 0;
    const startDate = parseDate(dateStr);
    const phone = cleanPhone(rawMobile, legacyLoanNo);
    const loanNumber = `LN-${String(legacyLoanNo).padStart(3, '0')}`;

    let calcResult;
    if (loanType === 'WEEKLY') {
      calcResult = weeklyCalc.calculate({ principal, interestRate, termCount, startDate, agreementFee });
    } else {
      calcResult = monthlyCalc.calculate({ principal, interestRate, termCount, startDate, agreementFee });
    }

    records.push({
      legacyLoanNo,
      loanNumber,
      customerName,
      phone,
      loanType,
      principal,
      interestRate,
      agreementFee,
      disbursedAmount: calcResult.disbursedAmount,
      installmentAmount: calcResult.installmentAmount,
      termCount,
      startDate: startDate.toISOString(),
      endDate: calcResult.endDate ? calcResult.endDate.toISOString() : null,
      dueSchedule: calcResult.dueSchedule.map(d => ({
        dueNumber: d.dueNumber,
        dueDate: d.dueDate.toISOString(),
        amount: d.amount,
      })),
    });
  }

  const outPath = path.join(__dirname, '..', 'src', 'modules', 'admin', 'legacyLoansData.json');
  fs.writeFileSync(outPath, JSON.stringify(records, null, 2), 'utf8');
  console.log(`Generated JSON file with ${records.length} records at: ${outPath}`);
}

generateJson();
