const fs = require('fs');
const path = require('path');
const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });

const weeklyCalc = require('../src/modules/loan/calculators/weeklyLoan.calculator');
const monthlyCalc = require('../src/modules/loan/calculators/monthlyEmiLoan.calculator');

const prisma = new PrismaClient();

// Helper to parse dates like "16/04/2026" or "2026-08-18 00:00:00"
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

// Clean phone number or assign placeholder if missing/corrupted
function cleanPhone(rawMobile, loanNo) {
  if (!rawMobile) {
    return `91${String(loanNo).padStart(8, '0')}`;
  }
  const digitsOnly = String(rawMobile).replace(/\D/g, '');
  if (digitsOnly.length === 10) {
    return digitsOnly;
  }
  return `91${String(loanNo).padStart(8, '0')}`;
}

async function run() {
  const csvPath = path.join(__dirname, '..', '..', 'OM_Finance_old_customers_97_PDF_verified.csv');
  console.log(`Reading CSV from: ${csvPath}`);
  const content = fs.readFileSync(csvPath, 'utf8');
  const lines = content.split(/\r?\n/).filter(line => line.trim().length > 0);

  // Skip header
  const dataLines = lines.slice(1);
  console.log(`Found ${dataLines.length} rows to process.`);

  const defaultPasswordHash = await bcrypt.hash('Customer@123', 10);
  let importedCount = 0;

  for (const line of dataLines) {
    // CSV columns: legacy_loan_no,customer_name,mobile,loan_date,principal_amount,Unnamed: 5,source_page,verification_required,month,Unnamed: 9
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

    // 1. Calculate schedule
    let calcResult;
    if (loanType === 'WEEKLY') {
      calcResult = weeklyCalc.calculate({
        principal,
        interestRate,
        termCount,
        startDate,
        agreementFee,
      });
    } else {
      calcResult = monthlyCalc.calculate({
        principal,
        interestRate,
        termCount,
        startDate,
        agreementFee,
      });
    }

    try {
      // 2. Find or create user
      let user = await prisma.user.findUnique({ where: { phone } });
      if (!user) {
        user = await prisma.user.create({
          data: {
            phone,
            passwordHash: defaultPasswordHash,
            role: 'CUSTOMER',
            isActive: true,
          },
        });
      }

      // 3. Find or create customer profile
      let customer = await prisma.customer.findUnique({ where: { userId: user.id } });
      if (!customer) {
        customer = await prisma.customer.create({
          data: {
            userId: user.id,
            name: customerName,
            phone,
            status: 'ACTIVE',
          },
        });
      }

      // 4. Check if loan already exists
      const existingLoan = await prisma.loan.findUnique({ where: { loanNumber } });
      if (existingLoan) {
        console.log(`[SKIP] Loan ${loanNumber} already exists.`);
        continue;
      }

      // 5. Create Loan & Dues in a single transaction
      await prisma.$transaction(async (tx) => {
        const createdLoan = await tx.loan.create({
          data: {
            customerId: customer.id,
            loanNumber,
            type: loanType,
            principal,
            interestRate,
            agreementFee,
            disbursedAmount: calcResult.disbursedAmount,
            startDate,
            endDate: calcResult.endDate,
            termCount,
            installmentAmount: calcResult.installmentAmount,
            status: 'ACTIVE',
          },
        });

        await tx.due.createMany({
          data: calcResult.dueSchedule.map((d) => ({
            loanId: createdLoan.id,
            dueNumber: d.dueNumber,
            dueDate: d.dueDate,
            amount: d.amount,
            status: 'PENDING',
          })),
        });
      });

      importedCount++;
      console.log(`[OK] Imported Loan #${legacyLoanNo} (${loanNumber}) - ${customerName} - ₹${principal} (${loanType})`);
    } catch (err) {
      console.error(`[ERROR] Loan #${legacyLoanNo} (${customerName}):`, err.message);
    }
  }

  console.log(`\n========================================`);
  console.log(`Successfully imported ${importedCount} loans with dues!`);
  console.log(`========================================\n`);
}

run()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
