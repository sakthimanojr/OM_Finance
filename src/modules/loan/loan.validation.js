const Joi = require('joi');

const createLoan = {
  body: Joi.object({
    customerId: Joi.string().allow('', null).optional(),
    customer: Joi.object({
      name: Joi.string().required(),
      phone: Joi.string().required(),
      fatherName: Joi.string().allow('', null).optional(),
      email: Joi.string().email().allow('', null).optional(),
      address: Joi.string().allow('', null).optional(),
      aadhaar: Joi.string().allow('', null).optional(),
      pan: Joi.string().allow('', null).optional(),
      occupation: Joi.string().allow('', null).optional(),
      monthlyIncome: Joi.number().allow(null).optional(),
      emergencyContact: Joi.string().allow('', null).optional(),
      guarantorName: Joi.string().allow('', null).optional(),
      guarantorPhone: Joi.string().allow('', null).optional(),
      password: Joi.string().allow('', null).optional(),
    }).optional(),
    loanNumber: Joi.string().max(50).allow('', null).optional(),
    type: Joi.string().valid('WEEKLY', 'MONTHLY', 'HIGH_VALUE').required(),
    principal: Joi.number().positive().required(),
    interestRate: Joi.number().min(0).required(),
    agreementFee: Joi.number().min(0).default(0),
    termCount: Joi.when('type', {
      is: Joi.string().valid('WEEKLY', 'MONTHLY'),
      then: Joi.number().integer().min(1).required(),
      otherwise: Joi.number().integer().min(1).optional(),
    }),
    startDate: Joi.date().required(),
    disbursementMethod: Joi.string().valid('CASH', 'BANK', 'BANK_TRANSFER').default('CASH').optional(),
  }),
};

const listLoans = {
  query: Joi.object({
    customerId: Joi.string().allow('', null).optional(),
    status: Joi.string().valid('ACTIVE', 'COMPLETED', 'CLOSED', 'OVERDUE', 'ALL').optional(),
    type: Joi.string().valid('WEEKLY', 'MONTHLY', 'HIGH_VALUE').optional(),
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).max(1000).default(500),
  }),
};

const loanIdParam = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
  }),
};

const closeLoan = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
  }),
  body: Joi.object({
    remarks: Joi.string().max(500).optional(),
  }),
};

const repayPrincipal = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
  }),
  body: Joi.object({
    amount: Joi.number().positive().required(),
    paymentMethod: Joi.string().valid('UPI', 'CASH', 'BANK_TRANSFER', 'MANUAL').required(),
  }),
};

const updateLoan = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
  }),
  body: Joi.object({
    principal: Joi.number().positive().optional(),
    interestRate: Joi.number().positive().optional(),
    agreementFee: Joi.number().min(0).optional(),
    termCount: Joi.number().integer().min(1).optional(),
    startDate: Joi.date().optional(),
  }).min(1),
};

module.exports = { createLoan, updateLoan, listLoans, loanIdParam, closeLoan, repayPrincipal };


