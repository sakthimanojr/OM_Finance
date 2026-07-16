const { formatINR } = require('../../../utils/currencyFormatter');

function overdueTemplate({ customerName, amount, overdueDays }) {
  const message = `Hi ${customerName}, your payment of ${formatINR(
    amount
  )} is overdue by ${overdueDays} day(s). Please pay immediately to avoid further action.`;
  const html = `<p>Hi ${customerName},</p><p>Your payment of <strong>${formatINR(
    amount
  )}</strong> is <strong>overdue by ${overdueDays} day(s)</strong>. Please pay immediately to avoid further action.</p>`;

  return { message, html, subject: 'Payment Overdue Notice' };
}

module.exports = overdueTemplate;
