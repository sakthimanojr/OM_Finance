const chitFundService = require('./chitFund.service');
const chitAuctionService = require('./chitAuction.service');
const chitLoanService = require('./chitLoan.service');
const chitPaymentService = require('./chitPayment.service');
const chitReportService = require('./chitReport.service');
const ApiResponse = require('../../utils/apiResponse');

// ─── Chit Fund CRUD ───────────────────────────────────────────────────────────

async function createChitFund(req, res, next) {
  try {
    const chit = await chitFundService.createChitFund(req.body, req.user.id);
    if (req.audit) await req.audit('CREATE_CHIT_FUND', 'ChitFund', chit.id, { name: chit.name });
    return ApiResponse.success(res, { statusCode: 201, message: 'Chit fund created', data: chit });
  } catch (err) { next(err); }
}

async function listChitFunds(req, res, next) {
  try {
    const result = await chitFundService.listChitFunds(req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit, totalPages: result.totalPages },
    });
  } catch (err) { next(err); }
}

async function getChitFund(req, res, next) {
  try {
    const chit = await chitFundService.getChitFundById(req.params.id);
    return ApiResponse.success(res, { data: chit });
  } catch (err) { next(err); }
}

async function updateChitFund(req, res, next) {
  try {
    const chit = await chitFundService.updateChitFund(req.params.id, req.body);
    if (req.audit) await req.audit('UPDATE_CHIT_FUND', 'ChitFund', chit.id, req.body);
    return ApiResponse.success(res, { message: 'Chit fund updated', data: chit });
  } catch (err) { next(err); }
}

// ─── Members ──────────────────────────────────────────────────────────────────

async function addMember(req, res, next) {
  try {
    const member = await chitFundService.addMember(req.params.id, req.body.customerId, req.user.id);
    if (req.audit) await req.audit('ADD_CHIT_MEMBER', 'ChitFund', req.params.id, { customerId: req.body.customerId });
    return ApiResponse.success(res, { statusCode: 201, message: 'Member added to chit fund', data: member });
  } catch (err) { next(err); }
}

async function removeMember(req, res, next) {
  try {
    await chitFundService.removeMember(req.params.id, req.params.memberId);
    if (req.audit) await req.audit('REMOVE_CHIT_MEMBER', 'ChitFund', req.params.id, { memberId: req.params.memberId });
    return ApiResponse.success(res, { message: 'Member removed from chit fund' });
  } catch (err) { next(err); }
}

async function listMembers(req, res, next) {
  try {
    const members = await chitFundService.listMembers(req.params.id);
    return ApiResponse.success(res, { data: members });
  } catch (err) { next(err); }
}

// ─── Months ───────────────────────────────────────────────────────────────────

async function createMonth(req, res, next) {
  try {
    const month = await chitFundService.createMonth(req.params.id, req.body);
    if (req.audit) await req.audit('CREATE_CHIT_MONTH', 'ChitFund', req.params.id, { monthNumber: month.monthNumber });
    return ApiResponse.success(res, { statusCode: 201, message: 'Month opened', data: month });
  } catch (err) { next(err); }
}

async function listMonths(req, res, next) {
  try {
    const months = await chitFundService.listMonths(req.params.id);
    return ApiResponse.success(res, { data: months });
  } catch (err) { next(err); }
}

async function closeMonth(req, res, next) {
  try {
    const month = await chitFundService.closeMonth(req.params.id, req.params.monthId, req.user.id);
    if (req.audit) await req.audit('CLOSE_CHIT_MONTH', 'ChitFund', req.params.id, { monthId: req.params.monthId });
    return ApiResponse.success(res, { message: 'Month closed', data: month });
  } catch (err) { next(err); }
}

async function getMonthSummary(req, res, next) {
  try {
    const summary = await chitFundService.getMonthSummary(req.params.id, req.params.monthId);
    return ApiResponse.success(res, { data: summary });
  } catch (err) { next(err); }
}

// ─── Auctions ─────────────────────────────────────────────────────────────────

async function createAuctions(req, res, next) {
  try {
    const auctions = await chitAuctionService.createAuctions(req.params.id, req.body, req.user.id);
    if (req.audit) {
      await req.audit('CREATE_CHIT_AUCTIONS', 'ChitFund', req.params.id, {
        count: auctions.length,
        monthId: req.body.monthId,
      });
    }
    return ApiResponse.success(res, { statusCode: 201, message: `${auctions.length} auction(s) created`, data: auctions });
  } catch (err) { next(err); }
}

async function listAuctions(req, res, next) {
  try {
    const result = await chitAuctionService.listAuctions(req.params.id, req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit },
    });
  } catch (err) { next(err); }
}

async function getAuction(req, res, next) {
  try {
    const auction = await chitAuctionService.getAuctionById(req.params.auctionId);
    return ApiResponse.success(res, { data: auction });
  } catch (err) { next(err); }
}

async function markPayoutPaid(req, res, next) {
  try {
    const payout = await chitAuctionService.markPayoutPaid(req.params.auctionId, req.body.paymentReference);
    if (req.audit) await req.audit('SETTLE_CHIT_PAYOUT', 'ChitAuction', req.params.auctionId, {});
    return ApiResponse.success(res, { message: 'Payout marked as paid', data: payout });
  } catch (err) { next(err); }
}

// ─── Member Payments ──────────────────────────────────────────────────────────

async function recordPayment(req, res, next) {
  try {
    const payment = await chitPaymentService.recordPayment(req.params.id, req.body, req.user.id);
    if (req.audit) await req.audit('RECORD_CHIT_PAYMENT', 'ChitFund', req.params.id, req.body);
    return ApiResponse.success(res, { statusCode: 201, message: 'Payment recorded', data: payment });
  } catch (err) { next(err); }
}

async function listPayments(req, res, next) {
  try {
    const result = await chitPaymentService.listPayments(req.params.id, req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit },
    });
  } catch (err) { next(err); }
}

async function getMonthPaymentStatus(req, res, next) {
  try {
    const status = await chitPaymentService.getMonthPaymentStatus(req.params.id, req.query.monthId);
    return ApiResponse.success(res, { data: status });
  } catch (err) { next(err); }
}

// ─── Loans ─────────────────────────────────────────────────────────────────────

async function createLoan(req, res, next) {
  try {
    const loan = await chitLoanService.createLoan(req.params.id, req.body, req.user.id);
    if (req.audit) await req.audit('CREATE_CHIT_LOAN', 'ChitFund', req.params.id, { memberId: req.body.memberId, amount: req.body.principalAmount });
    return ApiResponse.success(res, { statusCode: 201, message: 'Loan created', data: loan });
  } catch (err) { next(err); }
}

async function listLoans(req, res, next) {
  try {
    const result = await chitLoanService.listLoans(req.params.id, req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit },
    });
  } catch (err) { next(err); }
}

async function getLoan(req, res, next) {
  try {
    const loan = await chitLoanService.getLoanById(req.params.loanId);
    return ApiResponse.success(res, { data: loan });
  } catch (err) { next(err); }
}

async function repayLoan(req, res, next) {
  try {
    const loan = await chitLoanService.repayLoan(req.params.loanId, req.body, req.user.id);
    if (req.audit) await req.audit('REPAY_CHIT_LOAN', 'ChitLoan', req.params.loanId, req.body);
    return ApiResponse.success(res, { message: 'Repayment recorded', data: loan });
  } catch (err) { next(err); }
}

// ─── Fund ─────────────────────────────────────────────────────────────────────

async function getFundSummary(req, res, next) {
  try {
    const summary = await chitFundService.getFundSummary(req.params.id);
    return ApiResponse.success(res, { data: summary });
  } catch (err) { next(err); }
}

async function getLedger(req, res, next) {
  try {
    const result = await chitAuctionService.getLedger(req.params.id, req.query);
    return ApiResponse.success(res, {
      data: result.items,
      meta: { total: result.total, page: result.page, limit: result.limit },
    });
  } catch (err) { next(err); }
}

// ─── Reports ──────────────────────────────────────────────────────────────────

async function getSummaryReport(req, res, next) {
  try {
    const report = await chitReportService.getChitSummaryReport(req.params.id);
    return ApiResponse.success(res, { data: report });
  } catch (err) { next(err); }
}

async function getMonthlyReport(req, res, next) {
  try {
    const report = await chitReportService.getMonthlyReport(req.params.id);
    return ApiResponse.success(res, { data: report });
  } catch (err) { next(err); }
}

async function getAuctionReport(req, res, next) {
  try {
    const report = await chitReportService.getAuctionReport(req.params.id);
    return ApiResponse.success(res, { data: report });
  } catch (err) { next(err); }
}

async function getLoanReport(req, res, next) {
  try {
    const report = await chitReportService.getLoanReport(req.params.id);
    return ApiResponse.success(res, { data: report });
  } catch (err) { next(err); }
}

async function getMemberReport(req, res, next) {
  try {
    const report = await chitReportService.getMemberReport(req.params.id);
    return ApiResponse.success(res, { data: report });
  } catch (err) { next(err); }
}

module.exports = {
  createChitFund, listChitFunds, getChitFund, updateChitFund,
  addMember, removeMember, listMembers,
  createMonth, listMonths, closeMonth, getMonthSummary,
  createAuctions, listAuctions, getAuction, markPayoutPaid,
  recordPayment, listPayments, getMonthPaymentStatus,
  createLoan, listLoans, getLoan, repayLoan,
  getFundSummary, getLedger,
  getSummaryReport, getMonthlyReport, getAuctionReport, getLoanReport, getMemberReport,
};
