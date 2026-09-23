const { round2 } = require('../../../utils/currencyFormatter');
const dateHelper = require('../../../utils/dateHelper');

/**
 * Monthly loan: interest + agreement fee (extra charge) collected upfront.
 * Customer repays 20% of the loan amount (principal) monthly over 5 months.
 * Example: 10,000 @15% + 100 fee -> disburse 8,400, repay 2,000 x 5 months = 10,000
 *
 * @param {number} principal
 * @param {number} interestRate - percentage, e.g. 15 for 15%
 * @param {number} agreementFee - upfront extra charge
 * @param {number} [termCount=5] - number of monthly installments (default 5 months for 20%/month)
 * @param {Date} startDate
 */
function calculate({ principal, interestRate, agreementFee = 0, termCount = 5, startDate }) {
  const effectiveTerms = termCount || 5;
  const interestAmount = round2((principal * interestRate) / 100);
  const disbursedAmount = round2(principal - interestAmount - agreementFee);
  const totalRepayable = round2(principal);
  const installmentAmount = round2(totalRepayable / effectiveTerms);

  const dueSchedule = [];
  let runningTotal = 0;
  for (let i = 1; i <= effectiveTerms; i++) {
    const dueDate = dateHelper.addMonths(startDate, i);
    const amount = i === effectiveTerms ? round2(totalRepayable - runningTotal) : installmentAmount;
    runningTotal = round2(runningTotal + amount);
    dueSchedule.push({ dueNumber: i, dueDate, amount, status: 'PENDING' });
  }

  const endDate = dueSchedule[dueSchedule.length - 1].dueDate;

  return {
    disbursedAmount,
    installmentAmount,
    totalRepayable,
    interestAmount,
    endDate,
    dueSchedule,
  };
}

module.exports = { calculate };
