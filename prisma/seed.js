const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const prisma = new PrismaClient();

async function main() {
  const phone = process.env.SUPER_ADMIN_PHONE || '9999999999';
  const email = process.env.SUPER_ADMIN_EMAIL || 'admin@example.com';
  const password = process.env.SUPER_ADMIN_PASSWORD || 'ChangeMe123!';

  const existing = await prisma.user.findUnique({ where: { phone } });
  if (existing) {
    console.log(`Super admin already exists (phone: ${phone}). Skipping seed.`);
    return;
  }

  const passwordHash = await bcrypt.hash(password, 10);
  const admin = await prisma.user.create({
    data: {
      role: 'SUPER_ADMIN',
      phone,
      email,
      passwordHash,
    },
  });

  await prisma.adminConfig.create({ data: {} });

  console.log('Super admin created:');
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
