const { round2 } = require('../../../utils/currencyFormatter');
const dateHelper = require('../../../utils/dateHelper');

/**
 * Monthly EMI loan: interest + agreement fee deducted upfront.
 * Example: 10,000 @15% + 100 fee -> disburse 8,400, repay 2,000 x 5 months = 11,600
 *
 * @param {number} principal
 * @param {number} interestRate - percentage, e.g. 15 for 15%
 * @param {number} agreementFee
 * @param {number} termCount - number of monthly installments
 * @param {Date} startDate
 */
function calculate({ principal, interestRate, agreementFee = 0, termCount, startDate }) {
  const interestAmount = round2((principal * interestRate) / 100);
  const disbursedAmount = round2(principal - interestAmount - agreementFee);
  const totalRepayable = round2(principal + interestAmount);
  const installmentAmount = round2(totalRepayable / termCount);

  const dueSchedule = [];
  let runningTotal = 0;
  for (let i = 1; i <= termCount; i++) {
    const dueDate = dateHelper.addMonths(startDate, i);
    const amount = i === termCount ? round2(totalRepayable - runningTotal) : installmentAmount;
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
