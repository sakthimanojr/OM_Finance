const env = require('./env');
const logger = require('../utils/logger');

let cloudinary = null;
let initialized = false;

/**
 * Lazy-initialize the Cloudinary SDK.  Returns the configured cloudinary
 * instance or null if credentials are missing.
 */
function getCloudinary() {
  if (initialized) return cloudinary;
  initialized = true;

  try {
    if (!env.CLOUDINARY_CLOUD_NAME || !env.CLOUDINARY_API_KEY || !env.CLOUDINARY_API_SECRET) {
      logger.warn('Cloudinary credentials not configured — file uploads will fail.');
      return null;
    }

    // eslint-disable-next-line global-require
    const cloudinaryLib = require('cloudinary').v2;
    cloudinaryLib.config({
      cloud_name: env.CLOUDINARY_CLOUD_NAME,
      api_key: env.CLOUDINARY_API_KEY,
      api_secret: env.CLOUDINARY_API_SECRET,
    });

    cloudinary = cloudinaryLib;
    logger.info('Cloudinary SDK initialized.');
    return cloudinary;
  } catch (err) {
    logger.error(`Failed to initialize Cloudinary SDK: ${err.message}`);
    return null;
  }
}

/**
 * Upload a buffer to Cloudinary.
 *
 * @param {Buffer}  buffer   - The file contents.
 * @param {string}  folder   - Cloudinary folder path (e.g. 'om-finance/documents/aadhaar').
 * @param {string}  filename - Desired public ID / display name (without extension).
 * @returns {Promise<{url: string, publicId: string} | null>}
 */
async function uploadBuffer(buffer, folder, filename) {
  const cld = getCloudinary();
  if (!cld) {
    logger.warn('uploadBuffer called but Cloudinary is not configured — returning null.');
    return null;
  }

  return new Promise((resolve, reject) => {
    const stream = cld.uploader.upload_stream(
      {
        resource_type: 'auto',
        folder,
        public_id: filename,
        overwrite: true,
      },
      (error, result) => {
        if (error) return reject(error);
        resolve({ url: result.secure_url, publicId: result.public_id });
      }
    );
    stream.end(buffer);
  });
}

/**
 * Delete a resource from Cloudinary by its public ID.
 * Fails silently (logs a warning) so database cleanup can still succeed.
 *
 * @param {string} publicId - The Cloudinary public ID to delete.
 */
async function deleteByPublicId(publicId) {
  if (!publicId) return;

  const cld = getCloudinary();
  if (!cld) {
    logger.warn('deleteByPublicId called but Cloudinary is not configured — skipping.');
    return;
  }

  try {
    await cld.uploader.destroy(publicId, { resource_type: 'raw', invalidate: true });
  } catch (err) {
    // Also try image resource type — Cloudinary requires matching resource_type for deletion
    try {
      await cld.uploader.destroy(publicId, { resource_type: 'image', invalidate: true });
    } catch (innerErr) {
      logger.warn(`Failed to delete Cloudinary resource ${publicId}: ${innerErr.message}`);
    }
  }
}

module.exports = { getCloudinary, uploadBuffer, deleteByPublicId };
