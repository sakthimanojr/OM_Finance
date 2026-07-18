const customerService = require('./customer.service');
const ApiResponse = require('../../utils/apiResponse');
const ApiError = require('../../utils/apiError');

async function createCustomer(req, res, next) {
  try {
    const customer = await customerService.createCustomer(req.body);
    if (req.audit) await req.audit('CREATE_CUSTOMER', 'Customer', customer.id, { phone: customer.phone });
    return ApiResponse.success(res, { statusCode: 201, message: 'Customer created', data: customer });
  } catch (err) {
    next(err);
  }
}

async function getMyProfile(req, res, next) {
  try {
    if (req.user.role !== 'CUSTOMER') {
      throw ApiError.forbidden('Only customer accounts have a profile at this endpoint');
    }
    const profile = await customerService.getCustomerByUserId(req.user.id);
    return ApiResponse.success(res, { data: profile });
  } catch (err) {
    next(err);
  }
}

async function getCustomer(req, res, next) {
  try {
    // Customers can only view their own record
    if (req.user.role === 'CUSTOMER') {
      const own = await customerService.getCustomerById(req.params.id);
      if (own.userId !== req.user.id) throw ApiError.forbidden('Access denied');
      return ApiResponse.success(res, { data: own });
    }
    const customer = await customerService.getCustomerById(req.params.id);
    return ApiResponse.success(res, { data: customer });
  } catch (err) {
    next(err);
  }
}

async function listCustomers(req, res, next) {
  try {
    const result = await customerService.listCustomers(req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) {
    next(err);
  }
}

async function updateCustomer(req, res, next) {
  try {
    const customer = await customerService.updateCustomer(req.params.id, req.body);
    if (req.audit) await req.audit('UPDATE_CUSTOMER', 'Customer', customer.id, req.body);
    return ApiResponse.success(res, { message: 'Customer updated', data: customer });
  } catch (err) {
    next(err);
  }
}

async function uploadDocument(req, res, next) {
  try {
    if (!req.file) throw ApiError.badRequest('No file uploaded');
    const doc = await customerService.addDocument(
      req.params.id,
      req.body.type,
      req.file.buffer,
      req.file.originalname
    );
    if (req.audit) await req.audit('UPLOAD_DOCUMENT', 'Document', doc.id, { type: doc.type });
    return ApiResponse.success(res, { statusCode: 201, message: 'Document uploaded', data: doc });
  } catch (err) {
    next(err);
  }
}

async function getLoanHistory(req, res, next) {
  try {
    const loans = await customerService.getLoanHistory(req.params.id);
    return ApiResponse.success(res, { data: loans });
  } catch (err) {
    next(err);
  }
}

module.exports = { createCustomer, getCustomer, getMyProfile, listCustomers, updateCustomer, uploadDocument, getLoanHistory };
