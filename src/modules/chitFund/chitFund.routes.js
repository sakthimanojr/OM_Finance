const router = require('express').Router();
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');
const validate = require('../../middlewares/validate.middleware');
const auditLogger = require('../../middlewares/auditLogger.middleware');
const ctrl = require('./chitFund.controller');
const v = require('./chitFund.validation');

// All admin routes require authentication and admin role
router.use(authMiddleware, roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'), auditLogger);

// ─── Chit Funds ───────────────────────────────────────────────────────────────
router.post('/', roleGuard('SUPER_ADMIN'), validate(v.createChitFund), ctrl.createChitFund);
router.get('/', ctrl.listChitFunds);
router.get('/:id', validate(v.chitIdParam), ctrl.getChitFund);
router.put('/:id', roleGuard('SUPER_ADMIN'), validate(v.updateChitFund), ctrl.updateChitFund);

// ─── Members ──────────────────────────────────────────────────────────────────
router.get('/:id/members', validate(v.chitIdParam), ctrl.listMembers);
router.post('/:id/members', roleGuard('SUPER_ADMIN'), validate(v.addMember), ctrl.addMember);
router.delete('/:id/members/:memberId', roleGuard('SUPER_ADMIN'), validate(v.removeMember), ctrl.removeMember);

// ─── Months ───────────────────────────────────────────────────────────────────
router.get('/:id/months', validate(v.chitIdParam), ctrl.listMonths);
router.post('/:id/months', roleGuard('SUPER_ADMIN'), validate(v.createMonth), ctrl.createMonth);
router.get('/:id/months/:monthId/summary', validate(v.monthIdParam), ctrl.getMonthSummary);
router.post('/:id/months/:monthId/close', roleGuard('SUPER_ADMIN'), validate(v.closeMonth), ctrl.closeMonth);

// ─── Auctions ─────────────────────────────────────────────────────────────────
router.get('/:id/auctions', validate(v.chitIdParam), ctrl.listAuctions);
router.post('/:id/auctions', roleGuard('SUPER_ADMIN'), validate(v.createAuctions), ctrl.createAuctions);
router.get('/auctions/:auctionId', validate(v.auctionIdParam), ctrl.getAuction);
router.post('/auctions/:auctionId/payout-paid', roleGuard('SUPER_ADMIN'), validate(v.auctionIdParam), ctrl.markPayoutPaid);

// ─── Member Payments ──────────────────────────────────────────────────────────
router.get('/:id/payments', validate(v.listPayments), ctrl.listPayments);
router.get('/:id/payment-status', validate(v.chitIdParam), ctrl.getMonthPaymentStatus);
router.post('/:id/payments', roleGuard('SUPER_ADMIN'), validate(v.recordPayment), ctrl.recordPayment);

// ─── Loans ─────────────────────────────────────────────────────────────────────
router.get('/:id/loans', validate(v.chitIdParam), ctrl.listLoans);
router.post('/:id/loans', roleGuard('SUPER_ADMIN'), validate(v.createLoan), ctrl.createLoan);
router.get('/loans/:loanId', validate(v.loanIdParam), ctrl.getLoan);
router.post('/loans/:loanId/repay', roleGuard('SUPER_ADMIN'), validate(v.repayLoan), ctrl.repayLoan);

// ─── Fund & Ledger ────────────────────────────────────────────────────────────
router.get('/:id/fund', validate(v.chitIdParam), ctrl.getFundSummary);
router.get('/:id/fund/ledger', validate(v.chitIdParam), ctrl.getLedger);

// ─── Reports ──────────────────────────────────────────────────────────────────
router.get('/:id/reports/summary', validate(v.chitIdParam), ctrl.getSummaryReport);
router.get('/:id/reports/monthly', validate(v.chitIdParam), ctrl.getMonthlyReport);
router.get('/:id/reports/auctions', validate(v.chitIdParam), ctrl.getAuctionReport);
router.get('/:id/reports/loans', validate(v.chitIdParam), ctrl.getLoanReport);
router.get('/:id/reports/members', validate(v.chitIdParam), ctrl.getMemberReport);

module.exports = router;
