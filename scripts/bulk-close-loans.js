/**
 * Bulk Close 44 Legacy Loans Script
 *
 * Uses batched Postgres DO $$ blocks for fast atomic execution over Neon HTTP.
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

// Map of the 44 loans provided by user: '001' => '15/06/2026'
const closedMap = {
  '001': '15/06/2026',
  '002': '09/06/2026',
  '003': '14/06/2026',
  '004': '07/07/2026',
  '005': '20/05/2026',
  '006': '26/06/2026',
  '007': '06/07/2026',
  '008': '24/06/2026',
  '009': '12/07/2026',
  '011': '13/07/2026',
  '012': '15/07/2026',
  '013': '06/07/2026',
  '014': '23/07/2026',
  '016': '18/07/2026',
  '017': '15/06/2026',
  '018': '13/08/2026',
  '019': '23/07/2026',
  '020': 'CLOSED',
  '021': '30/06/2026',
  '023': '23/07/2026',
  '024': '22/07/2026',
  '025': '22/07/2026',
  '026': '26/07/2026',
  '027': '20/07/2026',
  '029': '20/07/2026',
  '030': '31/08/2026',
  '032': '03/08/2026',
  '033': '30/07/2026',
  '034': '10/08/2026',
  '035': '07/09/2026',
  '036': '24/08/2026',
  '037': '22/08/2026',
  '038': '08/09/2026',
  '039': '29/07/2026',
  '040': '29/09/2026',
  '043': '10/09/2026',
  '046': '15/09/2026',
  '050': '18/09/2026',
  '051': '20/07/2026',
  '054': '03/09/2026',
  '055': '09/09/2026',
  '058': '16/09/2026',
  '064': '16/09/2026',
  '071': '05/09/2026',
};

function parseClosedDate(dateStr, fallbackDate) {
  if (!dateStr || dateStr.toUpperCase() === 'CLOSED') {
    return fallbackDate ? new Date(fallbackDate) : new Date();
  }
  const parts = dateStr.trim().split('/');
  if (parts.length === 3) {
    const day = parseInt(parts[0], 10);
    const month = parseInt(parts[1], 10) - 1;
    const year = parseInt(parts[2], 10);
    return new Date(Date.UTC(year, month, day, 12, 0, 0));
  }
  const parsed = new Date(dateStr);
  return isNaN(parsed.getTime()) ? (fallbackDate ? new Date(fallbackDate) : new Date()) : parsed;
}

function escapeSql(str) {
  if (str === null || str === undefined) return 'NULL';
  return `'${String(str).replace(/'/g, "''")}'`;
}

function toIso(d) {
  if (!d) return 'NULL';
  return `'${d.toISOString()}'::timestamptz`;
}

async function run() {
  console.log('Connecting to database...');
  const ping = await sql`SELECT NOW() as now, current_database() as db`;
  console.log(`Connected! DB: ${ping[0].db}, Server Time: ${ping[0].now}\n`);

  const defaultPasswordHash = await bcrypt.hash('Customer@123', 10);

  // Group records into chunks of 10 for fast batching
  const CHUNK_SIZE = 10;
  const chunks = [];
  for (let i = 0; i < records.length; i += CHUNK_SIZE) {
    chunks.push(records.slice(i, i + CHUNK_SIZE));
  }

  let closedCount = 0;
  let activeCount = 0;

  for (let cIdx = 0; cIdx < chunks.length; cIdx++) {
    const chunk = chunks[cIdx];
    const statements = [];

    statements.push('DO $$');
    statements.push('DECLARE');
    statements.push('  v_uid text;');
    statements.push('  v_cid text;');
    statements.push('  v_lid text;');
    statements.push('  v_did text;');
    statements.push('  v_pid text;');
    statements.push('BEGIN');

    for (const item of chunk) {
      const key = String(item.legacyLoanNo).padStart(3, '0');
      const isClosed = Object.prototype.hasOwnProperty.call(closedMap, key);
      const closedDateStr = closedMap[key];
      const closureDate = isClosed ? parseClosedDate(closedDateStr, item.endDate || item.startDate) : null;
      const loanStatus = isClosed ? 'CLOSED' : 'ACTIVE';
      const totalCollection = isClosed ? item.dueSchedule.reduce((sum, d) => sum + Number(d.amount), 0) : 0;

      if (isClosed) closedCount++; else activeCount++;

      statements.push(`  -- [${item.loanNumber}] ${item.customerName} (${loanStatus})`);
      
      // 1. User
      statements.push(`
        INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
        VALUES (gen_random_uuid()::text, ${escapeSql(item.phone)}, ${escapeSql(defaultPasswordHash)}, 'CUSTOMER', true, NOW(), NOW())
        ON CONFLICT (phone) DO NOTHING;
        SELECT id INTO v_uid FROM users WHERE phone = ${escapeSql(item.phone)} LIMIT 1;
      `);

      // 2. Customer
      statements.push(`
        INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
        VALUES (gen_random_uuid()::text, v_uid, ${escapeSql(item.customerName)}, ${escapeSql(item.phone)}, 'ACTIVE', NOW(), NOW())
        ON CONFLICT ("userId") DO UPDATE SET name = ${escapeSql(item.customerName)};
        SELECT id INTO v_cid FROM customers WHERE "userId" = v_uid LIMIT 1;
      `);

      // 3. Loan
      statements.push(`
        INSERT INTO loans (
          id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee",
          "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount",
          "installmentAmount", status, "createdAt", "updatedAt"
        )
        VALUES (
          gen_random_uuid()::text, v_cid, ${escapeSql(item.loanNumber)}, ${escapeSql(item.loanType)}::"LoanType",
          ${item.principal}, ${item.interestRate}, ${item.agreementFee || 0},
          ${item.disbursedAmount}, ${totalCollection},
          ${toIso(new Date(item.startDate))}, ${toIso(item.endDate ? new Date(item.endDate) : null)},
          ${item.termCount}, ${item.installmentAmount}, ${escapeSql(loanStatus)}::"LoanStatus", NOW(), NOW()
        )
        ON CONFLICT ("loanNumber") DO UPDATE SET
          status = ${escapeSql(loanStatus)}::"LoanStatus",
          "totalCollection" = ${totalCollection},
          "updatedAt" = NOW();
        SELECT id INTO v_lid FROM loans WHERE "loanNumber" = ${escapeSql(item.loanNumber)} LIMIT 1;
      `);

      // 4. Dues & Payments & Receipts
      const duesJson = [];
      const paymentsJson = [];

      for (const d of item.dueSchedule) {
        const scheduledDueDate = new Date(d.dueDate);
        const dueStatus = isClosed ? 'PAID' : 'PENDING';
        const paidAmount = isClosed ? d.amount : 'NULL';
        const paymentMethod = isClosed ? "'CASH'::\"PaymentMethod\"" : 'NULL';
        const paidDate = isClosed ? (scheduledDueDate <= closureDate ? scheduledDueDate : closureDate) : null;
        const paidDateIso = paidDate ? toIso(paidDate) : 'NULL';

        duesJson.push({
          dueNumber: d.dueNumber,
          dueDate: scheduledDueDate.toISOString(),
          amount: d.amount,
          status: dueStatus,
          paidDate: paidDate ? paidDate.toISOString() : null,
          paidAmount: isClosed ? d.amount : null,
          paymentMethod: isClosed ? 'CASH' : null
        });

        statements.push(`
          INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "paidDate", "paidAmount", "paymentMethod", "createdAt")
          VALUES (
            gen_random_uuid()::text, v_lid, ${d.dueNumber}, ${toIso(scheduledDueDate)}, ${d.amount},
            ${escapeSql(dueStatus)}::"DueStatus", ${paidDateIso}, ${paidAmount}, ${paymentMethod}, NOW()
          )
          ON CONFLICT ("loanId", "dueNumber") DO UPDATE SET
            status = ${escapeSql(dueStatus)}::"DueStatus",
            "paidDate" = ${paidDateIso},
            "paidAmount" = ${paidAmount},
            "paymentMethod" = ${paymentMethod};
          SELECT id INTO v_did FROM dues WHERE "loanId" = v_lid AND "dueNumber" = ${d.dueNumber} LIMIT 1;
        `);

        if (isClosed) {
          const receiptNum = `RCP-${item.loanNumber.replace('LN-', '')}-${String(d.dueNumber).padStart(2, '0')}`;
          
          paymentsJson.push({
            amount: d.amount,
            method: 'CASH',
            status: 'SUCCESS',
            paidAt: paidDate.toISOString(),
            receiptNumber: receiptNum
          });

          statements.push(`
            IF NOT EXISTS (SELECT 1 FROM payments WHERE "dueId" = v_did) THEN
              INSERT INTO payments (id, "dueId", "loanId", "customerId", amount, method, status, "paidAt", "createdAt")
              VALUES (gen_random_uuid()::text, v_did, v_lid, v_cid, ${d.amount}, 'CASH'::"PaymentMethod", 'SUCCESS'::"PaymentStatus", ${paidDateIso}, NOW());
            END IF;

            SELECT id INTO v_pid FROM payments WHERE "dueId" = v_did LIMIT 1;

            IF v_pid IS NOT NULL AND NOT EXISTS (SELECT 1 FROM receipts WHERE "paymentId" = v_pid OR "receiptNumber" = ${escapeSql(receiptNum)}) THEN
              INSERT INTO receipts (id, "paymentId", "receiptNumber", "generatedAt")
              VALUES (gen_random_uuid()::text, v_pid, ${escapeSql(receiptNum)}, ${paidDateIso});
            END IF;
          `);
        }
      }

      // 5. ClosedLoan Snapshot
      if (isClosed) {
        statements.push(`
          INSERT INTO closed_loans (
            id, "loanId", "customerId", "customerName", "customerPhone", "loanType",
            "loanNumber", principal, "interestRate", "disbursedAmount", "totalCollected",
            "startDate", "endDate", "closedAt", "paymentHistory", "dueSchedule"
          )
          VALUES (
            gen_random_uuid()::text, v_lid, v_cid, ${escapeSql(item.customerName)}, ${escapeSql(item.phone)},
            ${escapeSql(item.loanType)}, ${escapeSql(item.loanNumber)}, ${item.principal}, ${item.interestRate},
            ${item.disbursedAmount}, ${totalCollection},
            ${toIso(new Date(item.startDate))}, ${toIso(item.endDate ? new Date(item.endDate) : null)},
            ${toIso(closureDate)},
            ${escapeSql(JSON.stringify(paymentsJson))}::jsonb,
            ${escapeSql(JSON.stringify(duesJson))}::jsonb
          )
          ON CONFLICT ("loanId") DO UPDATE SET
            "closedAt" = ${toIso(closureDate)},
            "totalCollected" = ${totalCollection},
            "paymentHistory" = ${escapeSql(JSON.stringify(paymentsJson))}::jsonb,
            "dueSchedule" = ${escapeSql(JSON.stringify(duesJson))}::jsonb;
        `);
      }
    }

    statements.push('END $$;');

    const fullSql = statements.join('\n');
    process.stdout.write(`Processing batch ${cIdx + 1}/${chunks.length} (${chunk.length} loans)... `);
    await sql.query(fullSql);
    console.log('DONE');
  }

  console.log('\n======================================================');
  console.log('                 BATCH SUMMARY REPORT                  ');
  console.log('======================================================');
  console.log(`Total Legacy Loans in Batch:  ${records.length}`);
  console.log(`Successfully Closed:          ${closedCount} loans`);
  console.log(`Remaining Active:             ${activeCount} loans`);
  console.log('======================================================\n');

  // Verify against DB
  console.log('Verifying Database State...');
  const [loansRes] = await sql`
    SELECT 
      COUNT(*) FILTER (WHERE "loanNumber" LIKE 'LN-%') as total_legacy,
      COUNT(*) FILTER (WHERE "loanNumber" LIKE 'LN-%' AND status = 'CLOSED') as closed_legacy,
      COUNT(*) FILTER (WHERE "loanNumber" LIKE 'LN-%' AND status = 'ACTIVE') as active_legacy
    FROM loans
  `;
  const [closedArchiveRes] = await sql`SELECT COUNT(*) as count FROM closed_loans`;
  const [duesRes] = await sql`
    SELECT 
      COUNT(*) FILTER (WHERE status = 'PAID') as paid_dues,
      COUNT(*) FILTER (WHERE status = 'PENDING') as pending_dues
    FROM dues
  `;
  const [paymentsRes] = await sql`SELECT COUNT(*) as count FROM payments`;
  const [receiptsRes] = await sql`SELECT COUNT(*) as count FROM receipts`;

  console.log('=== Final Verification ===');
  console.log(`Legacy Loans in DB:   ${loansRes.total_legacy} / 97`);
  console.log(`Closed Loans in DB:   ${loansRes.closed_legacy} (Expected: 44)`);
  console.log(`Active Loans in DB:   ${loansRes.active_legacy} (Expected: 53)`);
  console.log(`Archived in Closed:   ${closedArchiveRes.count} (Expected: 44)`);
  console.log(`Paid Dues:            ${duesRes.paid_dues}`);
  console.log(`Pending Dues:         ${duesRes.pending_dues}`);
  console.log(`Total Payments:       ${paymentsRes.count}`);
  console.log(`Total Receipts:       ${receiptsRes.count}`);
  console.log('==========================');
}

run()
  .catch((err) => {
    console.error('Fatal execution error:', err);
    process.exit(1);
  });

