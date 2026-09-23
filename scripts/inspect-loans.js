const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });
const { neon } = require('@neondatabase/serverless');
const sql = neon(process.env.DATABASE_URL);

async function main() {
  const query = `
    DO $$
    DECLARE
      v_uid text;
      v_cid text;
    BEGIN
      SELECT id INTO v_uid FROM users LIMIT 1;
      SELECT id INTO v_cid FROM customers WHERE "userId" = v_uid LIMIT 1;
      RAISE NOTICE 'v_uid = %, v_cid = %', v_uid, v_cid;
    END $$;
  `;
  const res = await sql.query(query);
  console.log('DO block with text vars executed successfully:', res);
}

main().catch(console.error);

