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
    password: Joi.string().min(4).max(100).optional().allow('', null),
  }),
};

const updateCustomer = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    name: Joi.string().min(2).max(100).optional(),
    fatherName: Joi.string().max(100).optional().allow('', null),
    phone: Joi.string().pattern(/^[0-9]{10}$/).optional(),
    email: Joi.string().email().optional().allow('', null),
    address: Joi.string().max(300).optional().allow('', null),
    aadhaar: Joi.string().pattern(/^[0-9]{12}$/).optional().allow('', null),
    pan: Joi.string().pattern(/^[A-Z]{5}[0-9]{4}[A-Z]$/).optional().allow('', null),
    occupation: Joi.string().max(100).optional().allow('', null),
    monthlyIncome: Joi.number().min(0).optional().allow(null),
    guarantorName: Joi.string().max(100).optional().allow('', null),
    guarantorPhone: Joi.string().pattern(/^[0-9]{10}$/).optional().allow('', null),
    emergencyContact: Joi.string().pattern(/^[0-9]{10}$/).optional().allow('', null),
    status: Joi.string().valid('ACTIVE', 'SUSPENDED', 'CLOSED').optional(),
    password: Joi.string().min(4).max(100).optional().allow('', null),
  }),
};

const listCustomers = {
  query: Joi.object({
    search: Joi.string().max(100).optional().allow(''),
    status: Joi.string().valid('ACTIVE', 'SUSPENDED', 'CLOSED').optional(),
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).max(500).default(20),
  }),
};

const idParam = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
};

module.exports = { createCustomer, updateCustomer, listCustomers, idParam };
