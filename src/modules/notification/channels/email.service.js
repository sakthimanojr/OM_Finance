const nodemailer = require('nodemailer');
const env = require('../../../config/env');
const logger = require('../../../utils/logger');

let transporter = null;

function getTransporter() {
  if (transporter) return transporter;
  if (!env.SMTP_USER || !env.SMTP_PASS) {
    logger.warn('SMTP credentials not configured — emails will be stubbed (logged only).');
    return null;
  }
  transporter = nodemailer.createTransport({
    host: env.SMTP_HOST,
    port: env.SMTP_PORT,
    secure: env.SMTP_PORT === 465,
    auth: { user: env.SMTP_USER, pass: env.SMTP_PASS },
  });
  return transporter;
}

async function send(to, subject, html) {
  const t = getTransporter();
  if (!t) {
    logger.info(`[EMAIL STUB] To: ${to} | Subject: ${subject}`);
    return { status: 'STUBBED' };
  }
  try {
    await t.sendMail({ from: env.SMTP_FROM, to, subject, html });
    return { status: 'SENT' };
  } catch (err) {
    logger.error(`Email send failed: ${err.message}`);
    return { status: 'FAILED', error: err.message };
  }
}

module.exports = { send };
