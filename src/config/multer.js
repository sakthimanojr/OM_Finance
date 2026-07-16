const multer = require('multer');
const path = require('path');
const fs = require('fs');

const destinations = {
  AADHAAR: 'uploads/aadhaar',
  PAN: 'uploads/pan',
  AGREEMENT: 'uploads/agreements',
  OTHER: 'uploads/customers',
};

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const type = (req.body.type || 'OTHER').toUpperCase();
    const dest = destinations[type] || destinations.OTHER;
    fs.mkdirSync(dest, { recursive: true });
    cb(null, dest);
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const unique = `${Date.now()}-${Math.round(Math.random() * 1e9)}`;
    cb(null, `${unique}${ext}`);
  },
});

const ALLOWED_MIME = ['image/jpeg', 'image/png', 'image/webp', 'application/pdf'];

const fileFilter = (req, file, cb) => {
  if (!ALLOWED_MIME.includes(file.mimetype)) {
    return cb(new Error('Unsupported file type. Allowed: jpg, png, webp, pdf'));
  }
  cb(null, true);
};

const upload = multer({
  storage,
  fileFilter,
  limits: { fileSize: 10 * 1024 * 1024 }, // 10MB
});

module.exports = upload;
