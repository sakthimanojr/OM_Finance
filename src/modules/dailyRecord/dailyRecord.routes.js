const express = require('express');
const router = express.Router();
const controller = require('./dailyRecord.controller');
const auth = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

// Protect all daily record routes for admins
router.use(auth);
router.use(roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'));

router.get('/', controller.getRecord);
router.post('/', roleGuard('SUPER_ADMIN'), controller.saveRecord);

module.exports = router;
