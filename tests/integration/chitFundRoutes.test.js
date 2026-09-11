const request = require('supertest');
const jwt = require('jsonwebtoken');

jest.mock('../../src/config/database', () => require('../mocks/prismaMock'));
const prisma = require('../../src/config/database');
const app = require('../../src/app');
const env = require('../../src/config/env');

// Valid mock UUIDs
const adminUserId = '11111111-1111-1111-1111-111111111111';
const customerUserId = '22222222-2222-2222-2222-222222222222';
const chitId = '33333333-3333-3333-3333-333333333333';
const customerId = '44444444-4444-4444-4444-444444444444';
const memberId = '55555555-5555-5555-5555-555555555555';
const loanId = '66666666-6666-6666-6666-666666666666';

function adminToken() {
  return jwt.sign({ sub: adminUserId, role: 'SUPER_ADMIN' }, env.JWT_ACCESS_SECRET, { expiresIn: '15m' });
}

function customerToken() {
  return jwt.sign({ sub: customerUserId, role: 'CUSTOMER' }, env.JWT_ACCESS_SECRET, { expiresIn: '15m' });
}

beforeEach(() => {
  // Mock standard auth lookup
  prisma.user.findUnique.mockResolvedValue({
    id: adminUserId,
    role: 'SUPER_ADMIN',
    phone: '9999999999',
    isActive: true,
  });
});

afterEach(() => jest.clearAllMocks());

describe('Chit Fund API Endpoints', () => {
  describe('POST /api/v1/chit-funds (Create)', () => {
    test('successfully creates a chit fund', async () => {
      prisma.chitFund.create.mockResolvedValueOnce({
        id: chitId,
        name: 'Gold Monthly Chit',
        memberCount: 30,
        monthlyContribution: 6000,
        regularAuctionAmount: 180000,
        status: 'DRAFT',
      });

      const res = await request(app)
        .post('/api/v1/chit-funds')
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({
          name: 'Gold Monthly Chit',
          memberCount: 30,
          monthlyContribution: 6000,
          startingBid: 1000,
          interestRate: 3,
          startDate: '2026-08-01',
          paymentDueDay: 1,
        });

      expect(res.status).toBe(201);
      expect(res.body.data.id).toBe(chitId);
      expect(res.body.data.regularAuctionAmount).toBe(180000);
    });

    test('rejects creation from customer role', async () => {
      // Mock user role guard lookup for customer
      prisma.user.findUnique.mockResolvedValueOnce({
        id: customerUserId,
        role: 'CUSTOMER',
        phone: '8888888888',
        isActive: true,
      });

      const res = await request(app)
        .post('/api/v1/chit-funds')
        .set('Authorization', `Bearer ${customerToken()}`)
        .send({
          name: 'Gold Monthly Chit',
          memberCount: 30,
          monthlyContribution: 6000,
          startingBid: 1000,
          startDate: '2026-08-01',
        });

      expect(res.status).toBe(403);
    });
  });

  describe('POST /api/v1/chit-funds/:id/members (Add Member)', () => {
    test('adds customer to chit fund if active and count not exceeded', async () => {
      prisma.chitFund.findUnique.mockResolvedValueOnce({
        id: chitId,
        memberCount: 30,
        monthlyContribution: 6000,
        status: 'ACTIVE',
      });
      prisma.customer.findUnique.mockResolvedValueOnce({
        id: customerId,
        userId: customerUserId,
        status: 'ACTIVE',
      });
      prisma.chitMember.count.mockResolvedValueOnce(5); // 5 members enrolled so far
      prisma.chitMember.findUnique.mockResolvedValueOnce(null); // Not already a member
      prisma.chitMember.count.mockResolvedValueOnce(1); // member of 1 chit already
      prisma.chitMember.create.mockResolvedValueOnce({
        id: memberId,
        customerId: customerId,
        status: 'ACTIVE',
      });

      const res = await request(app)
        .post(`/api/v1/chit-funds/${chitId}/members`)
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({ customerId });

      expect(res.status).toBe(201);
      expect(res.body.data.id).toBe(memberId);
    });

    test('rejects when member count is exceeded', async () => {
      prisma.chitFund.findUnique.mockResolvedValueOnce({
        id: chitId,
        memberCount: 30,
        monthlyContribution: 6000,
        status: 'ACTIVE',
      });
      prisma.customer.findUnique.mockResolvedValueOnce({
        id: customerId,
        userId: customerUserId,
        status: 'ACTIVE',
      });
      prisma.chitMember.count.mockResolvedValueOnce(30); // already full

      const res = await request(app)
        .post(`/api/v1/chit-funds/${chitId}/members`)
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({ customerId });

      expect(res.status).toBe(400);
      expect(res.body.message).toContain('Chit fund is full');
    });
  });

  describe('POST /api/v1/chit-funds/:id/loans (Create Loan)', () => {
    test('creates loan from accumulated balance', async () => {
      prisma.chitFund.findUnique.mockResolvedValueOnce({
        id: chitId,
        interestRate: 3,
        status: 'ACTIVE',
      });
      prisma.chitMember.findFirst.mockResolvedValueOnce({
        id: memberId,
        status: 'ACTIVE',
        customer: { name: 'Alice' },
      });

      // Mock ledger list for getAvailableBalance (credit ₹60,000)
      prisma.chitFundLedger.findMany.mockResolvedValue([
        { amount: 60000, direction: 'CREDIT' },
      ]);

      prisma.chitLoan.create.mockResolvedValueOnce({
        id: loanId,
        principalAmount: 40000,
        interestAmount: 1200,
        totalRepayment: 41200,
      });

      prisma.chitLoan.findUnique.mockResolvedValueOnce({
        id: loanId,
        principalAmount: 40000,
        interestAmount: 1200,
        totalRepayment: 41200,
        member: { customer: { name: 'Alice' } },
        transactions: [],
        chit: { name: 'Chit Name' },
      });

      const res = await request(app)
        .post(`/api/v1/chit-funds/${chitId}/loans`)
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({
          memberId,
          principalAmount: 40000,
          loanDate: '2026-08-01',
          dueDate: '2026-09-01',
        });

      expect(res.status).toBe(201);
      expect(res.body.data.totalRepayment).toBe(41200);
    });

    test('rejects loan if amount exceeds available fund balance', async () => {
      prisma.chitFund.findUnique.mockResolvedValueOnce({
        id: chitId,
        interestRate: 3,
        status: 'ACTIVE',
      });
      prisma.chitMember.findFirst.mockResolvedValueOnce({
        id: memberId,
        status: 'ACTIVE',
        customer: { name: 'Alice' },
      });

      // Available balance is only ₹10,000
      prisma.chitFundLedger.findMany.mockResolvedValue([
        { amount: 10000, direction: 'CREDIT' },
      ]);

      const res = await request(app)
        .post(`/api/v1/chit-funds/${chitId}/loans`)
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({
          memberId,
          principalAmount: 40000,
          loanDate: '2026-08-01',
          dueDate: '2026-09-01',
        });

      expect(res.status).toBe(400);
      expect(res.body.message).toContain('Insufficient fund');
    });
  });

  describe('POST /api/v1/chit-funds/:id/auctions (Duplicate Winner Rejection)', () => {
    test('rejects auction when winner has already won', async () => {
      const monthId = '77777777-7777-7777-7777-777777777777';

      prisma.chitFund.findUnique.mockResolvedValueOnce({
        id: chitId,
        memberCount: 30,
        monthlyContribution: 6000,
        regularAuctionAmount: 180000,
        startingBid: 1000,
        interestRate: 3,
        status: 'ACTIVE',
      });

      prisma.chitMonth.findFirst.mockResolvedValueOnce({
        id: monthId,
        chitId,
        status: 'OPEN',
      });

      // Mock getAvailableBalance
      prisma.chitFundLedger.findMany.mockResolvedValueOnce([]);

      // Mock $transaction to actually run the callback
      prisma.$transaction.mockImplementationOnce(async (cb) => {
        // Mock inside transaction
        prisma.chitAuction.findUnique.mockResolvedValueOnce(null); // auction number doesn't exist yet

        // Winner already won (auctionEligible = false)
        prisma.chitMember.findFirst.mockResolvedValueOnce({
          id: memberId,
          chitId,
          status: 'ACTIVE',
          auctionEligible: false, // Already won
          hasWonAuction: true,
          customer: { name: 'Alice', phone: '9999999999', email: null, id: customerId },
        });

        return cb(prisma);
      });

      const res = await request(app)
        .post(`/api/v1/chit-funds/${chitId}/auctions`)
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({
          monthId,
          auctions: [{
            auctionNumber: 5,
            auctionType: 'REGULAR',
            auctionDate: '2026-08-15',
            winnerId: memberId,
            winningBid: 10000,
          }],
        });

      expect(res.status).toBe(400);
      expect(res.body.message).toContain('not eligible');
    });
  });

  describe('POST /api/v1/chit-funds/loans/:loanId/repay (Loan Repayment)', () => {
    test('rejects repayment exceeding remaining balance', async () => {
      prisma.chitLoan.findUnique.mockResolvedValueOnce({
        id: loanId,
        chitId,
        memberId,
        principalAmount: 30000,
        interestAmount: 900,
        totalRepayment: 30900,
        amountPaid: 25000,
        remainingAmount: 5900,
        status: 'PARTIALLY_PAID',
        member: { customer: { name: 'Alice', id: customerId } },
        chit: { id: chitId },
      });

      const res = await request(app)
        .post(`/api/v1/chit-funds/loans/${loanId}/repay`)
        .set('Authorization', `Bearer ${adminToken()}`)
        .send({
          principalAmount: 5000,
          interestAmount: 2000,
        });

      expect(res.status).toBe(400);
      expect(res.body.message).toContain('exceeds remaining');
    });
  });

  describe('GET /api/v1/my/chits/:chitId/ledger (Customer Ledger)', () => {
    test('returns ledger entries visible to customer', async () => {
      prisma.user.findUnique.mockResolvedValueOnce({
        id: customerUserId,
        role: 'CUSTOMER',
        phone: '8888888888',
        isActive: true,
      });

      prisma.customer.findUnique.mockResolvedValueOnce({ id: customerId });

      prisma.chitMember.findFirst.mockResolvedValueOnce({
        id: memberId,
        chitId,
        customerId,
      });

      prisma.chitLoan.findMany.mockResolvedValueOnce([
        { id: loanId },
      ]);

      prisma.chitFundLedger.findMany.mockResolvedValueOnce([
        {
          id: '88888888-8888-8888-8888-888888888888',
          transactionType: 'WINNING_BID_CREDIT',
          amount: 4000,
          direction: 'CREDIT',
          balanceAfter: 4000,
          description: 'Auction #1 winning bid',
          createdAt: new Date(),
          auction: { auctionNumber: 1, auctionType: 'REGULAR' },
        },
      ]);

      const res = await request(app)
        .get(`/api/v1/my/chits/${chitId}/ledger`)
        .set('Authorization', `Bearer ${customerToken()}`);

      expect(res.status).toBe(200);
      expect(res.body.data).toHaveLength(1);
      expect(res.body.data[0].transactionType).toBe('WINNING_BID_CREDIT');
    });

    test('denies access for non-member customer', async () => {
      prisma.user.findUnique.mockResolvedValueOnce({
        id: customerUserId,
        role: 'CUSTOMER',
        phone: '8888888888',
        isActive: true,
      });

      prisma.customer.findUnique.mockResolvedValueOnce({ id: customerId });

      // Not a member of this chit
      prisma.chitMember.findFirst.mockResolvedValueOnce(null);

      const res = await request(app)
        .get(`/api/v1/my/chits/${chitId}/ledger`)
        .set('Authorization', `Bearer ${customerToken()}`);

      expect(res.status).toBe(403);
    });
  });
});
