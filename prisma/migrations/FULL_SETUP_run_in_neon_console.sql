-- ═══════════════════════════════════════════════════════════════════════════
-- FULL DATABASE SETUP — Paste into Neon SQL Editor → Run
-- This creates ALL tables for OM Finance (fresh database).
-- Go to: https://console.neon.tech → project ep-patient-shadow-ae69sqix → SQL Editor
-- ═══════════════════════════════════════════════════════════════════════════

-- ────────────────────────────────────────────────────────────────────────────
-- MIGRATION 1: init (20260716120226)
-- ────────────────────────────────────────────────────────────────────────────

CREATE TYPE "Role" AS ENUM ('SUPER_ADMIN', 'VIEW_ADMIN', 'CUSTOMER');
CREATE TYPE "CustomerStatus" AS ENUM ('ACTIVE', 'SUSPENDED', 'CLOSED');
CREATE TYPE "DocumentType" AS ENUM ('AADHAAR', 'PAN', 'AGREEMENT', 'OTHER');
CREATE TYPE "LoanType" AS ENUM ('WEEKLY', 'MONTHLY', 'HIGH_VALUE');
CREATE TYPE "LoanStatus" AS ENUM ('ACTIVE', 'COMPLETED', 'CLOSED', 'OVERDUE');
CREATE TYPE "DueStatus" AS ENUM ('PENDING', 'PAID', 'MISSED');
CREATE TYPE "PaymentMethod" AS ENUM ('UPI', 'CASH', 'MANUAL');
CREATE TYPE "PaymentStatus" AS ENUM ('INITIATED', 'SUCCESS', 'FAILED');
CREATE TYPE "NotificationChannel" AS ENUM ('SMS', 'EMAIL', 'PUSH');
CREATE TYPE "NotificationStatus" AS ENUM ('PENDING', 'SENT', 'FAILED');

CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "role" "Role" NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT,
    "passwordHash" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "customers" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "fatherName" TEXT,
    "phone" TEXT NOT NULL,
    "email" TEXT,
    "address" TEXT,
    "aadhaarLast4" TEXT,
    "aadhaarEncrypted" TEXT,
    "panEncrypted" TEXT,
    "occupation" TEXT,
    "monthlyIncome" DECIMAL(12,2),
    "guarantorName" TEXT,
    "guarantorPhone" TEXT,
    "emergencyContact" TEXT,
    "photoUrl" TEXT,
    "status" "CustomerStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "documents" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "type" "DocumentType" NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "documents_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "loans" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "type" "LoanType" NOT NULL,
    "principal" DECIMAL(12,2) NOT NULL,
    "interestRate" DECIMAL(5,2) NOT NULL,
    "agreementFee" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "disbursedAmount" DECIMAL(12,2) NOT NULL,
    "totalCollection" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "status" "LoanStatus" NOT NULL DEFAULT 'ACTIVE',
    "termCount" INTEGER,
    "installmentAmount" DECIMAL(12,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "loans_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "dues" (
    "id" TEXT NOT NULL,
    "loanId" TEXT NOT NULL,
    "dueNumber" INTEGER NOT NULL,
    "dueDate" TIMESTAMP(3) NOT NULL,
    "amount" DECIMAL(12,2) NOT NULL,
    "status" "DueStatus" NOT NULL DEFAULT 'PENDING',
    "paidDate" TIMESTAMP(3),
    "paidAmount" DECIMAL(12,2),
    "paymentMethod" "PaymentMethod",
    "remarks" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "dues_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "payments" (
    "id" TEXT NOT NULL,
    "dueId" TEXT NOT NULL,
    "loanId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "amount" DECIMAL(12,2) NOT NULL,
    "method" "PaymentMethod" NOT NULL,
    "upiRefNumber" TEXT,
    "gatewayOrderId" TEXT,
    "gatewaySignature" TEXT,
    "status" "PaymentStatus" NOT NULL DEFAULT 'INITIATED',
    "paidAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "receipts" (
    "id" TEXT NOT NULL,
    "paymentId" TEXT NOT NULL,
    "receiptNumber" TEXT NOT NULL,
    "qrCodeUrl" TEXT,
    "pdfUrl" TEXT,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "receipts_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "notifications" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "channel" "NotificationChannel" NOT NULL,
    "type" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "sentAt" TIMESTAMP(3),
    "status" "NotificationStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "audit_logs" (
    "id" TEXT NOT NULL,
    "adminId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "entityType" TEXT NOT NULL,
    "entityId" TEXT,
    "details" JSONB,
    "ipAddress" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "audit_logs_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "admin_config" (
    "id" TEXT NOT NULL,
    "upiId" TEXT,
    "smsProvider" TEXT,
    "smsApiKeyEncrypted" TEXT,
    "smtpConfigEncrypted" TEXT,
    "updatedBy" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "admin_config_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "closed_loans" (
    "id" TEXT NOT NULL,
    "loanId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "closedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "closedBy" TEXT,
    "reason" TEXT,
    "finalAmount" DECIMAL(12,2),
    CONSTRAINT "closed_loans_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "users_phone_key" ON "users"("phone");
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");
CREATE UNIQUE INDEX "customers_userId_key" ON "customers"("userId");
CREATE UNIQUE INDEX "dues_loanId_dueNumber_key" ON "dues"("loanId", "dueNumber");
CREATE UNIQUE INDEX "payments_gatewayOrderId_key" ON "payments"("gatewayOrderId");
CREATE UNIQUE INDEX "receipts_paymentId_key" ON "receipts"("paymentId");
CREATE UNIQUE INDEX "receipts_receiptNumber_key" ON "receipts"("receiptNumber");

ALTER TABLE "customers"  ADD CONSTRAINT "customers_userId_fkey"    FOREIGN KEY ("userId")     REFERENCES "users"("id")     ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "documents"  ADD CONSTRAINT "documents_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "loans"      ADD CONSTRAINT "loans_customerId_fkey"     FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "dues"       ADD CONSTRAINT "dues_loanId_fkey"          FOREIGN KEY ("loanId")     REFERENCES "loans"("id")     ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "payments"   ADD CONSTRAINT "payments_dueId_fkey"       FOREIGN KEY ("dueId")      REFERENCES "dues"("id")      ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "payments"   ADD CONSTRAINT "payments_loanId_fkey"      FOREIGN KEY ("loanId")     REFERENCES "loans"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "payments"   ADD CONSTRAINT "payments_customerId_fkey"  FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "receipts"   ADD CONSTRAINT "receipts_paymentId_fkey"   FOREIGN KEY ("paymentId")  REFERENCES "payments"("id")  ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "audit_logs" ADD CONSTRAINT "audit_logs_adminId_fkey"   FOREIGN KEY ("adminId")    REFERENCES "users"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;

-- ────────────────────────────────────────────────────────────────────────────
-- MIGRATION 2: add_cloudinary_public_id (20260718090000)
-- ────────────────────────────────────────────────────────────────────────────

ALTER TABLE "documents" ADD COLUMN "cloudinaryPublicId" TEXT;
ALTER TABLE "receipts"  ADD COLUMN "cloudinaryPublicId" TEXT;

-- ────────────────────────────────────────────────────────────────────────────
-- MIGRATION 3: add_chit_fund_system (20260911060000)
-- ────────────────────────────────────────────────────────────────────────────

CREATE TYPE "ChitStatus" AS ENUM ('DRAFT', 'ACTIVE', 'COMPLETED', 'CANCELLED');
CREATE TYPE "ChitMemberStatus" AS ENUM ('ACTIVE', 'DEFAULTED', 'WITHDRAWN');
CREATE TYPE "ChitMonthStatus" AS ENUM ('OPEN', 'CLOSED');
CREATE TYPE "AuctionType" AS ENUM ('REGULAR', 'ADDITIONAL');
CREATE TYPE "AuctionStatus" AS ENUM ('PENDING', 'SETTLED', 'CANCELLED');
CREATE TYPE "ChitMemberPaymentStatus" AS ENUM ('PENDING', 'PARTIAL', 'PAID', 'LATE', 'FAILED', 'WAIVED');
CREATE TYPE "ChitLoanStatus" AS ENUM ('ACTIVE', 'PARTIALLY_PAID', 'PAID', 'OVERDUE', 'WRITTEN_OFF');
CREATE TYPE "ChitLedgerDirection" AS ENUM ('CREDIT', 'DEBIT');
CREATE TYPE "ChitLedgerTransactionType" AS ENUM (
  'WINNING_BID_CREDIT', 'LOAN_DISBURSEMENT', 'LOAN_PRINCIPAL_REPAYMENT',
  'LOAN_INTEREST_CREDIT', 'ADDITIONAL_AUCTION_ALLOCATION',
  'MANUAL_CREDIT', 'MANUAL_DEBIT', 'REFUND'
);

CREATE TABLE "chit_funds" (
    "id" TEXT NOT NULL, "name" TEXT NOT NULL, "description" TEXT,
    "memberCount" INTEGER NOT NULL, "monthlyContribution" DECIMAL(15,2) NOT NULL,
    "regularAuctionAmount" DECIMAL(15,2) NOT NULL, "startingBid" DECIMAL(15,2) NOT NULL,
    "interestRate" DECIMAL(5,2) NOT NULL DEFAULT 3.00, "loanPeriodRule" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL, "paymentDueDay" INTEGER NOT NULL DEFAULT 1,
    "currentMonth" INTEGER NOT NULL DEFAULT 0, "completedAuctionCount" INTEGER NOT NULL DEFAULT 0,
    "requiredWinnerCount" INTEGER NOT NULL, "status" "ChitStatus" NOT NULL DEFAULT 'DRAFT',
    "createdById" TEXT NOT NULL, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "chit_funds_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_members" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "userId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL, "monthlyContribution" DECIMAL(15,2) NOT NULL,
    "auctionEligible" BOOLEAN NOT NULL DEFAULT true, "hasWonAuction" BOOLEAN NOT NULL DEFAULT false,
    "wonAuctionId" TEXT, "wonAuctionNumber" INTEGER,
    "status" "ChitMemberStatus" NOT NULL DEFAULT 'ACTIVE',
    "joinedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "chit_members_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_months" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "monthNumber" INTEGER NOT NULL,
    "periodStart" TIMESTAMP(3) NOT NULL, "periodEnd" TIMESTAMP(3),
    "amountDue" DECIMAL(15,2) NOT NULL, "amountCollected" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "status" "ChitMonthStatus" NOT NULL DEFAULT 'OPEN',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "chit_months_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_auctions" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "monthId" TEXT NOT NULL,
    "auctionNumber" INTEGER NOT NULL, "auctionType" "AuctionType" NOT NULL,
    "auctionDate" TIMESTAMP(3) NOT NULL, "auctionAmount" DECIMAL(15,2) NOT NULL,
    "startingBid" DECIMAL(15,2) NOT NULL, "winningBid" DECIMAL(15,2),
    "winnerId" TEXT, "winnerPayout" DECIMAL(15,2),
    "status" "AuctionStatus" NOT NULL DEFAULT 'PENDING',
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "chit_auctions_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_bids" (
    "id" TEXT NOT NULL, "auctionId" TEXT NOT NULL, "memberId" TEXT NOT NULL,
    "bidAmount" DECIMAL(15,2) NOT NULL, "bidTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL DEFAULT 'PLACED', "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "chit_bids_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_fund_ledger" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "auctionId" TEXT, "loanId" TEXT,
    "transactionType" "ChitLedgerTransactionType" NOT NULL, "amount" DECIMAL(15,2) NOT NULL,
    "direction" "ChitLedgerDirection" NOT NULL, "balanceAfter" DECIMAL(15,2) NOT NULL,
    "referenceId" TEXT, "description" TEXT NOT NULL, "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "chit_fund_ledger_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_loans" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "memberId" TEXT NOT NULL,
    "principalAmount" DECIMAL(15,2) NOT NULL, "interestRate" DECIMAL(5,2) NOT NULL DEFAULT 3.00,
    "interestAmount" DECIMAL(15,2) NOT NULL, "totalRepayment" DECIMAL(15,2) NOT NULL,
    "amountPaid" DECIMAL(15,2) NOT NULL DEFAULT 0, "remainingAmount" DECIMAL(15,2) NOT NULL,
    "loanDate" TIMESTAMP(3) NOT NULL, "dueDate" TIMESTAMP(3) NOT NULL,
    "status" "ChitLoanStatus" NOT NULL DEFAULT 'ACTIVE', "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "chit_loans_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_loan_transactions" (
    "id" TEXT NOT NULL, "loanId" TEXT NOT NULL, "transactionType" TEXT NOT NULL,
    "principalAmount" DECIMAL(15,2) NOT NULL, "interestAmount" DECIMAL(15,2) NOT NULL,
    "totalAmount" DECIMAL(15,2) NOT NULL, "paymentReference" TEXT,
    "transactionDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT NOT NULL, "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "chit_loan_transactions_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_member_payments" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "memberId" TEXT NOT NULL, "monthId" TEXT NOT NULL,
    "amountDue" DECIMAL(15,2) NOT NULL, "amountPaid" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "dueDate" TIMESTAMP(3) NOT NULL, "paidDate" TIMESTAMP(3),
    "status" "ChitMemberPaymentStatus" NOT NULL DEFAULT 'PENDING',
    "paymentReference" TEXT, "paymentMethod" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "chit_member_payments_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "chit_payouts" (
    "id" TEXT NOT NULL, "chitId" TEXT NOT NULL, "auctionId" TEXT NOT NULL, "winnerId" TEXT NOT NULL,
    "auctionAmount" DECIMAL(15,2) NOT NULL, "winningBid" DECIMAL(15,2) NOT NULL,
    "payoutAmount" DECIMAL(15,2) NOT NULL, "status" TEXT NOT NULL DEFAULT 'PENDING',
    "paymentReference" TEXT, "paidAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "chit_payouts_pkey" PRIMARY KEY ("id")
);

-- Unique constraints
ALTER TABLE "chit_members"         ADD CONSTRAINT "chit_members_chitId_userId_key"            UNIQUE ("chitId", "userId");
ALTER TABLE "chit_months"          ADD CONSTRAINT "chit_months_chitId_monthNumber_key"         UNIQUE ("chitId", "monthNumber");
ALTER TABLE "chit_auctions"        ADD CONSTRAINT "chit_auctions_chitId_auctionNumber_key"     UNIQUE ("chitId", "auctionNumber");
ALTER TABLE "chit_member_payments" ADD CONSTRAINT "chit_member_payments_memberId_monthId_key"  UNIQUE ("memberId", "monthId");
ALTER TABLE "chit_payouts"         ADD CONSTRAINT "chit_payouts_auctionId_key"                 UNIQUE ("auctionId");

-- Foreign keys
ALTER TABLE "chit_funds"             ADD CONSTRAINT "chit_funds_createdById_fkey"             FOREIGN KEY ("createdById") REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_members"           ADD CONSTRAINT "chit_members_chitId_fkey"                FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_members"           ADD CONSTRAINT "chit_members_userId_fkey"                FOREIGN KEY ("userId")      REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_members"           ADD CONSTRAINT "chit_members_customerId_fkey"            FOREIGN KEY ("customerId")  REFERENCES "customers"("id")       ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_months"            ADD CONSTRAINT "chit_months_chitId_fkey"                 FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_chitId_fkey"               FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_monthId_fkey"              FOREIGN KEY ("monthId")     REFERENCES "chit_months"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_winnerId_fkey"             FOREIGN KEY ("winnerId")    REFERENCES "chit_members"("id")    ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "chit_auctions"          ADD CONSTRAINT "chit_auctions_createdById_fkey"          FOREIGN KEY ("createdById") REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_bids"              ADD CONSTRAINT "chit_bids_auctionId_fkey"                FOREIGN KEY ("auctionId")   REFERENCES "chit_auctions"("id")   ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_chitId_fkey"            FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_auctionId_fkey"         FOREIGN KEY ("auctionId")   REFERENCES "chit_auctions"("id")   ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_loanId_fkey"            FOREIGN KEY ("loanId")      REFERENCES "chit_loans"("id")      ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "chit_fund_ledger"       ADD CONSTRAINT "chit_fund_ledger_createdById_fkey"       FOREIGN KEY ("createdById") REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_loans"             ADD CONSTRAINT "chit_loans_chitId_fkey"                  FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_loans"             ADD CONSTRAINT "chit_loans_memberId_fkey"                FOREIGN KEY ("memberId")    REFERENCES "chit_members"("id")    ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_loans"             ADD CONSTRAINT "chit_loans_createdById_fkey"             FOREIGN KEY ("createdById") REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_loan_transactions" ADD CONSTRAINT "chit_loan_transactions_loanId_fkey"      FOREIGN KEY ("loanId")      REFERENCES "chit_loans"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_loan_transactions" ADD CONSTRAINT "chit_loan_tx_createdById_fkey"           FOREIGN KEY ("createdById") REFERENCES "users"("id")           ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_member_payments"   ADD CONSTRAINT "chit_member_payments_chitId_fkey"        FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_member_payments"   ADD CONSTRAINT "chit_member_payments_memberId_fkey"      FOREIGN KEY ("memberId")    REFERENCES "chit_members"("id")    ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_member_payments"   ADD CONSTRAINT "chit_member_payments_monthId_fkey"       FOREIGN KEY ("monthId")     REFERENCES "chit_months"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_payouts"           ADD CONSTRAINT "chit_payouts_chitId_fkey"                FOREIGN KEY ("chitId")      REFERENCES "chit_funds"("id")      ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "chit_payouts"           ADD CONSTRAINT "chit_payouts_auctionId_fkey"             FOREIGN KEY ("auctionId")   REFERENCES "chit_auctions"("id")   ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "chit_payouts"           ADD CONSTRAINT "chit_payouts_winnerId_fkey"              FOREIGN KEY ("winnerId")    REFERENCES "chit_members"("id")    ON DELETE RESTRICT ON UPDATE CASCADE;

-- ────────────────────────────────────────────────────────────────────────────
-- STEP FINAL: Record all 3 migrations in Prisma's tracking table
-- (So Prisma knows these are applied and won't try to re-run them)
-- ────────────────────────────────────────────────────────────────────────────

INSERT INTO "_prisma_migrations" (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES
  (gen_random_uuid()::text, 'neon-sql-editor-applied', NOW(), '20260716120226_init',                        NULL, NULL, NOW(), 1),
  (gen_random_uuid()::text, 'neon-sql-editor-applied', NOW(), '20260718090000_add_cloudinary_public_id',     NULL, NULL, NOW(), 1),
  (gen_random_uuid()::text, 'neon-sql-editor-applied', NOW(), '20260911060000_add_chit_fund_system',         NULL, NULL, NOW(), 1);
