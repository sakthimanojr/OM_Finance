const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const { deleteByPublicId } = require('../../config/cloudinary');

async function listByCustomer(customerId) {
  return prisma.document.findMany({ where: { customerId }, orderBy: { uploadedAt: 'desc' } });
}

async function getById(id) {
  const doc = await prisma.document.findUnique({ where: { id } });
  if (!doc) throw ApiError.notFound('Document not found');
  return doc;
}

async function deleteDocument(id) {
  const doc = await getById(id);
  await prisma.document.delete({ where: { id } });
  try {
    await deleteByPublicId(doc.cloudinaryPublicId);
  } catch (err) {
    // Non-fatal — DB record removed even if Cloudinary cleanup fails
  }
  return doc;
}

module.exports = { listByCustomer, getById, deleteDocument };
