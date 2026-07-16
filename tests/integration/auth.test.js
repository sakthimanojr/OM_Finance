const request = require('supertest');
const bcrypt = require('bcryptjs');

jest.mock('../../src/config/database', () => require('../mocks/prismaMock'));
const prisma = require('../../src/config/database');
const app = require('../../src/app');

describe('POST /api/v1/auth/login', () => {
  afterEach(() => jest.clearAllMocks());

  test('rejects missing phone/password with a 400 validation error', async () => {
    const res = await request(app).post('/api/v1/auth/login').send({});
    expect(res.status).toBe(400);
    expect(res.body.success).toBe(false);
    expect(res.body.errors.body).toBeDefined();
  });

  test('rejects a non-10-digit phone number', async () => {
    const res = await request(app).post('/api/v1/auth/login').send({ phone: '123', password: 'password123' });
    expect(res.status).toBe(400);
  });

  test('returns 401 for unknown phone number', async () => {
    prisma.user.findUnique.mockResolvedValueOnce(null);
    const res = await request(app)
      .post('/api/v1/auth/login')
      .send({ phone: '9999999999', password: 'wrongpassword' });
    expect(res.status).toBe(401);
    expect(res.body.message).toMatch(/Invalid credentials/);
  });

  test('returns 401 for wrong password', async () => {
    const passwordHash = await bcrypt.hash('correct-password', 10);
    prisma.user.findUnique.mockResolvedValueOnce({
      id: 'user-1',
      role: 'SUPER_ADMIN',
      phone: '9999999999',
      email: 'admin@example.com',
      passwordHash,
      isActive: true,
    });
    const res = await request(app)
      .post('/api/v1/auth/login')
      .send({ phone: '9999999999', password: 'wrong-password' });
    expect(res.status).toBe(401);
  });

  test('returns access + refresh tokens on correct credentials', async () => {
    const passwordHash = await bcrypt.hash('correct-password', 10);
    prisma.user.findUnique.mockResolvedValueOnce({
      id: 'user-1',
      role: 'SUPER_ADMIN',
      phone: '9999999999',
      email: 'admin@example.com',
      passwordHash,
      isActive: true,
    });
    const res = await request(app)
      .post('/api/v1/auth/login')
      .send({ phone: '9999999999', password: 'correct-password' });
    expect(res.status).toBe(200);
    expect(res.body.data.accessToken).toBeDefined();
    expect(res.body.data.refreshToken).toBeDefined();
    expect(res.body.data.user.role).toBe('SUPER_ADMIN');
  });

  test('rejects login for a deactivated account', async () => {
    const passwordHash = await bcrypt.hash('correct-password', 10);
    prisma.user.findUnique.mockResolvedValueOnce({
      id: 'user-1',
      role: 'VIEW_ADMIN',
      phone: '8888888888',
      passwordHash,
      isActive: false,
    });
    const res = await request(app)
      .post('/api/v1/auth/login')
      .send({ phone: '8888888888', password: 'correct-password' });
    expect(res.status).toBe(401);
  });
});
