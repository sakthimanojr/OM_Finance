/**
 * Import 97 legacy loans directly into Neon DB using the serverless HTTP driver
 * (works on networks that block port 5432 — uses HTTPS/443 instead)
 */
const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });

const { neon } = require('@neondatabase/serverless');
const bcrypt = require('bcryptjs');
const records = require('../src/modules/admin/legacyLoansData.json');

const DATABASE_URL = process.env.DATABASE_URL;
if (!DATABASE_URL) {
  console.error('DATABASE_URL not set in .env');
  process.exit(1);
}

const sql = neon(DATABASE_URL);

async function run() {
  console.log('Connecting via Neon serverless HTTP driver (port 443)...');

  // Test connection
  const ping = await sql`SELECT NOW() as now, current_database() as db`;
  console.log(`Connected! DB: ${ping[0].db}, Server time: ${ping[0].now}`);

  // Check current state
  const loanCountRes = await sql`SELECT COUNT(*) as count FROM loans WHERE "loanNumber" LIKE 'LN-%'`;
  console.log(`Existing legacy loans in DB: ${loanCountRes[0].count} / 97\n`);

  const defaultPasswordHash = await bcrypt.hash('Customer@123', 10);
  let importedCount = 0;
  let skippedCount = 0;
  let errorCount = 0;

  for (const item of records) {
    try {
      // Check if loan already exists
      const existing = await sql`SELECT id FROM loans WHERE "loanNumber" = ${item.loanNumber} LIMIT 1`;
      if (existing.length > 0) {
        skippedCount++;
        process.stdout.write(`[SKIP] ${item.loanNumber}\n`);
        continue;
      }

      // Upsert user
      await sql`
        INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
        VALUES (gen_random_uuid(), ${item.phone}, ${defaultPasswordHash}, 'CUSTOMER', true, NOW(), NOW())
        ON CONFLICT (phone) DO NOTHING
      `;
      const userRow = await sql`SELECT id FROM users WHERE phone = ${item.phone} LIMIT 1`;
      const userId = userRow[0].id;

      // Upsert customer
      await sql`
        INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
        VALUES (gen_random_uuid(), ${userId}, ${item.customerName}, ${item.phone}, 'ACTIVE', NOW(), NOW())
        ON CONFLICT ("userId") DO NOTHING
      `;
      const customerRow = await sql`SELECT id FROM customers WHERE "userId" = ${userId} LIMIT 1`;
      const customerId = customerRow[0].id;

      // Insert loan
      await sql`
        INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee",
          "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
        VALUES (
          gen_random_uuid(), ${customerId}, ${item.loanNumber}, ${item.loanType}::"LoanType",
          ${item.principal}, ${item.interestRate}, ${item.agreementFee || 0},
          ${item.disbursedAmount}, 0,
          ${item.startDate}::timestamptz, ${item.endDate ? item.endDate : null}::timestamptz,
          ${item.termCount}, ${item.installmentAmount}, 'ACTIVE', NOW(), NOW()
        )
        ON CONFLICT ("loanNumber") DO NOTHING
      `;
      const loanRow = await sql`SELECT id FROM loans WHERE "loanNumber" = ${item.loanNumber} LIMIT 1`;
      const loanId = loanRow[0].id;

      // Insert dues
      for (const d of item.dueSchedule) {
        await sql`
          INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt", "updatedAt")
          VALUES (
            gen_random_uuid(), ${loanId}, ${d.dueNumber}, ${d.dueDate}::timestamptz,
            ${d.amount}, 'PENDING', NOW(), NOW()
          )
          ON CONFLICT ("loanId", "dueNumber") DO NOTHING
        `;
      }

      importedCount++;
      console.log(`[OK] ${item.loanNumber} - ${item.customerName} - ₹${item.principal} (${item.loanType})`);
    } catch (err) {
      errorCount++;
      console.error(`[ERROR] ${item.loanNumber} (${item.customerName}): ${err.message}`);
    }
  }

  console.log('\n========================================');
  console.log(`Total records: ${records.length}`);
  console.log(`Imported:      ${importedCount}`);
  console.log(`Skipped:       ${skippedCount} (already existed)`);
  console.log(`Errors:        ${errorCount}`);
  console.log('========================================\n');

  // Final verification
  const finalCount = await sql`SELECT COUNT(*) as count FROM loans WHERE "loanNumber" LIKE 'LN-%'`;
  console.log(`Final legacy loans in DB: ${finalCount[0].count} / 97`);
}

run().catch((e) => {
  console.error('\nFatal error:', e.message);
  process.exit(1);
});
