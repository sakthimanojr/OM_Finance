const Joi = require('joi');

// ── Chit Fund ────────────────────────────────────────────────────────────────

const createChitFund = {
  body: Joi.object({
    name: Joi.string().max(200).required(),
    description: Joi.string().max(1000).optional().allow('', null),
    memberCount: Joi.number().integer().min(2).max(500).required(),
    monthlyContribution: Joi.number().positive().required(),
    startingBid: Joi.number().positive().required(),
    interestRate: Joi.number().min(0).max(100).default(3),
    loanPeriodRule: Joi.string().max(500).optional().allow('', null),
    startDate: Joi.date().required(),
    paymentDueDay: Joi.number().integer().min(1).max(28).default(1),
  }),
};

const updateChitFund = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    name: Joi.string().max(200).optional(),
    description: Joi.string().max(1000).optional().allow('', null),
    startingBid: Joi.number().positive().optional(),
    loanPeriodRule: Joi.string().max(500).optional().allow('', null),
    paymentDueDay: Joi.number().integer().min(1).max(28).optional(),
    status: Joi.string().valid('DRAFT', 'ACTIVE', 'PAUSED').optional(),
  }),
};

const chitIdParam = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
};

// ── Members ──────────────────────────────────────────────────────────────────

const addMember = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    customerId: Joi.string().uuid().required(),
  }),
};

const removeMember = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
    memberId: Joi.string().uuid().required(),
  }),
};

// ── Months ───────────────────────────────────────────────────────────────────

const createMonth = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    periodStart: Joi.date().required(),
    periodEnd: Joi.date().optional().allow(null),
  }),
};

const closeMonth = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
    monthId: Joi.string().uuid().required(),
  }),
};

const monthIdParam = {
  params: Joi.object({
    id: Joi.string().uuid().required(),
    monthId: Joi.string().uuid().required(),
  }),
};

// ── Auctions ─────────────────────────────────────────────────────────────────

const createAuctions = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    monthId: Joi.string().uuid().required(),
    auctions: Joi.array()
      .items(
        Joi.object({
          auctionNumber: Joi.number().integer().min(1).required(),
          auctionType: Joi.string().valid('REGULAR', 'ADDITIONAL').required(),
          auctionDate: Joi.date().required(),
          winnerId: Joi.string().uuid().required(), // ChitMember.id
          winningBid: Joi.number().min(0).required(),
        })
      )
      .min(1)
      .required(),
  }),
};

const settleAuction = {
  params: Joi.object({ auctionId: Joi.string().uuid().required() }),
  body: Joi.object({
    paymentReference: Joi.string().max(200).optional().allow('', null),
  }),
};

const auctionIdParam = {
  params: Joi.object({ auctionId: Joi.string().uuid().required() }),
};

// ── Member Payments ───────────────────────────────────────────────────────────

const recordPayment = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    memberId: Joi.string().uuid().required(),
    monthId: Joi.string().uuid().required(),
    amountPaid: Joi.number().positive().required(),
    paymentMethod: Joi.string().valid('UPI', 'CASH', 'BANK_TRANSFER', 'MANUAL').required(),
    paymentReference: Joi.string().max(200).optional().allow('', null),
    paidDate: Joi.date().optional().allow(null),
    status: Joi.string()
      .valid('PENDING', 'PARTIAL', 'PAID', 'LATE', 'FAILED', 'WAIVED')
      .optional(),
  }),
};

const listPayments = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  query: Joi.object({
    monthId: Joi.string().uuid().optional(),
    memberId: Joi.string().uuid().optional(),
    status: Joi.string().optional(),
    page: Joi.number().integer().min(1).default(1),
    limit: Joi.number().integer().min(1).max(100).default(50),
  }),
};

// ── Loans ─────────────────────────────────────────────────────────────────────

const createLoan = {
  params: Joi.object({ id: Joi.string().uuid().required() }),
  body: Joi.object({
    memberId: Joi.string().uuid().required(), // ChitMember.id
    principalAmount: Joi.number().positive().required(),
    loanDate: Joi.date().required(),
    dueDate: Joi.date().required(),
  }),
};

const repayLoan = {
  params: Joi.object({ loanId: Joi.string().uuid().required() }),
  body: Joi.object({
    principalAmount: Joi.number().min(0).required(),
    interestAmount: Joi.number().min(0).required(),
    paymentReference: Joi.string().max(200).optional().allow('', null),
    paymentMethod: Joi.string().valid('UPI', 'CASH', 'BANK_TRANSFER', 'MANUAL').optional(),
    transactionDate: Joi.date().optional().allow(null),
  }),
};

const loanIdParam = {
  params: Joi.object({ loanId: Joi.string().uuid().required() }),
};

module.exports = {
  createChitFund,
  updateChitFund,
  chitIdParam,
  addMember,
  removeMember,
  createMonth,
  closeMonth,
  monthIdParam,
  createAuctions,
  settleAuction,
  auctionIdParam,
  recordPayment,
  listPayments,
  createLoan,
  repayLoan,
  loanIdParam,
};
