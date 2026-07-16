const express = require('express');
const Joi = require('joi');
const controller = require('./customer.controller');
const validate = require('../../middlewares/validate.middleware');
const schemas = require('./customer.validation');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');
const upload = require('../../config/multer');

const router = express.Router();
router.use(authMiddleware);

router.post('/', roleGuard('SUPER_ADMIN'), validate(schemas.createCustomer), controller.createCustomer);
router.get('/', roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'), validate(schemas.listCustomers), controller.listCustomers);
// Must be registered before '/:id' so "me" isn't matched as a customer id.
router.get('/me', controller.getMyProfile);
router.get('/:id', validate(schemas.idParam), controller.getCustomer);
router.patch('/:id', roleGuard('SUPER_ADMIN'), validate(schemas.updateCustomer), controller.updateCustomer);
router.get('/:id/loans', validate(schemas.idParam), controller.getLoanHistory);

router.post(
  '/:id/documents',
  roleGuard('SUPER_ADMIN'),
  validate({
    params: Joi.object({ id: Joi.string().uuid().required() }),
    body: Joi.object({ type: Joi.string().valid('AADHAAR', 'PAN', 'AGREEMENT', 'OTHER').required() }),
  }),
  upload.single('file'),
  controller.uploadDocument
);

module.exports = router;
