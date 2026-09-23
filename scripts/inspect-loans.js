const { neon } = require('@neondatabase/serverless');

const url = 'postgresql://neondb_owner:npg_i9BGatICcSr2@ep-patient-shadow-ae69sqix-pooler.c-2.us-east-2.aws.neon.tech/neondb?sslmode=require';
const sql = neon(url);

async function main() {
  const tables = await sql`
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public'
    ORDER BY table_name
  `;
  console.log('Tables in ep-patient-shadow:', tables.map(t => t.table_name));

  const loanSample = await sql`
    SELECT "loanNumber", status FROM loans WHERE "loanNumber" LIKE 'LN-%' ORDER BY "loanNumber" LIMIT 10
  `;
  console.log('Sample loans in ep-patient-shadow:', loanSample);
}

main().catch(console.error);





