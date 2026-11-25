-- Migration: 20261125030000_add_can_edit_and_daily_records
-- Adds canEdit to users, disbursementMethod to loans, and daily_records table with Bag & Bank classification

-- 1. Ensure users.canEdit exists
ALTER TABLE "users" ADD COLUMN IF NOT EXISTS "canEdit" BOOLEAN NOT NULL DEFAULT false;

-- 2. Ensure loans.disbursementMethod exists
ALTER TABLE "loans" ADD COLUMN IF NOT EXISTS "disbursementMethod" TEXT NOT NULL DEFAULT 'CASH';

-- 3. Ensure daily_records table exists
CREATE TABLE IF NOT EXISTS "daily_records" (
    "id" TEXT NOT NULL,
    "recordDate" DATE NOT NULL,
    "openingBalance" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "openingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "openingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "billIncome" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "billIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "billIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "otherIncome1Label" TEXT,
    "otherIncome1Amount" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "otherIncome2Label" TEXT,
    "otherIncome2Amount" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "expenses" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "expensesBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "expensesBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "expensesDetails" JSONB,
    "loansGivenCount" INTEGER NOT NULL DEFAULT 0,
    "loansGivenPrincipal" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenPrincipalBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenPrincipalBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenIncome" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenNetDisbursed" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenNetDisbursedBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenNetDisbursedBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "closingBalance" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "closingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "closingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "notes" TEXT,
    "updatedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "daily_records_pkey" PRIMARY KEY ("id")
);

-- Unique index on recordDate
CREATE UNIQUE INDEX IF NOT EXISTS "daily_records_recordDate_key" ON "daily_records"("recordDate");

-- If daily_records table already exists, ensure all Bag/Bank columns exist
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "openingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "openingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "billIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "billIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenPrincipalBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenPrincipalBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenIncomeBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenIncomeBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenNetDisbursedBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "loansGivenNetDisbursedBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "expensesBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "expensesBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "closingBalanceBag" DECIMAL(15,2) NOT NULL DEFAULT 0;
ALTER TABLE "daily_records" ADD COLUMN IF NOT EXISTS "closingBalanceBank" DECIMAL(15,2) NOT NULL DEFAULT 0;
