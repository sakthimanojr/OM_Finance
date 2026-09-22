const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const prisma = new PrismaClient();

async function main() {
  const phone = process.env.SUPER_ADMIN_PHONE || '8015810364';
  const email = process.env.SUPER_ADMIN_EMAIL || 'admin@omfinance.com';
  const password = process.env.SUPER_ADMIN_PASSWORD || 'Sakthi@143';

  const passwordHash = await bcrypt.hash(password, 10);

  // Upsert by phone — truly idempotent even if email already exists
  // First, clean up any stale record that has the same email but different phone
  await prisma.user.deleteMany({
    where: {
      email,
      phone: { not: phone },
    },
  });

  const admin = await prisma.user.upsert({
    where: { phone },
    update: {
      role: 'SUPER_ADMIN',
      email,
      passwordHash,
      isActive: true,
    },
    create: {
      role: 'SUPER_ADMIN',
      phone,
      email,
      passwordHash,
      isActive: true,
    },
  });

  // Ensure adminConfig exists (only one row ever)
  const configCount = await prisma.adminConfig.count();
  if (configCount === 0) {
    await prisma.adminConfig.create({ data: {} });
  }

  console.log('Super admin seeded (created or updated):');
  console.log(`  Phone:    ${admin.phone}`);
  console.log(`  Email:    ${admin.email}`);
  console.log(`  Password: ${password} (change this after first login!)`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
