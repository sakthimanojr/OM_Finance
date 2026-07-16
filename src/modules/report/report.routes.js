const express = require('express');
const controller = require('./report.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware, roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'));

router.get('/collections', controller.collections);
router.get('/loan-portfolio', controller.loanPortfolio);
router.get('/overdue', controller.overdue);

module.exports = router;
