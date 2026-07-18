const dotenv = require('dotenv');
dotenv.config();

const isProd = (process.env.NODE_ENV || 'development') === 'production';

function required(name, fallback = undefined) {
  const val = process.env[name] ?? fallback;
  if (val === undefined) {
    // eslint-disable-next-line no-console
    console.warn(`[env] Missing environment variable: ${name}`);
  }
  return val;
}

/**
 * Like `required`, but THROWS in production instead of falling back to an
 * insecure default.  Use this for secrets that must never run with defaults.
 */
function strictRequired(name, devFallback) {
  const val = process.env[name];
  if (!val) {
    if (isProd) {
      throw new Error(`[env] FATAL — missing required secret in production: ${name}`);
    }
    // eslint-disable-next-line no-console
    console.warn(`[env] Using insecure dev fallback for ${name}`);
    return devFallback;
  }
  return val;
}

const env = {
  NODE_ENV: process.env.NODE_ENV || 'development',
  PORT: parseInt(process.env.PORT || '4000', 10),
  API_PREFIX: process.env.API_PREFIX || '/api/v1',

  // Deployment URLs
  BASE_URL: process.env.BASE_URL || '',
  CORS_ORIGIN: process.env.CORS_ORIGIN || (isProd ? '' : '*'),

  DATABASE_URL: required('DATABASE_URL'),

  JWT_ACCESS_SECRET: strictRequired('JWT_ACCESS_SECRET', 'dev_access_secret'),
  JWT_REFRESH_SECRET: strictRequired('JWT_REFRESH_SECRET', 'dev_refresh_secret'),
  JWT_ACCESS_EXPIRES_IN: process.env.JWT_ACCESS_EXPIRES_IN || '15m',
  JWT_REFRESH_EXPIRES_IN: process.env.JWT_REFRESH_EXPIRES_IN || '7d',

  SUPER_ADMIN_PHONE: process.env.SUPER_ADMIN_PHONE || '9999999999',
  SUPER_ADMIN_EMAIL: process.env.SUPER_ADMIN_EMAIL || 'admin@example.com',
  SUPER_ADMIN_PASSWORD: process.env.SUPER_ADMIN_PASSWORD || 'ChangeMe123!',

  SMTP_HOST: process.env.SMTP_HOST,
  SMTP_PORT: parseInt(process.env.SMTP_PORT || '465', 10),
  SMTP_USER: process.env.SMTP_USER,
  SMTP_PASS: process.env.SMTP_PASS,
  SMTP_FROM: process.env.SMTP_FROM || 'Finance App <no-reply@financeapp.com>',

  FIREBASE_SERVICE_ACCOUNT_PATH: process.env.FIREBASE_SERVICE_ACCOUNT_PATH,

  CLOUDINARY_CLOUD_NAME: process.env.CLOUDINARY_CLOUD_NAME || '',
  CLOUDINARY_API_KEY: process.env.CLOUDINARY_API_KEY || '',
  CLOUDINARY_API_SECRET: process.env.CLOUDINARY_API_SECRET || '',

  SMS_PROVIDER: process.env.SMS_PROVIDER || 'none',
  SMS_API_KEY: process.env.SMS_API_KEY,
  SMS_SENDER_ID: process.env.SMS_SENDER_ID,

  UPI_ID: process.env.UPI_ID || 'merchant@upi',
  UPI_PAYEE_NAME: process.env.UPI_PAYEE_NAME || 'Finance Company',

  RAZORPAY_KEY_ID: process.env.RAZORPAY_KEY_ID || '',
  RAZORPAY_KEY_SECRET: process.env.RAZORPAY_KEY_SECRET || '',
  RAZORPAY_WEBHOOK_SECRET: process.env.RAZORPAY_WEBHOOK_SECRET || '',

  RATE_LIMIT_WINDOW_MS: parseInt(process.env.RATE_LIMIT_WINDOW_MS || '900000', 10),
  RATE_LIMIT_MAX: parseInt(process.env.RATE_LIMIT_MAX || '200', 10),

  ENCRYPTION_KEY: strictRequired('ENCRYPTION_KEY', 'dev_only_32_char_encryption_key!'),
};

module.exports = env;
