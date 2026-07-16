const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const env = require('../../config/env');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const smsService = require('../notification/channels/sms.service');

// NOTE: In-memory OTP store for demo purposes. Replace with Redis in production
// so OTPs survive server restarts and work across multiple instances.
const otpStore = new Map(); // phone -> { otp, expiresAt }

function generateOtp() {
  return String(Math.floor(100000 + Math.random() * 900000));
}

function signAccessToken(user) {
  return jwt.sign({ sub: user.id, role: user.role }, env.JWT_ACCESS_SECRET, {
    expiresIn: env.JWT_ACCESS_EXPIRES_IN,
  });
}

function signRefreshToken(user) {
  return jwt.sign({ sub: user.id, role: user.role }, env.JWT_REFRESH_SECRET, {
    expiresIn: env.JWT_REFRESH_EXPIRES_IN,
  });
}

async function login(phone, password) {
  const user = await prisma.user.findUnique({ where: { phone } });
  if (!user || !user.isActive) throw ApiError.unauthorized('Invalid credentials');

  const isMatch = await bcrypt.compare(password, user.passwordHash);
  if (!isMatch) throw ApiError.unauthorized('Invalid credentials');

  const accessToken = signAccessToken(user);
  const refreshToken = signRefreshToken(user);

  return {
    accessToken,
    refreshToken,
    user: { id: user.id, role: user.role, phone: user.phone, email: user.email },
  };
}

async function requestOtp(phone) {
  const user = await prisma.user.findUnique({ where: { phone } });
  if (!user) throw ApiError.notFound('No account found with this phone number');

  const otp = generateOtp();
  otpStore.set(phone, { otp, expiresAt: Date.now() + 5 * 60 * 1000 });

  await smsService.send(phone, `Your Finance App OTP is ${otp}. Valid for 5 minutes.`);
  return { message: 'OTP sent successfully' };
}

async function verifyOtp(phone, otp) {
  const record = otpStore.get(phone);
  if (!record || record.expiresAt < Date.now()) {
    throw ApiError.badRequest('OTP expired or not requested');
  }
  if (record.otp !== otp) {
    throw ApiError.badRequest('Invalid OTP');
  }
  otpStore.delete(phone);

  const user = await prisma.user.findUnique({ where: { phone } });
  if (!user || !user.isActive) throw ApiError.unauthorized('Account not active');

  const accessToken = signAccessToken(user);
  const refreshToken = signRefreshToken(user);

  return {
    accessToken,
    refreshToken,
    user: { id: user.id, role: user.role, phone: user.phone, email: user.email },
  };
}

async function forgotPassword(phone) {
  return requestOtp(phone);
}

async function resetPassword(phone, otp, newPassword) {
  const record = otpStore.get(phone);
  if (!record || record.expiresAt < Date.now() || record.otp !== otp) {
    throw ApiError.badRequest('Invalid or expired OTP');
  }
  otpStore.delete(phone);

  const passwordHash = await bcrypt.hash(newPassword, 10);
  await prisma.user.update({ where: { phone }, data: { passwordHash } });
  return { message: 'Password reset successfully' };
}

async function refreshAccessToken(refreshToken) {
  let payload;
  try {
    payload = jwt.verify(refreshToken, env.JWT_REFRESH_SECRET);
  } catch (err) {
    throw ApiError.unauthorized('Invalid or expired refresh token');
  }
  const user = await prisma.user.findUnique({ where: { id: payload.sub } });
  if (!user || !user.isActive) throw ApiError.unauthorized('User not active');

  return { accessToken: signAccessToken(user) };
}

module.exports = {
  login,
  requestOtp,
  verifyOtp,
  forgotPassword,
  resetPassword,
  refreshAccessToken,
};
