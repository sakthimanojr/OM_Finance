const Joi = require('joi');

const createLoan = {
  body: Joi.object({
    customerId: Joi.string().uuid().required(),
    type: Joi.string().valid('WEEKLY', 'MONTHLY', 'HIGH_VALUE').required(),
    principal: Joi.number().positive().required(),
    interestRate: Joi.number().positive().required(),
    agreementFee: Joi.number().min(0).default(0),
    termCount: Joi.when('type', {
      is: Joi.string().valid('WEEKLY', 'MONTHLY'),
      then: Joi.number().integer().min(1).required(),
      otherwise: Joi.number().integer().min(1).optional(),
    }),
    startDate: Joi.date().required(),
  }),
};

const listLoans = {
  query: Joi.object({
    customerId: Joi.string().uuid().optional(),
    status: Joi.string().valid('ACTIVE', 'COMPLETED', 'CLOSED', 'OVERDUE').optional(),
    type: Joi.string().valid('WEEKLY', 'MONTHLY', 'HIGH_VALUE').optional(),
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).max(100).default(20),
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
    paymentMethod: Joi.string().valid('UPI', 'CASH', 'MANUAL').required(),
  }),
};

module.exports = { createLoan, listLoans, loanIdParam, closeLoan, repayPrincipal };
