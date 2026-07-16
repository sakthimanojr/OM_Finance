const { round2 } = require('../../../utils/currencyFormatter');
const dateHelper = require('../../../utils/dateHelper');

/**
 * High-value loan: full principal disbursed. Interest accrues monthly on the
 * outstanding principal (e.g. 3%/month). Principal can be repaid anytime;
 * a monthly interest-only due is generated until principal is fully closed.
 *
 * This calculator produces the INITIAL schedule at disbursement time.
 * Subsequent recalculation after partial principal repayment is handled by
 * loan.service.recalculateHighValueSchedule(), which regenerates future
 * interest dues based on the new outstanding principal from the repayment
 * date forward (no pro-rating mid-cycle — interest is charged per full
 * month on whatever principal is outstanding at the start of that month).
 *
 * @param {number} principal
 * @param {number} interestRate - monthly percentage, e.g. 3 for 3%/month
 * @param {Date} startDate
 * @param {number} projectedMonths - how many months of interest-only dues to pre-generate (default 12)
 */
function calculate({ principal, interestRate, startDate, projectedMonths = 12 }) {
  const disbursedAmount = round2(principal);
  const monthlyInterest = round2((principal * interestRate) / 100);

  const dueSchedule = [];
  for (let i = 1; i <= projectedMonths; i++) {
    const dueDate = dateHelper.addMonths(startDate, i);
    dueSchedule.push({ dueNumber: i, dueDate, amount: monthlyInterest, status: 'PENDING' });
  }

  return {
    disbursedAmount,
    installmentAmount: monthlyInterest,
    monthlyInterest,
    outstandingPrincipal: principal,
    dueSchedule,
  };
}

/**
 * Recalculates monthly interest due amount when outstanding principal changes
 * (e.g. after a partial principal repayment).
 */
function recalculateInterest({ outstandingPrincipal, interestRate }) {
  return round2((outstandingPrincipal * interestRate) / 100);
}

module.exports = { calculate, recalculateInterest };
