const { round2 } = require('../../../utils/currencyFormatter');
const dateHelper = require('../../../utils/dateHelper');

/**
 * Monthly loan: interest + agreement fee (extra charge) collected upfront.
 * Customer repays principal monthly over termCount months (default 5 months).
 * Example: 20,000 @15% + 100 fee -> upfront deductions = 3,000 + 100 = 3,100, disburse 16,900,
 *          repay 4,000 x 5 months = 20,000
 * All parameters (principal, interestRate, agreementFee, termCount) are editable.
 *
 * @param {number} principal
 * @param {number} [interestRate=15] - percentage, e.g. 15 for 15%
 * @param {number} [agreementFee=100] - upfront extra charge
 * @param {number} [termCount=5] - number of monthly installments (default 5 months)
 * @param {Date} startDate
 */
function calculate({ principal, interestRate = 15, agreementFee = 100, termCount = 5, startDate }) {
  const effectiveTerms = termCount || 5;
  const effectiveRate = interestRate !== undefined && interestRate !== null ? interestRate : 15;
  const effectiveFee = agreementFee !== undefined && agreementFee !== null ? agreementFee : 100;
  const interestAmount = round2((principal * effectiveRate) / 100);
  const upfrontDeductions = round2(interestAmount + effectiveFee);
  const disbursedAmount = round2(principal - upfrontDeductions);
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
    upfrontDeductions,
    endDate,
    dueSchedule,
  };
}

module.exports = { calculate };
