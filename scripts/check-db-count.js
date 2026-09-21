const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function check() {
  const loanCount = await prisma.loan.count({ where: { loanNumber: { startsWith: 'LN-' } } });
  const customerCount = await prisma.customer.count();
  const userCount = await prisma.user.count({ where: { role: 'CUSTOMER' } });
  console.log('=== Database Record Counts ===');
  console.log('Legacy loans in DB (LN-xxx):', loanCount, '/ 97 expected');
  console.log('Total customers in DB:', customerCount);
  console.log('Total customer users in DB:', userCount);

  if (loanCount > 0) {
    const sample = await prisma.loan.findMany({
      where: { loanNumber: { startsWith: 'LN-' } },
      take: 3,
      select: { loanNumber: true, status: true, startDate: true, principal: true },
      orderBy: { loanNumber: 'asc' },
    });
    console.log('\nSample loans:', JSON.stringify(sample, null, 2));
  }
  await prisma.$disconnect();
}

check().catch((e) => {
  console.error('DB error:', e.message);
  process.exit(1);
});
