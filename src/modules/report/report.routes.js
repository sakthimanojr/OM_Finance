const express = require('express');
const controller = require('./report.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware, roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'));

// Excel download routes (existing)
router.get('/collections', controller.collections);
router.get('/loan-portfolio', controller.loanPortfolio);
router.get('/overdue', controller.overdue);

// JSON data routes (new — for interactive Flutter screens)
router.get('/monthly-collections', controller.monthlyCollectionsJson);
router.get('/loan-portfolio-json', controller.loanPortfolioJsonHandler);
router.get('/interest-profit', controller.interestProfitHandler);
router.get('/overdue-detail', controller.overdueDetailHandler);
router.get('/disbursement-summary', controller.disbursementSummaryHandler);

module.exports = router;
