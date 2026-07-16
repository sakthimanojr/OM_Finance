const ApiError = require('../utils/apiError');

/**
 * Usage: validate(schema) where schema = { body?, params?, query? } each a Joi schema
 */
function validate(schema) {
  return (req, res, next) => {
    const toValidate = {};
    if (schema.body) toValidate.body = req.body;
    if (schema.params) toValidate.params = req.params;
    if (schema.query) toValidate.query = req.query;

    const errors = {};
    for (const key of Object.keys(toValidate)) {
      const { error, value } = schema[key].validate(toValidate[key], { abortEarly: false, stripUnknown: true });
      if (error) {
        errors[key] = error.details.map((d) => d.message);
      } else {
        req[key] = value;
      }
    }

    if (Object.keys(errors).length > 0) {
      return next(ApiError.badRequest('Validation failed', errors));
    }
    next();
  };
}

module.exports = validate;
