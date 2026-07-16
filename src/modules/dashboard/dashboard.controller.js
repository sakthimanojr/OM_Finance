const dashboardService = require('./dashboard.service');
const ApiResponse = require('../../utils/apiResponse');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');

async function adminSummary(req, res, next) {
  try {
    const summary = await dashboardService.getAdminSummary();
    return ApiResponse.success(res, { data: summary });
  } catch (err) {
    next(err);
  }
}

async function customerSummary(req, res, next) {
  try {
    let customerId = req.params.id;
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      if (!own) throw ApiError.notFound('Customer profile not found');
      customerId = own.id;
    }
    const summary = await dashboardService.getCustomerSummary(customerId);
    return ApiResponse.success(res, { data: summary });
  } catch (err) {
    next(err);
  }
}

module.exports = { adminSummary, customerSummary };
