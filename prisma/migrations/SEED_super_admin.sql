-- ══════════════════════════════════════════════════════════════════════════
-- SEED: Super Admin account
-- Paste into Neon SQL Editor → project ep-patient-shadow-ae69sqix → Run
-- ══════════════════════════════════════════════════════════════════════════

INSERT INTO "users" (id, role, phone, email, "passwordHash", "isActive", "createdAt", "updatedAt") VALUES (
  'e80284be-e83a-49a1-817a-3bd39b892fb5',
  'SUPER_ADMIN',
  '9999999999',
  'omfinancedvd@gmail.com',
  '$2a$10$9RO/g8U.aByHiSan0XboFewoAZ.4mtN.vFlImJvMGR2Jeor5KdJ8W',
  true,
  NOW(),
  NOW()
);

-- Verify it worked (run this after):
SELECT id, role, phone, email, "isActive" FROM "users";
