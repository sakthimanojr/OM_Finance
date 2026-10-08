const rateLimit = require('express-rate-limit');
const env = require('../config/env');

// Safe key extractor: uses the real client IP (set via `trust proxy` in app.js),
// falling back to the socket address if the header is absent.
const keyGenerator = (req) => req.ip || req.socket.remoteAddress || 'unknown';

const apiLimiter = rateLimit({
  windowMs: env.RATE_LIMIT_WINDOW_MS,
  max: env.RATE_LIMIT_MAX,
  standardHeaders: true,
  legacyHeaders: false,
  keyGenerator,
  message: { success: false, message: 'Too many requests, please try again later.' },
});

const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 30,
  standardHeaders: true,
  legacyHeaders: false,
  keyGenerator,
  message: { success: false, message: 'Too many auth attempts, please try again later.' },
});

module.exports = { apiLimiter, authLimiter };
