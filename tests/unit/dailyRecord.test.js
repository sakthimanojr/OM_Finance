const { round2 } = require('../../src/utils/currencyFormatter');

describe('Daily Record Calculations', () => {
  test('Closing in-hand balance formula calculation', () => {
    // 1. Initial opening balance
    const openingBalance = 50000;
    // 2. Today's bill income
    const billIncome = 12000;
    // 3. Other incomes (2 fields)
    const otherIncome1 = 500;
    const otherIncome2 = 300;
    // 4. Day-to-day expenses
    const expenses = 1800;
    // 5. Loan given:
    // Full loan principal = 20,000 (expense / given to customer)
    // Upfront interest + fee = 2,000 (income to finance)
    const loanPrincipalGiven = 20000;
    const loanUpfrontIncome = 2000;

    // Formula:
    // Opening + Bill Income + Loan Upfront Income + Other Incomes - Full Loans Given - Expenses
    const closingInHand = round2(
      openingBalance +
        billIncome +
        loanUpfrontIncome +
        otherIncome1 +
        otherIncome2 -
        loanPrincipalGiven -
        expenses
    );

    // 50,000 + 12,000 + 2,000 + 500 + 300 - 20,000 - 1,800
    // = 64,800 - 21,800 = 43,000
    expect(closingInHand).toBe(43000);

    // Notice that: loanUpfrontIncome - loanPrincipalGiven = -(20,000 - 2,000) = -18,000 (net cash disbursed)
    const netDisbursed = loanPrincipalGiven - loanUpfrontIncome;
    const alternativeCashCheck = round2(
      openingBalance + billIncome + otherIncome1 + otherIncome2 - netDisbursed - expenses
    );
    expect(alternativeCashCheck).toBe(43000);
  });
});
