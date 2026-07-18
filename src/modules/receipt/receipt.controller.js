const receiptService = require('./receipt.service');
const ApiResponse = require('../../utils/apiResponse');
const ApiError = require('../../utils/apiError');
const prisma = require('../../config/database');

async function _assertOwnsReceiptIfCustomer(req, payment) {
  if (req.user.role !== 'CUSTOMER') return;
  const own = await prisma.customer.findUnique({ where: { userId: req.user.id } });
  if (!own || payment.customerId !== own.id) throw ApiError.forbidden('Access denied');
}

async function getByPayment(req, res, next) {
  try {
    const receipt = await receiptService.getReceiptByPaymentId(req.params.paymentId);
    const payment = await prisma.payment.findUnique({ where: { id: receipt.paymentId } });
    await _assertOwnsReceiptIfCustomer(req, payment);
    return ApiResponse.success(res, { data: receipt });
  } catch (err) {
    next(err);
  }
}

async function download(req, res, next) {
  try {
    const receipt = await receiptService.getReceiptById(req.params.id);
    await _assertOwnsReceiptIfCustomer(req, receipt.payment);
    if (!receipt.pdfUrl) throw ApiError.notFound('Receipt PDF not available');
    return res.redirect(receipt.pdfUrl);
  } catch (err) {
    next(err);
  }
}

module.exports = { getByPayment, download };
