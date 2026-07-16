const express = require('express');
const controller = require('./due.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware);

router.get('/', controller.listDues);
router.get('/upcoming', roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'), controller.getUpcoming);
router.get('/overdue', roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'), controller.getOverdue);
router.get('/:id', controller.getDue);

module.exports = router;
