const QRCode = require('qrcode');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const env = require('../../config/env');
const receiptService = require('../receipt/receipt.service');
const notificationService = require('../notification/notification.service');
const razorpay = require('./razorpay.adapter');

/**
 * Builds a standard UPI deep-link (upi://pay?...) and a QR code data URL for it.
 * This is the FALLBACK path used only when Razorpay isn't configured (see
 * razorpay.adapter.js + initiatePayment below). It generates a payment
 * REQUEST only — an admin must manually confirm funds received via
 * POST /payments/confirm. When Razorpay IS configured, initiatePayment
 * creates a real order instead, and confirmation happens automatically via
 * the signature-verified webhook in payment.controller.js.
 */
async function buildUpiIntent(amount, note) {
  const params = new URLSearchParams({
    pa: env.UPI_ID,
    pn: env.UPI_PAYEE_NAME,
    am: String(amount),
    cu: 'INR',
    tn: note || 'Loan repayment',
  });
  const upiUrl = `upi://pay?${params.toString()}`;
  const qrCodeDataUrl = await QRCode.toDataURL(upiUrl);
  return { upiUrl, qrCodeDataUrl };
}

async function initiatePayment({ dueId, method, amount }) {
  const due = await prisma.due.findUnique({ where: { id: dueId }, include: { loan: true } });
  if (!due) throw ApiError.notFound('Due not found');
  if (due.status === 'PAID') throw ApiError.badRequest('This due has already been paid');

  let gatewayOrderId = null;
  let razorpayOrder = null;
  let upiPayload = null;

  if (method === 'UPI' && razorpay.isConfigured()) {
    razorpayOrder = await razorpay.createOrder({
      amount,
      receipt: `due_${due.id}`,
      notes: { dueId: due.id, loanId: due.loanId },
    });
    gatewayOrderId = razorpayOrder.id;
  } else if (method === 'UPI') {
    // No PSP configured — fall back to a static UPI-intent QR that the
    // customer pays manually, with an admin confirming receipt afterwards.
    upiPayload = await buildUpiIntent(amount, `Due #${due.dueNumber}`);
  }

  const payment = await prisma.payment.create({
    data: {
      dueId,
      loanId: due.loanId,
      customerId: due.loan.customerId,
      amount,
      method,
      status: 'INITIATED',
      gatewayOrderId,
    },
  });

  return {
    payment,
    upiPayload,
    razorpayOrder: razorpayOrder
      ? {
          orderId: razorpayOrder.id,
          amount: razorpayOrder.amount,
          currency: razorpayOrder.currency,
          keyId: env.RAZORPAY_KEY_ID,
        }
      : null,
  };
}

/**
 * Confirms a payment (manual admin confirmation, or after PSP webhook signature
 * verification in a production integration). Marks the due as PAID, updates
 * loan totals, generates a receipt, and notifies the customer.
 */
async function confirmPayment(paymentId, upiRefNumber, confirmedByAdminId = null) {
  const payment = await prisma.payment.findUnique({
    where: { id: paymentId },
    include: { due: true, loan: true, customer: true },
  });
  if (!payment) throw ApiError.notFound('Payment not found');
  return _confirmPaymentCore(payment, { upiRefNumber });
}

/**
 * Confirms a payment that was paid through Razorpay, looked up by the
 * gateway's order id. Called only after the webhook signature has been
 * verified by the caller (see razorpay.adapter.js + payment.controller.js).
 */
async function confirmPaymentByOrderId(gatewayOrderId, { razorpayPaymentId, gatewaySignature } = {}) {
  const payment = await prisma.payment.findUnique({
    where: { gatewayOrderId },
    include: { due: true, loan: true, customer: true },
  });
  if (!payment) {
    throw ApiError.notFound(`No payment found for Razorpay order ${gatewayOrderId}`);
  }
  return _confirmPaymentCore(payment, { upiRefNumber: razorpayPaymentId, gatewaySignature });
}

async function _confirmPaymentCore(payment, { upiRefNumber, gatewaySignature } = {}) {
  if (payment.status === 'SUCCESS') {
    // Idempotent: webhooks can be delivered more than once.
    return { payment, receipt: await receiptService.getReceiptByPaymentId(payment.id).catch(() => null) };
  }

  const result = await prisma.$transaction(async (tx) => {
    const updatedPayment = await tx.payment.update({
      where: { id: payment.id },
      data: {
        status: 'SUCCESS',
        paidAt: new Date(),
        upiRefNumber: upiRefNumber || null,
        gatewaySignature: gatewaySignature || null,
      },
    });

    await tx.due.update({
      where: { id: payment.dueId },
      data: {
        status: 'PAID',
        paidDate: new Date(),
        paidAmount: payment.amount,
        paymentMethod: payment.method,
      },
    });

    await tx.loan.update({
      where: { id: payment.loanId },
      data: { totalCollection: { increment: payment.amount } },
    });

    const remainingPending = await tx.due.count({
      where: { loanId: payment.loanId, status: { in: ['PENDING', 'MISSED'] } },
    });
    if (remainingPending === 0) {
      await tx.loan.update({ where: { id: payment.loanId }, data: { status: 'COMPLETED' } });
    }

    return updatedPayment;
  });

  const receipt = await receiptService.generateReceipt(result.id);
  await notificationService.sendPaymentSuccess(payment.customer, result, receipt.receiptNumber);

  return { payment: result, receipt };
}

async function listPayments({ customerId, loanId, status, page, limit }) {
  const where = {};
  if (customerId) where.customerId = customerId;
  if (loanId) where.loanId = loanId;
  if (status) where.status = status;

  const [items, total] = await Promise.all([
    prisma.payment.findMany({
      where,
      include: { due: true, receipt: true, customer: { select: { id: true, name: true } } },
      orderBy: { createdAt: 'desc' },
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.payment.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function getPaymentById(id) {
  const payment = await prisma.payment.findUnique({
    where: { id },
    include: { due: true, loan: true, customer: true, receipt: true },
  });
  if (!payment) throw ApiError.notFound('Payment not found');
  return payment;
}

module.exports = {
  buildUpiIntent,
  initiatePayment,
  confirmPayment,
  confirmPaymentByOrderId,
  listPayments,
  getPaymentById,
};
