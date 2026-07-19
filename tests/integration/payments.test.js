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

describe('POST /api/v1/payments/confirm', () => {
  test('allows manual confirmation of CASH payments', async () => {
    const paymentId = '11111111-1111-1111-1111-111111111111';
    prisma.payment.findUnique.mockResolvedValue({
      id: paymentId,
      dueId: '22222222-2222-2222-2222-222222222222',
      loanId: '33333333-3333-3333-3333-333333333333',
      customerId: '44444444-4444-4444-4444-444444444444',
      amount: 1000,
      method: 'CASH',
      status: 'INITIATED',
      due: { dueNumber: 1 },
      customer: { id: '44444444-4444-4444-4444-444444444444', name: 'Test Customer', phone: '9999999999' },
    });

    prisma.payment.update.mockResolvedValueOnce({
      id: paymentId,
      status: 'SUCCESS',
      amount: 1000,
      method: 'CASH',
    });

    prisma.due.update.mockResolvedValueOnce({ id: '22222222-2222-2222-2222-222222222222' });
    prisma.loan.update.mockResolvedValueOnce({ id: '33333333-3333-3333-3333-333333333333' });
    prisma.due.count.mockResolvedValueOnce(5); // remaining pending dues > 0

    // mock receipt creation
    prisma.receipt.findUnique.mockResolvedValueOnce(null);
    prisma.receipt.create.mockResolvedValueOnce({ receiptNumber: 'REC-123' });

    const res = await request(app)
      .post('/api/v1/payments/confirm')
      .set('Authorization', `Bearer ${adminToken()}`)
      .send({ paymentId, upiRefNumber: 'UPI-123' });

    expect(res.status).toBe(200);
    expect(res.body.message).toBe('Payment confirmed');
  });

  test('blocks manual confirmation of UPI payments', async () => {
    const paymentId = '11111111-1111-1111-1111-111111111111';
    prisma.payment.findUnique.mockResolvedValue({
      id: paymentId,
      dueId: '22222222-2222-2222-2222-222222222222',
      loanId: '33333333-3333-3333-3333-333333333333',
      customerId: '44444444-4444-4444-4444-444444444444',
      amount: 1000,
      method: 'UPI',
      status: 'INITIATED',
      customer: { id: '44444444-4444-4444-4444-444444444444', name: 'Test Customer' },
    });

    const res = await request(app)
      .post('/api/v1/payments/confirm')
      .set('Authorization', `Bearer ${adminToken()}`)
      .send({ paymentId, upiRefNumber: 'UPI-123' });

    expect(res.status).toBe(400);
    expect(res.body.message).toContain('UPI payments cannot be manually confirmed');
  });

  test('automatically creates ClosedLoan record when a loan is fully paid', async () => {
    const paymentId = '11111111-1111-1111-1111-111111111111';
    prisma.payment.findUnique.mockResolvedValue({
      id: paymentId,
      dueId: '22222222-2222-2222-2222-222222222222',
      loanId: '33333333-3333-3333-3333-333333333333',
      customerId: '44444444-4444-4444-4444-444444444444',
      amount: 1000,
      method: 'CASH',
      status: 'INITIATED',
      due: { dueNumber: 1 },
      customer: { id: '44444444-4444-4444-4444-444444444444', name: 'Test Customer', phone: '9999999999' },
    });

    prisma.payment.update.mockResolvedValueOnce({
      id: paymentId,
      status: 'SUCCESS',
      amount: 1000,
      method: 'CASH',
    });

    prisma.due.update.mockResolvedValueOnce({ id: '22222222-2222-2222-2222-222222222222' });
    prisma.loan.update.mockResolvedValueOnce({ id: '33333333-3333-3333-3333-333333333333' });
    prisma.due.count.mockResolvedValueOnce(0); // 0 remaining pending dues!

    // Mock receipt creation
    prisma.receipt.findUnique.mockResolvedValueOnce(null);
    prisma.receipt.create.mockResolvedValueOnce({ receiptNumber: 'REC-123' });

    // Mock customer lookup in notificationService.sendManual
    prisma.customer.findUnique.mockResolvedValueOnce({
      id: '44444444-4444-4444-4444-444444444444',
      name: 'Test Customer',
      phone: '9999999999',
      status: 'ACTIVE',
    });

    // Mock loan lookup in closedLoanService.createSnapshot
    prisma.loan.findUnique.mockResolvedValueOnce({
      id: '33333333-3333-3333-3333-333333333333',
      customerId: '44444444-4444-4444-4444-444444444444',
      type: 'WEEKLY',
      loanNumber: 'LN-123',
      principal: 10000,
      interestRate: 10,
      disbursedAmount: 9000,
      totalCollection: 10000,
      startDate: new Date(),
      endDate: new Date(),
      customer: { id: '44444444-4444-4444-4444-444444444444', name: 'Test Customer', phone: '9999999999' },
      dues: [],
      payments: [],
    });

    prisma.closedLoan.findUnique.mockResolvedValueOnce(null);
    prisma.closedLoan.create.mockResolvedValueOnce({ id: 'closed-123' });

    const res = await request(app)
      .post('/api/v1/payments/confirm')
      .set('Authorization', `Bearer ${adminToken()}`)
      .send({ paymentId, upiRefNumber: 'UPI-123' });

    expect(res.status).toBe(200);
    // ClosedLoan should have been created
    expect(prisma.closedLoan.create).toHaveBeenCalledTimes(1);
  });
});
