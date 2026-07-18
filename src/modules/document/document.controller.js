const documentService = require('./document.service');
const ApiResponse = require('../../utils/apiResponse');

async function listByCustomer(req, res, next) {
  try {
    const docs = await documentService.listByCustomer(req.params.customerId);
    return ApiResponse.success(res, { data: docs });
  } catch (err) {
    next(err);
  }
}

async function download(req, res, next) {
  try {
    const doc = await documentService.getById(req.params.id);
    return res.redirect(doc.fileUrl);
  } catch (err) {
    next(err);
  }
}

async function deleteDocument(req, res, next) {
  try {
    const doc = await documentService.deleteDocument(req.params.id);
    if (req.audit) await req.audit('DELETE_DOCUMENT', 'Document', doc.id, { type: doc.type });
    return ApiResponse.success(res, { message: 'Document deleted' });
  } catch (err) {
    next(err);
  }
}

module.exports = { listByCustomer, download, deleteDocument };
