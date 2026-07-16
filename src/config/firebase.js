const fs = require('fs');
const env = require('./env');
const logger = require('../utils/logger');

let admin = null;
let initialized = false;

function getFirebaseAdmin() {
  if (initialized) return admin;
  initialized = true;

  try {
    if (!env.FIREBASE_SERVICE_ACCOUNT_PATH || !fs.existsSync(env.FIREBASE_SERVICE_ACCOUNT_PATH)) {
      logger.warn('Firebase service account not found — FCM push notifications disabled (stub mode).');
      return null;
    }
    // eslint-disable-next-line global-require, import/no-dynamic-require
    const firebaseAdmin = require('firebase-admin');
    const serviceAccount = require(require('path').resolve(env.FIREBASE_SERVICE_ACCOUNT_PATH));
    firebaseAdmin.initializeApp({
      credential: firebaseAdmin.credential.cert(serviceAccount),
    });
    admin = firebaseAdmin;
    logger.info('Firebase Admin SDK initialized.');
    return admin;
  } catch (err) {
    logger.error(`Failed to initialize Firebase Admin SDK: ${err.message}`);
    return null;
  }
}

module.exports = { getFirebaseAdmin };
