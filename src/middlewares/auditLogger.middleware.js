const prisma = require('../config/database');
const logger = require('../utils/logger');

/**
 * Attaches req.audit(action, entityType, entityId, details) helper and
 * auto-logs on response finish for mutating requests made by admins.
 */
function auditLogger(req, res, next) {
  req.audit = async (action, entityType, entityId = null, details = null) => {
    try {
      if (!req.user || req.user.role === 'CUSTOMER') return;
      await prisma.auditLog.create({
        data: {
          adminId: req.user.id,
          action,
          entityType,
          entityId,
          details: details ? details : undefined,
          ipAddress: req.ip,
        },
      });
    } catch (err) {
      logger.error(`Failed to write audit log: ${err.message}`);
    }
  };
  next();
}

module.exports = auditLogger;
