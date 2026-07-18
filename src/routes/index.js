const express = require('express');

const authRoutes = require('../modules/auth/auth.routes');
const adminRoutes = require('../modules/admin/admin.routes');
const customerRoutes = require('../modules/customer/customer.routes');
const loanRoutes = require('../modules/loan/loan.routes');
const dueRoutes = require('../modules/due/due.routes');
const paymentRoutes = require('../modules/payment/payment.routes');
const receiptRoutes = require('../modules/receipt/receipt.routes');
const notificationRoutes = require('../modules/notification/notification.routes');
const reportRoutes = require('../modules/report/report.routes');
const documentRoutes = require('../modules/document/document.routes');
const dashboardRoutes = require('../modules/dashboard/dashboard.routes');
const auditRoutes = require('../modules/audit/audit.routes');
const closedLoanRoutes = require('../modules/closedLoan/closedLoan.routes');

const router = express.Router();

router.use('/auth', authRoutes);
router.use('/admin', adminRoutes);
router.use('/customers', customerRoutes);
router.use('/loans', loanRoutes);
router.use('/dues', dueRoutes);
router.use('/payments', paymentRoutes);
router.use('/receipts', receiptRoutes);
router.use('/notifications', notificationRoutes);
router.use('/reports', reportRoutes);
router.use('/documents', documentRoutes);
router.use('/dashboard', dashboardRoutes);
router.use('/audit-logs', auditRoutes);
router.use('/closed-loans', closedLoanRoutes);

module.exports = router;
