const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');
const morgan = require('morgan');
const swaggerUi = require('swagger-ui-express');

const env = require('./config/env');
const swaggerSpec = require('./config/swagger');
const routes = require('./routes');
const paymentController = require('./modules/payment/payment.controller');
const auditLogger = require('./middlewares/auditLogger.middleware');
const errorMiddleware = require('./middlewares/error.middleware');
const notFoundMiddleware = require('./middlewares/notFound.middleware');
const { apiLimiter } = require('./middlewares/rateLimiter.middleware');
const logger = require('./utils/logger');

const app = express();

app.use(helmet());

// CORS — restrict origins in production.  Set CORS_ORIGIN in .env to a
// comma-separated list of allowed origins (e.g. "https://app.example.com").
const corsOrigin = env.CORS_ORIGIN;
app.use(
  cors({
    origin: corsOrigin === '*' ? true : corsOrigin.split(',').map((o) => o.trim()),
    credentials: true,
  })
);

app.use(compression());

// IMPORTANT: the Razorpay webhook must be registered with express.raw()
// BEFORE the global express.json() below, so the HMAC signature check in
// paymentController.razorpayWebhook runs against the exact raw bytes
// Razorpay sent. Once express.json() consumes the stream, the raw body is
// gone — that's why this can't simply live inside payment.routes.js.
app.post(
  `${env.API_PREFIX}/payments/webhook/razorpay`,
  express.raw({ type: 'application/json' }),
  paymentController.razorpayWebhook
);

app.use(express.json({ limit: '5mb' }));
app.use(express.urlencoded({ extended: true }));
app.use(
  morgan('combined', {
    stream: { write: (msg) => logger.info(msg.trim()) },
  })
);
app.use(apiLimiter);
app.use(auditLogger);

app.get('/health', (req, res) => res.json({ status: 'ok', timestamp: new Date().toISOString() }));

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use(env.API_PREFIX, routes);

app.use(notFoundMiddleware);
app.use(errorMiddleware);

module.exports = app;
