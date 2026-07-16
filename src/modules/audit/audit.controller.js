const auditService = require('./audit.service');
const ApiResponse = require('../../utils/apiResponse');

async function listAuditLogs(req, res, next) {
  try {
    const result = await auditService.listAuditLogs(req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) {
    next(err);
  }
}

module.exports = { listAuditLogs };
