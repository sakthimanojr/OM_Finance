const dueService = require('./due.service');
const ApiResponse = require('../../utils/apiResponse');
const ApiError = require('../../utils/apiError');
const prisma = require('../../config/database');

async function listDues(req, res, next) {
  try {
    const query = { ...req.query };
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      if (!own) throw ApiError.notFound('Customer profile not found');
      query.customerId = own.id;
    }
    const result = await dueService.listDues(query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) {
    next(err);
  }
}

async function getUpcoming(req, res, next) {
  try {
    const days = parseInt(req.query.days, 10) || 7;
    const dues = await dueService.getUpcoming(days);
    return ApiResponse.success(res, { data: dues });
  } catch (err) {
    next(err);
  }
}

async function getOverdue(req, res, next) {
  try {
    const dues = await dueService.getOverdue();
    return ApiResponse.success(res, { data: dues });
  } catch (err) {
    next(err);
  }
}

async function getDue(req, res, next) {
  try {
    const due = await dueService.getDueById(req.params.id);
    return ApiResponse.success(res, { data: due });
  } catch (err) {
    next(err);
  }
}

module.exports = { listDues, getUpcoming, getOverdue, getDue };
