const prisma = require('../../config/database');

async function listAuditLogs({ adminId, entityType, action, page = 1, limit = 30 }) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 30;
  const where = {};
  if (adminId) where.adminId = adminId;
  if (entityType) where.entityType = entityType;
  if (action) where.action = action;

  const [items, total] = await Promise.all([
    prisma.auditLog.findMany({
      where,
      include: { admin: { select: { id: true, phone: true, email: true, role: true } } },
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.auditLog.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

module.exports = { listAuditLogs };
