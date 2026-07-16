const Joi = require('joi');

const createCustomer = {
  body: Joi.object({
    name: Joi.string().min(2).max(100).required(),
    fatherName: Joi.string().max(100).optional().allow(''),
    phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
    email: Joi.string().email().optional().allow(''),
    address: Joi.string().max(300).optional().allow(''),
    aadhaar: Joi.string().pattern(/^[0-9]{12}$/).optional().allow(''),
    pan: Joi.string().pattern(/^[A-Z]{5}[0-9]{4}[A-Z]$/).optional().allow(''),
    occupation: Joi.string().max(100).optional().allow(''),
    monthlyIncome: Joi.number().min(0).optional(),
    guarantorName: Joi.string().max(100).optional().allow(''),
    guarantorPhone: Joi.string().pattern(/^[0-9]{10}$/).optional().allow(''),
    emergencyContact: Joi.string().pattern(/^[0-9]{10}$/).optional().allow(''),
    password: Joi.string().min(6).required(),
  }),
};

const updateCustomer = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    name: Joi.string().min(2).max(100).optional(),
    fatherName: Joi.string().max(100).optional().allow(''),
    email: Joi.string().email().optional().allow(''),
    address: Joi.string().max(300).optional().allow(''),
    occupation: Joi.string().max(100).optional().allow(''),
    monthlyIncome: Joi.number().min(0).optional(),
    guarantorName: Joi.string().max(100).optional().allow(''),
    guarantorPhone: Joi.string().pattern(/^[0-9]{10}$/).optional().allow(''),
    emergencyContact: Joi.string().pattern(/^[0-9]{10}$/).optional().allow(''),
    status: Joi.string().valid('ACTIVE', 'SUSPENDED', 'CLOSED').optional(),
  }),
};

const listCustomers = {
  query: Joi.object({
    search: Joi.string().max(100).optional().allow(''),
    status: Joi.string().valid('ACTIVE', 'SUSPENDED', 'CLOSED').optional(),
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).max(100).default(20),
  }),
};

const idParam = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
};

module.exports = { createCustomer, updateCustomer, listCustomers, idParam };
