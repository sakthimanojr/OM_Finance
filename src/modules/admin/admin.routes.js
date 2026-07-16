const express = require('express');
const Joi = require('joi');
const controller = require('./admin.controller');
const validate = require('../../middlewares/validate.middleware');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware, roleGuard('SUPER_ADMIN'));

router.post(
  '/view-admins',
  validate({
    body: Joi.object({
      phone: Joi.string().pattern(/^[0-9]{10}$/).required(),
      email: Joi.string().email().optional().allow(''),
      password: Joi.string().min(6).required(),
    }),
  }),
  controller.createViewAdmin
);
router.get('/view-admins', controller.listAdmins);
router.patch(
  '/view-admins/:id/status',
  validate({
    params: Joi.object({ id: Joi.string().uuid().required() }),
    body: Joi.object({ isActive: Joi.boolean().required() }),
  }),
  controller.setAdminActive
);

router.get('/config', controller.getConfig);
router.put(
  '/config',
  validate({
    body: Joi.object({
      upiId: Joi.string().max(100).optional(),
      smsProvider: Joi.string().max(50).optional().allow(''),
      smsApiKey: Joi.string().max(200).optional().allow(''),
      smtpConfig: Joi.object().optional(),
    }),
  }),
  controller.updateConfig
);

module.exports = router;
