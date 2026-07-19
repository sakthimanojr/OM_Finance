const request = require('supertest');
const jwt = require('jsonwebtoken');

jest.mock('../../src/config/database', () => require('../mocks/prismaMock'));
const prisma = require('../../src/config/database');
const app = require('../../src/app');
const env = require('../../src/config/env');

function adminToken() {
  return jwt.sign({ sub: 'admin-1', role: 'SUPER_ADMIN' }, env.JWT_ACCESS_SECRET, { expiresIn: '15m' });
}

beforeEach(() => {
  prisma.user.findUnique.mockResolvedValue({
    id: 'admin-1',
    role: 'SUPER_ADMIN',
    phone: '9999999999',
    isActive: true,
  });
});

afterEach(() => jest.clearAllMocks());

describe('POST /api/v1/loans — weekly loan creation', () => {
  test('creates the loan and its due schedule via the real calculator, then returns the created loan', async () => {
    prisma.customer.findUnique.mockResolvedValueOnce({ id: '11111111-1111-1111-1111-111111111111', status: 'ACTIVE' });
    prisma.loan.findUnique.mockResolvedValueOnce(null); // Uniqueness check
    prisma.loan.create.mockResolvedValueOnce({ id: '22222222-2222-2222-2222-222222222222' });
    prisma.due.createMany.mockResolvedValueOnce({ count: 10 });
    prisma.loan.findUnique.mockResolvedValueOnce({
      id: '22222222-2222-2222-2222-222222222222',
      customerId: '11111111-1111-1111-1111-111111111111',
      loanNumber: 'LN-1001',
      type: 'WEEKLY',
      principal: 10000,
      interestRate: 10,
      disbursedAmount: 9000,
      totalCollection: 0,
      startDate: new Date('2026-01-01'),
      endDate: new Date('2026-03-12'),
      status: 'ACTIVE',
      termCount: 10,
      installmentAmount: 1000,
      customer: { id: '11111111-1111-1111-1111-111111111111', name: 'Test Customer', phone: '9000000000' },
      dues: [],
    });

    const res = await request(app)
      .post('/api/v1/loans')
      .set('Authorization', `Bearer ${adminToken()}`)
      .send({
        customerId: '11111111-1111-1111-1111-111111111111',
        loanNumber: 'LN-1001',
        type: 'WEEKLY',
        principal: 10000,
        interestRate: 10,
        termCount: 10,
        startDate: '2026-01-01',
      });

    expect(res.status).toBe(201);
    expect(res.body.data.disbursedAmount).toBe(9000);

    // Verify the calculator's math actually reached the DB layer correctly:
    // 10 weekly dues of 1,000 each should have been created in one batch call.
    expect(prisma.due.createMany).toHaveBeenCalledTimes(1);
    const dueRows = prisma.due.createMany.mock.calls[0][0].data;
    expect(dueRows).toHaveLength(10);
    expect(dueRows[0].amount).toBe(1000);
    const total = dueRows.reduce((sum, d) => sum + d.amount, 0);
    expect(Math.round(total * 100) / 100).toBe(10000);
  });

  test('rejects loan creation for a non-existent customer', async () => {
    prisma.customer.findUnique.mockResolvedValueOnce(null);

    const res = await request(app)
      .post('/api/v1/loans')
      .set('Authorization', `Bearer ${adminToken()}`)
      .send({
        customerId: '99999999-9999-9999-9999-999999999999',
        loanNumber: 'LN-1002',
        type: 'WEEKLY',
        principal: 10000,
        interestRate: 10,
        termCount: 10,
        startDate: '2026-01-01',
      });

    expect(res.status).toBe(404);
  });

  test('rejects a malformed loan payload (missing termCount for a WEEKLY loan)', async () => {
    const res = await request(app)
      .post('/api/v1/loans')
      .set('Authorization', `Bearer ${adminToken()}`)
      .send({
        customerId: '11111111-1111-1111-1111-111111111111',
        loanNumber: 'LN-1003',
        type: 'WEEKLY',
        principal: 10000,
        interestRate: 10,
        startDate: '2026-01-01',
      });

    expect(res.status).toBe(400);
  });
});
