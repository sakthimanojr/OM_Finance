const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

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

function escapeSql(str) {
  if (!str) return 'NULL';
  return `'${String(str).replace(/'/g, "''")}'`;
}

function toIso(d) {
  return `'${d.toISOString()}'`;
}

function generateSql() {
  const csvPath = path.join(__dirname, '..', '..', 'OM_Finance_old_customers_97_PDF_verified.csv');
  const content = fs.readFileSync(csvPath, 'utf8');
  const lines = content.split(/\r?\n/).filter(line => line.trim().length > 0);
  const dataLines = lines.slice(1);

  // bcrypt hash for 'Customer@123'
  const defaultPasswordHash = '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.';

  const sqlStatements = [
    '-- OM FINANCE BATCH SEED SCRIPT (97 CUSTOMERS & LOANS)',
    'BEGIN;',
    ''
  ];

  for (const line of dataLines) {
    const cols = line.split(',');
    if (cols.length < 5) continue;

    const legacyLoanNo = cols[0].trim();
    if (!legacyLoanNo) continue;

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

    const userId = crypto.randomUUID();
    const customerId = crypto.randomUUID();
    const loanId = crypto.randomUUID();

    let calcResult;
    if (loanType === 'WEEKLY') {
      calcResult = weeklyCalc.calculate({ principal, interestRate, termCount, startDate, agreementFee });
    } else {
      calcResult = monthlyCalc.calculate({ principal, interestRate, termCount, startDate, agreementFee });
    }

    // Insert User (if not exists by phone)
    sqlStatements.push(`-- Record #${legacyLoanNo}: ${customerName}`);
    sqlStatements.push(`INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('${userId}', '${phone}', '${defaultPasswordHash}', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;`);

    // Insert Customer
    sqlStatements.push(`INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '${customerId}', u.id, ${escapeSql(customerName)}, '${phone}', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '${phone}'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;`);

    // Insert Loan
    sqlStatements.push(`INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '${loanId}', c.id, '${loanNumber}', '${loanType}', ${principal}, ${interestRate}, ${agreementFee}, ${calcResult.disbursedAmount}, 0.00, ${toIso(startDate)}, ${toIso(calcResult.endDate)}, ${termCount}, ${calcResult.installmentAmount}, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '${phone}'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;`);

    // Insert Dues
    for (const d of calcResult.dueSchedule) {
      const dueId = crypto.randomUUID();
      sqlStatements.push(`INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '${dueId}', l.id, ${d.dueNumber}, ${toIso(d.dueDate)}, ${d.amount}, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = '${loanNumber}'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;`);
    }

    sqlStatements.push('');
  }

  sqlStatements.push('COMMIT;');
  sqlStatements.push('-- Completed import of 97 loans');

  const outPath = path.join(__dirname, '..', 'import_loans.sql');
  fs.writeFileSync(outPath, sqlStatements.join('\n'), 'utf8');
  console.log(`Generated SQL file with ${sqlStatements.length} lines at: ${outPath}`);
}

generateSql();
