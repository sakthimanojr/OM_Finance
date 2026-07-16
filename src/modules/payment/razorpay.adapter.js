const crypto = require('crypto');
const env = require('../../config/env');
const logger = require('../../utils/logger');

function isConfigured() {
  return Boolean(env.RAZORPAY_KEY_ID && env.RAZORPAY_KEY_SECRET);
}

function authHeader() {
  const token = Buffer.from(`${env.RAZORPAY_KEY_ID}:${env.RAZORPAY_KEY_SECRET}`).toString('base64');
  return `Basic ${token}`;
}

/**
 * Creates a Razorpay Order for the given amount (in rupees). Returns the
 * order id the frontend needs to open Razorpay Checkout. Razorpay expects
 * amounts in the smallest currency unit (paise), so we multiply by 100.
 * Docs: https://razorpay.com/docs/api/orders/
 */
async function createOrder({ amount, receipt, notes = {} }) {
  if (!isConfigured()) {
    throw new Error('Razorpay is not configured (RAZORPAY_KEY_ID / RAZORPAY_KEY_SECRET missing)');
  }

  const response = await fetch('https://api.razorpay.com/v1/orders', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: authHeader(),
    },
    body: JSON.stringify({
      amount: Math.round(Number(amount) * 100),
      currency: 'INR',
      receipt,
      notes,
      // Restricts the checkout to UPI only, matching this app's collection method.
      method: 'upi',
    }),
  });

  if (!response.ok) {
    const errorBody = await response.text();
    logger.error(`Razorpay order creation failed: ${response.status} ${errorBody}`);
    throw new Error('Failed to create Razorpay order');
  }

  return response.json(); // { id, amount, currency, status, ... }
}

/**
 * Verifies the `X-Razorpay-Signature` header on incoming webhooks using
 * HMAC-SHA256 over the raw request body with the webhook secret configured
 * in the Razorpay dashboard. This MUST be checked before trusting any
 * webhook payload — never mark a payment as paid from an unverified webhook.
 */
function verifyWebhookSignature(rawBody, signatureHeader) {
  if (!env.RAZORPAY_WEBHOOK_SECRET) {
    logger.warn('RAZORPAY_WEBHOOK_SECRET not set — cannot verify webhook signature.');
    return false;
  }
  const expected = crypto
    .createHmac('sha256', env.RAZORPAY_WEBHOOK_SECRET)
    .update(rawBody)
    .digest('hex');

  try {
    return crypto.timingSafeEqual(Buffer.from(expected), Buffer.from(signatureHeader || ''));
  } catch (err) {
    // Buffers of different length throw — treat as invalid signature.
    return false;
  }
}

/**
 * Verifies the signature returned by Razorpay Checkout on the client after a
 * successful payment (order_id|payment_id signed with the key secret).
 * Used as a secondary check if you choose to also validate the client
 * callback — the webhook remains the source of truth for marking dues paid.
 */
function verifyCheckoutSignature({ orderId, paymentId, signature }) {
  const expected = crypto
    .createHmac('sha256', env.RAZORPAY_KEY_SECRET)
    .update(`${orderId}|${paymentId}`)
    .digest('hex');
  try {
    return crypto.timingSafeEqual(Buffer.from(expected), Buffer.from(signature || ''));
  } catch (err) {
    return false;
  }
}

module.exports = { isConfigured, createOrder, verifyWebhookSignature, verifyCheckoutSignature };
