const bcrypt = require('bcryptjs');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { encrypt, decrypt } = require('../../utils/encryption');

let canEditColumnEnsured = false;
async function ensureCanEditColumn() {
  if (canEditColumnEnsured) return;
  try {
    await prisma.$executeRawUnsafe(`
      ALTER TABLE "users" ADD COLUMN IF NOT EXISTS "canEdit" BOOLEAN DEFAULT false;
    `);
    canEditColumnEnsured = true;
  } catch (err) {
    console.warn('ensureCanEditColumn warning:', err.message);
  }
}

async function createViewAdmin({ phone, email, password, canEdit = false }) {
  await ensureCanEditColumn();
  const existing = await prisma.user.findUnique({ where: { phone } });
  if (existing) throw ApiError.conflict('A user with this phone number already exists');

  const passwordHash = await bcrypt.hash(password, 10);
  const user = await prisma.user.create({
    data: { role: 'VIEW_ADMIN', phone, email: email || null, passwordHash, canEdit: !!canEdit },
  });
  const { passwordHash: _, ...safeUser } = user;
  return safeUser;
}

async function listAdmins() {
  await ensureCanEditColumn();
  const admins = await prisma.user.findMany({
    where: { role: { in: ['SUPER_ADMIN', 'VIEW_ADMIN'] } },
    select: { id: true, phone: true, email: true, role: true, isActive: true, canEdit: true, createdAt: true },
    orderBy: { createdAt: 'asc' },
  });
  return admins.map((a) => ({
    ...a,
    canEdit: a.role === 'SUPER_ADMIN' ? true : !!a.canEdit,
  }));
}

async function setAdminActive(id, isActive) {
  const user = await prisma.user.findUnique({ where: { id } });
  if (!user) throw ApiError.notFound('Admin not found');
  if (user.role === 'SUPER_ADMIN') throw ApiError.forbidden('Cannot deactivate the super admin');

  return prisma.user.update({ where: { id }, data: { isActive } });
}

async function setAdminCanEdit(id, canEdit) {
  await ensureCanEditColumn();
  const user = await prisma.user.findUnique({ where: { id } });
  if (!user) throw ApiError.notFound('Admin not found');
  if (user.role === 'SUPER_ADMIN') throw ApiError.forbidden('Super admin already has full edit access');

  return prisma.user.update({
    where: { id },
    data: { canEdit: !!canEdit },
    select: { id: true, phone: true, email: true, role: true, isActive: true, canEdit: true },
  });
}

async function getConfig() {
  let config = await prisma.adminConfig.findFirst();
  if (!config) {
    config = await prisma.adminConfig.create({ data: {} });
  }
  return {
    id: config.id,
    upiId: config.upiId,
    smsProvider: config.smsProvider,
    smsApiKey: config.smsApiKeyEncrypted ? decrypt(config.smsApiKeyEncrypted) : null,
    smtpConfig: config.smtpConfigEncrypted ? JSON.parse(decrypt(config.smtpConfigEncrypted)) : null,
    updatedAt: config.updatedAt,
  };
}

async function updateConfig(payload, updatedBy) {
  let config = await prisma.adminConfig.findFirst();
  const data = {
    upiId: payload.upiId,
    smsProvider: payload.smsProvider,
    updatedBy,
  };
  if (payload.smsApiKey) data.smsApiKeyEncrypted = encrypt(payload.smsApiKey);
  if (payload.smtpConfig) data.smtpConfigEncrypted = encrypt(JSON.stringify(payload.smtpConfig));

  if (!config) {
    config = await prisma.adminConfig.create({ data });
  } else {
    config = await prisma.adminConfig.update({ where: { id: config.id }, data });
  }
  return getConfig();
}

async function importLegacyLoans() {
  const records = require('./legacyLoansData.json');
  const defaultPasswordHash = await bcrypt.hash('Customer@123', 10);
  let importedCount = 0;
  let skippedCount = 0;

  for (const item of records) {
    const existingLoan = await prisma.loan.findUnique({ where: { loanNumber: item.loanNumber } });
    if (existingLoan) {
      skippedCount++;
      continue;
    }

    let user = await prisma.user.findUnique({ where: { phone: item.phone } });
    if (!user) {
      user = await prisma.user.create({
        data: {
          phone: item.phone,
          passwordHash: defaultPasswordHash,
          role: 'CUSTOMER',
          isActive: true,
        },
      });
    }

    let customer = await prisma.customer.findUnique({ where: { userId: user.id } });
    if (!customer) {
      customer = await prisma.customer.create({
        data: {
          userId: user.id,
          name: item.customerName,
          phone: item.phone,
          status: 'ACTIVE',
        },
      });
    }

    await prisma.$transaction(async (tx) => {
      const createdLoan = await tx.loan.create({
        data: {
          customerId: customer.id,
          loanNumber: item.loanNumber,
          type: item.loanType,
          principal: item.principal,
          interestRate: item.interestRate,
          agreementFee: item.agreementFee || 0,
          disbursedAmount: item.disbursedAmount,
          startDate: new Date(item.startDate),
          endDate: item.endDate ? new Date(item.endDate) : null,
          termCount: item.termCount,
          installmentAmount: item.installmentAmount,
          status: 'ACTIVE',
        },
      });

      await tx.due.createMany({
        data: item.dueSchedule.map((d) => ({
          loanId: createdLoan.id,
          dueNumber: d.dueNumber,
          dueDate: new Date(d.dueDate),
          amount: d.amount,
          status: 'PENDING',
        })),
      });
    });

    importedCount++;
  }

  return { total: records.length, importedCount, skippedCount };
}

async function resetAdminPassword(id, newPassword) {
  const user = await prisma.user.findUnique({ where: { id } });
  if (!user) throw ApiError.notFound('Admin not found');
  if (user.role === 'CUSTOMER') throw ApiError.forbidden('Cannot reset password for customers via this endpoint');

  const passwordHash = await bcrypt.hash(newPassword, 10);
  await prisma.user.update({ where: { id }, data: { passwordHash } });
  return { success: true };
}

async function toggleAdminRole(id, requesterId) {
  if (id === requesterId) throw ApiError.forbidden('You cannot change your own role');

  const user = await prisma.user.findUnique({ where: { id } });
  if (!user) throw ApiError.notFound('Admin not found');
  if (user.role === 'CUSTOMER') throw ApiError.forbidden('Cannot change role of a customer');

  if (user.role === 'SUPER_ADMIN') {
    // Demoting: ensure at least one other super admin will remain
    const superAdminCount = await prisma.user.count({ where: { role: 'SUPER_ADMIN' } });
    if (superAdminCount <= 1) throw ApiError.forbidden('Cannot demote the last Super Admin');
  }

  const newRole = user.role === 'SUPER_ADMIN' ? 'VIEW_ADMIN' : 'SUPER_ADMIN';
  const updated = await prisma.user.update({
    where: { id },
    data: { role: newRole },
    select: { id: true, phone: true, email: true, role: true, isActive: true, canEdit: true },
  });
  return updated;
}

async function cleanupInvalidLoans() {
  const { deleteLoan } = require('../loan/loan.service');
  const { deleteCustomer } = require('../customer/customer.service');

  // 1. Find all loans where loanNumber is missing or empty
  const allLoans = await prisma.loan.findMany({
    select: { id: true, loanNumber: true },
  });
  const invalidLoans = allLoans.filter(
    (l) => !l.loanNumber || !String(l.loanNumber).trim() || String(l.loanNumber).trim().toLowerCase() === 'null'
  );

  let deletedLoansCount = 0;
  for (const loan of invalidLoans) {
    try {
      await deleteLoan(loan.id);
      deletedLoansCount++;
    } catch (e) {
      console.error(`Error deleting invalid loan ${loan.id}:`, e.message);
    }
  }

  // 2. Find any customer who has no loans at all
  const customersWithNoLoans = await prisma.customer.findMany({
    where: {
      loans: { none: {} },
    },
    select: { id: true, name: true, phone: true },
  });

  let deletedCustomersCount = 0;
  const deletedCustomers = [];
  for (const cust of customersWithNoLoans) {
    try {
      await deleteCustomer(cust.id);
      deletedCustomersCount++;
      deletedCustomers.push({ id: cust.id, name: cust.name, phone: cust.phone });
    } catch (e) {
      console.error(`Error deleting customer without loans ${cust.id}:`, e.message);
    }
  }

  return {
    deletedLoansCount,
    deletedCustomersCount,
    deletedCustomers,
  };
}

module.exports = { createViewAdmin, listAdmins, setAdminActive, setAdminCanEdit, getConfig, updateConfig, importLegacyLoans, resetAdminPassword, toggleAdminRole, cleanupInvalidLoans };

