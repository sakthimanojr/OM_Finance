const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const prisma = new PrismaClient();

async function main() {
  const phone = process.env.SUPER_ADMIN_PHONE || '8015810364';
  const email = process.env.SUPER_ADMIN_EMAIL || 'admin@omfinance.com';
  const password = process.env.SUPER_ADMIN_PASSWORD || 'Sakthi@143';

  const passwordHash = await bcrypt.hash(password, 10);

  // Find the canonical record: prefer phone match, then fall back to email match.
  // We never delete — audit_log FK is RESTRICT, so deletion would fail.
  const byPhone = await prisma.user.findUnique({ where: { phone } });
  const byEmail = await prisma.user.findUnique({ where: { email } });

  if (byPhone) {
    // Record with this phone already exists — just update it in place.
    await prisma.user.update({
      where: { phone },
      data: { role: 'SUPER_ADMIN', email, passwordHash, isActive: true },
    });
    console.log(`Super admin updated (matched by phone ${phone}).`);
  } else if (byEmail) {
    // A different user has this email — update that record's phone too.
    await prisma.user.update({
      where: { email },
      data: { role: 'SUPER_ADMIN', phone, passwordHash, isActive: true },
    });
    console.log(`Super admin updated (matched by email ${email}, phone set to ${phone}).`);
  } else {
    // No existing record — create fresh.
    const admin = await prisma.user.create({
      data: { role: 'SUPER_ADMIN', phone, email, passwordHash, isActive: true },
    });
    console.log(`Super admin created: phone=${admin.phone}, email=${admin.email}`);
  }

  // Ensure adminConfig exists (only one row ever needed)
  const configCount = await prisma.adminConfig.count();
  if (configCount === 0) {
    await prisma.adminConfig.create({ data: {} });
    console.log('AdminConfig row created.');
  }

  console.log(`Password: ${password} (change after first login!)`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
