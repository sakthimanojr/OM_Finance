const bcrypt = require('bcryptjs');
const prisma = require('../src/config/database');

async function setupAdmins() {
  console.log('--- Setting up Admin and View Admin Accounts ---');

  // 1. Move test customer 'Bass khan' to another phone if currently on 8015810364
  const existingCustomerUser = await prisma.user.findUnique({
    where: { phone: '8015810364' },
    include: { customer: true },
  });

  if (existingCustomerUser && existingCustomerUser.customer) {
    console.log('Moving test customer Bass khan from 8015810364 to 9848022338 to preserve loan #123...');
    // Check if 9848022338 already exists
    const tempUser = await prisma.user.findUnique({ where: { phone: '9848022338' } });
    if (tempUser) {
      await prisma.user.delete({ where: { phone: '9848022338' } });
    }

    // Update customer and user phone
    await prisma.customer.update({
      where: { id: existingCustomerUser.customer.id },
      data: { phone: '9848022338' },
    });

    await prisma.user.update({
      where: { id: existingCustomerUser.id },
      data: { phone: '9848022338' },
    });
    console.log('Test customer moved to 9848022338 successfully.');
  }

  // 2. Create or update SUPER_ADMIN 8015810364 (Sakthi@143)
  const superAdminHash = await bcrypt.hash('Sakthi@143', 10);
  let superAdmin = await prisma.user.findUnique({ where: { phone: '8015810364' } });
  if (superAdmin) {
    superAdmin = await prisma.user.update({
      where: { phone: '8015810364' },
      data: {
        role: 'SUPER_ADMIN',
        passwordHash: superAdminHash,
        isActive: true,
      },
    });
  } else {
    superAdmin = await prisma.user.create({
      data: {
        phone: '8015810364',
        email: 'admin@omfinance.com',
        role: 'SUPER_ADMIN',
        passwordHash: superAdminHash,
        isActive: true,
      },
    });
  }
  console.log('SUPER_ADMIN 8015810364 configured.');

  // 3. Configure the 3 View Admins
  const viewAdmins = [
    { phone: '8122504829', pass: 'Viji@123', name: 'View Admin 1' },
    { phone: '9080659626', pass: 'Dheeran@123', name: 'View Admin 2' },
    { phone: '8015810397', pass: 'Diva@123', name: 'View Admin 3' },
  ];

  for (const va of viewAdmins) {
    const hash = await bcrypt.hash(va.pass, 10);
    const existing = await prisma.user.findUnique({ where: { phone: va.phone } });
    if (existing) {
      await prisma.user.update({
        where: { phone: va.phone },
        data: {
          role: 'VIEW_ADMIN',
          passwordHash: hash,
          isActive: true,
        },
      });
    } else {
      await prisma.user.create({
        data: {
          phone: va.phone,
          role: 'VIEW_ADMIN',
          passwordHash: hash,
          isActive: true,
        },
      });
    }
    console.log(`${va.name} (${va.phone}) configured.`);
  }

  // 4. Re-assign any foreign keys from 9999999999 to new superAdmin before deletion
  const oldAdmin = await prisma.user.findUnique({ where: { phone: '9999999999' } });
  if (oldAdmin) {
    console.log('Re-assigning records from old admin 9999999999 to new super admin...');
    await prisma.auditLog.updateMany({
      where: { adminId: oldAdmin.id },
      data: { adminId: superAdmin.id },
    });
    await prisma.chitFund.updateMany({
      where: { createdById: oldAdmin.id },
      data: { createdById: superAdmin.id },
    });
    await prisma.chitAuction.updateMany({
      where: { createdById: oldAdmin.id },
      data: { createdById: superAdmin.id },
    });
    await prisma.chitFundLedger.updateMany({
      where: { createdById: oldAdmin.id },
      data: { createdById: superAdmin.id },
    });
    await prisma.chitLoan.updateMany({
      where: { createdById: oldAdmin.id },
      data: { createdById: superAdmin.id },
    });
    await prisma.chitLoanTransaction.updateMany({
      where: { createdById: oldAdmin.id },
      data: { createdById: superAdmin.id },
    });

    await prisma.user.delete({ where: { phone: '9999999999' } });
    console.log('Old admin 9999999999 removed.');
  }

  // 5. Remove junk test customer 3232323232 if exists
  const junkUser = await prisma.user.findUnique({
    where: { phone: '3232323232' },
    include: { customer: { include: { loans: true } } },
  });
  if (junkUser && junkUser.customer && junkUser.customer.loans.length === 0) {
    await prisma.customer.delete({ where: { id: junkUser.customer.id } });
    await prisma.user.delete({ where: { id: junkUser.id } });
    console.log('Junk test customer 3232323232 removed.');
  }

  // Summary
  const allUsers = await prisma.user.findMany({
    select: { phone: true, role: true, isActive: true },
    orderBy: { role: 'asc' },
  });
  console.log('\n--- Final Users in Database ---');
  console.table(allUsers);
}

setupAdmins()
  .catch((err) => {
    console.error('Error in setupAdmins:', err);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
