const { v4: uuidv4 } = require('uuid');

function generateReceiptNumber() {
  const now = new Date();
  const y = now.getFullYear();
  const m = String(now.getMonth() + 1).padStart(2, '0');
  const rand = Math.floor(100000 + Math.random() * 900000);
  return `RCPT-${y}${m}-${rand}`;
}

function generateCustomerCode() {
  const rand = Math.floor(1000 + Math.random() * 9000);
  return `CUST-${rand}`;
}

function generateUuid() {
  return uuidv4();
}

module.exports = { generateReceiptNumber, generateCustomerCode, generateUuid };
