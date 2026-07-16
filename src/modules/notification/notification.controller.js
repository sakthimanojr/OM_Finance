const notificationService = require('./notification.service');
const ApiResponse = require('../../utils/apiResponse');

async function listForCustomer(req, res, next) {
  try {
    const notifications = await notificationService.listForCustomer(req.params.id);
    return ApiResponse.success(res, { data: notifications });
  } catch (err) {
    next(err);
  }
}

async function sendManual(req, res, next) {
  try {
    const { customerId, message, channel } = req.body;
    const result = await notificationService.sendManual(customerId, message, channel);
    if (req.audit) await req.audit('SEND_MANUAL_NOTIFICATION', 'Notification', result.id, { customerId, channel });
    return ApiResponse.success(res, { statusCode: 201, message: 'Notification sent', data: result });
  } catch (err) {
    next(err);
  }
}

module.exports = { listForCustomer, sendManual };
