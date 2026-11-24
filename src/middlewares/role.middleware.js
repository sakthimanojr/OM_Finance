const ApiError = require('../utils/apiError');

/**
 * Usage: roleGuard('SUPER_ADMIN'), roleGuard('SUPER_ADMIN', 'VIEW_ADMIN')
 * If a route requires SUPER_ADMIN, a VIEW_ADMIN with canEdit === true is also allowed.
 */
function roleGuard(...allowedRoles) {
  return (req, res, next) => {
    if (!req.user) {
      return next(ApiError.unauthorized('Not authenticated'));
    }
    const hasExplicitRole = allowedRoles.includes(req.user.role);
    const hasEditAccess = allowedRoles.includes('SUPER_ADMIN') && req.user.role === 'VIEW_ADMIN' && req.user.canEdit === true;

    if (!hasExplicitRole && !hasEditAccess) {
      return next(ApiError.forbidden('You do not have permission to perform this action'));
    }
    next();
  };
}

module.exports = roleGuard;
