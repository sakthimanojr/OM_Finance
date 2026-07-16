const request = require('supertest');

// The database module is mocked across all integration tests in this folder
// (see tests/mocks/prismaMock.js) since a live Postgres + `prisma generate`
// aren't available in every CI/sandbox environment. Requiring src/app.js
// pulls in every route module, and several instantiate a PrismaClient at
// import time — so this mock is needed even for routes (like /health) that
// don't touch the database themselves.
jest.mock('../../src/config/database', () => require('../mocks/prismaMock'));

const app = require('../../src/app');

describe('App bootstrap', () => {
  test('GET /health returns 200 with ok status', async () => {
    const res = await request(app).get('/health');
    expect(res.status).toBe(200);
    expect(res.body.status).toBe('ok');
    expect(res.body.timestamp).toBeDefined();
  });

  test('GET /api-docs serves Swagger UI', async () => {
    const res = await request(app).get('/api-docs/');
    expect([200, 301, 302]).toContain(res.status);
  });

  test('unknown route returns a structured 404', async () => {
    const res = await request(app).get('/api/v1/this-route-does-not-exist');
    expect(res.status).toBe(404);
    expect(res.body.success).toBe(false);
    expect(res.body.message).toMatch(/Route not found/);
  });
});
