const ApiError = require('../utils/apiError');

/**
 * Usage: roleGuard('SUPER_ADMIN'), roleGuard('SUPER_ADMIN', 'VIEW_ADMIN')
 */
function roleGuard(...allowedRoles) {
  return (req, res, next) => {
    if (!req.user) {
      return next(ApiError.unauthorized('Not authenticated'));
    }
    if (!allowedRoles.includes(req.user.role)) {
      return next(ApiError.forbidden('You do not have permission to perform this action'));
    }
    next();
  };
}

module.exports = roleGuard;
