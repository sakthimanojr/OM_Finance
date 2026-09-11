-- ═══════════════════════════════════════════════════════════════════════════
-- Run this ONLY if you already ran the Chit Fund SQL on the NEW database
-- (ep-patient-shadow-ae69sqix). This adds the missing base tables.
-- Go to: https://console.neon.tech → project ep-patient-shadow-ae69sqix → SQL Editor
-- ═══════════════════════════════════════════════════════════════════════════

-- MIGRATION 1: Base schema (users, customers, loans, dues, payments, etc.)

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
    "id" TEXT NOT NULL, "userId" TEXT NOT NULL, "name" TEXT NOT NULL,
    "fatherName" TEXT, "phone" TEXT NOT NULL, "email" TEXT, "address" TEXT,
    "aadhaarLast4" TEXT, "aadhaarEncrypted" TEXT, "panEncrypted" TEXT,
    "occupation" TEXT, "monthlyIncome" DECIMAL(12,2),
    "guarantorName" TEXT, "guarantorPhone" TEXT, "emergencyContact" TEXT,
    "photoUrl" TEXT, "status" "CustomerStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "documents" (
    "id" TEXT NOT NULL, "customerId" TEXT NOT NULL,
    "type" "DocumentType" NOT NULL, "fileUrl" TEXT NOT NULL,
    "cloudinaryPublicId" TEXT,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "documents_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "loans" (
    "id" TEXT NOT NULL, "customerId" TEXT NOT NULL, "type" "LoanType" NOT NULL,
    "principal" DECIMAL(12,2) NOT NULL, "interestRate" DECIMAL(5,2) NOT NULL,
    "agreementFee" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "disbursedAmount" DECIMAL(12,2) NOT NULL,
    "totalCollection" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "startDate" TIMESTAMP(3) NOT NULL, "endDate" TIMESTAMP(3),
    "status" "LoanStatus" NOT NULL DEFAULT 'ACTIVE',
    "termCount" INTEGER, "installmentAmount" DECIMAL(12,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "loans_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "dues" (
    "id" TEXT NOT NULL, "loanId" TEXT NOT NULL, "dueNumber" INTEGER NOT NULL,
    "dueDate" TIMESTAMP(3) NOT NULL, "amount" DECIMAL(12,2) NOT NULL,
    "status" "DueStatus" NOT NULL DEFAULT 'PENDING',
    "paidDate" TIMESTAMP(3), "paidAmount" DECIMAL(12,2),
    "paymentMethod" "PaymentMethod", "remarks" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "dues_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "payments" (
    "id" TEXT NOT NULL, "dueId" TEXT NOT NULL, "loanId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL, "amount" DECIMAL(12,2) NOT NULL,
    "method" "PaymentMethod" NOT NULL, "upiRefNumber" TEXT,
    "gatewayOrderId" TEXT, "gatewaySignature" TEXT,
    "status" "PaymentStatus" NOT NULL DEFAULT 'INITIATED',
    "paidAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "receipts" (
    "id" TEXT NOT NULL, "paymentId" TEXT NOT NULL, "receiptNumber" TEXT NOT NULL,
    "qrCodeUrl" TEXT, "pdfUrl" TEXT, "cloudinaryPublicId" TEXT,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "receipts_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "notifications" (
    "id" TEXT NOT NULL, "customerId" TEXT NOT NULL,
    "channel" "NotificationChannel" NOT NULL, "type" TEXT NOT NULL,
    "message" TEXT NOT NULL, "sentAt" TIMESTAMP(3),
    "status" "NotificationStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "audit_logs" (
    "id" TEXT NOT NULL, "adminId" TEXT NOT NULL,
    "action" TEXT NOT NULL, "entityType" TEXT NOT NULL,
    "entityId" TEXT, "details" JSONB, "ipAddress" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "audit_logs_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "admin_config" (
    "id" TEXT NOT NULL, "upiId" TEXT, "smsProvider" TEXT,
    "smsApiKeyEncrypted" TEXT, "smtpConfigEncrypted" TEXT,
    "updatedBy" TEXT, "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "admin_config_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "closed_loans" (
    "id" TEXT NOT NULL, "loanId" TEXT NOT NULL, "customerId" TEXT NOT NULL,
    "closedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "closedBy" TEXT, "reason" TEXT, "finalAmount" DECIMAL(12,2),
    CONSTRAINT "closed_loans_pkey" PRIMARY KEY ("id")
);

-- Indexes
CREATE UNIQUE INDEX "users_phone_key" ON "users"("phone");
CREATE UNIQUE INDEX "users_email_key"  ON "users"("email");
CREATE UNIQUE INDEX "customers_userId_key" ON "customers"("userId");
CREATE UNIQUE INDEX "dues_loanId_dueNumber_key" ON "dues"("loanId", "dueNumber");
CREATE UNIQUE INDEX "payments_gatewayOrderId_key" ON "payments"("gatewayOrderId");
CREATE UNIQUE INDEX "receipts_paymentId_key"     ON "receipts"("paymentId");
CREATE UNIQUE INDEX "receipts_receiptNumber_key" ON "receipts"("receiptNumber");

-- Foreign keys
ALTER TABLE "customers"     ADD CONSTRAINT "customers_userId_fkey"      FOREIGN KEY ("userId")      REFERENCES "users"("id")     ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "documents"     ADD CONSTRAINT "documents_customerId_fkey"  FOREIGN KEY ("customerId")  REFERENCES "customers"("id") ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "loans"         ADD CONSTRAINT "loans_customerId_fkey"      FOREIGN KEY ("customerId")  REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "dues"          ADD CONSTRAINT "dues_loanId_fkey"           FOREIGN KEY ("loanId")      REFERENCES "loans"("id")     ON DELETE CASCADE  ON UPDATE CASCADE;
ALTER TABLE "payments"      ADD CONSTRAINT "payments_dueId_fkey"        FOREIGN KEY ("dueId")       REFERENCES "dues"("id")      ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "payments"      ADD CONSTRAINT "payments_loanId_fkey"       FOREIGN KEY ("loanId")      REFERENCES "loans"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "payments"      ADD CONSTRAINT "payments_customerId_fkey"   FOREIGN KEY ("customerId")  REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "receipts"      ADD CONSTRAINT "receipts_paymentId_fkey"    FOREIGN KEY ("paymentId")   REFERENCES "payments"("id")  ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "audit_logs"    ADD CONSTRAINT "audit_logs_adminId_fkey"    FOREIGN KEY ("adminId")     REFERENCES "users"("id")     ON DELETE RESTRICT ON UPDATE CASCADE;

-- Register migrations 1 + 2 in Prisma tracking
-- (Migration 3 / chit fund was already inserted when you ran the previous SQL)
INSERT INTO "_prisma_migrations" (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES
  (gen_random_uuid()::text, 'neon-sql-editor-applied', NOW(), '20260716120226_init',                    NULL, NULL, NOW(), 1),
  (gen_random_uuid()::text, 'neon-sql-editor-applied', NOW(), '20260718090000_add_cloudinary_public_id', NULL, NULL, NOW(), 1);
