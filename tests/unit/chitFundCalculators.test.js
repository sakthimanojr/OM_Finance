describe('Chit Fund Calculations', () => {
  // Rule 1: Monthly contribution ₹6,000, 30 members
  const memberCount = 30;
  const monthlyContribution = 6000;

  // Rule 2: Regular auction is always ₹1,80,000 (memberCount * monthlyContribution)
  const regularAuctionAmount = memberCount * monthlyContribution;

  test('regular auction amount calculation', () => {
    expect(regularAuctionAmount).toBe(180000);
  });

  // Rule 3: Flat 3% interest rate on loans from accumulated fund
  test('flat 3% interest calculation on loan', () => {
    const principalAmount = 50000;
    const interestRate = 3; // 3.00%
    const interestAmount = Math.round(principalAmount * (interestRate / 100) * 100) / 100;
    const totalRepayment = principalAmount + interestAmount;

    expect(interestAmount).toBe(1500);
    expect(totalRepayment).toBe(51500);
  });

  // Rule 4: Payout calculation: payout = auctionAmount - winningBid
  test('regular auction winner payout calculation', () => {
    const winningBid = 35000; // winning bid is the discount given up by winner
    const winnerPayout = regularAuctionAmount - winningBid;

    expect(winnerPayout).toBe(145000);
  });

  // Rule 5: Ledger balance tracking
  test('ledger credit and debit flow tracking', () => {
    let balance = 0;

    // Credit winning bid from first regular auction
    const winningBid1 = 30000;
    balance += winningBid1;
    expect(balance).toBe(30000);

    // Credit winning bid from second regular auction
    const winningBid2 = 25000;
    balance += winningBid2;
    expect(balance).toBe(55000);

    // Disburse a loan of ₹40,000 from the accumulated fund
    const loanPrincipal = 40000;
    balance -= loanPrincipal;
    expect(balance).toBe(15000);

    // Repay loan: principal ₹40,000 + interest ₹1,200 (flat 3%)
    const principalRepayment = 40000;
    const interestRepayment = 1200;
    balance += principalRepayment + interestRepayment;

    // Balance grows by the interest earned
    expect(balance).toBe(56200);
  });
});
