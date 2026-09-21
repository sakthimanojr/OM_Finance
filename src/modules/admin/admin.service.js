const bcrypt = require('bcryptjs');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { encrypt, decrypt } = require('../../utils/encryption');

async function createViewAdmin({ phone, email, password }) {
  const existing = await prisma.user.findUnique({ where: { phone } });
  if (existing) throw ApiError.conflict('A user with this phone number already exists');

  const passwordHash = await bcrypt.hash(password, 10);
  const user = await prisma.user.create({
    data: { role: 'VIEW_ADMIN', phone, email: email || null, passwordHash },
  });
  const { passwordHash: _, ...safeUser } = user;
  return safeUser;
}

async function listAdmins() {
  const admins = await prisma.user.findMany({
    where: { role: { in: ['SUPER_ADMIN', 'VIEW_ADMIN'] } },
    select: { id: true, phone: true, email: true, role: true, isActive: true, createdAt: true },
    orderBy: { createdAt: 'asc' },
  });
  return admins;
}

async function setAdminActive(id, isActive) {
  const user = await prisma.user.findUnique({ where: { id } });
  if (!user) throw ApiError.notFound('Admin not found');
  if (user.role === 'SUPER_ADMIN') throw ApiError.forbidden('Cannot deactivate the super admin');

  return prisma.user.update({ where: { id }, data: { isActive } });
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

module.exports = { createViewAdmin, listAdmins, setAdminActive, getConfig, updateConfig, importLegacyLoans };

