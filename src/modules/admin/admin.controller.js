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

async function setAdminCanEdit(req, res, next) {
  try {
    const admin = await adminService.setAdminCanEdit(req.params.id, req.body.canEdit);
    if (req.audit) await req.audit('SET_ADMIN_CAN_EDIT', 'User', admin.id, { canEdit: req.body.canEdit });
    return ApiResponse.success(res, {
      message: `Edit access ${req.body.canEdit ? 'granted' : 'revoked'} successfully`,
      data: admin,
    });
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

async function importLegacyLoans(req, res, next) {
  try {
    const result = await adminService.importLegacyLoans();
    if (req.audit) await req.audit('IMPORT_LEGACY_LOANS', 'Loan', null, result);
    return ApiResponse.success(res, { message: 'Legacy loans imported successfully', data: result });
  } catch (err) {
    next(err);
  }
}

async function resetAdminPassword(req, res, next) {
  try {
    const result = await adminService.resetAdminPassword(req.params.id, req.body.newPassword);
    if (req.audit) await req.audit('RESET_ADMIN_PASSWORD', 'User', req.params.id, {});
    return ApiResponse.success(res, { message: 'Password reset successfully', data: result });
  } catch (err) {
    next(err);
  }
}

async function toggleAdminRole(req, res, next) {
  try {
    const admin = await adminService.toggleAdminRole(req.params.id, req.user.id);
    if (req.audit) await req.audit('TOGGLE_ADMIN_ROLE', 'User', admin.id, { newRole: admin.role });
    return ApiResponse.success(res, { message: `Role changed to ${admin.role}`, data: admin });
  } catch (err) {
    next(err);
  }
}

module.exports = { createViewAdmin, listAdmins, setAdminActive, setAdminCanEdit, getConfig, updateConfig, importLegacyLoans, resetAdminPassword, toggleAdminRole };
