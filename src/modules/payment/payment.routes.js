const express = require('express');
const controller = require('./payment.controller');
const validate = require('../../middlewares/validate.middleware');
const schemas = require('./payment.validation');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();

// NOTE: the Razorpay webhook (POST /payments/webhook/razorpay) is mounted
// directly in app.js, ahead of the global express.json() parser, because
// its signature verification needs the raw request body. It is NOT defined
// here to avoid it being shadowed by router.use(authMiddleware) below.
router.use(authMiddleware);

router.post('/initiate', validate(schemas.initiate), controller.initiate);
// Manual confirmation by an admin after verifying funds received (fallback path — see payment.service.js).
router.post('/confirm', roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'), validate(schemas.confirm), controller.confirm);
router.get('/', validate(schemas.listPayments), controller.listPayments);
router.get('/:id', controller.getPayment);

module.exports = router;
