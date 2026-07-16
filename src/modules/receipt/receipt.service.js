const fs = require('fs');
const path = require('path');
const PDFDocument = require('pdfkit');
const QRCode = require('qrcode');
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { generateReceiptNumber } = require('../../utils/generateId');
const { formatINR } = require('../../utils/currencyFormatter');

const RECEIPTS_DIR = path.join(process.cwd(), 'uploads', 'receipts');
fs.mkdirSync(RECEIPTS_DIR, { recursive: true });

async function generateReceipt(paymentId) {
  const payment = await prisma.payment.findUnique({
    where: { id: paymentId },
    include: { due: true, loan: true, customer: true },
  });
  if (!payment) throw ApiError.notFound('Payment not found');

  const receiptNumber = generateReceiptNumber();
  const qrDataUrl = await QRCode.toDataURL(
    JSON.stringify({ receiptNumber, paymentId, amount: payment.amount })
  );

  const pdfPath = path.join(RECEIPTS_DIR, `${receiptNumber}.pdf`);
  await renderReceiptPdf(pdfPath, { payment, receiptNumber, qrDataUrl });

  const receipt = await prisma.receipt.create({
    data: {
      paymentId,
      receiptNumber,
      qrCodeUrl: qrDataUrl,
      pdfUrl: pdfPath,
    },
  });

  return receipt;
}

function renderReceiptPdf(filePath, { payment, receiptNumber, qrDataUrl }) {
  return new Promise((resolve, reject) => {
    const doc = new PDFDocument({ size: 'A5', margin: 40 });
    const stream = fs.createWriteStream(filePath);
    doc.pipe(stream);

    doc.fontSize(18).text('Payment Receipt', { align: 'center' });
    doc.moveDown();
    doc.fontSize(10).text(`Receipt No: ${receiptNumber}`);
    doc.text(`Date: ${new Date().toLocaleString('en-IN')}`);
    doc.moveDown();

    doc.fontSize(12).text(`Customer: ${payment.customer.name}`);
    doc.text(`Phone: ${payment.customer.phone}`);
    doc.moveDown();

    doc.text(`Loan ID: ${payment.loanId}`);
    doc.text(`Due Number: ${payment.due.dueNumber}`);
    doc.text(`Payment Method: ${payment.method}`);
    if (payment.upiRefNumber) doc.text(`UPI Ref: ${payment.upiRefNumber}`);
    doc.moveDown();

    doc.fontSize(16).text(`Amount Paid: ${formatINR(payment.amount)}`, { underline: true });
    doc.moveDown();

    const qrImage = Buffer.from(qrDataUrl.split(',')[1], 'base64');
    doc.image(qrImage, { fit: [100, 100], align: 'center' });

    doc.moveDown();
    doc.fontSize(9).fillColor('gray').text('This is a system-generated receipt.', { align: 'center' });

    doc.end();
    stream.on('finish', resolve);
    stream.on('error', reject);
  });
}

async function getReceiptByPaymentId(paymentId) {
  const receipt = await prisma.receipt.findUnique({ where: { paymentId } });
  if (!receipt) throw ApiError.notFound('Receipt not found for this payment');
  return receipt;
}

async function getReceiptById(id) {
  const receipt = await prisma.receipt.findUnique({ where: { id }, include: { payment: true } });
  if (!receipt) throw ApiError.notFound('Receipt not found');
  return receipt;
}

module.exports = { generateReceipt, getReceiptByPaymentId, getReceiptById };
