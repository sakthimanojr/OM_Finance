require('dotenv').config();
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function main() {
  // 1. Fetch counts of all customer-related records
  const customerCount = await prisma.customer.count();
  const loanCount = await prisma.loan.count();
  const closedLoanCount = await prisma.closedLoan.count();
  const dueCount = await prisma.due.count();
  const paymentCount = await prisma.payment.count();
  const receiptCount = await prisma.receipt.count();
  const documentCount = await prisma.document.count();
  const notificationCount = await prisma.notification.count();
  const customerUserCount = await prisma.user.count({ where: { role: 'CUSTOMER' } });

  console.log('================ WIPE CUSTOMER DATA SUMMARY ================');
  console.log(`Customers to delete:         ${customerCount}`);
  console.log(`Loans to delete:             ${loanCount}`);
  console.log(`Closed Loans to delete:      ${closedLoanCount}`);
  console.log(`Dues to delete:              ${dueCount}`);
  console.log(`Payments to delete:          ${paymentCount}`);
  console.log(`Receipts to delete:          ${receiptCount}`);
  console.log(`Documents to delete:         ${documentCount}`);
  console.log(`Notifications to delete:     ${notificationCount}`);
  console.log(`Customer Users to delete:    ${customerUserCount}`);
  console.log('===========================================================');

  // Check for the --confirm CLI flag
  const hasConfirm = process.argv.includes('--confirm');

  if (!hasConfirm) {
    console.error('\n⚠️  WARNING: This script will WIPE ALL CUSTOMER-RELATED DATA PERMANENTLY.');
    console.error('To execute the wipe, you must run this script with the --confirm flag:');
    console.error('  node scripts/wipeAllCustomerData.js --confirm\n');
    process.exit(1);
  }

  console.log('\n--confirm flag detected. Wiping data in a transaction...');

  try {
    // 2. Perform deletions in FK-safe order inside a single transaction
    await prisma.$transaction(async (tx) => {
      // 1. Receipts (reference Payments)
      const receiptsDeleted = await tx.receipt.deleteMany();
      console.log(`- Deleted ${receiptsDeleted.count} receipts`);

      // 2. Payments (reference Dues/Loans/Customers)
      const paymentsDeleted = await tx.payment.deleteMany();
      console.log(`- Deleted ${paymentsDeleted.count} payments`);

      // 3. Dues (reference Loans)
      const duesDeleted = await tx.due.deleteMany();
      console.log(`- Deleted ${duesDeleted.count} dues`);

      // 4. Documents (reference Customers)
      const documentsDeleted = await tx.document.deleteMany();
      console.log(`- Deleted ${documentsDeleted.count} documents`);

      // 5. Notifications (reference Customers)
      const notificationsDeleted = await tx.notification.deleteMany();
      console.log(`- Deleted ${notificationsDeleted.count} notifications`);

      // 6. Loans (reference Customers)
      const loansDeleted = await tx.loan.deleteMany();
      console.log(`- Deleted ${loansDeleted.count} loans`);

      // 7. Closed Loans
      const closedLoansDeleted = await tx.closedLoan.deleteMany();
      console.log(`- Deleted ${closedLoansDeleted.count} closed loans`);

      // 8. Customers
      const customersDeleted = await tx.customer.deleteMany();
      console.log(`- Deleted ${customersDeleted.count} customers`);

      // 9. Users where role = 'CUSTOMER'
      const usersDeleted = await tx.user.deleteMany({
        where: { role: 'CUSTOMER' },
      });
      console.log(`- Deleted ${usersDeleted.count} customer users`);

      // 3. Keep audit trail by logging this wipe under a SUPER_ADMIN / VIEW_ADMIN
      const adminUser = await tx.user.findFirst({
        where: { role: { in: ['SUPER_ADMIN', 'VIEW_ADMIN'] } },
      });

      if (adminUser) {
        await tx.auditLog.create({
          data: {
            adminId: adminUser.id,
            action: 'WIPE_CUSTOMER_DATA',
            entityType: 'SYSTEM',
            entityId: 'SYSTEM',
            details: {
              confirmed: true,
              deletedCounts: {
                customers: customerCount,
                loans: loanCount,
                closedLoans: closedLoanCount,
                dues: dueCount,
                payments: paymentCount,
                receipts: receiptCount,
                documents: documentCount,
                notifications: notificationCount,
                users: customerUserCount,
              },
              timestamp: new Date().toISOString(),
            },
            ipAddress: '127.0.0.1',
          },
        });
        console.log('- Logged system audit log entry for this wipe');
      }
    });

    console.log('\n✅ Success! All customer-related data has been successfully wiped.');
  } catch (error) {
    console.error('\n❌ ERROR: Failed to wipe data. Transaction rolled back.');
    console.error(error);
    process.exit(1);
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
