/**
 * baseline-migration.js
 *
 * Directly inserts the second migration record into _prisma_migrations
 * without going through `prisma migrate resolve` (which requires an advisory lock).
 * Run this ONCE on the production DB to complete the baseline.
 *
 * Usage:
 *   node prisma/baseline-migration.js
 */

require('dotenv').config();
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

const MIGRATION_NAME = '20260718090000_add_cloudinary_public_id';

async function main() {
  // Check if already recorded
  const existing = await prisma.$queryRaw`
    SELECT id FROM "_prisma_migrations" WHERE migration_name = ${MIGRATION_NAME}
  `;

  if (existing.length > 0) {
    console.log(`Migration "${MIGRATION_NAME}" is already recorded. Nothing to do.`);
    return;
  }

  // Insert the baseline record — we use gen_random_uuid() for the id.
  // The checksum is intentionally left as an empty string because the schema
  // is already in sync (we used db push); Prisma only checks the checksum
  // when actually running migrations, not when they're pre-recorded as applied.
  await prisma.$executeRaw`
    INSERT INTO "_prisma_migrations"
      (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count)
    VALUES
      (
        gen_random_uuid()::text,
        '',
        NOW(),
        ${MIGRATION_NAME},
        NULL,
        NULL,
        NOW(),
        1
      )
  `;

  console.log(`✅ Migration "${MIGRATION_NAME}" successfully recorded as applied.`);
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
