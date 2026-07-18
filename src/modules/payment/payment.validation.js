const Joi = require('joi');

const initiate = {
  body: Joi.object({
    dueId: Joi.string().uuid().required(),
    method: Joi.string().valid('UPI', 'CASH', 'BANK_TRANSFER', 'MANUAL').required(),
    amount: Joi.number().positive().required(),
  }),
};

const confirm = {
  body: Joi.object({
    paymentId: Joi.string().uuid().required(),
    upiRefNumber: Joi.string().max(100).optional(),
  }),
};

const listPayments = {
  query: Joi.object({
    customerId: Joi.string().uuid().optional(),
    loanId: Joi.string().uuid().optional(),
    status: Joi.string().valid('INITIATED', 'SUCCESS', 'FAILED').optional(),
    month: Joi.string().valid('current').optional(),
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).max(100).default(20),
  }),
};

module.exports = { initiate, confirm, listPayments };
