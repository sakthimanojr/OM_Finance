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

module.exports = { createViewAdmin, listAdmins, setAdminActive, getConfig, updateConfig };
