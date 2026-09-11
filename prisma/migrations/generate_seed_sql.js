const bcrypt = require('bcryptjs');
const { v4: uuidv4 } = require('uuid');

async function main() {
  const id = uuidv4();
  const hash = await bcrypt.hash('OmFinance@811C3873', 10);

  console.log('');
  console.log('-- ══════════════════════════════════════════════════════');
  console.log('-- Paste this into Neon SQL Editor → Run');
  console.log('-- Creates the Super Admin account');
  console.log('-- ══════════════════════════════════════════════════════');
  console.log('');
  console.log(`INSERT INTO "users" (id, role, phone, email, "passwordHash", "isActive", "createdAt", "updatedAt") VALUES (`);
  console.log(`  '${id}',`);
  console.log(`  'SUPER_ADMIN',`);
  console.log(`  '9999999999',`);
  console.log(`  'omfinancedvd@gmail.com',`);
  console.log(`  '${hash}',`);
  console.log(`  true,`);
  console.log(`  NOW(),`);
  console.log(`  NOW()`);
  console.log(`);`);
  console.log('');
  console.log('-- Verify it worked:');
  console.log('-- SELECT id, role, phone, email, "isActive" FROM "users";');
}

main().catch(console.error);
