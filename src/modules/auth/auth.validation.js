const Joi = require('joi');

const login = {
  body: Joi.object({
    phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
    password: Joi.string().min(6).required(),
  }),
};

const otpRequest = {
  body: Joi.object({
    phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
  }),
};

const otpVerify = {
  body: Joi.object({
    phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
    otp: Joi.string().length(6).required(),
  }),
};

const forgotPassword = {
  body: Joi.object({
    phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
  }),
};

const resetPassword = {
  body: Joi.object({
    phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
    otp: Joi.string().length(6).required(),
    newPassword: Joi.string().min(6).required(),
  }),
};

const refreshToken = {
  body: Joi.object({
    refreshToken: Joi.string().required(),
  }),
};

module.exports = { login, otpRequest, otpVerify, forgotPassword, resetPassword, refreshToken };
