const adminService = require('./admin.service');
const ApiResponse = require('../../utils/apiResponse');

async function createViewAdmin(req, res, next) {
  try {
    const admin = await adminService.createViewAdmin(req.body);
    if (req.audit) await req.audit('CREATE_VIEW_ADMIN', 'User', admin.id, { phone: admin.phone });
    return ApiResponse.success(res, { statusCode: 201, message: 'View admin created', data: admin });
  } catch (err) {
    next(err);
  }
}

async function listAdmins(req, res, next) {
  try {
    const admins = await adminService.listAdmins();
    return ApiResponse.success(res, { data: admins });
  } catch (err) {
    next(err);
  }
}

async function setAdminActive(req, res, next) {
  try {
    const admin = await adminService.setAdminActive(req.params.id, req.body.isActive);
    if (req.audit) await req.audit('SET_ADMIN_ACTIVE', 'User', admin.id, { isActive: req.body.isActive });
    return ApiResponse.success(res, { message: 'Admin status updated', data: admin });
  } catch (err) {
    next(err);
  }
}

async function getConfig(req, res, next) {
  try {
    const config = await adminService.getConfig();
    return ApiResponse.success(res, { data: config });
  } catch (err) {
    next(err);
  }
}

async function updateConfig(req, res, next) {
  try {
    const config = await adminService.updateConfig(req.body, req.user.id);
    if (req.audit) await req.audit('UPDATE_ADMIN_CONFIG', 'AdminConfig', config.id);
    return ApiResponse.success(res, { message: 'Config updated', data: config });
  } catch (err) {
    next(err);
  }
}

module.exports = { createViewAdmin, listAdmins, setAdminActive, getConfig, updateConfig };
