const express = require('express');
const controller = require('./auth.controller');
const validate = require('../../middlewares/validate.middleware');
const schemas = require('./auth.validation');
const { authLimiter } = require('../../middlewares/rateLimiter.middleware');

const router = express.Router();

/**
 * @openapi
 * /auth/login:
 *   post:
 *     summary: Login with phone + password
 *     tags: [Auth]
 */
router.post('/login', authLimiter, validate(schemas.login), controller.login);

router.post('/otp/request', authLimiter, validate(schemas.otpRequest), controller.requestOtp);
router.post('/otp/verify', authLimiter, validate(schemas.otpVerify), controller.verifyOtp);
router.post('/forgot-password', authLimiter, validate(schemas.forgotPassword), controller.forgotPassword);
router.post('/reset-password', authLimiter, validate(schemas.resetPassword), controller.resetPassword);
router.post('/refresh-token', validate(schemas.refreshToken), controller.refreshToken);

module.exports = router;
