const { round2 } = require('../../../utils/currencyFormatter');
const dateHelper = require('../../../utils/dateHelper');

/**
 * Weekly loan: interest deducted upfront; principal divided evenly across term.
 * Example: 10,000 @10% -> disburse 9,000, repay 1,000 x 10 weeks = 11,000
 *
 * @param {number} principal
 * @param {number} interestRate - percentage, e.g. 10 for 10%
 * @param {number} termCount - number of weekly installments
 * @param {Date} startDate
 */
function calculate({ principal, interestRate, termCount, startDate }) {
  const interestAmount = round2((principal * interestRate) / 100);
  const disbursedAmount = round2(principal - interestAmount);
  const totalRepayable = round2(principal + interestAmount);
  const installmentAmount = round2(totalRepayable / termCount);

  const dueSchedule = [];
  let runningTotal = 0;
  for (let i = 1; i <= termCount; i++) {
    const dueDate = dateHelper.addWeeks(startDate, i);
    // Adjust last installment for rounding drift
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
