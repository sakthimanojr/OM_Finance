const { formatINR } = require('../../../utils/currencyFormatter');

function paymentSuccessTemplate({ customerName, amount, receiptNumber }) {
  const message = `Hi ${customerName}, we received your payment of ${formatINR(
    amount
  )}. Receipt No: ${receiptNumber}. Thank you!`;
  const html = `<p>Hi ${customerName},</p><p>We received your payment of <strong>${formatINR(
    amount
  )}</strong>.</p><p>Receipt No: <strong>${receiptNumber}</strong></p><p>Thank you!</p>`;

  return { message, html, subject: 'Payment Received' };
}

module.exports = paymentSuccessTemplate;
