const env = require('../../../config/env');
const logger = require('../../../utils/logger');

/**
 * Generic SMS adapter. Plug in a real provider (Twilio, MSG91, Fast2SMS, etc.)
 * by implementing the HTTP call in the 'else' branch below. In 'none' mode,
 * messages are just logged — useful for local dev without a paid SMS account.
 */
async function send(phone, message) {
  if (!env.SMS_PROVIDER || env.SMS_PROVIDER === 'none') {
    logger.info(`[SMS STUB] To: ${phone} | Message: ${message}`);
    return { status: 'STUBBED' };
  }

  try {
    // Example generic REST call — replace URL/payload shape with your provider's API.
    const res = await fetch(`https://api.${env.SMS_PROVIDER}.com/send`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${env.SMS_API_KEY}`,
      },
      body: JSON.stringify({ to: phone, from: env.SMS_SENDER_ID, message }),
    });
    if (!res.ok) throw new Error(`SMS provider responded with ${res.status}`);
    return { status: 'SENT' };
  } catch (err) {
    logger.error(`SMS send failed: ${err.message}`);
    return { status: 'FAILED', error: err.message };
  }
}

module.exports = { send };
