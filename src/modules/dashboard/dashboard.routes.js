const express = require('express');
const controller = require('./dashboard.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware);

router.get('/admin-summary', roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'), controller.adminSummary);
// Customer's own summary; also allows admin to pass a specific customer id
router.get('/customer-summary/:id?', controller.customerSummary);

module.exports = router;
