const loanService = require('./loan.service');
const ApiResponse = require('../../utils/apiResponse');
const ApiError = require('../../utils/apiError');
const prisma = require('../../config/database');

async function createLoan(req, res, next) {
  try {
    const loan = await loanService.createLoan(req.body);
    if (req.audit) await req.audit('CREATE_LOAN', 'Loan', loan.id, { type: loan.type, principal: loan.principal });
    return ApiResponse.success(res, { statusCode: 201, message: 'Loan created', data: loan });
  } catch (err) {
    next(err);
  }
}

async function getLoan(req, res, next) {
  try {
    const loan = await loanService.getLoanById(req.params.id);
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      if (!own || loan.customerId !== own.id) throw ApiError.forbidden('Access denied');
    }
    return ApiResponse.success(res, { data: loan });
  } catch (err) {
    next(err);
  }
}

async function listLoans(req, res, next) {
  try {
    const query = { ...req.query };
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      if (!own) throw ApiError.notFound('Customer profile not found');
      query.customerId = own.id;
    }
    const result = await loanService.listLoans(query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) {
    next(err);
  }
}

async function closeLoan(req, res, next) {
  try {
    const loan = await loanService.closeLoan(req.params.id, req.body.remarks);
    if (req.audit) await req.audit('CLOSE_LOAN', 'Loan', loan.id, { remarks: req.body.remarks });
    return ApiResponse.success(res, { message: 'Loan closed', data: loan });
  } catch (err) {
    next(err);
  }
}

async function repayPrincipal(req, res, next) {
  try {
    const result = await loanService.repayPrincipal(req.params.id, req.body.amount, req.body.paymentMethod);
    if (req.audit) await req.audit('REPAY_PRINCIPAL', 'Loan', req.params.id, { amount: req.body.amount });
    return ApiResponse.success(res, { message: 'Principal repayment recorded', data: result });
  } catch (err) {
    next(err);
  }
}

module.exports = { createLoan, getLoan, listLoans, closeLoan, repayPrincipal };
