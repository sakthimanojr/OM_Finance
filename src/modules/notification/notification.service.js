const prisma = require('../../config/database');
const fcm = require('./channels/fcm.service');
const email = require('./channels/email.service');
const sms = require('./channels/sms.service');
const dueReminderTemplate = require('./templates/dueReminder.template');
const overdueTemplate = require('./templates/overdue.template');
const paymentSuccessTemplate = require('./templates/paymentSuccess.template');
const ApiError = require('../../utils/apiError');

async function recordNotification({ customerId, channel, type, message, status }) {
  return prisma.notification.create({
    data: { customerId, channel, type, message, status, sentAt: status === 'SENT' ? new Date() : null },
  });
}

async function sendDueReminder(customer, due) {
  const dueDateObj = new Date(due.dueDate);
  const daysUntilDue = Math.ceil((dueDateObj - new Date()) / (1000 * 60 * 60 * 24));
  const { message, html, subject } = dueReminderTemplate({
    customerName: customer.name,
    amount: due.amount,
    dueDate: due.dueDate,
    daysUntilDue,
  });

  if (customer.email) {
    const result = await email.send(customer.email, subject, html);
    await recordNotification({
      customerId: customer.id,
      channel: 'EMAIL',
      type: 'DUE_REMINDER',
      message,
      status: result.status === 'SENT' || result.status === 'STUBBED' ? 'SENT' : 'FAILED',
    });
  }
  const smsResult = await sms.send(customer.phone, message);
  await recordNotification({
    customerId: customer.id,
    channel: 'SMS',
    type: 'DUE_REMINDER',
    message,
    status: smsResult.status === 'SENT' || smsResult.status === 'STUBBED' ? 'SENT' : 'FAILED',
  });
}

async function sendOverdueNotice(customer, due, overdueDays) {
  const { message, html, subject } = overdueTemplate({ customerName: customer.name, amount: due.amount, overdueDays });
  if (customer.email) {
    const result = await email.send(customer.email, subject, html);
    await recordNotification({
      customerId: customer.id,
      channel: 'EMAIL',
      type: 'OVERDUE',
      message,
      status: result.status === 'SENT' || result.status === 'STUBBED' ? 'SENT' : 'FAILED',
    });
  }
}

async function sendPaymentSuccess(customer, payment, receiptNumber) {
  const { message, html, subject } = paymentSuccessTemplate({
    customerName: customer.name,
    amount: payment.amount,
    receiptNumber,
  });
  if (customer.email) {
    await email.send(customer.email, subject, html);
  }
  const smsResult = await sms.send(customer.phone, message);
  await recordNotification({
    customerId: customer.id,
    channel: 'SMS',
    type: 'PAYMENT_SUCCESS',
    message,
    status: smsResult.status === 'SENT' || smsResult.status === 'STUBBED' ? 'SENT' : 'FAILED',
  });
}

async function sendManual(customerId, message, channel = 'PUSH') {
  const customer = await prisma.customer.findUnique({ where: { id: customerId } });
  if (!customer) throw ApiError.notFound('Customer not found');

  let result = { status: 'STUBBED' };
  if (channel === 'EMAIL' && customer.email) {
    result = await email.send(customer.email, 'Notification', `<p>${message}</p>`);
  } else if (channel === 'SMS') {
    result = await sms.send(customer.phone, message);
  } else if (channel === 'PUSH') {
    result = await fcm.send(null, 'Notification', message);
  }

  return recordNotification({
    customerId,
    channel,
    type: 'MANUAL',
    message,
    status: result.status === 'SENT' || result.status === 'STUBBED' ? 'SENT' : 'FAILED',
  });
}

async function listForCustomer(customerId) {
  return prisma.notification.findMany({
    where: { customerId },
    orderBy: { createdAt: 'desc' },
  });
}

module.exports = {
  sendDueReminder,
  sendOverdueNotice,
  sendPaymentSuccess,
  sendManual,
  listForCustomer,
};
