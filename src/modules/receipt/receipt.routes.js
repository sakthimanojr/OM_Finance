const express = require('express');
const controller = require('./receipt.controller');
const authMiddleware = require('../../middlewares/auth.middleware');

const router = express.Router();
router.use(authMiddleware);

router.get('/payment/:paymentId', controller.getByPayment);
router.get('/:id/download', controller.download);

module.exports = router;
