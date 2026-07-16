const crypto = require('crypto');
const env = require('../config/env');

const ALGORITHM = 'aes-256-cbc';

function getKey() {
  return crypto.createHash('sha256').update(String(env.ENCRYPTION_KEY)).digest();
}

function encrypt(text) {
  if (!text) return null;
  const iv = crypto.randomBytes(16);
  const cipher = crypto.createCipheriv(ALGORITHM, getKey(), iv);
  const encrypted = Buffer.concat([cipher.update(String(text), 'utf8'), cipher.final()]);
  return `${iv.toString('hex')}:${encrypted.toString('hex')}`;
}

function decrypt(payload) {
  if (!payload) return null;
  const [ivHex, dataHex] = payload.split(':');
  const iv = Buffer.from(ivHex, 'hex');
  const decipher = crypto.createDecipheriv(ALGORITHM, getKey(), iv);
  const decrypted = Buffer.concat([decipher.update(Buffer.from(dataHex, 'hex')), decipher.final()]);
  return decrypted.toString('utf8');
}

function maskAadhaar(aadhaar) {
  if (!aadhaar || aadhaar.length < 4) return null;
  return aadhaar.slice(-4);
}

module.exports = { encrypt, decrypt, maskAadhaar };
