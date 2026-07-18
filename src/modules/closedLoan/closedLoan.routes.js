const express = require('express');
const controller = require('./closedLoan.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();

// All closed-loan routes are admin-only (Super Admin + View Admin)
router.use(authMiddleware);
router.use(roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'));

router.get('/', controller.listClosedLoans);
router.get('/:id', controller.getClosedLoan);

module.exports = router;
