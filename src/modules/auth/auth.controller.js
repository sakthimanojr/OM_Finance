const authService = require('./auth.service');
const ApiResponse = require('../../utils/apiResponse');

async function login(req, res, next) {
  try {
    const { phone, password } = req.body;
    const result = await authService.login(phone, password);
    return ApiResponse.success(res, { message: 'Login successful', data: result });
  } catch (err) {
    next(err);
  }
}

async function requestOtp(req, res, next) {
  try {
    const { phone } = req.body;
    const result = await authService.requestOtp(phone);
    return ApiResponse.success(res, { message: result.message });
  } catch (err) {
    next(err);
  }
}

async function verifyOtp(req, res, next) {
  try {
    const { phone, otp } = req.body;
    const result = await authService.verifyOtp(phone, otp);
    return ApiResponse.success(res, { message: 'OTP verified', data: result });
  } catch (err) {
    next(err);
  }
}

async function forgotPassword(req, res, next) {
  try {
    const { phone } = req.body;
    const result = await authService.forgotPassword(phone);
    return ApiResponse.success(res, { message: result.message });
  } catch (err) {
    next(err);
  }
}

async function resetPassword(req, res, next) {
  try {
    const { phone, otp, newPassword } = req.body;
    const result = await authService.resetPassword(phone, otp, newPassword);
    return ApiResponse.success(res, { message: result.message });
  } catch (err) {
    next(err);
  }
}

async function refreshToken(req, res, next) {
  try {
    const { refreshToken: token } = req.body;
    const result = await authService.refreshAccessToken(token);
    return ApiResponse.success(res, { message: 'Token refreshed', data: result });
  } catch (err) {
    next(err);
  }
}

module.exports = { login, requestOtp, verifyOtp, forgotPassword, resetPassword, refreshToken };
