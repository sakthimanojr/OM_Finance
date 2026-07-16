const { getFirebaseAdmin } = require('../../../config/firebase');
const logger = require('../../../utils/logger');

async function send(deviceToken, title, body, data = {}) {
  const admin = getFirebaseAdmin();
  if (!admin || !deviceToken) {
    logger.info(`[PUSH STUB] To: ${deviceToken || 'unknown'} | ${title}: ${body}`);
    return { status: 'STUBBED' };
  }
  try {
    await admin.messaging().send({
      token: deviceToken,
      notification: { title, body },
      data,
    });
    return { status: 'SENT' };
  } catch (err) {
    logger.error(`FCM send failed: ${err.message}`);
    return { status: 'FAILED', error: err.message };
  }
}

module.exports = { send };
