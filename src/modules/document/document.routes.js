const express = require('express');
const controller = require('./document.controller');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware);

router.get('/customer/:customerId', controller.listByCustomer);
router.get('/:id/download', controller.download);
router.delete('/:id', roleGuard('SUPER_ADMIN'), controller.deleteDocument);

module.exports = router;
