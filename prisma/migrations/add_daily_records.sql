-- Table for Daily Records (Daily Daybook & Finance Cash In-Hand)
CREATE TABLE IF NOT EXISTS "daily_records" (
    "id" TEXT NOT NULL,
    "recordDate" DATE NOT NULL,
    "openingBalance" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "billIncome" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "otherIncome1Label" TEXT,
    "otherIncome1Amount" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "otherIncome2Label" TEXT,
    "otherIncome2Amount" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "expenses" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "expensesDetails" JSONB,
    "loansGivenCount" INTEGER NOT NULL DEFAULT 0,
    "loansGivenPrincipal" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenIncome" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "loansGivenNetDisbursed" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "closingBalance" DECIMAL(15,2) NOT NULL DEFAULT 0,
    "notes" TEXT,
    "updatedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "daily_records_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX IF NOT EXISTS "daily_records_recordDate_key" ON "daily_records"("recordDate");
