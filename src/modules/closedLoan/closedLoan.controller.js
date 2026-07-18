const closedLoanService = require('./closedLoan.service');
const ApiResponse = require('../../utils/apiResponse');

async function listClosedLoans(req, res, next) {
  try {
    const result = await closedLoanService.listClosedLoans(req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) {
    next(err);
  }
}

async function getClosedLoan(req, res, next) {
  try {
    const closedLoan = await closedLoanService.getClosedLoan(req.params.id);
    return ApiResponse.success(res, { data: closedLoan });
  } catch (err) {
    next(err);
  }
}

module.exports = { listClosedLoans, getClosedLoan };
