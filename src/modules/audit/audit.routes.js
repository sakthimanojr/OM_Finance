const express = require('express');
const controller = require('./audit.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware, roleGuard('SUPER_ADMIN'));

router.get('/', controller.listAuditLogs);

module.exports = router;
