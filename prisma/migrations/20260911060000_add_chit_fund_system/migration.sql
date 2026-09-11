-- ─────────────────────────────────────────────────────────────────────────────
-- Migration: add_chit_fund_system
-- Created: 2026-09-11
-- Adds all Chit Fund tables, enums, and relationships to the existing schema.
-- ─────────────────────────────────────────────────────────────────────────────

-- Enums
CREATE TYPE "ChitStatus" AS ENUM ('DRAFT', 'ACTIVE', 'COMPLETED', 'CANCELLED');
CREATE TYPE "ChitMemberStatus" AS ENUM ('ACTIVE', 'DEFAULTED', 'WITHDRAWN');
CREATE TYPE "ChitMonthStatus" AS ENUM ('OPEN', 'CLOSED');
CREATE TYPE "AuctionType" AS ENUM ('REGULAR', 'ADDITIONAL');
CREATE TYPE "AuctionStatus" AS ENUM ('PENDING', 'SETTLED', 'CANCELLED');
CREATE TYPE "ChitMemberPaymentStatus" AS ENUM ('PENDING', 'PARTIAL', 'PAID', 'LATE', 'FAILED', 'WAIVED');
CREATE TYPE "ChitLoanStatus" AS ENUM ('ACTIVE', 'PARTIALLY_PAID', 'PAID', 'OVERDUE', 'WRITTEN_OFF');
CREATE TYPE "ChitLedgerDirection" AS ENUM ('CREDIT', 'DEBIT');
CREATE TYPE "ChitLedgerTransactionType" AS ENUM (
  'WINNING_BID_CREDIT',
  'LOAN_DISBURSEMENT',
  'LOAN_PRINCIPAL_REPAYMENT',
  'LOAN_INTEREST_CREDIT',
  'ADDITIONAL_AUCTION_ALLOCATION',
  'MANUAL_CREDIT',
  'MANUAL_DEBIT',
  'REFUND'
);

-- chit_funds
CREATE TABLE "chit_funds" (
    "id"                    TEXT NOT NULL,
    "name"                  TEXT NOT NULL,
    "description"           TEXT,
    "memberCount"           INTEGER NOT NULL,
    "monthlyContribution"   DECIMAL(15,2) NOT NULL,
    "regularAuctionAmount"  DECIMAL(15,2) NOT NULL,
    "startingBid"           DECIMAL(15,2) NOT NULL,
    "interestRate"          DECIMAL(5,2) NOT NULL DEFAULT 3.00,
    "loanPeriodRule"        TEXT,
    "startDate"             TIMESTAMP(3) NOT NULL,
    "paymentDueDay"         INTEGER NOT NULL DEFAULT 1,
    "currentMonth"          INTEGER NOT NULL DEFAULT 0,
    "completedAuctionCount" INTEGER NOT NULL DEFAULT 0,
    "requiredWinnerCount"   INTEGER NOT NULL,
    "status"                "ChitStatus" NOT NULL DEFAULT 'DRAFT',
    "createdById"           TEXT NOT NULL,
    "createdAt"             TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt"             TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chit_funds_pkey" PRIMARY KEY ("id")
);

-- chit_members
CREATE TABLE "chit_members" (
    "id"                  TEXT NOT NULL,
    "chitId"              TEXT NOT NULL,
    "userId"              TEXT NOT NULL,
    "customerId"          TEXT NOT NULL,
    "monthlyContribution" DECIMAL(15,2) NOT NULL,
    "auctionEligible"     BOOLEAN NOT NULL DEFAULT true,
    "hasWonAuction"       BOOLEAN NOT NULL DEFAULT false,
    "wonAuctionId"        TEXT,
    "wonAuctionNumber"    INTEGER,
    "status"              "ChitMemberStatus" NOT NULL DEFAULT 'ACTIVE',
    "joinedAt"            TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt"           TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt"           TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chit_members_pkey" PRIMARY KEY ("id")
);

-- chit_months
CREATE TABLE "chit_months" (
    "id"              TEXT NOT NULL,
    "chitId"          TEXT NOT NULL,
    "monthNumber"     INTEGER NOT NULL,
    "periodStart"     TIMESTAMP(3) NOT NULL,
    "periodEnd"       TIMESTAMP(3),
    "amountDue"       DECIMAL(15,2) NOT NULL,
    "amountCollected" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "status"          "ChitMonthStatus" NOT NULL DEFAULT 'OPEN',
    "createdAt"       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt"       TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chit_months_pkey" PRIMARY KEY ("id")
);

-- chit_auctions
CREATE TABLE "chit_auctions" (
    "id"            TEXT NOT NULL,
    "chitId"        TEXT NOT NULL,
    "monthId"       TEXT NOT NULL,
    "auctionNumber" INTEGER NOT NULL,
    "auctionType"   "AuctionType" NOT NULL,
    "auctionDate"   TIMESTAMP(3) NOT NULL,
    "auctionAmount" DECIMAL(15,2) NOT NULL,
    "startingBid"   DECIMAL(15,2) NOT NULL,
    "winningBid"    DECIMAL(15,2),
    "winnerId"      TEXT,
    "winnerPayout"  DECIMAL(15,2),
    "status"        "AuctionStatus" NOT NULL DEFAULT 'PENDING',
    "createdById"   TEXT NOT NULL,
    "createdAt"     TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt"     TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chit_auctions_pkey" PRIMARY KEY ("id")
);

-- chit_bids
CREATE TABLE "chit_bids" (
    "id"        TEXT NOT NULL,
    "auctionId" TEXT NOT NULL,
    "memberId"  TEXT NOT NULL,
    "bidAmount" DECIMAL(15,2) NOT NULL,
    "bidTime"   TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status"    TEXT NOT NULL DEFAULT 'PLACED',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chit_bids_pkey" PRIMARY KEY ("id")
);

-- chit_fund_ledger
CREATE TABLE "chit_fund_ledger" (
    "id"              TEXT NOT NULL,
    "chitId"          TEXT NOT NULL,
    "auctionId"       TEXT,
    "loanId"          TEXT,
    "transactionType" "ChitLedgerTransactionType" NOT NULL,
    "amount"          DECIMAL(15,2) NOT NULL,
    "direction"       "ChitLedgerDirection" NOT NULL,
    "balanceAfter"    DECIMAL(15,2) NOT NULL,
    "referenceId"     TEXT,
    "description"     TEXT NOT NULL,
    "createdById"     TEXT NOT NULL,
    "createdAt"       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chit_fund_ledger_pkey" PRIMARY KEY ("id")
);

-- chit_loans
CREATE TABLE "chit_loans" (
    "id"              TEXT NOT NULL,
    "chitId"          TEXT NOT NULL,
    "memberId"        TEXT NOT NULL,
    "principalAmount" DECIMAL(15,2) NOT NULL,
    "interestRate"    DECIMAL(5,2) NOT NULL DEFAULT 3.00,
    "interestAmount"  DECIMAL(15,2) NOT NULL,
    "totalRepayment"  DECIMAL(15,2) NOT NULL,
    "amountPaid"      DECIMAL(15,2) NOT NULL DEFAULT 0,
    "remainingAmount" DECIMAL(15,2) NOT NULL,
    "loanDate"        TIMESTAMP(3) NOT NULL,
    "dueDate"         TIMESTAMP(3) NOT NULL,
    "status"          "ChitLoanStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdById"     TEXT NOT NULL,
    "createdAt"       TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt"       TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chit_loans_pkey" PRIMARY KEY ("id")
);

-- chit_loan_transactions
CREATE TABLE "chit_loan_transactions" (
    "id"               TEXT NOT NULL,
    "loanId"           TEXT NOT NULL,
    "transactionType"  TEXT NOT NULL,
    "principalAmount"  DECIMAL(15,2) NOT NULL,
    "interestAmount"   DECIMAL(15,2) NOT NULL,
    "totalAmount"      DECIMAL(15,2) NOT NULL,
    "paymentReference" TEXT,
    "transactionDate"  TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById"      TEXT NOT NULL,
    "createdAt"        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chit_loan_transactions_pkey" PRIMARY KEY ("id")
);

-- chit_member_payments
CREATE TABLE "chit_member_payments" (
    "id"               TEXT NOT NULL,
    "chitId"           TEXT NOT NULL,
    "memberId"         TEXT NOT NULL,
    "monthId"          TEXT NOT NULL,
    "amountDue"        DECIMAL(15,2) NOT NULL,
    "amountPaid"       DECIMAL(15,2) NOT NULL DEFAULT 0,
    "dueDate"          TIMESTAMP(3) NOT NULL,
    "paidDate"         TIMESTAMP(3),
    "status"           "ChitMemberPaymentStatus" NOT NULL DEFAULT 'PENDING',
    "paymentReference" TEXT,
    "paymentMethod"    TEXT,
    "createdAt"        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt"        TIMESTAMP(3) NOT NULL,

    CONSTRAINT "chit_member_payments_pkey" PRIMARY KEY ("id")
);

-- chit_payouts
CREATE TABLE "chit_payouts" (
    "id"               TEXT NOT NULL,
    "chitId"           TEXT NOT NULL,
    "auctionId"        TEXT NOT NULL,
    "winnerId"         TEXT NOT NULL,
    "auctionAmount"    DECIMAL(15,2) NOT NULL,
    "winningBid"       DECIMAL(15,2) NOT NULL,
    "payoutAmount"     DECIMAL(15,2) NOT NULL,
    "status"           TEXT NOT NULL DEFAULT 'PENDING',
    "paymentReference" TEXT,
    "paidAt"           TIMESTAMP(3),
    "createdAt"        TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "chit_payouts_pkey" PRIMARY KEY ("id")
);

-- ─── Unique constraints ───────────────────────────────────────────────────────
ALTER TABLE "chit_members"         ADD CONSTRAINT "chit_members_chitId_userId_key"           UNIQUE ("chitId", "userId");
ALTER TABLE "chit_months"          ADD CONSTRAINT "chit_months_chitId_monthNumber_key"        UNIQUE ("chitId", "monthNumber");
ALTER TABLE "chit_auctions"        ADD CONSTRAINT "chit_auctions_chitId_auctionNumber_key"   UNIQUE ("chitId", "auctionNumber");
ALTER TABLE "chit_member_payments" ADD CONSTRAINT "chit_member_payments_memberId_monthId_key" UNIQUE ("memberId", "monthId");
ALTER TABLE "chit_payouts"         ADD CONSTRAINT "chit_payouts_auctionId_key"               UNIQUE ("auctionId");

-- ─── Foreign keys ─────────────────────────────────────────────────────────────
ALTER TABLE "chit_funds"             ADD CONSTRAINT "chit_funds_createdById_fkey"             FOREIGN KEY ("createdById")  REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_members"           ADD CONSTRAINT "chit_members_chitId_fkey"                FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_members"           ADD CONSTRAINT "chit_members_userId_fkey"                FOREIGN KEY ("userId")       REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_members"           ADD CONSTRAINT "chit_members_customerId_fkey"            FOREIGN KEY ("customerId")   REFERENCES "customers"("id")       ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_months"            ADD CONSTRAINT "chit_months_chitId_fkey"                 FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_chitId_fkey"               FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_monthId_fkey"              FOREIGN KEY ("monthId")      REFERENCES "chit_months"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_winnerId_fkey"             FOREIGN KEY ("winnerId")     REFERENCES "chit_members"("id")    ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_createdById_fkey"          FOREIGN KEY ("createdById")  REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_bids"              ADD CONSTRAINT "chit_bids_auctionId_fkey"                FOREIGN KEY ("auctionId")    REFERENCES "chit_auctions"("id")   ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_chitId_fkey"            FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_auctionId_fkey"         FOREIGN KEY ("auctionId")    REFERENCES "chit_auctions"("id")   ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_loanId_fkey"            FOREIGN KEY ("loanId")       REFERENCES "chit_loans"("id")      ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_createdById_fkey"       FOREIGN KEY ("createdById")  REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_loans"             ADD CONSTRAINT "chit_loans_chitId_fkey"                  FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_loans"             ADD CONSTRAINT "chit_loans_memberId_fkey"                FOREIGN KEY ("memberId")     REFERENCES "chit_members"("id")    ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_loans"             ADD CONSTRAINT "chit_loans_createdById_fkey"             FOREIGN KEY ("createdById")  REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_loan_transactions" ADD CONSTRAINT "chit_loan_transactions_loanId_fkey"      FOREIGN KEY ("loanId")       REFERENCES "chit_loans"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_loan_transactions" ADD CONSTRAINT "chit_loan_transactions_createdById_fkey" FOREIGN KEY ("createdById")  REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_member_payments"   ADD CONSTRAINT "chit_member_payments_chitId_fkey"        FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_member_payments"   ADD CONSTRAINT "chit_member_payments_memberId_fkey"      FOREIGN KEY ("memberId")     REFERENCES "chit_members"("id")    ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_member_payments"   ADD CONSTRAINT "chit_member_payments_monthId_fkey"       FOREIGN KEY ("monthId")      REFERENCES "chit_months"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_payouts"           ADD CONSTRAINT "chit_payouts_chitId_fkey"                FOREIGN KEY ("chitId")       REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_payouts"           ADD CONSTRAINT "chit_payouts_auctionId_fkey"             FOREIGN KEY ("auctionId")    REFERENCES "chit_auctions"("id")   ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_payouts"           ADD CONSTRAINT "chit_payouts_winnerId_fkey"              FOREIGN KEY ("winnerId")     REFERENCES "chit_members"("id")    ON DELETE RESTRICT ON UPDATE CASCADE;
