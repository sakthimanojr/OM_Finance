const request = require('supertest');
const jwt = require('jsonwebtoken');

jest.mock('../../src/config/database', () => require('../mocks/prismaMock'));
const prisma = require('../../src/config/database');
const app = require('../../src/app');
const env = require('../../src/config/env');

jest.mock('../../src/modules/payment/razorpay.adapter', () => ({
  createOrder: jest.fn(),
  verifyWebhookSignature: jest.fn().mockReturnValue(true),
}));

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

  describe('Sequential Bill Numbers', () => {
    let billCounter = 1;
    beforeEach(() => {
      billCounter = 1;
      prisma.receipt.create.mockImplementation(async (args) => ({
        id: 'receipt-id',
        receiptNumber: args.data.receiptNumber,
        billNumber: billCounter++,
      }));
    });

    test('webhook and manual paths should produce sequential bill numbers', async () => {
      const mockPayment1 = { 
        id: 'payment-1', 
        amount: 1000, 
        status: 'PENDING', 
        method: 'UPI',
        dueId: 'due-1',
        loanId: 'loan-1',
        customerId: 'customer-1',
        gatewayOrderId: 'order_1',
        customer: { id: 'customer-1', name: 'Test', phone: '123' },
        loan: { loanNumber: 'LN-123' },
        due: { dueNumber: 1 }
      };
      prisma.payment.findUnique.mockResolvedValue(mockPayment1);
      prisma.payment.update.mockResolvedValue({ ...mockPayment1, status: 'SUCCESS' });
      prisma.due.update.mockResolvedValue({ id: 'due-1' });
      prisma.loan.update.mockResolvedValue({ id: 'loan-1' });
      prisma.due.count.mockResolvedValue(1); // not closed
      prisma.receipt.findUnique.mockResolvedValue(null);

      // Path 1: Webhook (UPI)
      const res1 = await request(app)
        .post('/api/v1/payments/webhook/razorpay')
        .set('x-razorpay-signature', 'valid-signature') // mock bypass
        .send({
          event: 'payment.captured',
          payload: { payment: { entity: { order_id: 'order_1', id: 'pay_1' } } },
        });
      // The webhook returns 200 immediately, but the receipt is created
      expect(res1.status).toBe(200);
      
      // Wait a tick for async processing (since webhook is async)
      await new Promise((resolve) => setTimeout(resolve, 50));
      
      // Path 2: Manual Confirm (Cash)
      const mockPayment2Id = '22222222-2222-2222-2222-222222222222';
      const mockPayment2 = {
        id: mockPayment2Id,
        amount: 1000,
        status: 'PENDING',
        method: 'CASH',
        dueId: 'due-2',
        loanId: 'loan-1',
        customerId: 'customer-1',
        customer: { id: 'customer-1', name: 'Test', phone: '123' },
        loan: { loanNumber: 'LN-123' },
        due: { dueNumber: 2 }
      };
      prisma.payment.findUnique.mockResolvedValue(mockPayment2);
      prisma.payment.update.mockResolvedValue({ ...mockPayment2, status: 'SUCCESS' });
      
      const res2 = await request(app)
        .post('/api/v1/payments/confirm')
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({ paymentId: mockPayment2Id });

      expect(res2.status).toBe(200);
      expect(res2.body.data.receipt.billNumber).toBe(2);

      // Verify that receipts were created twice
      expect(prisma.receipt.create).toHaveBeenCalledTimes(2);
      
      // First receipt should be billNumber 1, Second is 2
      expect(prisma.receipt.create.mock.results[0].value.then(r => expect(r.billNumber).toBe(1)));
      expect(prisma.receipt.create.mock.results[1].value.then(r => expect(r.billNumber).toBe(2)));
    });
  });
});
