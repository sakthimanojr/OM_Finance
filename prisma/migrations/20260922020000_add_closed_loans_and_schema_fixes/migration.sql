-- ─────────────────────────────────────────────────────────────────────────────
-- Migration: 20260922020000_add_closed_loans_and_schema_fixes
-- Adds closed_loans table, ensures loanNumber, billNumber, and BANK_TRANSFER enum value.
-- ─────────────────────────────────────────────────────────────────────────────

-- 1. Create closed_loans table
CREATE TABLE IF NOT EXISTS "closed_loans" (
    "id" TEXT NOT NULL,
    "loanId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "customerName" TEXT NOT NULL,
    "customerPhone" TEXT NOT NULL,
    "loanType" TEXT NOT NULL,
    "loanNumber" TEXT,
    "principal" DECIMAL(12,2) NOT NULL,
    "interestRate" DECIMAL(5,2) NOT NULL,
    "disbursedAmount" DECIMAL(12,2) NOT NULL,
    "totalCollected" DECIMAL(12,2) NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "closedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "paymentHistory" JSONB NOT NULL,
    "dueSchedule" JSONB NOT NULL,

    CONSTRAINT "closed_loans_pkey" PRIMARY KEY ("id")
);

-- Unique index on closed_loans(loanId)
CREATE UNIQUE INDEX IF NOT EXISTS "closed_loans_loanId_key" ON "closed_loans"("loanId");

-- 2. Ensure PaymentMethod includes BANK_TRANSFER
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_enum
        WHERE enumlabel = 'BANK_TRANSFER'
        AND enumtypid = (SELECT oid FROM pg_type WHERE typname = 'PaymentMethod')
    ) THEN
        ALTER TYPE "PaymentMethod" ADD VALUE 'BANK_TRANSFER';
    END IF;
END $$;

-- 3. Ensure loans.loanNumber exists
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'loans' AND column_name = 'loanNumber'
    ) THEN
        ALTER TABLE "loans" ADD COLUMN "loanNumber" TEXT;
        UPDATE "loans" SET "loanNumber" = 'LN-' || substr(id, 1, 8) WHERE "loanNumber" IS NULL;
        ALTER TABLE "loans" ALTER COLUMN "loanNumber" SET NOT NULL;
        CREATE UNIQUE INDEX IF NOT EXISTS "loans_loanNumber_key" ON "loans"("loanNumber");
    END IF;
END $$;

-- 4. Ensure receipts.billNumber exists
DO $$ BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'receipts' AND column_name = 'billNumber'
    ) THEN
        CREATE SEQUENCE IF NOT EXISTS receipts_billNumber_seq;
        ALTER TABLE "receipts" ADD COLUMN "billNumber" INTEGER NOT NULL DEFAULT nextval('receipts_billNumber_seq');
        ALTER SEQUENCE receipts_billNumber_seq OWNED BY "receipts"."billNumber";
        CREATE UNIQUE INDEX IF NOT EXISTS "receipts_billNumber_key" ON "receipts"("billNumber");
    END IF;
END $$;
