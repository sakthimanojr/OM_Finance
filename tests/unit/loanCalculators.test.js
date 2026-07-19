const weeklyCalc = require('../../src/modules/loan/calculators/weeklyLoan.calculator');
const monthlyCalc = require('../../src/modules/loan/calculators/monthlyEmiLoan.calculator');
const highValueCalc = require('../../src/modules/loan/calculators/highValueLoan.calculator');

describe('Loan Calculators', () => {
  test('weekly loan: 10,000 @10% over 10 weeks', () => {
    const result = weeklyCalc.calculate({
      principal: 10000,
      interestRate: 10,
      termCount: 10,
      startDate: new Date('2026-01-01'),
    });
    expect(result.disbursedAmount).toBe(9000);
    expect(result.totalRepayable).toBe(10000);
    expect(result.installmentAmount).toBe(1000);
    expect(result.dueSchedule).toHaveLength(10);
    const totalDues = result.dueSchedule.reduce((s, d) => s + d.amount, 0);
    expect(Math.round(totalDues * 100) / 100).toBe(10000);
  });

  test('weekly loan: 10,000 @10% + 200 fee over 10 weeks', () => {
    const result = weeklyCalc.calculate({
      principal: 10000,
      interestRate: 10,
      agreementFee: 200,
      termCount: 10,
      startDate: new Date('2026-01-01'),
    });
    expect(result.disbursedAmount).toBe(8800); // 10000 - 1000 (interest) - 200 (fee)
    expect(result.totalRepayable).toBe(10000);
    expect(result.installmentAmount).toBe(1000);
    expect(result.dueSchedule).toHaveLength(10);
  });


  test('monthly EMI loan: 10,000 @15% + 100 fee over 5 months', () => {
    const result = monthlyCalc.calculate({
      principal: 10000,
      interestRate: 15,
      agreementFee: 100,
      termCount: 5,
      startDate: new Date('2026-01-01'),
    });
    expect(result.disbursedAmount).toBe(8400);
    expect(result.totalRepayable).toBe(11500);
    expect(result.installmentAmount).toBe(2300);
    expect(result.dueSchedule).toHaveLength(5);
  });

  test('high-value loan: 100,000 @3%/month interest-only', () => {
    const result = highValueCalc.calculate({
      principal: 100000,
      interestRate: 3,
      startDate: new Date('2026-01-01'),
      projectedMonths: 6,
    });
    expect(result.disbursedAmount).toBe(100000);
    expect(result.monthlyInterest).toBe(3000);
    expect(result.dueSchedule).toHaveLength(6);
    expect(result.dueSchedule[0].amount).toBe(3000);
  });

  test('high-value loan: interest recalculates after partial principal repayment', () => {
    const newInterest = highValueCalc.recalculateInterest({
      outstandingPrincipal: 60000,
      interestRate: 3,
    });
    expect(newInterest).toBe(1800);
  });
});
