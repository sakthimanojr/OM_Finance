const paymentService = require('./payment.service');
const razorpay = require('./razorpay.adapter');
const ApiResponse = require('../../utils/apiResponse');
const ApiError = require('../../utils/apiError');
const logger = require('../../utils/logger');
const prisma = require('../../config/database');

async function initiate(req, res, next) {
  try {
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      const due = await prisma.due.findUnique({ where: { id: req.body.dueId }, include: { loan: true } });
      if (!own || !due || due.loan.customerId !== own.id) {
        throw ApiError.forbidden('You can only pay your own dues');
      }
    }
    const result = await paymentService.initiatePayment(req.body);
    return ApiResponse.success(res, { statusCode: 201, message: 'Payment initiated', data: result });
  } catch (err) {
    next(err);
  }
}

async function confirm(req, res, next) {
  try {
    const { paymentId, upiRefNumber } = req.body;
    const result = await paymentService.confirmPayment(paymentId, upiRefNumber, req.user?.id);
    if (req.audit) await req.audit('CONFIRM_PAYMENT', 'Payment', paymentId, { upiRefNumber });
    return ApiResponse.success(res, { message: 'Payment confirmed', data: result });
  } catch (err) {
    next(err);
  }
}

async function listPayments(req, res, next) {
  try {
    const query = { ...req.query };
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      if (!own) throw ApiError.notFound('Customer profile not found');
      query.customerId = own.id;
    }
    const result = await paymentService.listPayments(query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) {
    next(err);
  }
}

async function getPayment(req, res, next) {
  try {
    const payment = await paymentService.getPaymentById(req.params.id);
    if (req.user.role === 'CUSTOMER') {
      const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
      if (!own || payment.customerId !== own.id) throw ApiError.forbidden('Access denied');
    }
    return ApiResponse.success(res, { data: payment });
  } catch (err) {
    next(err);
  }
}

/**
 * Handles Razorpay's `payment.captured` webhook. The route this is mounted
 * on (see payment.routes.js + app.js) uses express.raw() so `req.body` here
 * is a Buffer — required for HMAC signature verification against the exact
 * bytes Razorpay sent, before we trust anything in the payload.
 */
async function razorpayWebhook(req, res, next) {
  try {
    const signature = req.headers['x-razorpay-signature'];
    const isValid = razorpay.verifyWebhookSignature(req.body, signature);
    if (!isValid) {
      logger.warn('Rejected Razorpay webhook: invalid signature');
      return res.status(400).json({ success: false, message: 'Invalid webhook signature' });
    }

    const payload = JSON.parse(req.body.toString('utf8'));
    const event = payload.event;

    if (event === 'payment.captured' || event === 'order.paid') {
      const paymentEntity = payload.payload?.payment?.entity;
      const orderId = paymentEntity?.order_id;
      const razorpayPaymentId = paymentEntity?.id;

      if (orderId) {
        await paymentService.confirmPaymentByOrderId(orderId, { razorpayPaymentId });
        logger.info(`Payment confirmed via Razorpay webhook for order ${orderId}`);
      }
    }

    // Always 200 quickly so Razorpay doesn't retry unnecessarily for events we ignore.
    return res.status(200).json({ received: true });
  } catch (err) {
    // Log but still return 200-ish handling upstream; don't leak internals to the webhook caller.
    logger.error(`Razorpay webhook processing failed: ${err.message}`);
    next(err);
  }
}

module.exports = { initiate, confirm, listPayments, getPayment, razorpayWebhook };
