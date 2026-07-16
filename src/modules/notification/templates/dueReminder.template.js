const { formatINR } = require('../../../utils/currencyFormatter');

function dueReminderTemplate({ customerName, amount, dueDate, daysUntilDue }) {
  const dateStr = new Date(dueDate).toLocaleDateString('en-IN');
  let timing;
  if (daysUntilDue === 0) timing = 'is due today';
  else if (daysUntilDue > 0) timing = `is due in ${daysUntilDue} day(s) (${dateStr})`;
  else timing = `was due on ${dateStr}`;

  const message = `Hi ${customerName}, your payment of ${formatINR(amount)} ${timing}. Please pay on time to avoid late charges.`;
  const html = `<p>Hi ${customerName},</p><p>Your payment of <strong>${formatINR(
    amount
  )}</strong> ${timing}. Please pay on time to avoid late charges.</p>`;

  return { message, html, subject: 'Payment Due Reminder' };
}

module.exports = dueReminderTemplate;
