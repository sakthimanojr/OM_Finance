const request = require('supertest');
const jwt = require('jsonwebtoken');

jest.mock('../../src/config/database', () => require('../mocks/prismaMock'));
const prisma = require('../../src/config/database');
const app = require('../../src/app');
const env = require('../../src/config/env');

function signToken(userId) {
  return jwt.sign({ sub: userId, role: 'SUPER_ADMIN' }, env.JWT_ACCESS_SECRET, { expiresIn: '15m' });
}

describe('Auth guard + RBAC on protected routes', () => {
  afterEach(() => jest.clearAllMocks());

  test('rejects a request with no Authorization header', async () => {
    const res = await request(app).get('/api/v1/customers');
    expect(res.status).toBe(401);
    expect(res.body.message).toMatch(/Missing or invalid Authorization header/);
  });

  test('rejects a request with a malformed token', async () => {
    const res = await request(app).get('/api/v1/customers').set('Authorization', 'Bearer not-a-real-token');
    expect(res.status).toBe(401);
    expect(res.body.message).toMatch(/Invalid or expired token/);
  });

  test('rejects a valid token whose user no longer exists / is inactive', async () => {
    prisma.user.findUnique.mockResolvedValueOnce(null);
    const token = signToken('deleted-user-id');
    const res = await request(app).get('/api/v1/customers').set('Authorization', `Bearer ${token}`);
    expect(res.status).toBe(401);
  });

  test('SUPER_ADMIN can access an admin-only route (list customers)', async () => {
    prisma.user.findUnique.mockResolvedValueOnce({
      id: 'admin-1',
      role: 'SUPER_ADMIN',
      phone: '9999999999',
      email: 'admin@example.com',
      isActive: true,
    });
    prisma.customer.findMany.mockResolvedValueOnce([]);
    prisma.customer.count.mockResolvedValueOnce(0);

    const token = signToken('admin-1');
    const res = await request(app).get('/api/v1/customers').set('Authorization', `Bearer ${token}`);
    expect(res.status).toBe(200);
    expect(res.body.data).toEqual([]);
  });

  test('a CUSTOMER-role token is forbidden from an admin-only route', async () => {
    prisma.user.findUnique.mockResolvedValueOnce({
      id: 'customer-1',
      role: 'CUSTOMER',
      phone: '7777777777',
      isActive: true,
    });
    const token = jwt.sign({ sub: 'customer-1', role: 'CUSTOMER' }, env.JWT_ACCESS_SECRET, { expiresIn: '15m' });
    const res = await request(app).get('/api/v1/customers').set('Authorization', `Bearer ${token}`);
    expect(res.status).toBe(403);
    expect(res.body.message).toMatch(/permission/);
  });

  test('audit-logs route is SUPER_ADMIN only — VIEW_ADMIN is forbidden', async () => {
    prisma.user.findUnique.mockResolvedValueOnce({
      id: 'view-admin-1',
      role: 'VIEW_ADMIN',
      phone: '6666666666',
      isActive: true,
    });
    const token = jwt.sign({ sub: 'view-admin-1', role: 'VIEW_ADMIN' }, env.JWT_ACCESS_SECRET, { expiresIn: '15m' });
    const res = await request(app).get('/api/v1/audit-logs').set('Authorization', `Bearer ${token}`);
    expect(res.status).toBe(403);
  });
});
