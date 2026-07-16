const swaggerJsdoc = require('swagger-jsdoc');
const env = require('./env');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Finance Company Management API',
      version: '1.0.0',
      description:
        'REST API for loan disbursal, due tracking, UPI collection, notifications, reporting, and audit logging.',
    },
    servers: [
      {
        url: `${env.BASE_URL || `http://localhost:${env.PORT}`}${env.API_PREFIX}`,
        description: env.BASE_URL ? 'Production' : 'Local development',
      },
    ],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
        },
      },
    },
    security: [{ bearerAuth: [] }],
  },
  apis: ['./src/modules/**/*.routes.js'],
};

const swaggerSpec = swaggerJsdoc(options);

module.exports = swaggerSpec;
