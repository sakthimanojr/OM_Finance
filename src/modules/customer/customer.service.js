const bcrypt = require('bcryptjs');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { encrypt, decrypt, maskAadhaar } = require('../../utils/encryption');

async function createCustomer(payload) {
  const existingUser = await prisma.user.findUnique({ where: { phone: payload.phone } });
  if (existingUser) throw ApiError.conflict('A user with this phone number already exists');

  const rawPassword = (payload.password && String(payload.password).trim().length > 0)
    ? String(payload.password).trim()
    : payload.phone;
  const passwordHash = await bcrypt.hash(rawPassword, 10);

  const result = await prisma.$transaction(async (tx) => {
    const user = await tx.user.create({
      data: {
        role: 'CUSTOMER',
        phone: payload.phone,
        email: payload.email || null,
        passwordHash,
        isActive: true,
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
        status: 'ACTIVE',
      },
    });

    return customer;
  });

  return sanitizeCustomer(result);
}

function sanitizeCustomer(customer) {
  const { aadhaarEncrypted, panEncrypted, loans, ...rest } = customer;
  const loansList = Array.isArray(loans) ? loans : [];
  const activeLoan = loansList.find((l) => l.status === 'ACTIVE' || l.status === 'OVERDUE');
  const latestLoan = activeLoan || loansList[0] || null;

  let effectiveStatus = rest.status || 'ACTIVE';
  if (loansList.length > 0) {
    if (activeLoan) {
      effectiveStatus = activeLoan.status === 'OVERDUE' ? 'OVERDUE' : 'ACTIVE';
    } else {
      effectiveStatus = 'CLOSED';
    }
  }

  return {
    ...rest,
    status: effectiveStatus,
    pan: panEncrypted ? decrypt(panEncrypted) : null,
    loans: loansList,
    loanNumber: latestLoan?.loanNumber || null,
    activeLoanNumber: activeLoan?.loanNumber || null,
    loanStatus: latestLoan?.status || null,
  };
}

async function getCustomerByUserId(userId) {
  const customer = await prisma.customer.findUnique({
    where: { userId },
    include: { documents: true, loans: { orderBy: { createdAt: 'desc' } } },
  });
  if (!customer) throw ApiError.notFound('Customer profile not found');
  return sanitizeCustomer(customer);
}

async function getCustomerById(id) {
  const customer = await prisma.customer.findUnique({
    where: { id },
    include: { documents: true, loans: { orderBy: { createdAt: 'desc' } } },
  });
  if (!customer) throw ApiError.notFound('Customer not found');
  return sanitizeCustomer(customer);
}

async function listCustomers({ search, status, page, limit }) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 500;
  const where = {};
  if (status) {
    const s = status.toUpperCase();
    if (s === 'ACTIVE') {
      where.loans = { some: { status: { in: ['ACTIVE', 'OVERDUE'] } } };
    } else if (s === 'CLOSED') {
      where.loans = {
        some: { status: { in: ['CLOSED', 'COMPLETED'] } },
        none: { status: { in: ['ACTIVE', 'OVERDUE'] } },
      };
    } else {
      where.status = status;
    }
  }
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
      include: {
        loans: {
          select: {
            id: true,
            loanNumber: true,
            status: true,
            type: true,
            principal: true,
            disbursedAmount: true,
            totalCollection: true,
          },
          orderBy: { createdAt: 'desc' },
        },
      },
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

  const {
    password,
    phone,
    email,
    name,
    fatherName,
    address,
    aadhaar,
    pan,
    occupation,
    monthlyIncome,
    guarantorName,
    guarantorPhone,
    emergencyContact,
    status,
  } = payload;

  // If phone is changed, verify uniqueness
  if (phone && phone !== existing.phone) {
    const phoneExists = await prisma.user.findFirst({
      where: {
        phone,
        id: { not: existing.userId },
      },
    });
    if (phoneExists) {
      throw ApiError.conflict('A user with this phone number already exists');
    }
  }

  // If email is changed, verify uniqueness
  if (email && email !== existing.email) {
    const emailExists = await prisma.user.findFirst({
      where: {
        email,
        id: { not: existing.userId },
      },
    });
    if (emailExists) {
      throw ApiError.conflict('A user with this email address already exists');
    }
  }

  const result = await prisma.$transaction(async (tx) => {
    // 1. Sync User updates (password, phone, email, status)
    const userUpdateData = {};
    if (password && String(password).trim().length > 0) {
      userUpdateData.passwordHash = await bcrypt.hash(String(password).trim(), 10);
    }
    if (phone && phone !== existing.phone) {
      userUpdateData.phone = phone;
    }
    if (email !== undefined) {
      userUpdateData.email = email || null;
    }
    if (status !== undefined) {
      userUpdateData.isActive = status === 'ACTIVE';
    }

    if (Object.keys(userUpdateData).length > 0) {
      await tx.user.update({
        where: { id: existing.userId },
        data: userUpdateData,
      });
    }

    // 2. Prepare customer record updates
    const customerData = {};
    if (name !== undefined) customerData.name = name;
    if (fatherName !== undefined) customerData.fatherName = fatherName || null;
    if (phone !== undefined) customerData.phone = phone;
    if (email !== undefined) customerData.email = email || null;
    if (address !== undefined) customerData.address = address || null;
    if (occupation !== undefined) customerData.occupation = occupation || null;
    if (monthlyIncome !== undefined) customerData.monthlyIncome = monthlyIncome || null;
    if (guarantorName !== undefined) customerData.guarantorName = guarantorName || null;
    if (guarantorPhone !== undefined) customerData.guarantorPhone = guarantorPhone || null;
    if (emergencyContact !== undefined) customerData.emergencyContact = emergencyContact || null;
    if (status !== undefined) customerData.status = status;
    if (aadhaar !== undefined) {
      customerData.aadhaarLast4 = aadhaar ? maskAadhaar(aadhaar) : null;
      customerData.aadhaarEncrypted = aadhaar ? encrypt(aadhaar) : null;
    }
    if (pan !== undefined) {
      customerData.panEncrypted = pan ? encrypt(pan) : null;
    }

    const updated = await tx.customer.update({
      where: { id },
      data: customerData,
    });

    return updated;
  });

  return sanitizeCustomer(result);
}

const path = require('path');
const { uploadBuffer } = require('../../config/cloudinary');

const CLOUDINARY_FOLDERS = {
  AADHAAR: 'om-finance/documents/aadhaar',
  PAN: 'om-finance/documents/pan',
  AGREEMENT: 'om-finance/documents/agreement',
  OTHER: 'om-finance/documents/other',
};

async function addDocument(customerId, type, buffer, originalname) {
  const customer = await prisma.customer.findUnique({ where: { id: customerId } });
  if (!customer) throw ApiError.notFound('Customer not found');

  const docType = (type || 'OTHER').toUpperCase();
  const folder = CLOUDINARY_FOLDERS[docType] || CLOUDINARY_FOLDERS.OTHER;
  const ext = path.extname(originalname || '');
  const filename = `${customerId}-${Date.now()}${ext}`;

  const result = await uploadBuffer(buffer, folder, filename);
  if (!result) throw ApiError.internal('File upload failed — Cloudinary not configured');

  return prisma.document.create({
    data: {
      customerId,
      type: docType,
      fileUrl: result.url,
      cloudinaryPublicId: result.publicId,
    },
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
