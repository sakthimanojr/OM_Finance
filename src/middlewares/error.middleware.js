const env = require('../config/env');
const ApiError = require('../utils/apiError');
const logger = require('../utils/logger');

// eslint-disable-next-line no-unused-vars
function errorMiddleware(err, req, res, next) {
  let error = err;

  if (!(error instanceof ApiError)) {
    const statusCode = error.statusCode || 500;
    error = new ApiError(statusCode, error.message || 'Internal server error', null, false, err.stack);
  }

  if (!error.isOperational) {
    logger.error(`Unhandled error: ${error.message}`, { stack: error.stack });
  } else {
    logger.warn(`Handled error: ${error.message}`);
  }

  const response = {
    success: false,
    message: error.message,
    ...(error.errors ? { errors: error.errors } : {}),
    ...(env.NODE_ENV === 'development' ? { stack: error.stack } : {}),
  };

  res.status(error.statusCode || 500).json(response);
}

module.exports = errorMiddleware;
