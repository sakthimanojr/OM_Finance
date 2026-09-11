const router = require('express').Router();
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');
const ctrl = require('./myChit.controller');

// All my-chit routes require customer authentication
router.use(authMiddleware, roleGuard('CUSTOMER'));

router.get('/', ctrl.listMyChits);
router.get('/:chitId', ctrl.getMyChitDetail);
router.get('/:chitId/payments', ctrl.getMyPayments);
router.get('/:chitId/auctions', ctrl.getMyAuctions);
router.get('/:chitId/loans', ctrl.getMyLoans);
router.get('/:chitId/loans/:loanId', ctrl.getMyLoanDetail);
router.get('/:chitId/ledger', ctrl.getMyLedger);

module.exports = router;
