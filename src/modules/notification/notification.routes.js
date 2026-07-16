const express = require('express');
const Joi = require('joi');
const controller = require('./notification.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');
const validate = require('../../middlewares/validate.middleware');

const router = express.Router();
router.use(authMiddleware);

router.get('/customer/:id', controller.listForCustomer);

router.post(
  '/send-manual',
  roleGuard('SUPER_ADMIN'),
  validate({
    body: Joi.object({
      customerId: Joi.string().uuid().required(),
      message: Joi.string().min(1).max(500).required(),
      channel: Joi.string().valid('SMS', 'EMAIL', 'PUSH').default('PUSH'),
    }),
  }),
  controller.sendManual
);

module.exports = router;
