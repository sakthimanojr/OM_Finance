const bcrypt = require('bcryptjs');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { encrypt, decrypt, maskAadhaar } = require('../../utils/encryption');

async function createCustomer(payload) {
  const existingUser = await prisma.user.findUnique({ where: { phone: payload.phone } });
  if (existingUser) throw ApiError.conflict('A user with this phone number already exists');

  const passwordHash = await bcrypt.hash(payload.password, 10);

  const result = await prisma.$transaction(async (tx) => {
    const user = await tx.user.create({
      data: {
        role: 'CUSTOMER',
        phone: payload.phone,
        email: payload.email || null,
        passwordHash,
      },
    });

    const customer = await tx.customer.create({
      data: {
        userId: user.id,
        name: payload.name,
        fatherName: payload.fatherName || null,
        phone: payload.phone,
        email: payload.email || null,
        address: payload.address || null,
        aadhaarLast4: payload.aadhaar ? maskAadhaar(payload.aadhaar) : null,
        aadhaarEncrypted: payload.aadhaar ? encrypt(payload.aadhaar) : null,
        panEncrypted: payload.pan ? encrypt(payload.pan) : null,
        occupation: payload.occupation || null,
        monthlyIncome: payload.monthlyIncome || null,
        guarantorName: payload.guarantorName || null,
        guarantorPhone: payload.guarantorPhone || null,
        emergencyContact: payload.emergencyContact || null,
      },
    });

    return customer;
  });

  return sanitizeCustomer(result);
}

function sanitizeCustomer(customer) {
  const { aadhaarEncrypted, panEncrypted, ...rest } = customer;
  return {
    ...rest,
    pan: panEncrypted ? decrypt(panEncrypted) : null,
  };
}

async function getCustomerByUserId(userId) {
  const customer = await prisma.customer.findUnique({
    where: { userId },
    include: { documents: true },
  });
  if (!customer) throw ApiError.notFound('Customer profile not found');
  return sanitizeCustomer(customer);
}

async function getCustomerById(id) {
  const customer = await prisma.customer.findUnique({
    where: { id },
    include: { documents: true },
  });
  if (!customer) throw ApiError.notFound('Customer not found');
  return sanitizeCustomer(customer);
}

async function listCustomers({ search, status, page, limit }) {
  const where = {};
  if (status) where.status = status;
  if (search) {
    where.OR = [
      { name: { contains: search, mode: 'insensitive' } },
      { phone: { contains: search } },
      { email: { contains: search, mode: 'insensitive' } },
    ];
  }

  const [items, total] = await Promise.all([
    prisma.customer.findMany({
      where,
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.customer.count({ where }),
  ]);

  return {
    items: items.map(sanitizeCustomer),
    total,
    page,
    limit,
    totalPages: Math.ceil(total / limit),
  };
}

async function updateCustomer(id, payload) {
  const existing = await prisma.customer.findUnique({ where: { id } });
  if (!existing) throw ApiError.notFound('Customer not found');

  const updated = await prisma.customer.update({
    where: { id },
    data: payload,
  });
  return sanitizeCustomer(updated);
}

async function addDocument(customerId, type, fileUrl) {
  const customer = await prisma.customer.findUnique({ where: { id: customerId } });
  if (!customer) throw ApiError.notFound('Customer not found');

  return prisma.document.create({
    data: { customerId, type, fileUrl },
  });
}

async function getLoanHistory(customerId) {
  return prisma.loan.findMany({
    where: { customerId },
    include: { dues: { orderBy: { dueNumber: 'asc' } } },
    orderBy: { createdAt: 'desc' },
  });
}

module.exports = {
  createCustomer,
  getCustomerById,
  getCustomerByUserId,
  listCustomers,
  updateCustomer,
  addDocument,
  getLoanHistory,
};
