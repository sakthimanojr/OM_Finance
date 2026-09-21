-- OM FINANCE BATCH SEED SCRIPT (97 CUSTOMERS & LOANS)
BEGIN;

-- Record #1: pattu (mani)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5050c109-114b-4c68-b7da-a85d8e3e2f86', '8825696877', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd8912ab4-9dbb-4c41-b10e-ae3d10ecf09f', u.id, 'pattu (mani)', '8825696877', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '8825696877'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4c4bf15e-8347-4bc2-8e71-91e97e6074e2', c.id, 'LN-001', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-16T00:00:00.000Z', '2026-06-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '8825696877'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f11b2aba-5f8d-46da-87e3-9df24c3ec893', l.id, 1, '2026-04-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '59212ea3-3b84-4208-91d5-b8d958ca547c', l.id, 2, '2026-04-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1efdebe3-ea12-470d-a847-01e800973ffc', l.id, 3, '2026-05-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68b4d28e-882c-4d9e-9adf-741f9266a5af', l.id, 4, '2026-05-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '370d0379-b623-41b0-8144-6eb88e3e392e', l.id, 5, '2026-05-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '45be3d02-fdcf-4146-8ee4-d73d5644176b', l.id, 6, '2026-05-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f3735125-a698-4bf6-b7ff-e7682bf746af', l.id, 7, '2026-06-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a46333ca-556e-4c6d-a6f8-ded4fa9699a4', l.id, 8, '2026-06-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3b71d18c-23dc-4247-9da2-48fd89c11d38', l.id, 9, '2026-06-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '94d75f64-8312-44f7-8c9c-5a0524d02fb4', l.id, 10, '2026-06-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #2: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8dce5133-46ce-4fec-bb31-ec38bf6c6d44', '9655320968', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '5017d488-a9e8-49a6-81a3-845050f07eac', u.id, 'ragupathy', '9655320968', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9655320968'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '968afece-a658-4ed3-b899-b415e36dd9b1', c.id, 'LN-002', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-16T00:00:00.000Z', '2026-06-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9655320968'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b4509028-6fd6-47b7-9ced-e7f302a0ece0', l.id, 1, '2026-04-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f1672dab-c45f-4b3d-a205-e20bda8f2cb9', l.id, 2, '2026-04-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b94961c9-cf14-4f3c-935e-23cd6bf4af1f', l.id, 3, '2026-05-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27badd7d-3170-4a86-a4c7-79b27abec749', l.id, 4, '2026-05-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '62bf2325-293a-4e7d-a338-5758387192fb', l.id, 5, '2026-05-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ee2c8132-885b-48c4-ac2f-ccf1133dc0ab', l.id, 6, '2026-05-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '95df02ce-ee26-487a-9c85-bbfe84b345cc', l.id, 7, '2026-06-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48a2c7b2-0b8d-40b5-9997-0ed6b24912ea', l.id, 8, '2026-06-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fd03020a-be42-420c-aa1d-f62bc7a37a48', l.id, 9, '2026-06-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '604ae1e2-f4ea-4527-b4ce-8f67773afc06', l.id, 10, '2026-06-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #3: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ecc3e686-6c5e-4486-9f6e-1ca9f8bf7d6d', '9655550366', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7f497305-907a-4253-9803-b35252e7ad2a', u.id, 'venkatesan (kv)', '9655550366', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9655550366'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7ed153dc-082a-43e1-8151-037a5066abaa', c.id, 'LN-003', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-15T00:00:00.000Z', '2026-06-24T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9655550366'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ab8337ea-d784-4c4b-ad3f-cec44bb1f559', l.id, 1, '2026-04-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f1f70a4d-8619-459c-9265-553d6d7a8f99', l.id, 2, '2026-04-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0613c774-e3fd-4076-9ede-f2338f9feec6', l.id, 3, '2026-05-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fd454541-df6c-4303-a10e-df3f30f9dc3a', l.id, 4, '2026-05-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd5f05dc1-6237-4602-9d62-c179b4b0506b', l.id, 5, '2026-05-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '421f4f69-85a2-44fb-9e28-222cf0188382', l.id, 6, '2026-05-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e825e882-6fad-43ff-aef4-ae2bd7032fab', l.id, 7, '2026-06-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37ecf13c-de09-4cf3-85bf-5a2952736991', l.id, 8, '2026-06-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb7c4bd4-b15f-41f6-b176-2736557bb316', l.id, 9, '2026-06-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fe83a099-5849-4c92-8db2-9c4144a17c87', l.id, 10, '2026-06-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #4: naga (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5263b52f-a4f8-48b4-896d-ac166b7d56d8', '6383153440', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '41e624ca-2a71-4bca-85d0-370799987dc5', u.id, 'naga (mesthiri)', '6383153440', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6383153440'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '200cdf74-1d19-4f33-b72c-797c1cdda7ba', c.id, 'LN-004', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6383153440'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69a87211-9d18-4921-b61d-863a6536b46a', l.id, 1, '2026-04-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e7ca7723-84d2-47dc-8d5f-7c8e3d986f37', l.id, 2, '2026-05-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3f74672-9a17-4126-9ad1-df0669d1cf8a', l.id, 3, '2026-05-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '84c2333b-ddb9-4f4d-9ebb-71b1c6ee3b60', l.id, 4, '2026-05-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '92513655-b709-40e2-9cf8-9c0d6d37ca61', l.id, 5, '2026-05-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f8cd59cf-5b6d-4385-872d-d223647377b3', l.id, 6, '2026-06-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '721f3a6e-fb79-47bb-8684-f8e71aa5aaa0', l.id, 7, '2026-06-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd5cab9f5-0c6b-4a68-82fc-e39e0331e916', l.id, 8, '2026-06-15T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6cf25e1f-9d7a-4583-b2bb-dde8513b9e40', l.id, 9, '2026-06-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26e250a2-34f7-41ac-a560-3cfffca4a06b', l.id, 10, '2026-06-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #5: ajith aali
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('97546683-9500-4a2f-a56c-bc187319ebd6', '9100000005', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9e493563-be3e-4dee-879b-e555701dd96f', u.id, 'ajith aali', '9100000005', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000005'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '84bcb05d-dfbd-412f-a3ed-d820c3bcb07e', c.id, 'LN-005', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000005'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34b069c2-ed52-434c-94c5-7b1b197f94da', l.id, 1, '2026-04-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '95d169c6-7989-4f7c-8bff-442c727b7006', l.id, 2, '2026-05-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '40613bd4-08b4-472d-bf40-bc673a670a8e', l.id, 3, '2026-05-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e74cfd1a-28c5-46e6-8afe-3170ec97342c', l.id, 4, '2026-05-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8ca66eb-8aea-4e31-8d83-2ee897ad3319', l.id, 5, '2026-05-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '87cccdc8-d2ff-4679-a193-dc90dbb797f0', l.id, 6, '2026-06-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1f2ce6da-b3f3-4c37-80ed-dbc95fb1bf7d', l.id, 7, '2026-06-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '72ebef35-3ecd-4e47-b19b-6a3ce28f981d', l.id, 8, '2026-06-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16d6e958-80c5-4248-b2f0-969233449f74', l.id, 9, '2026-06-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '371f9eac-cf1b-4019-9687-914a131fb6b3', l.id, 10, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #6: praveen (baguti)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c63ac5f2-3952-4dc0-9725-b17e0881b7d2', '7825985142', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '1a6c4b83-ca5d-41d8-838e-ff6e6dbe5fc3', u.id, 'praveen (baguti)', '7825985142', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7825985142'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'eed69b92-93b9-4beb-92f1-ea92703c55d0', c.id, 'LN-006', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7825985142'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '50779e5e-dced-4f9d-9fd8-111134a9193a', l.id, 1, '2026-04-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b9c3d2f-52ef-4898-a42d-0a5a87e95962', l.id, 2, '2026-05-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '032c4573-7826-423c-87aa-4966a154432a', l.id, 3, '2026-05-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0823b8c6-26ed-4447-add2-a51c02876265', l.id, 4, '2026-05-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fae67854-bbb9-4a27-87ee-35916f1d2f2e', l.id, 5, '2026-05-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '87e299b2-552b-4284-af99-e1ed13012ab8', l.id, 6, '2026-06-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2c0ff399-a9dd-4e94-b83f-6dfb01fcd4d3', l.id, 7, '2026-06-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d07c496-12f6-4dcf-9abb-cc50d1e3056b', l.id, 8, '2026-06-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6c9fa9f9-133d-4479-8d08-6b753aafa87c', l.id, 9, '2026-06-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a0ef50c7-04d7-4c5d-9320-67e263b2d999', l.id, 10, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #7: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2912bbee-3dba-486d-92c1-d6b0721fd644', '9100000007', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '08806f2e-464d-472a-84e8-8423882acbd7', u.id, 'elango (pigga)', '9100000007', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000007'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '9d1db1d9-7011-4a04-be03-6d6b8335cbf5', c.id, 'LN-007', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000007'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f5feeba3-8f0f-419a-80f8-e6098ce20b50', l.id, 1, '2026-04-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dc642a9a-c306-4e3d-9471-b3480b0799fc', l.id, 2, '2026-05-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '25be12dd-c029-48b3-91a0-84336926c7bd', l.id, 3, '2026-05-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a770a212-6119-4bc8-a256-d758b7259b55', l.id, 4, '2026-05-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf490eef-266b-4a84-9189-2ad3ba65c8f2', l.id, 5, '2026-05-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99d2fc72-9bd0-4471-b556-f8e3f36284a5', l.id, 6, '2026-06-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9b53ef06-5b1b-4392-bd9b-81c139a1a549', l.id, 7, '2026-06-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0850bf91-a18f-48d9-8828-09e98f48a69a', l.id, 8, '2026-06-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0fcf8f66-93ce-4a39-abcc-80de3504da6b', l.id, 9, '2026-06-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ae4d6e7a-c320-4a23-a343-05ed67829991', l.id, 10, '2026-06-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #8: arvind (sb)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('60516409-96e6-47b8-b674-04fc6b26e9b6', '9100000008', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '0b69a0e3-d96d-4187-9fd4-12da4584b019', u.id, 'arvind (sb)', '9100000008', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000008'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '9cb762dc-37a7-41b6-9520-079784abfa8f', c.id, 'LN-008', 'WEEKLY', 25000, 10, 0, 22500, 0.00, '2026-04-25T00:00:00.000Z', '2026-07-04T00:00:00.000Z', 10, 2500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000008'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0c74243e-06dd-4e47-b55f-0d80155223d7', l.id, 1, '2026-05-02T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a66ad7dc-ee26-49f1-b564-8b45a24d5d32', l.id, 2, '2026-05-09T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c87e61c4-4330-42df-9c11-3958a546096e', l.id, 3, '2026-05-16T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dbb35f69-068b-49ae-a5c1-95c9c248c39a', l.id, 4, '2026-05-23T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2474d2b1-6dff-437e-8303-8162ce31421f', l.id, 5, '2026-05-30T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2e207dd9-9445-4fb2-90b1-ca59c889d5d8', l.id, 6, '2026-06-06T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9311a71b-b378-4e6b-8c50-4aeabaa5c067', l.id, 7, '2026-06-13T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2fc42671-9b88-4df6-8243-55bbc0401d1f', l.id, 8, '2026-06-20T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'acf4f4ff-7d05-4984-a9d2-17d7709c9bbc', l.id, 9, '2026-06-27T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54805793-3262-46f3-a4cf-916f64397b0f', l.id, 10, '2026-07-04T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #9: sakthivel
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ce254362-2257-4098-8f70-fa10061fc511', '9100000009', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e096aa18-18c4-4709-900e-26e30e35742b', u.id, 'sakthivel', '9100000009', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000009'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'bab9bc0b-d72b-490e-99e1-f0c2238bd976', c.id, 'LN-009', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-04-28T00:00:00.000Z', '2026-07-07T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000009'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7bcf7627-d657-4f2b-89f8-53a9c04d7090', l.id, 1, '2026-05-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69fb2bc7-0c3d-431e-943b-fb17e5300dd0', l.id, 2, '2026-05-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '949fbd53-123e-420c-b776-4e8c5276610c', l.id, 3, '2026-05-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7cc630ef-1c8d-48ad-8f35-a37c308abe9f', l.id, 4, '2026-05-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6ac832e1-6d1b-40ba-b8fa-8027ce1c2402', l.id, 5, '2026-06-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6d8f4ad7-040d-49f6-a655-8090054a691b', l.id, 6, '2026-06-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c282b39d-1457-449e-a36e-d53d8d73c700', l.id, 7, '2026-06-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7904840-3d18-45ab-954e-a215ebe4138c', l.id, 8, '2026-06-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a9be2269-0a93-4ade-bc2a-7aa707050e6d', l.id, 9, '2026-06-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b75fef6e-ce13-4681-9b6c-f15de6962a5f', l.id, 10, '2026-07-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #10: kisoth (sappa)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a809b0da-b0b5-4d21-8c3c-3b3d1f228ce4', '9100000010', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '33cc40b6-7519-45a8-8c38-ed77b9fcd4fc', u.id, 'kisoth (sappa)', '9100000010', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000010'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fe21c599-d67b-40fa-86be-60427a2b1d7f', c.id, 'LN-010', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-04-28T00:00:00.000Z', '2026-09-28T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000010'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1ede25b2-ab17-4f7f-b319-ff71439284ba', l.id, 1, '2026-05-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f0722f96-0eed-42ca-97b9-92997367d1df', l.id, 2, '2026-06-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'afa75dcd-73ac-47c5-b41c-649f8515eeee', l.id, 3, '2026-07-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac800ab1-d0c0-4a74-aba0-624ac4f38395', l.id, 4, '2026-08-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eaf25dc4-8c18-435f-8357-97e3635378f6', l.id, 5, '2026-09-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #11: balaraman
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5b71f26e-daf2-4f8b-a7e5-b4fa9bf580ff', '9100000011', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'eed7dbaa-6e76-4f63-ba21-3f88c47df280', u.id, 'balaraman', '9100000011', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000011'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0693f1fc-d323-4726-bbd2-4a0df2c848c1', c.id, 'LN-011', 'WEEKLY', 30000, 10, 0, 27000, 0.00, '2026-04-27T00:00:00.000Z', '2026-07-06T00:00:00.000Z', 10, 3000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000011'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b5976bde-c81d-46d3-9f61-34d6dcbe3801', l.id, 1, '2026-05-04T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '06b26ae9-d9ec-4dfa-8ef3-102298227496', l.id, 2, '2026-05-11T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd52eba3c-8787-491e-b37a-426df30a8f20', l.id, 3, '2026-05-18T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8468535d-1ce0-4eba-9b87-5e1ac9b2e4bf', l.id, 4, '2026-05-25T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2cc5e752-b99b-44e2-9c77-ed85625ae665', l.id, 5, '2026-06-01T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea5d2aa5-551f-4bbc-8174-4e637457e9f4', l.id, 6, '2026-06-08T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '403392ab-d2a0-4eed-8152-05ebd3eedef3', l.id, 7, '2026-06-15T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '58d6fd9a-0dc2-4b4d-acb7-283d2ad9ac82', l.id, 8, '2026-06-22T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3d353003-c0a0-45e6-ae12-7dd67421d5b6', l.id, 9, '2026-06-29T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27fe6060-fd09-44ca-9923-2841159282e7', l.id, 10, '2026-07-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #12: ajith (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('95d40fee-f778-4dfa-942d-6e0a74f519be', '7270276690', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'aa78c9e1-32b7-4208-bdba-e7b8fc389569', u.id, 'ajith (metu)', '7270276690', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7270276690'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '6390af89-e0a9-4b7a-a1ae-8f61a073fef5', c.id, 'LN-012', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-09T00:00:00.000Z', '2026-06-18T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7270276690'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2c05d4e9-32db-446c-bb3d-fa67c87d6c1a', l.id, 1, '2026-04-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a1920cb-1f81-40dc-b8b8-66fb84b05529', l.id, 2, '2026-04-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ce49d6ab-54dc-491c-bd21-9ac6ae9e76f7', l.id, 3, '2026-04-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '49475c39-71ad-4ca6-95a4-aa4dcd31f5ac', l.id, 4, '2026-05-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8162f75f-34fb-410b-91b7-a0e1c8f4e08a', l.id, 5, '2026-05-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '18879ded-b073-43b0-85ba-09117721de9f', l.id, 6, '2026-05-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '10807c70-1b6f-45cb-a42c-aafa050327fa', l.id, 7, '2026-05-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '08aaaf68-c667-496b-8357-663a5ceb1d74', l.id, 8, '2026-06-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb0a6e36-d142-4aec-bda3-1ce063a50a87', l.id, 9, '2026-06-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31b5ef68-c334-4273-b18d-12806c809ae5', l.id, 10, '2026-06-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #13: manimaran (laddu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1b908188-6c1a-432d-ae57-b2419ddf5897', '9100000013', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '78865102-47d0-476a-8d0a-7e1a1f5c42fe', u.id, 'manimaran (laddu)', '9100000013', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000013'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5debb696-39bb-4e48-bde7-35fda0fc968e', c.id, 'LN-013', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-29T00:00:00.000Z', '2026-07-08T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000013'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46571a20-05d0-47cc-8fb6-95bc9f78a8fa', l.id, 1, '2026-05-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f0720029-0502-4cdd-9c12-77ae1211d272', l.id, 2, '2026-05-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'acef694d-0cfb-4ab6-a24c-df4a57f79eff', l.id, 3, '2026-05-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e079178d-016b-4ad2-aaad-d01a69f59680', l.id, 4, '2026-05-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e846ddce-e16e-447a-afcc-d19ad2bbfba0', l.id, 5, '2026-06-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48590c00-b771-43d1-a7fe-c31c7818beae', l.id, 6, '2026-06-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2bb3e15f-b6e0-4d54-9138-24fba2d68b2e', l.id, 7, '2026-06-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0fae4938-8746-4398-823d-69af1d3e9391', l.id, 8, '2026-06-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c3fa92d-43fb-4879-b5d3-8b8b8fc9ba81', l.id, 9, '2026-07-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '15ff264f-f742-4fd9-80b5-9b63ef1dbdd3', l.id, 10, '2026-07-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #14: yuvaraj (goindthan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('9ddaf732-5e0f-4af2-a271-ec9c5e6e3803', '6383032175', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '24d8a42a-f05e-4020-9461-41547f8e0ac7', u.id, 'yuvaraj (goindthan)', '6383032175', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6383032175'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '29a86efe-43e5-4e75-9a75-3b25067adc4c', c.id, 'LN-014', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-07T00:00:00.000Z', '2026-07-16T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6383032175'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dba6f379-f4c6-4128-8a80-0e052fd2f28e', l.id, 1, '2026-05-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6d60000-f4cd-4a88-bd44-3e7ddfafff37', l.id, 2, '2026-05-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f8e3517-e0a0-4907-b107-ae6e8ac1b6b0', l.id, 3, '2026-05-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7efa70a4-541b-4c36-b676-28ff93dc1458', l.id, 4, '2026-06-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '79922af9-e348-420a-bc16-cc09492e4549', l.id, 5, '2026-06-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3df7c774-5ed7-4523-a0f8-a2dcea2741ce', l.id, 6, '2026-06-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e49d4a6-7e68-4b49-8e84-43fd2f77fa28', l.id, 7, '2026-06-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1cebcfee-dde0-42e7-90df-f45b6faa54d2', l.id, 8, '2026-07-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5dc8d5a5-6e99-4da2-a4a7-d5b78117f810', l.id, 9, '2026-07-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8992fc4-3acf-4d30-9ae0-a48b60d8da9f', l.id, 10, '2026-07-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #15: Dayalan (manda)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('07f6c844-ea26-44b1-840b-70c5ce7e61f3', '9100000015', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9bbd547f-98ec-4be8-8215-c895ed892dd8', u.id, 'Dayalan (manda)', '9100000015', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000015'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '12b4bf01-2696-457b-9cfe-12c3648fd9f6', c.id, 'LN-015', 'WEEKLY', 6000, 10, 0, 5400, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000015'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b775364-94f1-4468-84e2-fddad0cf32ec', l.id, 1, '2026-06-07T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '50bc33ca-4c5f-406d-99be-541bed223810', l.id, 2, '2026-06-14T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fdff094e-7837-475d-b915-09f36b316573', l.id, 3, '2026-06-21T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8f0afef-1334-44ae-a918-915b45a48219', l.id, 4, '2026-06-28T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c3a9c39f-8508-4d8f-b99c-1038f5e7607a', l.id, 5, '2026-07-05T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c782c4b-e2b2-4918-9958-9a1f248b5a33', l.id, 6, '2026-07-12T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '14f9f9fc-5b3d-48fd-b739-c68c0db34bbb', l.id, 7, '2026-07-19T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a336af75-9ca9-4ca2-b20b-bf1c6b2ce896', l.id, 8, '2026-07-26T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a165616e-9d7c-4cca-aa52-2543ed3b0467', l.id, 9, '2026-08-02T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9f961d0e-62eb-462e-a43c-cbf14373f43d', l.id, 10, '2026-08-09T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #16: Mani (Jolly)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('83779b22-466e-4be0-bd00-39521dd8ea73', '9345396573', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b5a9f210-a10a-4764-9626-c23166d2d3f2', u.id, 'Mani (Jolly)', '9345396573', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9345396573'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '51a14d69-eb84-41ea-9f7d-4c9225caa5d6', c.id, 'LN-016', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9345396573'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c1293753-f9af-48cc-ac83-3618464bc746', l.id, 1, '2026-06-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '311ea4a6-ff02-43ba-be87-6d1bc986e06b', l.id, 2, '2026-06-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a125c0a9-308b-4b60-95b1-e710491de2ee', l.id, 3, '2026-06-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2faca00e-b59b-4195-958d-12b54b56c331', l.id, 4, '2026-06-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7388412f-d20d-4924-9a5c-d92551bebc52', l.id, 5, '2026-07-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f063689-9a24-40ff-a486-917c0f43286e', l.id, 6, '2026-07-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5fd23fdc-f31b-4e9f-b7d1-ae8d38c52482', l.id, 7, '2026-07-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99b733bf-d9fb-4559-a295-4462e53130de', l.id, 8, '2026-07-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0d5c2039-6c98-4b89-8723-1e2c2691a3dc', l.id, 9, '2026-08-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '30dd9d00-2776-4788-84c3-b4b40d80ebcb', l.id, 10, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #17: Ashok
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('e759f1f4-5219-4401-a551-e70fb064f75f', '9100000017', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '35d7f365-9c7f-4fb2-9a0e-b3de1cbbd464', u.id, 'Ashok', '9100000017', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000017'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8b18875e-8b7e-4d21-b3ba-00f744cd54e7', c.id, 'LN-017', 'WEEKLY', 35000, 10, 0, 31500, 0.00, '2026-05-21T00:00:00.000Z', '2026-07-30T00:00:00.000Z', 10, 3500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000017'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54f45c15-d2db-4a68-a85d-9e24f62a62da', l.id, 1, '2026-05-28T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'de947dc9-52c7-4573-a636-91d11db9b88a', l.id, 2, '2026-06-04T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '353eceae-e017-4e74-8c94-87dd698b8d6c', l.id, 3, '2026-06-11T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '341d2782-b61c-4285-add7-9d31bf3230a7', l.id, 4, '2026-06-18T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f6f705bb-9786-454e-bc7d-c8ee33684100', l.id, 5, '2026-06-25T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f745ed4-aba2-4b96-b772-32719cc2e269', l.id, 6, '2026-07-02T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5ba694bd-fc8a-462c-9576-0ba7e033d7d5', l.id, 7, '2026-07-09T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aee6eaef-e5e3-4944-b597-9265f1657d72', l.id, 8, '2026-07-16T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e6d12bb-40cd-45cf-b7e7-93d5dbcdaa6d', l.id, 9, '2026-07-23T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd44b9c90-488b-4d06-809f-8cf5803ff281', l.id, 10, '2026-07-30T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #18: Raj (rice)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ea5e6b0c-907a-43ef-a7fe-bad7ef01f10c', '9100000018', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a7257110-ff05-45fb-bbee-6355c0fdccdc', u.id, 'Raj (rice)', '9100000018', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000018'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f42dd734-c10e-405f-bcd4-91a017df147b', c.id, 'LN-018', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-05-20T00:00:00.000Z', '2026-07-29T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000018'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '53a5429d-8bdc-4217-b4cd-f14d8aa0f935', l.id, 1, '2026-05-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '44864b3c-0cf3-4234-b3bc-d0b7f704243b', l.id, 2, '2026-06-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cacfa29f-b674-4ce3-8b24-bd23e051b70a', l.id, 3, '2026-06-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '15e17f92-c2ef-4fe2-a17d-7dfa7db251e0', l.id, 4, '2026-06-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c571b9dc-ad2b-475e-8275-8daae0900fbe', l.id, 5, '2026-06-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26c49be1-9870-4aed-bc30-48cd059e4a6f', l.id, 6, '2026-07-01T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b8b2f501-a82b-4a1a-b887-d8db042b9e05', l.id, 7, '2026-07-08T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b004b370-5b01-49a1-a93a-a32e965c1112', l.id, 8, '2026-07-15T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dd332971-ba51-42d7-888a-8524fc5df013', l.id, 9, '2026-07-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd3f3c90-3b97-46b5-8244-c1e80e21a2bc', l.id, 10, '2026-07-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #19: sakthivel (mangalam)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('fb27a75f-d5bc-426a-bde8-f000bea172b1', '9848757747', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3438e7ef-3c3f-4abf-bbe1-db4af765efb5', u.id, 'sakthivel (mangalam)', '9848757747', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9848757747'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'dca49e39-8a9f-44dc-90b0-d776afd83b9d', c.id, 'LN-019', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-16T00:00:00.000Z', '2026-07-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9848757747'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '35a2b530-0fea-4e68-9e2a-3410c107f824', l.id, 1, '2026-05-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ddfaa102-1681-4eeb-94e8-2bb1ebd7eb05', l.id, 2, '2026-05-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a5f8b7e-871b-473a-b4db-266ab433144d', l.id, 3, '2026-06-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '633b1ffd-d020-4eb6-9e12-5ee47be05d12', l.id, 4, '2026-06-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7d2734f5-d970-4ee5-b8d8-972fee223b2f', l.id, 5, '2026-06-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9360cb1a-b93b-4587-b0f5-bc5cf94eef0c', l.id, 6, '2026-06-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9fd535c5-314e-4bca-a6fd-255e897ac3fe', l.id, 7, '2026-07-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1fb47633-243d-47af-8527-c622e3e8230c', l.id, 8, '2026-07-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bab28d03-68b7-4287-9727-0e9b4eaf6b43', l.id, 9, '2026-07-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'faf69cc4-c55a-47c5-b2bc-8b4249ff88c6', l.id, 10, '2026-07-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #20: murugan (painter)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5f29f334-a5b8-4997-881a-5dfab351d381', '9843173422', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6875ebaf-247d-45f3-a5b9-7a76fc5d2d21', u.id, 'murugan (painter)', '9843173422', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9843173422'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7083d0a2-5d18-4397-a693-83b2664610d8', c.id, 'LN-020', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-16T00:00:00.000Z', '2026-07-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9843173422'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47e84efd-ea6b-4069-a5d4-e55e2c841f3f', l.id, 1, '2026-05-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aab6f592-492b-48ef-9499-74be62acd117', l.id, 2, '2026-05-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8902ecb-a122-475c-b417-ffd39fd38cb8', l.id, 3, '2026-06-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '65b08308-3929-4c38-b7da-6308f7762008', l.id, 4, '2026-06-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '28baedaa-a925-40f8-9817-487f51a067a0', l.id, 5, '2026-06-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '101d86b9-e443-4055-8402-2e26e44ef9be', l.id, 6, '2026-06-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54561328-7172-4fed-966f-79b05eee03fa', l.id, 7, '2026-07-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99bfe3e9-7e84-4afe-b184-15c336e7ba2c', l.id, 8, '2026-07-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8271e063-7ed1-403a-b553-57079c493bd2', l.id, 9, '2026-07-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e0998a46-3020-4ef1-b401-af7a98f8c248', l.id, 10, '2026-07-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #21: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c939dd9f-7f9c-4238-b673-ec1cd5488259', '9100000021', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b394bc42-837a-41f4-afbf-16a4d1ac2b9d', u.id, 'raghul (naren)', '9100000021', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000021'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '83d5ab25-bee5-42bf-9945-cf132706d2d2', c.id, 'LN-021', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-21T00:00:00.000Z', '2026-07-30T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000021'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8978d57-dee2-4d17-852a-0917628be64f', l.id, 1, '2026-05-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eea65c60-373f-472f-a01b-a3a74c7e1b5e', l.id, 2, '2026-06-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8e52cdb-8d2a-4c56-a4b5-8861796e6abb', l.id, 3, '2026-06-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48747bc1-2659-4565-af00-bcb48a54ed1d', l.id, 4, '2026-06-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8903dbab-cdd1-46ea-a433-2d1d0cda4c42', l.id, 5, '2026-06-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e562e029-6f68-4b83-b662-5ae20c3b7149', l.id, 6, '2026-07-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '984c3e9a-6eea-428d-a3fe-13364c832791', l.id, 7, '2026-07-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99aa6644-6df8-4484-945c-39dee2f36416', l.id, 8, '2026-07-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f65125f-6fd4-46e1-865f-7f0023841a42', l.id, 9, '2026-07-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c35a5a67-6f8a-4b52-9f17-4d2f302dfccb', l.id, 10, '2026-07-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #22: Jai (pichai)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ddd8b6a0-29b1-4f33-89d6-a18ccf237693', '9100000022', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ae423959-4e6c-4d16-a498-7d625494f5f5', u.id, 'Jai (pichai)', '9100000022', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000022'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4aada59a-7c5a-43ea-9e56-e11992f04329', c.id, 'LN-022', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-23T00:00:00.000Z', '2026-08-01T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000022'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8b9e0b39-6a8f-4778-8e21-824b0ab1a132', l.id, 1, '2026-05-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8bef74d2-05a7-44c6-853f-80e18ace4a2e', l.id, 2, '2026-06-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'baa6e550-c5ea-4798-ab5c-d386403ca3ff', l.id, 3, '2026-06-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1b5abc2b-2127-49fb-a5a5-bc5f7bc3e5a4', l.id, 4, '2026-06-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c18244fa-53e9-40ad-b867-566554bde7b4', l.id, 5, '2026-06-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '945d1ad0-c8e1-4141-b573-9530230f5c3b', l.id, 6, '2026-07-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '043b332c-0804-466a-9f53-348b94fa26bf', l.id, 7, '2026-07-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '96396268-93ac-4606-a22c-e617904da1cd', l.id, 8, '2026-07-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ca2d2f72-f8a3-4290-b781-236c4205f548', l.id, 9, '2026-07-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb535b46-465b-407c-8396-711f70a2b9ee', l.id, 10, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #23: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a77bc42d-865c-406d-b64e-980ba8db313f', '9100000023', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b9197ab6-1fd9-4f80-8a03-3e3938ae5130', u.id, 'ragupathy', '9100000023', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000023'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '91c541fe-fbfd-4b22-b774-30cbb20241c8', c.id, 'LN-023', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000023'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9da31812-02fa-41d3-9ec7-3a85a1f9a6c1', l.id, 1, '2026-06-01T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb123ac3-d99c-4ed0-a31a-5f6ee5e95ac5', l.id, 2, '2026-06-08T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb85644f-d9d8-4698-b6fc-323e9e7d60cd', l.id, 3, '2026-06-15T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3da8a84-126c-4b3b-890d-629adad5a569', l.id, 4, '2026-06-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '293ee796-1b43-4c85-9501-2f1046d840e4', l.id, 5, '2026-06-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7df1377c-6b47-41ab-8e52-bff0b54899b3', l.id, 6, '2026-07-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54039d29-4162-408f-8e69-88a57f2f1120', l.id, 7, '2026-07-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61adcf32-fe3b-4727-90d5-8ab1f1d4ad8f', l.id, 8, '2026-07-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1a15c714-b0e3-4616-90a6-5724b75646f1', l.id, 9, '2026-07-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd534cc8-fc88-4c3e-82f8-368b1d09a470', l.id, 10, '2026-08-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #24: ranjith
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('98c4d7f1-48d6-416f-8be5-4cfc61e7fbb2', '9100000024', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '50a1cbf8-e0fd-4fda-98c6-51f7b305d087', u.id, 'ranjith', '9100000024', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000024'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd9df3cef-8f1e-4cd8-8d7d-66464cc43dc9', c.id, 'LN-024', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000024'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eca08ed5-b2ac-452c-9f90-12d1180e451c', l.id, 1, '2026-06-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b605959f-1c5b-4f04-9e40-b915142bb5ce', l.id, 2, '2026-06-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2dc41984-d48f-48d3-9257-3ed239856207', l.id, 3, '2026-06-15T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f89e2ff-3a6c-4eaa-89ce-6a3d76faf974', l.id, 4, '2026-06-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '370fe3db-30de-4c1f-a188-6c821b62eae7', l.id, 5, '2026-06-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1ec74873-d381-4d03-a6db-34aa68a69992', l.id, 6, '2026-07-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '531269a5-1435-40c8-ba18-7f892ebe8885', l.id, 7, '2026-07-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4076f768-3c8f-46a3-a970-6c6588c4b8ec', l.id, 8, '2026-07-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eebdb824-3aba-4e1e-855b-4c050bbc20e2', l.id, 9, '2026-07-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a54c8081-07fe-4c02-b1af-5149514af7b2', l.id, 10, '2026-08-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #25: Shanmugavel (KP)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ea43c8fd-9a26-4a2c-a60f-42b0e045026b', '9100000025', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '60e9141e-cc3a-4c11-b821-3b9555a76521', u.id, 'Shanmugavel (KP)', '9100000025', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000025'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'bb545abd-94d3-4e52-91b4-4b324dc66f0d', c.id, 'LN-025', 'WEEKLY', 35000, 10, 0, 31500, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 3500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000025'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c7150097-8c4a-4103-88ff-2659df8f7b50', l.id, 1, '2026-06-01T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48759af9-1374-40f9-ac9d-b2f0bb5c7279', l.id, 2, '2026-06-08T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f1ff60d-b6ae-4300-b177-c7f6b5a1423e', l.id, 3, '2026-06-15T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '12f79fea-04b5-4591-b83f-3cd7db36f5de', l.id, 4, '2026-06-22T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cc62971c-8c5a-4a12-b537-8b077329d23b', l.id, 5, '2026-06-29T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99ace527-4fec-4052-8f7a-8dea5d77d6be', l.id, 6, '2026-07-06T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff27813a-1193-40ac-9783-5a7f8207314d', l.id, 7, '2026-07-13T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ee6580d8-31ad-4ec1-8cd1-52b40d949921', l.id, 8, '2026-07-20T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bcd48985-b2ab-44c2-a6f6-d8184ce3acb8', l.id, 9, '2026-07-27T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e20cf06-3a03-404f-b027-42b1a447778e', l.id, 10, '2026-08-03T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #26: mani (tails)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c95e378e-f243-4f8b-b8e8-5c5b04332805', '9100000026', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '4515f78a-dad7-4d9c-b5ea-409b456614f2', u.id, 'mani (tails)', '9100000026', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000026'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '389bd597-d04b-48b0-a9e4-2292b9cfe1ad', c.id, 'LN-026', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000026'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d894aef-2eda-420c-882e-4cabe0362a1c', l.id, 1, '2026-06-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1bfc7382-b27f-446c-8cae-119ce1a0e682', l.id, 2, '2026-06-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f9da8c8f-4b2b-4551-a458-aab7ec297aa5', l.id, 3, '2026-06-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f55242b-1061-4cec-a8be-ea150f0c86eb', l.id, 4, '2026-06-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4ecdf8b7-9c79-45fa-b115-e98b7e050b08', l.id, 5, '2026-06-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3fc144cc-e727-4aa1-bc6a-7238674c5adf', l.id, 6, '2026-07-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fc032d53-5029-475d-88f2-f2d7b15b5ccc', l.id, 7, '2026-07-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a554c98e-e535-4868-ad4e-e2488fa319e0', l.id, 8, '2026-07-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3186b1b4-8292-40ca-b1ba-9dd3e7d94bda', l.id, 9, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f6198cb-483e-41e8-92f9-c97c64008d1a', l.id, 10, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #27: praveen (baguti)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('769a674b-8555-4ce0-a70f-e97b0a00ae49', '9100000027', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2aa8fa14-5df2-451b-9b82-762f70e946ce', u.id, 'praveen (baguti)', '9100000027', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000027'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '45522702-c05f-4147-a8b6-e65bb8d3ec74', c.id, 'LN-027', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000027'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a053b025-2b83-4f39-9074-1124ff7892c4', l.id, 1, '2026-06-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cdcf86c8-8ab5-4c4d-b426-9f8541077f10', l.id, 2, '2026-06-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2e489b6-e6fd-460c-bfa9-491d877a7b11', l.id, 3, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55c9bd0c-284f-4ef9-927f-18b32d0b6a3a', l.id, 4, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2247f40e-a485-4410-8025-bb92e0a92c99', l.id, 5, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3d89b3a5-da3b-428b-834d-38ac84fe22b4', l.id, 6, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '746213b8-2444-4db7-aaca-a6192ab439ca', l.id, 7, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c74fdce1-65e3-4185-bedc-3c189b940323', l.id, 8, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c846333-1a42-48b0-8750-d1476a2ab390', l.id, 9, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5b29433a-7308-45f9-b5cf-47fcc35fc757', l.id, 10, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #28: arunachalam (master)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('97b8ffe5-ce38-40db-bbe6-e8fa7100fc0b', '9100000028', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '26217eee-214f-42b7-ac32-4ce3f4cbc771', u.id, 'arunachalam (master)', '9100000028', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000028'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'baa73662-2039-4179-8e19-a91d4c8839c2', c.id, 'LN-028', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000028'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7932798d-b60b-494d-8b01-496142793da9', l.id, 1, '2026-06-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b912fff0-9d2f-4017-b00a-b5e7a1f82c15', l.id, 2, '2026-06-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff0ed796-d9f7-4408-9c65-a18282f58676', l.id, 3, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '326512b9-e29a-4951-8dcc-b0fa6e4dad3f', l.id, 4, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5efa87e8-5d96-4b73-8d9e-1273944d1189', l.id, 5, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ed89b17d-d154-4f4b-bc81-d3c2a9356401', l.id, 6, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f58c6dea-7f58-4739-a216-5aa4a799b7d3', l.id, 7, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '41be170c-9161-4ce2-9370-1f9c87db3b4d', l.id, 8, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a7a6052-279f-448e-8241-1cad67e8bb03', l.id, 9, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9f0c4e75-0c54-457a-8532-793c9710e665', l.id, 10, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #29: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a5960014-67d0-4fb2-8030-3ce22c1c10ba', '9100000029', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '35abd52c-213e-444c-b63e-164f13aa6b69', u.id, 'ajith (aali)', '9100000029', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000029'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0f413ae1-33c8-42c1-bd3e-491ec41ceeaa', c.id, 'LN-029', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-30T00:00:00.000Z', '2026-08-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000029'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '317f6321-5fee-4205-b2df-2894c674ad66', l.id, 1, '2026-06-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '421e161a-903c-4cbe-aebf-c449894fc2b7', l.id, 2, '2026-06-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '494cf87a-5af5-45df-975e-1a754f8d3e4f', l.id, 3, '2026-06-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0cce0d5e-0f25-4f7f-8804-1f0d27c66139', l.id, 4, '2026-06-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c96abdd-52b3-4e8c-a5cc-6d1bcd4fae1e', l.id, 5, '2026-07-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bbc3317a-7b0e-40ed-b958-ed3508184307', l.id, 6, '2026-07-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c115262-11c4-49d7-9d19-5bbbbcb6ceae', l.id, 7, '2026-07-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9131d1d9-ffe2-452a-9af0-4597c8f3d2f5', l.id, 8, '2026-07-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c5cee312-b649-4db5-80b4-95fcc8053df9', l.id, 9, '2026-08-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f60e86ac-93b6-4cf9-ba42-c0fc3c49f50f', l.id, 10, '2026-08-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #30: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c3b84c17-dac1-4222-935a-ef7c2acd8178', '9100000030', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a029d71f-d244-4bc9-8cf1-629bc48f4713', u.id, 'vicky (metu)', '9100000030', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000030'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'df6ded60-8ce6-4314-9508-058795af31c1', c.id, 'LN-030', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000030'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '623202b8-f058-41fc-bd6c-851dc1defac9', l.id, 1, '2026-06-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2f15c806-c4d1-4a47-a6de-f19320a2f0e9', l.id, 2, '2026-06-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77552f53-0c00-402f-b4d8-e6a243304f76', l.id, 3, '2026-06-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff30b16f-f096-44f7-9de5-10e7188de92e', l.id, 4, '2026-06-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f9afeffd-57bc-4953-98b7-1489e3171dc9', l.id, 5, '2026-07-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '070006fb-c83e-4d68-ba47-d51eedff700b', l.id, 6, '2026-07-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47038db5-db96-4354-835d-457514d0321c', l.id, 7, '2026-07-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6aa4676c-d24f-46ce-85c4-5b4a57cb8964', l.id, 8, '2026-07-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4f760bd4-7923-4701-8553-282659770850', l.id, 9, '2026-08-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b6da1122-009f-47ba-84e3-47d6c45d36df', l.id, 10, '2026-08-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #31: yuvaraj (3)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('cbd875f8-c16e-4cf7-b471-ba26486211b6', '9100000031', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '252f382e-75d8-4d87-89fa-3080593f33df', u.id, 'yuvaraj (3)', '9100000031', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000031'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4daa8c2a-e902-4e5b-a4a7-39fc53c02a4d', c.id, 'LN-031', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-06-06T00:00:00.000Z', '2026-11-06T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000031'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c00869b5-305e-436c-bc38-9eb7b30794f1', l.id, 1, '2026-07-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '73c67c73-3a33-4b1c-ad03-cadece497ea9', l.id, 2, '2026-08-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aaf1a60e-837e-4eb5-9824-6c8a2d5f4c8a', l.id, 3, '2026-09-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '572290bb-42a0-4148-ac7d-55a1e8fdafb3', l.id, 4, '2026-10-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dbad8d37-49ac-4ae8-9a89-3d7c373523e9', l.id, 5, '2026-11-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #32: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('85059a61-7862-4396-8f1a-18d6ffb279bc', '9100000032', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '5d0a4f12-61ce-456c-89d3-3f6ec9c891e2', u.id, 'ragupathy', '9100000032', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000032'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '3d426c95-9669-4913-8e91-a23f237a5144', c.id, 'LN-032', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-09T00:00:00.000Z', '2026-08-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000032'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '22e78f36-5ed0-49d5-8360-a6520ae5e487', l.id, 1, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '300d3491-e2e5-4772-bb1e-397d8807ad08', l.id, 2, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'efaf3476-243d-4537-9f20-dba9fb2e52fa', l.id, 3, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2a6e544b-a18d-4152-8826-a2d7c32bea5a', l.id, 4, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '07d7702d-37e5-453e-8308-0ea431f7bfb5', l.id, 5, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9501ddc8-99f7-44be-9e3b-0e3424262621', l.id, 6, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8b2ccc90-4487-4105-857c-ae7e88a405c3', l.id, 7, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c81f964-48a4-4832-be84-bd7ecf1fd8e3', l.id, 8, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a694ab05-e408-4249-9ee4-39db99479431', l.id, 9, '2026-08-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ee378553-10d6-4f5b-b630-54a55b41db2f', l.id, 10, '2026-08-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #33: babu (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7f619e73-b502-401d-9b3a-cd5d1e236ec8', '9100000033', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a6d5fcac-4360-4d7e-ad94-f4b3fc994045', u.id, 'babu (metu)', '9100000033', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000033'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd2026d44-8e3e-4ddf-9ee7-8d76ea88029e', c.id, 'LN-033', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-06-13T00:00:00.000Z', '2026-08-22T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000033'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a3f9a3be-736c-4d23-973b-29ce05d5ff96', l.id, 1, '2026-06-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ad2141e0-107a-4b1b-960d-c49ca2ce4ddd', l.id, 2, '2026-06-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9366fc89-43f5-4b11-8ce8-6822a3ce9ae9', l.id, 3, '2026-07-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '503c7b65-e9ee-431d-b4f7-adef9b1a472a', l.id, 4, '2026-07-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c3acc5ce-4b32-4f7c-a492-51fc19817933', l.id, 5, '2026-07-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e53ed311-9511-4783-b1a5-9cc9c0237366', l.id, 6, '2026-07-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b77307f7-cf4b-43df-a854-12b2905e3368', l.id, 7, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7b81b19-6a84-4712-bc1f-5769e0f7212c', l.id, 8, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ebc32227-8abc-4dae-bbd0-6c2ff9a60e36', l.id, 9, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd4fcce3-58ff-4219-9e8f-72f7fe294d34', l.id, 10, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #34: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('63a8be23-0324-4e5e-b247-73ab5cfdc2cd', '9100000034', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd4c952dc-4b8a-44fa-9f82-8b1121119a54', u.id, 'venkatesan (kv)', '9100000034', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000034'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fe4a9ca4-59a2-4183-8ba5-be76a17a1cfb', c.id, 'LN-034', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-14T00:00:00.000Z', '2026-08-23T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000034'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d8c279f-251b-4205-a809-07ffdd7acc2f', l.id, 1, '2026-06-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26d72b44-60d4-4a99-975e-b0505546122c', l.id, 2, '2026-06-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b08ce39a-75a2-4b29-85eb-2d38c56935b5', l.id, 3, '2026-07-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9e35ecc4-9092-4ff5-8351-36608a16928c', l.id, 4, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5d93256f-a79c-467a-b36e-0a15bf733291', l.id, 5, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '56b42260-c265-4b8a-bf9d-8ab2fe3cdc82', l.id, 6, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e10e8bb5-6d71-4a87-97f8-f987e3f15ffd', l.id, 7, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8272b469-f6bf-4d41-b1f5-915fae04f42c', l.id, 8, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8021a671-bac1-47c8-bb98-6ecbdbd25a3d', l.id, 9, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea50c6d6-a6c7-41b6-b7ea-c7258e67ce2b', l.id, 10, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #35: Ashok
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f9893ac1-f3c8-4ae2-bab6-411b88d140cd', '9100000035', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'fbfc7ccf-f92a-475f-b910-91370888952c', u.id, 'Ashok', '9100000035', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000035'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ab93cddd-83aa-4852-bd5d-236273fd4047', c.id, 'LN-035', 'WEEKLY', 3500, 10, 0, 3150, 0.00, '2026-06-15T00:00:00.000Z', '2026-08-24T00:00:00.000Z', 10, 350, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000035'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4f40a1e9-37a0-4cab-a02f-54f384babf31', l.id, 1, '2026-06-22T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f32f040d-bdcd-4c05-9692-9c105910e42a', l.id, 2, '2026-06-29T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61ef0e71-0732-4fac-84a2-d89edbbb3179', l.id, 3, '2026-07-06T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb784751-10cd-410b-ab9c-de7e40be4838', l.id, 4, '2026-07-13T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '63fa8990-b96e-43f9-a6e5-be061e5389f4', l.id, 5, '2026-07-20T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '60691472-193d-4489-b035-9be5fe3d03a7', l.id, 6, '2026-07-27T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1112c3f1-e679-4cc2-833a-664101324965', l.id, 7, '2026-08-03T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '734bd4e5-2f17-4038-963b-b5fdc8ec730d', l.id, 8, '2026-08-10T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b00b021b-0ca7-44f9-875e-db1c054adb84', l.id, 9, '2026-08-17T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a378164f-1b12-491e-b732-6ab926bb4059', l.id, 10, '2026-08-24T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #36: balu (tha)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d794fe29-dbc8-45fe-9369-3529697f6631', '9100000036', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7f310c4f-4edb-4b3a-ae20-4e8c2e962292', u.id, 'balu (tha)', '9100000036', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000036'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fd808f94-ea63-4952-bce1-feaaca8a907a', c.id, 'LN-036', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-20T00:00:00.000Z', '2026-08-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000036'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7953f15-1759-4c7a-9d76-277541898a1a', l.id, 1, '2026-06-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b967a08a-8461-4991-b54e-b9c85168f925', l.id, 2, '2026-07-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f0acd9c-2b14-470a-a3a7-c63168fef3f4', l.id, 3, '2026-07-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '49b38cf8-4e35-4a4e-954b-3f95a951fb35', l.id, 4, '2026-07-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b381a6a0-e146-4f66-ba10-a81fcd64fee5', l.id, 5, '2026-07-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '514685d2-8707-42ad-98ad-2216f35fa883', l.id, 6, '2026-08-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c6993ae8-2168-42a0-8f46-df5963824d63', l.id, 7, '2026-08-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9b0aa249-1b6e-4c9a-afcf-941a2a7154e4', l.id, 8, '2026-08-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '806e6b9e-74b8-453f-a8f3-b4cc3db5906f', l.id, 9, '2026-08-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff4615b7-1819-4400-8875-d3050075e95e', l.id, 10, '2026-08-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #37: bass (khan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d7eac8d7-1786-49b2-8035-bd1d7d9e40b5', '9199566430', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ad164984-2369-4c38-9cd3-4672709be959', u.id, 'bass (khan)', '9199566430', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9199566430'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '08edb696-5f10-4e9b-87c4-eb87d2b85cec', c.id, 'LN-037', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-21T00:00:00.000Z', '2026-08-30T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9199566430'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd613cfce-1e04-4921-b6cc-24ae788d2741', l.id, 1, '2026-06-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '67e2e77b-2426-40d5-9e4d-832935560e75', l.id, 2, '2026-07-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3b167c05-afea-4558-9bf5-3413c53db86c', l.id, 3, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31543668-dcb7-4702-9b1f-d57e54a4a8ab', l.id, 4, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '203a5f25-bb32-425d-9dc5-134b6f0af32f', l.id, 5, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27ccf708-b52b-44d4-94fa-7ab88bb92f6f', l.id, 6, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7258f704-ba3f-40e9-8fd3-9be472c3a51d', l.id, 7, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5d192f0e-f9e4-47b4-8f76-7c3b0508d417', l.id, 8, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'afc226ff-8139-4b11-944f-b57d577938e9', l.id, 9, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0aa302ae-1f01-4c49-a5cd-bd232da1b9ff', l.id, 10, '2026-08-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #38: Balamuthu
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4063f175-35b0-473b-8ac8-0fdb25d7be98', '9100000038', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '39817d06-ba4c-44fa-b09f-c734a1718b77', u.id, 'Balamuthu', '9100000038', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000038'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '469e1984-4897-498d-97a1-e63eed2c2657', c.id, 'LN-038', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-21T00:00:00.000Z', '2026-08-30T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000038'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '25bae36a-3dfd-44a1-a07e-baee222fef4c', l.id, 1, '2026-06-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c86c143a-2c21-4e70-bd70-09957cfbaafd', l.id, 2, '2026-07-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '19e759eb-4a2b-490b-9f52-4920ded30160', l.id, 3, '2026-07-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a0cd0ffb-deaa-4e7c-a2a8-c77e7b0cec6f', l.id, 4, '2026-07-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '188bf7e2-8e57-4e38-92e4-24f7f2fb0086', l.id, 5, '2026-07-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a743115c-c2d0-4c5e-a4a9-ca900a5e8ee7', l.id, 6, '2026-08-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac01e9f0-c7dd-4986-b1f4-0f2bd92d3749', l.id, 7, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '22106f9b-9deb-4440-a7dd-1b24153a6077', l.id, 8, '2026-08-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b638b1e-530e-4ef9-8e63-0965752888a8', l.id, 9, '2026-08-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '79898cea-aade-427a-8936-1e7dfb3fe089', l.id, 10, '2026-08-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #39: simabu (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a30e9483-965b-474d-8211-cb32deacbc39', '9100000039', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'cd0adaa8-037f-4600-9670-c408c6ce63c3', u.id, 'simabu (kv)', '9100000039', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000039'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1c64bedf-c16f-4aac-a3a9-d1cff3d05c10', c.id, 'LN-039', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-22T00:00:00.000Z', '2026-08-31T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000039'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'acdfdda8-f4fe-4ccf-a6d1-2c5861d770e4', l.id, 1, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b7806e60-e982-457c-a890-a00be8ec7db4', l.id, 2, '2026-07-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'da5ad366-8a24-4d08-92c7-be03c062fcb3', l.id, 3, '2026-07-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '162796e7-1dc1-4fa8-920d-b9c9768790ae', l.id, 4, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bd3c233d-fd06-4a2f-9b21-a9bc1f1c5b4e', l.id, 5, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '58410826-54b4-4ca0-9e41-fb04817b17a8', l.id, 6, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cc2cecc9-d375-4445-b3ac-706faca39f59', l.id, 7, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1ff0563-e423-4136-9529-af7538f2a9a6', l.id, 8, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27a2f68e-853f-4490-8845-e0dfba720b0e', l.id, 9, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2572305f-d968-46b6-a443-a884bdaff277', l.id, 10, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #40: madhan (makku)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('135af0a6-d246-45f0-894c-42be06ad41bf', '9100000040', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f37fd716-6251-4e05-b4cc-70cf45b0a780', u.id, 'madhan (makku)', '9100000040', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000040'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '78868574-16f1-4ea7-8030-fd235bd2d5bd', c.id, 'LN-040', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-26T00:00:00.000Z', '2026-09-04T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000040'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '068dcee3-239c-49ae-9842-3c0484118ded', l.id, 1, '2026-07-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6e7f0cb9-11e9-4cf1-8e19-4581dce8b99d', l.id, 2, '2026-07-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8ebac7cb-4b8d-44c1-943c-d3e71b15b225', l.id, 3, '2026-07-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '30b8c712-1115-403f-8b1c-425709508f87', l.id, 4, '2026-07-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9ad7e603-1763-4fa8-9b23-a9b2ce24d2f6', l.id, 5, '2026-07-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '33ddd121-b47e-4ca3-a3ee-a763d3f4e252', l.id, 6, '2026-08-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '52c479ec-c5d8-4a87-8779-8ffe7e95cf8d', l.id, 7, '2026-08-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5b1e8c9a-793e-4130-aaf5-75f94eb11b9d', l.id, 8, '2026-08-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55609899-97b6-4bd2-a74f-a83ce58e67f7', l.id, 9, '2026-08-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c29111af-e91b-46e0-b0cf-c056c7258173', l.id, 10, '2026-09-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #41: magi (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6750336c-09cb-4a10-a7ca-6d521b1b80af', '9100000041', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '78c7c97e-cb75-43fb-9867-4734678dd28f', u.id, 'magi (kv)', '9100000041', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000041'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'e4baa469-2e44-442b-972f-4a48da3b8fa0', c.id, 'LN-041', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-29T00:00:00.000Z', '2026-09-07T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000041'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8eb532cb-cd10-4263-bcfe-83a2a2d54fbe', l.id, 1, '2026-07-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a3b79b24-865f-4bd6-a8ee-f80b52c60bc6', l.id, 2, '2026-07-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f9945e91-0d9a-4f90-a70f-25d00a9b0ba3', l.id, 3, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5b205df0-8d0c-4553-a2ad-eee0fa0f0474', l.id, 4, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cfa03852-c189-4f1a-aeef-445dd1389f31', l.id, 5, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8bf3728f-94c0-474b-b1ad-66f3519932fb', l.id, 6, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8cb942e4-4818-414f-bc3e-d13210603038', l.id, 7, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '96ed25db-ccef-4e24-951c-829dfc2afd17', l.id, 8, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd0cde405-a4be-415a-ad0f-213824620b07', l.id, 9, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6c2219e6-72de-4273-b9d7-6e539ebd3792', l.id, 10, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #42: babu (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('cb2dd2f3-0d0c-4b77-923d-119d008a7119', '9100000042', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '064a21ea-a881-433c-b2d0-99dff52a1d39', u.id, 'babu (metu)', '9100000042', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000042'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'efd5ec48-48c0-44fe-8e12-3d669fa41e38', c.id, 'LN-042', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-30T00:00:00.000Z', '2026-09-08T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000042'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8bf2d2d8-279a-415c-849b-3f96ecfe9221', l.id, 1, '2026-07-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0acf5b47-8897-4827-877a-b3342822e829', l.id, 2, '2026-07-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aa2faddc-e724-4acb-bf9a-343c3371a950', l.id, 3, '2026-07-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '181b4e37-90ec-4437-a96d-4f57f936319b', l.id, 4, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a82d499c-8ef3-4cc9-a962-fca774f3a333', l.id, 5, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'daddb52b-f81d-4fdb-89ce-91691a0b9ed8', l.id, 6, '2026-08-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2e2028af-ecdd-42d9-994a-498d12d86bca', l.id, 7, '2026-08-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f940063-79e7-4cb8-9621-adaf022af074', l.id, 8, '2026-08-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '70cb7398-67aa-4503-b822-49b922b3109f', l.id, 9, '2026-09-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f61d744-6f4f-4da4-8e17-6e0ccbf9256d', l.id, 10, '2026-09-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #43: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a8a46211-fbda-4001-a562-1a14d1b47322', '9100000043', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '06eb7ff9-aa94-4ab2-9e7b-f49866e817bd', u.id, 'raghul (naren)', '9100000043', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000043'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8a0b71cf-955d-4cb6-90c6-1f573994d390', c.id, 'LN-043', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-30T00:00:00.000Z', '2026-09-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000043'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c0cbb35-2015-4426-9cf8-a807c43bc09d', l.id, 1, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f2a39c6-d9ab-4eaf-919f-78253df99a5f', l.id, 2, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c7c1c15c-6eb1-4148-83c8-21a92b11571a', l.id, 3, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eca4c114-c5b2-498a-96cb-6052c3109f52', l.id, 4, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '788eda3b-e91c-4051-9784-69d58b787efb', l.id, 5, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '219ca2e0-8c07-42bf-9d5b-d541ff2d29ea', l.id, 6, '2026-08-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '89336f91-aff7-44fb-a58d-59a5a4d579b3', l.id, 7, '2026-08-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5aee71c9-629c-4ec1-8b39-3db110fa77bb', l.id, 8, '2026-08-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99fea7a3-acf1-40ce-830d-9f38c49db166', l.id, 9, '2026-09-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6a767a5f-2c24-4ee7-80f2-994d426a5d2e', l.id, 10, '2026-09-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #44: Prakash (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('27c44991-777d-4028-80b7-04b35c804e24', '9100000044', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ee1e7c74-a46a-482b-bc0a-903346bf5d12', u.id, 'Prakash (metu)', '9100000044', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000044'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '6f3a2518-685b-47bb-af84-38325ba8fdc7', c.id, 'LN-044', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-01T00:00:00.000Z', '2026-09-09T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000044'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2881df92-8140-47ed-af29-0cc5a01f6ea8', l.id, 1, '2026-07-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '905e6585-fc4e-4ab4-bb50-9f77b6d2104f', l.id, 2, '2026-07-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9db9eca6-6f44-40ea-8a75-679a0e069dd1', l.id, 3, '2026-07-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5398e353-a7e2-4d46-88b5-49d6e8f1b5e1', l.id, 4, '2026-07-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b11991a2-c0b9-4d09-afd9-b012fd93d4cf', l.id, 5, '2026-08-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f09c1a45-9c31-41cf-ad9f-78702361c79a', l.id, 6, '2026-08-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1623b4a-2bf4-4092-b164-05d26033eb52', l.id, 7, '2026-08-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ffbd2c40-a5af-4bca-a637-589385f32e37', l.id, 8, '2026-08-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8f13714-d485-4262-ae1c-b132780bccfd', l.id, 9, '2026-09-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e0d59a52-9554-4c5a-883c-2722b6da9160', l.id, 10, '2026-09-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #45: Sundar Santhosh
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('86d8c709-402c-417c-86b8-fb4d1381070d', '9100000045', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a40745ca-38b5-4680-8e04-3eb8a165ff1a', u.id, 'Sundar Santhosh', '9100000045', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000045'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'e5dc1860-9751-4cbb-92f5-b99ad11dc9f8', c.id, 'LN-045', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-03T00:00:00.000Z', '2026-09-11T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000045'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ffa51f89-8ee5-4281-be60-92be85c7cbcd', l.id, 1, '2026-07-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'be97236d-3d83-4afb-8280-e6f1d7fa5fcf', l.id, 2, '2026-07-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e9778d52-afa2-486d-9d9e-927e003c4d89', l.id, 3, '2026-07-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c96d6683-405a-4b63-a182-43e7cc905990', l.id, 4, '2026-07-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ce9e2334-fbef-48b3-b3dd-dc11fa2dc516', l.id, 5, '2026-08-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c6b65e75-fa2b-451d-9c3e-1ea3e88aa455', l.id, 6, '2026-08-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3946992-50b4-41aa-be7d-9850d3757906', l.id, 7, '2026-08-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b0397ad8-b731-4b37-be1f-891c4d3dd5df', l.id, 8, '2026-08-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8d7bad35-3248-4902-aed3-f6a98e0b24ec', l.id, 9, '2026-09-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5fb10867-6245-432f-ab1c-ddb665fb3ab2', l.id, 10, '2026-09-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #46: Mohan (Small)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f1a59138-8258-49e9-be55-00831c2760dc', '9100000046', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7d5ea5a2-5326-492f-98d8-ac2ebfc5d32d', u.id, 'Mohan (Small)', '9100000046', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000046'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c00bc46d-1cc6-457f-a96f-4fc969e6c8c4', c.id, 'LN-046', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-07-04T00:00:00.000Z', '2026-12-04T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000046'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f1d66925-0ade-425d-abdf-c17ff31270bb', l.id, 1, '2026-08-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a4e4797-cfcb-4bc7-8e81-5185f5d1fecc', l.id, 2, '2026-09-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff4acc02-dda5-4943-950d-8e5bc956d07b', l.id, 3, '2026-10-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '17460a79-7525-48d1-9f37-2fb7053bab50', l.id, 4, '2026-11-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7dcc210d-df8c-4efa-9284-4fcd50ffbf60', l.id, 5, '2026-12-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #47: Kotti (karthi)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('38a43002-df60-40d8-9392-4eb730f997a5', '9944328194', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c03063bd-1a95-4e2e-81ba-0ba2800edf5f', u.id, 'Kotti (karthi)', '9944328194', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9944328194'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c9b51b0a-6e7e-4c27-bb84-0373b7c3feba', c.id, 'LN-047', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-04T00:00:00.000Z', '2026-12-04T00:00:00.000Z', 5, 2300, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9944328194'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5e215818-0847-4e18-bcec-f9a910f93f4e', l.id, 1, '2026-08-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '20befdee-cda0-40c9-805f-c74b521d634f', l.id, 2, '2026-09-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac71362a-a0cf-4be2-a0e1-f6f8b1d94cf6', l.id, 3, '2026-10-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '86d062d1-aca7-4bde-a0b9-75f3add41b7b', l.id, 4, '2026-11-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68a525af-61c0-4f57-8d5a-7e76bda03a6c', l.id, 5, '2026-12-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #48: diva (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('aa2e6691-05b1-4a42-a5ee-33f2b1fa9224', '7418302940', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6be85893-86f5-44e5-98e1-a1264c49b5c8', u.id, 'diva (metu)', '7418302940', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7418302940'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '9bc851b6-0265-4960-92e9-350b69388736', c.id, 'LN-048', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-05T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7418302940'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4ad71f83-7ba1-4085-99d7-31b65173283b', l.id, 1, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '548750fb-1431-4a6a-912f-246cf4e91cb9', l.id, 2, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '193d576b-6bc4-4b93-b5bf-3e54ea73fc11', l.id, 3, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df838209-227e-479c-8d0e-73ef2e673371', l.id, 4, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '49cfe099-b295-4249-8ba6-8a4256cbe58a', l.id, 5, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0c7ce20b-9147-42d7-b2c7-0af35971467c', l.id, 6, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f6ae0ed-13e0-4c21-bb7b-2100a5309866', l.id, 7, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eff3efaa-225d-4b9e-92cf-2b9b88cd3f11', l.id, 8, '2026-08-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54a32aea-1308-4894-8ab9-d14fd184b42f', l.id, 9, '2026-09-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6df09bbc-07d5-4771-948c-2f6b11a8caed', l.id, 10, '2026-09-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #49: naga (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('140c169d-d66f-49c3-991b-20ebff0dd495', '6373153440', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ff592223-b77e-4e83-8184-6b80c569ca0e', u.id, 'naga (mesthiri)', '6373153440', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6373153440'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7b947257-2cde-4be9-8648-d48383097cde', c.id, 'LN-049', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-06T00:00:00.000Z', '2026-09-14T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6373153440'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fab74736-e24e-41f9-a2a7-699c192d9339', l.id, 1, '2026-07-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0a2199a-6079-4641-ae21-d93c8e1c6121', l.id, 2, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '36c93a38-456e-4df1-aa34-5b218348d8bd', l.id, 3, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5904a51c-298a-40fb-b1c8-64335a2068f2', l.id, 4, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4c849ae-c7da-4394-95ac-66ddbe6d9872', l.id, 5, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31c8eeb8-af2a-4400-aa2d-5916e750dca4', l.id, 6, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd09e112a-29b2-4cb9-a333-2d103b7e8625', l.id, 7, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd6a9cbb7-2f39-4eed-a1de-cdf9e908f585', l.id, 8, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '22870493-369b-4b19-a990-3046023d2e2f', l.id, 9, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fe834281-b83c-48f0-b166-e5abdabb7b75', l.id, 10, '2026-09-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #50: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0c0501dc-4d3d-4ef3-ac9f-41f4106c5d56', '9100000050', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f570c0d6-3cca-498e-8763-8c820c5997ec', u.id, 'elango (pigga)', '9100000050', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000050'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a07d901a-aa3e-4a77-a862-187cbd00cce7', c.id, 'LN-050', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-13T00:00:00.000Z', '2026-09-21T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000050'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a690cccf-f2aa-4d53-a388-1f55386d05b7', l.id, 1, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b15e4410-0223-4feb-b565-2a765c386b55', l.id, 2, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac6787dc-1b75-4f86-902b-3a262628c179', l.id, 3, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47b1f087-55ab-4487-b6ac-11baa3c0b519', l.id, 4, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ad649767-f371-4c7f-9da6-7ebc20fffcbb', l.id, 5, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'de24fdc4-205e-45e4-9db5-125594a3a71b', l.id, 6, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '04b2b6a6-6006-43d5-b80f-c324127aa8da', l.id, 7, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '604b73c7-d702-4e59-9188-e381ab5995be', l.id, 8, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8627855e-e1ac-4109-b108-760f61ecfd46', l.id, 9, '2026-09-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bcad7290-7eea-4c14-bd5f-fd0f1d182506', l.id, 10, '2026-09-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #51: Diva (om)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1c8fd788-252d-40fa-a802-ad52e380a882', '9100000051', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd4f7166a-efc5-4ac9-a6bf-5468eb7bd473', u.id, 'Diva (om)', '9100000051', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000051'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7333609b-1ce9-486f-a3e1-fad21a8536cc', c.id, 'LN-051', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-17T00:00:00.000Z', '2026-09-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000051'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a665ac39-71bd-4f0f-81db-c5199dd1aa5a', l.id, 1, '2026-07-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'db1220b1-8b83-4743-8d4c-84175610abe3', l.id, 2, '2026-07-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ca82b7fb-c67f-4ed1-a742-a450ccae5994', l.id, 3, '2026-08-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '80daf3d5-c2f3-4381-89e2-1a15e49776fe', l.id, 4, '2026-08-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '605315b9-ea8e-440a-b2b4-d4279318307f', l.id, 5, '2026-08-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f097db4e-b27d-4de7-a8f4-2288ee250836', l.id, 6, '2026-08-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'be62682e-171c-4c3d-b660-e66986b1f044', l.id, 7, '2026-09-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b01b40a4-2e37-4aa4-9267-42476a32d14d', l.id, 8, '2026-09-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4d4d0fc1-514d-4fc6-9377-ea46406319b5', l.id, 9, '2026-09-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4e96f5cf-cb09-4749-8440-f57bed66deec', l.id, 10, '2026-09-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #52: sarath (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d0093266-c1cb-476e-8721-01acdda5a0ed', '9100000052', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f9973330-4f3a-4260-a37c-b4e605b2ab66', u.id, 'sarath (kv)', '9100000052', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000052'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1c06ef38-4d54-439c-ab49-f660d33985ab', c.id, 'LN-052', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-17T00:00:00.000Z', '2026-12-17T00:00:00.000Z', 5, 2300, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000052'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '818532dd-8282-4a7d-ae82-edb79833029e', l.id, 1, '2026-08-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'afe873d8-7969-4891-8648-d9d3fb8693ff', l.id, 2, '2026-09-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fdb9368a-ac44-4d80-8c4d-a45633387525', l.id, 3, '2026-10-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68956a44-eb88-4e93-90e4-b1cb2fa66228', l.id, 4, '2026-11-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ece2acc7-f4f8-425f-aada-d08f8e9a1122', l.id, 5, '2026-12-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #53: sundu santhosh
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3a4f186a-0925-464b-a0f1-65c6ef625614', '9100000053', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '4fa9c7ad-dc10-440b-9d1b-b2ae860b36cf', u.id, 'sundu santhosh', '9100000053', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000053'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '489418b5-38d1-4a28-b983-0764e841f7a2', c.id, 'LN-053', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-17T00:00:00.000Z', '2026-09-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000053'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1afcf00c-bfb9-4126-84d4-e4ecd3973434', l.id, 1, '2026-07-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f411e75-33e2-4dd8-8580-eacf2a58c75d', l.id, 2, '2026-07-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1857972e-5673-4375-b935-161a20025e72', l.id, 3, '2026-08-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9ebc730-1d6d-4d5b-a61f-a083d02b2ca0', l.id, 4, '2026-08-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c945809b-a474-4777-bca2-db9605d187c0', l.id, 5, '2026-08-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '66c477f9-efda-41ba-9203-4a5b7dc6ab6e', l.id, 6, '2026-08-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b7d3d9ce-2529-417d-a570-d197df67b241', l.id, 7, '2026-09-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a4b175da-0ccf-4c4e-b3cd-ced28dba3250', l.id, 8, '2026-09-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd3694c05-fb1f-4f78-becd-23e86a18edeb', l.id, 9, '2026-09-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a8786c1b-f2b2-4d96-9777-dcd8289f738c', l.id, 10, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #54: Raman
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('133032d0-9dfb-4dc3-9855-cfe743bb2aaf', '9843560642', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '729353e3-ba35-4150-afd1-7999a586c92e', u.id, 'Raman', '9843560642', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9843560642'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '90d18c82-d3e8-41f0-9d8f-d38f86702aae', c.id, 'LN-054', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-21T00:00:00.000Z', '2026-09-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9843560642'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '429d1704-eb91-4e36-8d21-e5017e84d154', l.id, 1, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2e59f750-5f83-4306-b771-9ab8ab6976ae', l.id, 2, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '602a271e-b492-4eed-a470-112840e363dc', l.id, 3, '2026-08-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '907e0e03-93e0-4ebe-84c6-3c2c56778f2a', l.id, 4, '2026-08-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd495ae6c-256c-4b12-b722-966362914ff9', l.id, 5, '2026-08-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5a29da0c-8a96-4916-95d5-ae6135de6746', l.id, 6, '2026-09-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3febfebf-5027-482d-9ec4-3c2dab5d4056', l.id, 7, '2026-09-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf625be6-2fd7-41a8-af66-c943bf7aaf8d', l.id, 8, '2026-09-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c2a0953d-51c9-43fc-bd68-cb2acf9493a4', l.id, 9, '2026-09-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec0a9456-a72d-4278-82a4-c78bd2b76fe1', l.id, 10, '2026-09-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #55: mani (pattu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8512d5b4-eb49-4750-80a5-fded9d2880d4', '9100000055', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '31866359-d863-475f-866c-3228af56fd06', u.id, 'mani (pattu)', '9100000055', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000055'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '21366547-b8a5-4e2d-a1d4-cb5a93a624b4', c.id, 'LN-055', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-21T00:00:00.000Z', '2026-09-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000055'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea9d0d77-94ed-48bc-a29d-9e89bdb12824', l.id, 1, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '22f57e97-2b7d-413f-863b-de862c1f1c72', l.id, 2, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '719946df-04bd-4184-a984-1c6659ebbde6', l.id, 3, '2026-08-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dfcb1fbe-f0cd-4933-a9ef-d2f5f64a2205', l.id, 4, '2026-08-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b90ccf6-7b13-4a88-a5d0-2a090c81b32b', l.id, 5, '2026-08-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '32b576ae-42ec-4147-843e-2c87ba5ada1e', l.id, 6, '2026-09-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '40a2255a-5efc-4268-b4f2-f6253c499b9a', l.id, 7, '2026-09-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '40638b1d-52ac-4f0b-aac5-839b07f9771a', l.id, 8, '2026-09-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8608cf9b-7fed-4464-b43c-83e046b77b23', l.id, 9, '2026-09-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '760298c7-dbb1-404f-9a49-46af90d867fe', l.id, 10, '2026-09-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #56: sakthivel (mangalam)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('db1cd63f-3371-49f2-8d39-594e48319290', '9847557749', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7852ed9d-d7e8-47d0-a8ca-6cb79532d16b', u.id, 'sakthivel (mangalam)', '9847557749', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9847557749'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '33343f10-0f6e-48d9-b648-77029a1ea54e', c.id, 'LN-056', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9847557749'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '00e05bd1-c899-4408-82a8-834be4a55532', l.id, 1, '2026-07-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ada3b68e-4fba-4375-ab8e-de6fe69b3fa3', l.id, 2, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '30ca2090-7c35-4ad6-99dc-faf7cb77d55d', l.id, 3, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fa006da5-7ab6-4149-8585-0ed6d5ebb172', l.id, 4, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68485afd-fee1-49b3-a958-ee9dfd381e2f', l.id, 5, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '67a66870-bb80-4f55-9537-3172c8c8d0e7', l.id, 6, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a324f847-e46a-425a-97cf-f7996f89c0c3', l.id, 7, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f69a8a5-84f5-4ecb-8e00-bec5bfe9ee2f', l.id, 8, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd72c1900-b68e-46e1-9b81-70d6f599cea5', l.id, 9, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16a04bdc-276a-4171-9ba3-7f13e5eb91d5', l.id, 10, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #57: ranjith
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('944c5233-6178-451c-a5dc-cd35638bbb07', '9100000057', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '75a42fbe-e6ec-48a8-bee6-a3a33842f25e', u.id, 'ranjith', '9100000057', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000057'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f0c323ea-ea5e-4f9b-b06d-d3467b199a02', c.id, 'LN-057', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000057'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4bb39b61-f7d7-49dc-8f06-921bd127ff18', l.id, 1, '2026-07-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fa81ef3f-46fc-40a2-95a3-b68f7610ee95', l.id, 2, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4298cc9f-9842-4405-88cb-3b09774a7cc8', l.id, 3, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '842213fa-c93d-4e3d-af25-83dd706baa4b', l.id, 4, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '751a6f0e-59cd-4664-9722-1ba62d9fc378', l.id, 5, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55239b0a-1acc-41a4-ac29-c47ce20c6a5f', l.id, 6, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a0f02f83-b51e-47f2-97ad-259e75056142', l.id, 7, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '08b46da2-96ea-47c2-92ce-b296f6cc797f', l.id, 8, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6666414f-d6d5-439c-8158-f17e32250029', l.id, 9, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '79560d52-a78f-42fa-aedc-ae647026e19b', l.id, 10, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #58: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('56f015b0-37f4-4fb9-b7c0-550859a85b7a', '9100000058', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '8facd386-49fd-4a8b-9fb5-313e7fbbe8b0', u.id, 'ragupathy', '9100000058', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000058'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ef5204b6-3234-4795-b1b8-1eaddc7930d7', c.id, 'LN-058', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000058'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c3431fc-81a6-4f3a-85af-1798bbb5840c', l.id, 1, '2026-07-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dae5f6a4-cfd7-4183-a0c6-23c64eefce68', l.id, 2, '2026-08-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '955bf861-5837-4f4a-9d9e-9b2c4dfd000a', l.id, 3, '2026-08-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4adad9e2-9e49-43fd-9cdc-3db47e036f0e', l.id, 4, '2026-08-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3b122ce5-a41d-45ba-a81b-3249144879da', l.id, 5, '2026-08-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b03beb3f-57f2-4868-b09d-f4178a8977d6', l.id, 6, '2026-09-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c93d8e8-e278-441f-8940-7bd9ca0e935f', l.id, 7, '2026-09-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4ab4b028-13df-4f70-9732-da09fdc34165', l.id, 8, '2026-09-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1a11a15-af1b-452e-b732-6440a3ff4fd8', l.id, 9, '2026-09-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8aa193c0-8763-4a19-bbbc-7861427324c7', l.id, 10, '2026-10-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #59: ajith (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2107e6a4-0c62-404b-aad4-620dcf342d3e', '9100000059', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '18565aeb-9f0e-4403-9b59-e03fab0ebe73', u.id, 'ajith (metu)', '9100000059', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000059'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f6fb6932-a2d5-40c0-afbf-3c87e15b103d', c.id, 'LN-059', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-07-24T00:00:00.000Z', '2026-10-02T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000059'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '817b155b-2479-464c-a428-1a784bd9a190', l.id, 1, '2026-07-31T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f9bdb18d-cba1-48cf-b622-c80cfe55467f', l.id, 2, '2026-08-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42e1b9bc-4b0c-4985-8094-3313030eaf2a', l.id, 3, '2026-08-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '683b18bf-556b-4a84-8d55-620fdbfb5abb', l.id, 4, '2026-08-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '28ba9792-dfa4-4bcb-a110-a05046b6267a', l.id, 5, '2026-08-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '575d9c7e-5ceb-4189-9e88-6791d0bde0c5', l.id, 6, '2026-09-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c2ef6c8-7776-4135-b78e-5cb27d47e3ab', l.id, 7, '2026-09-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd0eedfb9-1b93-4ed8-9a2d-699fdea06f2e', l.id, 8, '2026-09-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a0227fd7-f13b-47f7-a74a-f7a72532b293', l.id, 9, '2026-09-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e0c2b380-df5f-44db-8f9c-e13d10b6d286', l.id, 10, '2026-10-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #60: ganesh (karesh)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ef43da90-c67f-45d9-a37b-6282ce8afb68', '9100000060', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3484a472-f966-46a8-94fe-c2d819526b3a', u.id, 'ganesh (karesh)', '9100000060', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000060'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5c7edc42-5223-4a95-b6b3-92f116d02d2f', c.id, 'LN-060', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-24T00:00:00.000Z', '2026-12-24T00:00:00.000Z', 5, 2300, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000060'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '80b90572-c2f7-482a-9e17-54238c22798d', l.id, 1, '2026-08-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55c76f5e-719a-42d2-a81f-32bd3ee180f5', l.id, 2, '2026-09-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6997dbe9-1a79-49d2-8f61-fd4b8a6173f6', l.id, 3, '2026-10-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a818846-d528-452a-bc01-2677a3329c0a', l.id, 4, '2026-11-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1fbaeaf9-1b1e-4b07-b4b4-ff4489710edb', l.id, 5, '2026-12-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #61: Suresh (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('773d7c09-6a96-460c-a463-55dfa09b4b1e', '9100000061', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd0396ba5-05be-4e5c-830a-bcbee8abed86', u.id, 'Suresh (mesthiri)', '9100000061', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000061'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '75601c20-5908-45fb-ba6f-13447e540f13', c.id, 'LN-061', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-25T00:00:00.000Z', '2026-10-03T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000061'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7fdf699a-b539-4d92-8404-d0269809045d', l.id, 1, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8c8084ab-070d-4ec3-98a6-08087693c30a', l.id, 2, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '59268e25-812f-475d-adc2-4361c602822e', l.id, 3, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ed1110a6-890b-49f3-bb33-ca02cabcf523', l.id, 4, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a3cdc335-f258-4b7a-b50f-d285d6c2f19e', l.id, 5, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff39072c-6f56-4565-8472-4c1910cfa16b', l.id, 6, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '355e2480-b515-470e-940f-2db8e4c0b9fa', l.id, 7, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0ae33129-c24d-4a59-984a-6de8e91d3d90', l.id, 8, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c05aa16b-60cc-4f1d-81f6-84bfedc945e4', l.id, 9, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd3842856-1c48-4b25-a340-495e34a99fb4', l.id, 10, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #62: yuvaraj (Gowinthan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f0d4e5ea-45cc-487f-b9fe-abdc4ba5a7d6', '9100000062', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '1e5fd01e-4c1c-4294-b3d0-8e5fec2b14b5', u.id, 'yuvaraj (Gowinthan)', '9100000062', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000062'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0d6292fa-b9c7-4ff5-ac00-27a10513d898', c.id, 'LN-062', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-25T00:00:00.000Z', '2026-10-03T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000062'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '347c5234-dae0-43fc-8f09-86abaf88d9f8', l.id, 1, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2986c082-1955-4db2-8dc7-e7de91ca1eec', l.id, 2, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2b28270-fc75-4d03-804c-19579069a98e', l.id, 3, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '391c0598-acbf-4829-b348-c35717fc8c3a', l.id, 4, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e93cd37c-288d-4bbb-8cc7-959bcf24029e', l.id, 5, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8b80bf24-beb0-4d3d-8ad3-ce3f6002804a', l.id, 6, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f7928da1-7e68-4f14-a7cc-c57e9c55df56', l.id, 7, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f4a47db-c2ed-4619-89c8-5b83ad7528af', l.id, 8, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec6b4345-fd7e-4596-940a-481a5227a91f', l.id, 9, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4d46757b-ea56-4d4a-86b8-bb195ebdfba4', l.id, 10, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #63: Mani (Tails)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('983e5650-c536-44a1-8c7b-2e89c12d1cb2', '9100000063', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e0ada979-4a90-4da8-83d2-1bc7864bc23e', u.id, 'Mani (Tails)', '9100000063', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000063'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ff6a852c-736e-4519-bf55-928e98e5133e', c.id, 'LN-063', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-07-26T00:00:00.000Z', '2026-10-04T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000063'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01ff9b56-a994-4633-96af-1d11c3b33047', l.id, 1, '2026-08-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8a41a69-ef91-489a-abd4-e5bd39ea521c', l.id, 2, '2026-08-09T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c21e0f5-c73b-4de6-873c-e871589050e2', l.id, 3, '2026-08-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '64280438-c93b-445b-894b-badceb64685c', l.id, 4, '2026-08-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f52eccd1-249a-4a01-9fcd-f5e479edf5c7', l.id, 5, '2026-08-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6d7a173-3837-4940-805f-5612d4b72eb7', l.id, 6, '2026-09-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '729f9f6d-9f03-4de3-b95c-effbd3f79d32', l.id, 7, '2026-09-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f5b7b7ef-575d-47fe-a67d-f7791a6fd4d8', l.id, 8, '2026-09-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3953f950-8acb-4cc5-8980-74c52cf43c90', l.id, 9, '2026-09-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a5a970bc-38b1-4736-9f40-f3bcdc4ae2a4', l.id, 10, '2026-10-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #64: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2edce7b3-6025-474b-8fbe-42967db9f377', '9100000064', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f47d6d6f-8a6c-41da-aeb2-a8c359c8554d', u.id, 'ajith (aali)', '9100000064', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000064'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8ff36ee9-3982-4420-aaf0-59f0e8a628e1', c.id, 'LN-064', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-29T00:00:00.000Z', '2026-10-07T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000064'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '67974adf-3259-4d8b-9eb4-cee1beb5e1ab', l.id, 1, '2026-08-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f167864e-939a-4217-9974-f01663492fb7', l.id, 2, '2026-08-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7bced3c9-cad5-432e-b414-e736fe366b52', l.id, 3, '2026-08-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c15edb99-2c0c-4d1c-a8c2-74588e123471', l.id, 4, '2026-08-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9372aac7-d15f-4f17-b6fa-90cfc2ce7898', l.id, 5, '2026-09-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '601edda6-2aed-4cce-9520-ab1de482719e', l.id, 6, '2026-09-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dea96095-348a-49bf-b053-1e9811cdc6c9', l.id, 7, '2026-09-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0913a34a-6177-4b65-a630-236439a04412', l.id, 8, '2026-09-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5d8a0c8d-2c96-4d9d-9596-d7ed51509324', l.id, 9, '2026-09-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '608b09c9-1db7-468a-a2b9-192260903a6c', l.id, 10, '2026-10-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #65: arunachalam (master)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('40285cd4-61ed-4051-a748-0633213cad9e', '9100000065', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '72f238fa-c874-43f4-bd74-a7081a0ca4ff', u.id, 'arunachalam (master)', '9100000065', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000065'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1e156bc5-9f45-4459-8e91-3aecd89fdb8c', c.id, 'LN-065', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-30T00:00:00.000Z', '2026-10-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000065'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eaf1d782-e105-4c7f-9fb1-20e67b8240b7', l.id, 1, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ba6f45b3-4e6b-464f-be8f-15a998164069', l.id, 2, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '612726ba-ac2e-481b-be49-f2d5d26d69c8', l.id, 3, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '13112a25-6de4-478b-989a-1a3c73802dca', l.id, 4, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '23410571-fdea-4df7-bfba-dccf4db918a3', l.id, 5, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0592b1e5-b387-485c-881b-5dd3395bf385', l.id, 6, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '87c873f5-85e0-4662-8564-e0b95a88cacf', l.id, 7, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f6023fa-bfa7-423c-b3b0-11479aee7662', l.id, 8, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd18b0060-e4aa-40cc-8013-32fdd70c6b20', l.id, 9, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd82a25bb-fabd-4f33-841f-b5470787c96f', l.id, 10, '2026-10-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #66: karthi (kendu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('b032716b-a053-4c7f-b897-aab05397887b', '9100000066', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'fabf2feb-fbcd-4f49-9bd8-2ca9dfc15966', u.id, 'karthi (kendu)', '9100000066', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000066'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd49b41e4-66f2-4cac-bf61-530387b04748', c.id, 'LN-066', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-07-31T00:00:00.000Z', '2026-12-31T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000066'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8b98b58-e561-4277-b4e2-c1a2f8a613d4', l.id, 1, '2026-08-31T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34f78f9e-f41d-4a8d-84d6-702dac29b3cc', l.id, 2, '2026-10-01T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1402ca1b-a660-4559-93ec-87ab8d0d3a63', l.id, 3, '2026-10-31T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9fc45f7d-2840-420d-93ff-3f884e242ec6', l.id, 4, '2026-12-01T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '253a7476-cca0-4579-8865-869680536da1', l.id, 5, '2026-12-31T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #67: babu (acheri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c7e6bacb-9580-4dc5-b81b-1b2573a41bf7', '9100000067', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '47cebee7-4991-4d1c-b89e-db85497479ee', u.id, 'babu (acheri)', '9100000067', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000067'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f62c8d3d-182e-49dd-b552-7ff00f3fcea9', c.id, 'LN-067', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-02T00:00:00.000Z', '2026-10-11T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000067'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3d3842fa-3662-406a-aefb-92bbea5d5ab4', l.id, 1, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2bc21b65-cbfa-48ff-91e4-8b6f5983cffd', l.id, 2, '2026-08-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5a9d9462-3fb7-4709-8506-dab6e5bdc1ec', l.id, 3, '2026-08-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2856cc40-d1d5-4cf6-93d6-d9662b7210e1', l.id, 4, '2026-08-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '592ad731-7f63-4cc9-acf5-8f4692a9ab73', l.id, 5, '2026-09-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f443809-29c9-4632-bc3e-51013aec8512', l.id, 6, '2026-09-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c4e46fe-bcc1-42bc-af4d-c6b0a4fe0f3f', l.id, 7, '2026-09-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8a35c336-3076-4111-8c4b-5702ce0ac758', l.id, 8, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8612823-bace-4cd7-a73a-5bb57d8ad06a', l.id, 9, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '177575d4-326f-43d1-ad69-9412d9a45cb6', l.id, 10, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #68: Naveen (puthupet)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6ca48416-fdc4-49c0-a3a9-e2fefa426290', '9100000068', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7765a34c-3ad3-4c94-9afa-5a7bfeee2343', u.id, 'Naveen (puthupet)', '9100000068', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000068'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '25870b49-7523-48ee-9cfd-73baebc1bbec', c.id, 'LN-068', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-03T00:00:00.000Z', '2026-10-12T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000068'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e65638b1-ee69-44d7-b286-0f0490d186ac', l.id, 1, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b623d7f5-a1ac-4cec-b061-b7a946e9e268', l.id, 2, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aa40d374-138b-46c8-92ac-6454ff6b40d0', l.id, 3, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4e14cd2-d648-45bd-97cd-a0327800b872', l.id, 4, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '09e78490-dd51-45b6-beb0-ef7cf47c8423', l.id, 5, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '74575dab-01a6-4494-ad32-924768eb7cd8', l.id, 6, '2026-09-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a9b3ab88-6263-46a4-85df-cb82954841a8', l.id, 7, '2026-09-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1a38fad9-2ce2-4998-9c39-803c35e99172', l.id, 8, '2026-09-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ba972c08-b900-4a2b-8566-d11ac76846ba', l.id, 9, '2026-10-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb9bdfd2-acfd-4689-8411-76c8b0871e01', l.id, 10, '2026-10-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #69: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('58109746-4616-46ae-92bc-13ed216b6260', '9100000069', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '025d672e-76b7-41d1-9b4f-68091cd0ae3e', u.id, 'ragupathy', '9100000069', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000069'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '3bc66b5a-5f75-4e48-9e7e-77b338e25072', c.id, 'LN-069', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-08-03T00:00:00.000Z', '2026-10-12T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000069'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7473dc61-2d3b-4faf-b535-74ff71f3b28e', l.id, 1, '2026-08-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '390f3676-14b0-4c22-834b-a9175b701bd0', l.id, 2, '2026-08-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff6e95fd-ef97-4368-921c-50d3d9b6a90f', l.id, 3, '2026-08-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cbc97030-6cfe-4b48-a1f6-4fe4a01c82c8', l.id, 4, '2026-08-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f7478d3c-437c-4a58-b74c-2055b51b5e13', l.id, 5, '2026-09-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f2612c8-3625-42f4-b08c-63152ad0753f', l.id, 6, '2026-09-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '93d36c72-9ed8-47ca-81d8-e5f6d885ec0d', l.id, 7, '2026-09-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bab20764-633e-4fe0-976e-c9e6e0a67d6d', l.id, 8, '2026-09-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '82f6268d-c1fa-4cfd-bda3-afc9e78108c5', l.id, 9, '2026-10-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1e6b2002-cc76-403c-ba16-a8833197e811', l.id, 10, '2026-10-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #70: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('972ee2fe-7dd0-451c-90af-b30c06bd87a7', '9100000070', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'bd520064-8ca0-432f-a836-e737d864a3ec', u.id, 'venkatesan (kv)', '9100000070', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000070'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f42dc3a1-2234-4b88-9569-0eb88a806ea4', c.id, 'LN-070', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-08-10T00:00:00.000Z', '2026-10-19T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000070'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '146ef82d-a025-4ba9-93df-0fb256af12e6', l.id, 1, '2026-08-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42cd9e63-5b6e-4cc8-8692-3f7f868fc229', l.id, 2, '2026-08-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6bc3ea0d-ad03-4bb9-9ff2-04ed8cb90a86', l.id, 3, '2026-08-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c4862799-d2d9-431f-9715-85e5e7096785', l.id, 4, '2026-09-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01a557fe-6d5e-4ab4-8e28-2c375e4f0973', l.id, 5, '2026-09-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c833085-ac5e-4932-bc30-1d2505edcd7d', l.id, 6, '2026-09-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d866362-4041-4baf-8dbd-a16f2f165a5f', l.id, 7, '2026-09-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '58588364-c15c-47b9-8605-0989e5c6c17a', l.id, 8, '2026-10-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f5d78ff5-04d7-400f-a62e-d92e24178112', l.id, 9, '2026-10-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'de9c98cf-6204-42b4-a86c-63fa70e51714', l.id, 10, '2026-10-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #71: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f7b24bcc-942b-4692-8f85-f2455099a181', '9100000071', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f43eaabc-1951-4ec3-9153-bbbf6368c9a7', u.id, 'vicky (metu)', '9100000071', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000071'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'cd7c700b-a021-4bb8-9193-532c6e41d30f', c.id, 'LN-071', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-08-13T00:00:00.000Z', '2026-10-22T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000071'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '926469f0-e4ea-4006-82ed-44dc704f44b0', l.id, 1, '2026-08-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9e7afae6-0b9f-4bb9-aaf4-ec588802047f', l.id, 2, '2026-08-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47ee5ba9-c0f1-4ce5-a2e5-43c5a962ff2a', l.id, 3, '2026-09-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec76142e-0cd1-4eb2-8bbb-2720ab6f5303', l.id, 4, '2026-09-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a84bb823-5b42-43da-9592-3b7be504ec41', l.id, 5, '2026-09-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fa7f0ddd-3732-4398-9fa0-4641fecbec39', l.id, 6, '2026-09-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6e8111b0-9e28-47c3-8002-227cf193364c', l.id, 7, '2026-10-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4eda9928-6fd1-461b-afe3-458678f03d7c', l.id, 8, '2026-10-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6235efe6-3542-43df-9e1a-7a6156aff27a', l.id, 9, '2026-10-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '28e73f51-e11f-4558-8fc1-a4acabfb78e3', l.id, 10, '2026-10-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #72: rathinavel (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ca1e4122-2ef6-4227-98ca-fcde4dc40f0a', '9100000072', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e4aa7c06-598f-4d40-b6d2-c35961cf8223', u.id, 'rathinavel (kv)', '9100000072', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000072'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '76ad978f-6062-4c08-96ed-5306b6b3068f', c.id, 'LN-072', 'MONTHLY', 20000, 15, 0, 17000, 0.00, '2026-08-15T00:00:00.000Z', '2027-01-15T00:00:00.000Z', 5, 4600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000072'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9dc4bce-e137-4f24-8cbe-30ba14a55c84', l.id, 1, '2026-09-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '934f5263-0ae6-4961-80b2-8e4600c6237e', l.id, 2, '2026-10-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69139739-cfdd-4879-80da-4452e1af2e87', l.id, 3, '2026-11-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'be557974-31f9-4fbf-9557-becb073428f7', l.id, 4, '2026-12-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46b76461-c7ce-49ee-87cd-d0aeca821d80', l.id, 5, '2027-01-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #73: manimaran (laddu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3e160a9a-d5e4-4826-9228-a56b77127ec0', '9100000073', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '539df075-a7e0-432c-a435-889efe771ca8', u.id, 'manimaran (laddu)', '9100000073', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000073'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '2a8fa6af-2bee-4bf5-b840-9f3a933e6a6f', c.id, 'LN-073', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-17T18:30:00.000Z', '2026-10-26T18:30:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000073'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '71215312-f962-46c0-8ac2-86ca894c01bf', l.id, 1, '2026-08-24T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7c0ae4ed-38dd-46a1-b2b4-a2088bb8a4c5', l.id, 2, '2026-08-31T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a83921e6-7d7d-48fe-a03d-7714f335c203', l.id, 3, '2026-09-07T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '151ec8e2-7361-4c98-b609-e738b7d57fae', l.id, 4, '2026-09-14T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '98cc8776-0be3-412c-a9df-b8d589c8e3f6', l.id, 5, '2026-09-21T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '097a0e63-0153-45d6-8c71-e1a6564563ad', l.id, 6, '2026-09-28T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c140b84-82f9-43a0-a454-4760d8c28814', l.id, 7, '2026-10-05T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8652fae1-b61a-4849-a1c1-002f37b921c7', l.id, 8, '2026-10-12T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2babc94d-8230-4ec6-8b28-e9770275e565', l.id, 9, '2026-10-19T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f87bb79-3798-49e9-8809-539613678ffa', l.id, 10, '2026-10-26T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #74: logesh (don)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('00c2a91f-5510-41b0-a1a8-8b24b2764770', '9100000074', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ccf675a5-06b7-4af4-ab4f-7e64801b4ee0', u.id, 'logesh (don)', '9100000074', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000074'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '43eb0010-f034-4811-b2fb-4b19ae85a60d', c.id, 'LN-074', 'WEEKLY', 12000, 10, 0, 10800, 0.00, '2026-08-10T00:00:00.000Z', '2026-10-19T00:00:00.000Z', 10, 1200, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000074'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0489c627-7dc4-40ae-900e-c440814f4102', l.id, 1, '2026-08-17T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '575b40e8-0264-407d-bffc-df3cf43d36d1', l.id, 2, '2026-08-24T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1cc80b42-edb8-4d5f-8184-f4c077ecd12d', l.id, 3, '2026-08-31T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ab1858bb-2a13-4182-bf05-b1b0617db9e3', l.id, 4, '2026-09-07T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9d0a639-5162-4304-8563-f2cc853ed57c', l.id, 5, '2026-09-14T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6860b61a-9874-4c66-b103-f979e745a3dc', l.id, 6, '2026-09-21T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4009435f-9681-4fa6-9c72-8abfdb3cfb21', l.id, 7, '2026-09-28T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e33e36e-1b31-4979-81e3-93163ada2767', l.id, 8, '2026-10-05T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2f0237a9-e902-4770-9599-b081d43d94b7', l.id, 9, '2026-10-12T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd2891e4-4964-4b21-8178-2db4e159048f', l.id, 10, '2026-10-19T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #75: dhanush (vv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('24b0c9d8-7f4e-449f-89e9-1e7af6054275', '9100000075', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '40bea618-cdfa-4f84-ace1-9a35cc8a8bd5', u.id, 'dhanush (vv)', '9100000075', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000075'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1fb518f1-046a-485a-a68a-1fad888164ce', c.id, 'LN-075', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-08-22T00:00:00.000Z', '2026-10-31T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000075'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55488818-38de-4049-a0b1-60c4154ecb92', l.id, 1, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7d1edec1-0003-4ffd-8f67-3f6606461b0c', l.id, 2, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd484ec45-57d7-4556-8ad1-750cadd1a2da', l.id, 3, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1b6ae4ce-4720-454a-8b3b-dfc3568dfcf6', l.id, 4, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c1310a04-5d10-4918-8bf6-8114beabe2c8', l.id, 5, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2c6fd1e-e826-400b-b0e2-e577b3121312', l.id, 6, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31690bf6-3603-43a7-8026-b9a8e1c98104', l.id, 7, '2026-10-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '568207f4-de07-41c0-9a97-6b801804a92f', l.id, 8, '2026-10-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16a20914-ac78-4f17-b995-263abd98035a', l.id, 9, '2026-10-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a8789d43-aec3-4c93-bde0-eee6ea960def', l.id, 10, '2026-10-31T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #76: bass (khan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f5994bb4-13e8-40cc-bc6e-9b284dad5be3', '9100000076', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '8ced8705-4a1d-40c8-8e9c-5e1e02ed233b', u.id, 'bass (khan)', '9100000076', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000076'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '13a658f4-464f-42f0-96e6-b58d3caaaa6a', c.id, 'LN-076', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-08-22T00:00:00.000Z', '2026-10-31T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000076'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb07d043-a765-4aa3-a7c7-3940ceaff6f9', l.id, 1, '2026-08-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '44fb5745-c558-45f5-ad3f-6ac109e4c840', l.id, 2, '2026-09-05T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4bc25cad-cdb4-46b9-8583-d1304b8c99bd', l.id, 3, '2026-09-12T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7cb9b18-fed7-479e-aedd-451549c4167b', l.id, 4, '2026-09-19T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '38cfe05c-c110-4d8a-b8e0-fc7b0a27e970', l.id, 5, '2026-09-26T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f4d7a52-d3bf-42a2-bcf3-5e9c2920753a', l.id, 6, '2026-10-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7a9e2771-619f-4a18-ac2e-b4a6956ede41', l.id, 7, '2026-10-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd2c7e013-a70f-40fa-aa03-4f2d2489eef6', l.id, 8, '2026-10-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '398fe8ff-f063-42f1-9bab-5545617f4184', l.id, 9, '2026-10-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '56bc59bf-6b4f-43b7-87ab-66fa5adc3de0', l.id, 10, '2026-10-31T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #77: arvind (sb)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ed2f12db-05f4-43ad-a39a-a6e8971404ca', '9100000077', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f1d501a5-3450-495c-80cc-4da96c4a8aba', u.id, 'arvind (sb)', '9100000077', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000077'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8853f2bb-71a7-4d48-a935-7b4628fd6a13', c.id, 'LN-077', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-29T00:00:00.000Z', '2026-11-07T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000077'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1f10e123-5eaa-4083-b7eb-9c0026c72a56', l.id, 1, '2026-09-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '05fcc784-7e2b-41a5-bf32-0b7110822aeb', l.id, 2, '2026-09-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3da419e0-6ced-4842-9354-ebd840ef2c36', l.id, 3, '2026-09-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a354fd7-19ce-443a-b59c-36ddd215f5d2', l.id, 4, '2026-09-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7319db38-65cd-468c-b906-91a265f41d48', l.id, 5, '2026-10-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '32691f0f-add1-4010-8476-01ca1e905565', l.id, 6, '2026-10-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9be8e340-408b-478a-84f9-b996f80c66c3', l.id, 7, '2026-10-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a717048-d21b-419d-adbf-b0254171f575', l.id, 8, '2026-10-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'caac9b39-5b76-4903-a93b-f97f37dfdafd', l.id, 9, '2026-10-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9ee6975b-7d23-4de8-bee7-cb7817cb2b3b', l.id, 10, '2026-11-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #78: madhan (makku)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f0716404-dbe0-4295-9fc6-95a80b437aa3', '9100000078', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2408ee81-42df-422e-b4c6-97cbffcf1abf', u.id, 'madhan (makku)', '9100000078', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000078'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5178c783-ae7a-4cca-b1d8-ae58be8610ed', c.id, 'LN-078', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-29T00:00:00.000Z', '2026-11-07T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000078'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '616c0e1a-1da7-4523-85ab-a897f7de6e2e', l.id, 1, '2026-09-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '009ce93b-9476-46e9-b289-fe17f7b6b753', l.id, 2, '2026-09-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2e55fdb9-137f-4625-9537-c93c268ccdf2', l.id, 3, '2026-09-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0821e6fa-9d22-4f65-810a-a3a60fa54092', l.id, 4, '2026-09-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0c40b2f-e7cb-45ca-b9d6-40f9d6e59159', l.id, 5, '2026-10-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2fd38aca-c17a-4baa-8cad-bb9e25b4e0a1', l.id, 6, '2026-10-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26e1b743-8f9a-4bcc-9a29-5ce83374413f', l.id, 7, '2026-10-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '603b5047-b5a9-406f-9f4f-03e05246dd5d', l.id, 8, '2026-10-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '622f8b71-454e-4a34-8de2-565d4f84622d', l.id, 9, '2026-10-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '29e7ee0d-d0ca-4982-878d-36bf785c5c4f', l.id, 10, '2026-11-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #79: udhaya (rd st)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('577b7555-e2d7-4820-ab12-48785c0c7b9f', '9100000079', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '04e911d0-aa52-48b2-8c61-45711c3b4936', u.id, 'udhaya (rd st)', '9100000079', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000079'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '748af2ae-ddcf-40cf-b129-d45f9a9a0453', c.id, 'LN-079', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-09-05T00:00:00.000Z', '2026-11-14T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000079'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f767feca-b4de-421d-865b-c254af854783', l.id, 1, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2751ab71-312c-46cd-8b77-1e7bf799fae9', l.id, 2, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c50e4c69-35cf-4973-b025-a58b6549fe1a', l.id, 3, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb6647f5-eea6-4029-b23e-e612d0d77fdb', l.id, 4, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b0eac6dc-16ba-4f67-bc1f-bfc20b7e0024', l.id, 5, '2026-10-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9d472a7-6412-45df-b3e0-9b9f0b87f594', l.id, 6, '2026-10-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b8b72677-a8c8-4574-8a19-41ea90824c37', l.id, 7, '2026-10-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c7c2ffb-1bdb-4081-b824-1fc9db6defa5', l.id, 8, '2026-10-31T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a0bffa6-938d-4116-8bb5-df3776b964f8', l.id, 9, '2026-11-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6313fd2c-17d9-49f0-93dd-15a99702008c', l.id, 10, '2026-11-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #80: barath (mia)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('674f8aca-0ba5-4727-b664-b48987509a42', '9100000080', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '40cafe63-b3b0-4904-9373-a55f693bd119', u.id, 'barath (mia)', '9100000080', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000080'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f8593bd3-5a54-44ae-af63-70fd9306598e', c.id, 'LN-080', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-08-26T00:00:00.000Z', '2026-11-04T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000080'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0af85790-2ad4-4a23-bc85-80e427530051', l.id, 1, '2026-09-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df7de24b-d7c7-46f5-af25-b02a4529fece', l.id, 2, '2026-09-09T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '95ae0757-d520-4333-a85a-5677598ffe51', l.id, 3, '2026-09-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8d39bdc-740f-4846-8421-45e8b0a03f94', l.id, 4, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61e16c49-f148-4dd9-a2e2-53e0eadd6f72', l.id, 5, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '95401afd-7050-4643-a198-545b9d0bded4', l.id, 6, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f99f088f-2a1e-4bc4-834b-0a01580426c3', l.id, 7, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'baafde89-f18a-43e2-b1d6-e549ca87df18', l.id, 8, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99db7b66-3d05-495a-b39b-c1b842f13ffe', l.id, 9, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '43a35756-757b-4fa8-94df-ac76e23a17c9', l.id, 10, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #81: shanmugavel (kp)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('28ea3705-e907-46d7-83ad-619c63b783c5', '9100000081', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'dd5d9df7-6491-4f84-805d-1d25fea5bed8', u.id, 'shanmugavel (kp)', '9100000081', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000081'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'bf4e3c6c-e195-4a3f-b0c8-2d056830f7be', c.id, 'LN-081', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-05T00:00:00.000Z', '2026-11-14T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000081'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8569030-cf94-4442-899c-99845a234981', l.id, 1, '2026-09-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b7034aa9-3bae-41fb-985f-9a5f67050baa', l.id, 2, '2026-09-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0dfe083-d95c-4dc1-81c5-e46db8c2e135', l.id, 3, '2026-09-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9996645-91a6-4413-9458-c5fb3c73686c', l.id, 4, '2026-10-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '347def3d-e830-42b7-b9ed-08612dacf1a2', l.id, 5, '2026-10-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '78aeee1f-f790-4bf1-a558-78a6a8576b1c', l.id, 6, '2026-10-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42d8bde5-f7fb-4409-9ed2-d01f9eaa7e20', l.id, 7, '2026-10-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3fd5de04-2b22-4782-a49c-e59ba9ece338', l.id, 8, '2026-10-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff4b442a-a219-47f9-a4fb-62bf08479e6d', l.id, 9, '2026-11-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '58ce2d57-51ba-46c1-9096-f78abe06f8b7', l.id, 10, '2026-11-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #82: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c9ad99d7-8b59-4bea-a3e4-4f11fbd95b2f', '9100000082', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '96e78f64-47e4-4281-b289-b6361423cee1', u.id, 'vicky (metu)', '9100000082', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000082'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '13756f8d-44e5-476d-bc63-79a33c4c0824', c.id, 'LN-082', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-09-07T00:00:00.000Z', '2026-11-16T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000082'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47d548c6-b1ed-467c-b25f-04ce683c63ed', l.id, 1, '2026-09-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '72abb0c9-531b-4b87-adfa-6302ed167f19', l.id, 2, '2026-09-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6ee0ec0-3cf3-490f-83b5-e9a86bd77f1c', l.id, 3, '2026-09-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37aeac10-53e0-4f1c-93f6-5f9165a0e16c', l.id, 4, '2026-10-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4bbf3e2-9116-4fec-bd00-5af3e35b4f79', l.id, 5, '2026-10-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c8c6428-f13b-41aa-912c-12b7658dc854', l.id, 6, '2026-10-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fdb747dd-c592-489d-9e18-62df1f3a0e27', l.id, 7, '2026-10-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e674fa22-03bb-4b4b-a1a7-7777ff8eb61f', l.id, 8, '2026-11-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dcf7b3fa-931b-4db8-a3f0-abb3b71eb537', l.id, 9, '2026-11-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '80ea4bbf-5320-492a-aee8-93ae870b74d6', l.id, 10, '2026-11-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #83: mani (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5d00dd83-6531-40f8-b4cc-8a43b47957ba', '9100000083', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '642b21cf-721f-4c62-8984-f98db5a5a6ec', u.id, 'mani (metu)', '9100000083', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000083'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '83f499e8-9449-4908-bc2c-9855d6eb82f2', c.id, 'LN-083', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-06T00:00:00.000Z', '2026-11-15T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000083'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9ab46209-6042-49e0-9cc7-0fde465c4dd2', l.id, 1, '2026-09-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42c0ada8-0217-45fc-b95e-1b692e16c271', l.id, 2, '2026-09-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b96e7b6a-6740-473b-9555-f1ebcf0d75fd', l.id, 3, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b7ac2e55-07f3-4ca4-b307-9ec76a786ea1', l.id, 4, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5231e762-d582-42cc-86da-f82ff2dcc25c', l.id, 5, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '935985de-7f1f-4585-ba0c-de11d3632260', l.id, 6, '2026-10-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '308ba107-6805-43fd-87c3-6c9ed1d568ea', l.id, 7, '2026-10-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4f0ac32a-c490-4cef-86be-bc7ddd4d170b', l.id, 8, '2026-11-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'db02ba93-e537-4f71-ab97-b55601aef050', l.id, 9, '2026-11-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b9385c45-df25-4425-a6ef-e5283537a129', l.id, 10, '2026-11-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #84: balaji
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8d0e2033-cab6-4d88-be01-65404242add4', '9100000084', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '600496ab-9997-4f80-acb6-99f12dd3789c', u.id, 'balaji', '9100000084', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000084'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1386b411-6de5-471c-8f55-5ecda640ce47', c.id, 'LN-084', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-08T00:00:00.000Z', '2026-11-17T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000084'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e316f9f8-53c6-433f-adf0-113f8f7e4529', l.id, 1, '2026-09-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '64c02e21-83f8-4e8e-a029-f93823e75902', l.id, 2, '2026-09-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c67128df-10d8-4814-82ea-f248990ee85a', l.id, 3, '2026-09-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0d27f6a0-91f3-4ae2-82ef-2e5b13cb727c', l.id, 4, '2026-10-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf4f8026-7b49-4cd5-9b69-cb26dce5846c', l.id, 5, '2026-10-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '90910567-a0cf-4572-8be0-a12f28b47c68', l.id, 6, '2026-10-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c3a035c9-5cf5-4926-9a1d-e00514104308', l.id, 7, '2026-10-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff7d0496-2f5d-4bc4-85e3-0c4b62990846', l.id, 8, '2026-11-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a176d706-e9e3-470e-911b-fc775c87476c', l.id, 9, '2026-11-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5a8f0733-7d84-42af-a0de-34759e7ff885', l.id, 10, '2026-11-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #85: raman (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a0dd9baa-6291-4bfb-aa3c-5921b599cea0', '9100000085', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '587fe3a5-7a8f-4d23-9433-89d0ed0ea1e8', u.id, 'raman (metu)', '9100000085', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000085'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '50b6e854-1a51-4cae-a61b-6a808dbd7312', c.id, 'LN-085', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000085'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d84b1cc-3636-4246-920c-1ef174ab4e60', l.id, 1, '2026-09-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a225afe2-7aa5-47e5-b1da-55f6f092d67c', l.id, 2, '2026-09-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cf329143-d604-4467-80df-77b64c738ae9', l.id, 3, '2026-10-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd4871147-6d58-4d35-b92c-a5839835ab6f', l.id, 4, '2026-10-09T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47237c1b-9ceb-400c-8e9c-7e8c067794a2', l.id, 5, '2026-10-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dc63fe59-dcfe-46d8-a0b4-3a5133e38ae7', l.id, 6, '2026-10-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff2a7af3-ab50-416a-be05-d0c337a92edf', l.id, 7, '2026-10-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '29ebc3fa-be95-4ef7-87a8-6802a9c19a16', l.id, 8, '2026-11-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff92115b-c0f0-43b0-862b-86c27acf134d', l.id, 9, '2026-11-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd56bc429-b776-47fc-aad5-29ef22da96c1', l.id, 10, '2026-11-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #86: raman (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c8f202d3-a95b-4528-ae24-0a04db9470cb', '9100000086', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '1d0e3a9c-acb7-46bc-9151-cb62ac9f18ac', u.id, 'raman (metu)', '9100000086', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000086'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '898af404-41d3-441c-9bf8-fc646de01bd4', c.id, 'LN-086', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000086'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '864f3f82-4339-4fcc-855c-e58238eb83f3', l.id, 1, '2026-09-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ab7030ac-66d0-4dca-8f35-2298cdba2c8a', l.id, 2, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7ad2a310-a32c-4078-b5ac-800deba5415e', l.id, 3, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e1918739-00c8-4178-b801-a1fe4726d076', l.id, 4, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ef1804ce-fff4-42a2-9514-f272c94fbd25', l.id, 5, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e7228478-31fe-44e2-bdd7-19c044b8ec7f', l.id, 6, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd057be1c-9854-4a9d-a6e3-7c13ebfff7b3', l.id, 7, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b8dba57b-59e2-4785-8c25-182446b20fb4', l.id, 8, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'deb87aef-12cf-408a-8007-1fb4057899f9', l.id, 9, '2026-11-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8d98d329-f011-44a3-8f72-0d947730a5ad', l.id, 10, '2026-11-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #87: raja (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('b0fbd0c2-fc61-442a-8813-2830e8899dd6', '9100000087', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'de58b171-49a4-485c-89ae-6bef2a355335', u.id, 'raja (metu)', '9100000087', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000087'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ed7ec31f-4e3b-4959-b8f0-23a2d98e8ae9', c.id, 'LN-087', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000087'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b31c548-2234-41f0-af7f-47616a74a4d4', l.id, 1, '2026-09-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3115a7fa-274c-41fe-814c-65c097090b43', l.id, 2, '2026-09-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4ad088a9-bd55-42cd-8ca6-696053ad8911', l.id, 3, '2026-09-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f6a15118-d17e-4a7a-b66b-7a32434e8ab3', l.id, 4, '2026-10-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '262729b2-7ad0-4289-b914-172395e4f704', l.id, 5, '2026-10-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fcd2c9e4-71b1-4d32-83f0-600ed3518209', l.id, 6, '2026-10-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6a279dd8-0942-4569-875f-bd084b9fbf92', l.id, 7, '2026-10-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '45eed67b-216e-46f7-a707-cdc4e6e56e91', l.id, 8, '2026-11-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77c8d059-54c3-441a-9359-4c63a5578718', l.id, 9, '2026-11-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b56ac3dd-9131-4608-8d8f-aa61750208ed', l.id, 10, '2026-11-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #88: main (pattu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0dcfc320-8ba6-4d95-8ca7-802f6d2c50fb', '9100000088', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '79a91e21-afcc-4fad-8808-86d2b9eeab67', u.id, 'main (pattu)', '9100000088', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000088'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '262896cc-cbbe-4264-acf1-91ace10f5a9c', c.id, 'LN-088', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000088'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7b0cedb6-5762-4cdb-a765-fe24f441ecc2', l.id, 1, '2026-09-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f2eda3e-07dd-44ee-aaf8-1e3d1630e1b2', l.id, 2, '2026-09-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4e025ee8-5a63-4040-a5e3-5e2b7f448da1', l.id, 3, '2026-09-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8ec837cb-4bba-4ed8-b3d4-4d47e90c618b', l.id, 4, '2026-10-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '64303ea1-a10b-4eaa-ab04-888337e01ccf', l.id, 5, '2026-10-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd53c1bae-0059-463b-b63c-1af4e152618b', l.id, 6, '2026-10-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b34a3c21-4c35-48b1-94f8-8f1417e8046b', l.id, 7, '2026-10-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6ca0a81d-cfed-4706-8a6d-c98e99240fb8', l.id, 8, '2026-11-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '384af727-fde3-4b45-bf94-a87ff600d218', l.id, 9, '2026-11-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '63892c48-960b-453d-8391-bd694bb34370', l.id, 10, '2026-11-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #89: dhakshinesh (sakthi)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('55107de0-049d-4917-831c-8e2f5c9a4920', '9100000089', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '15413b5e-c700-41f8-b065-9e1e11bf7b1c', u.id, 'dhakshinesh (sakthi)', '9100000089', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000089'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '65698110-10a7-4323-b4d9-97ad510ef332', c.id, 'LN-089', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000089'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c4e3bba6-17d8-4c4b-a7a2-e20197e94cc2', l.id, 1, '2026-09-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '70caa806-7c76-41a7-9c1a-f043d3e8c790', l.id, 2, '2026-09-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cabfbc28-6521-4257-ad8e-9ae32c1b84a6', l.id, 3, '2026-10-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea9b5fc5-b424-4616-8775-6bf9581b874e', l.id, 4, '2026-10-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aae7d4ed-f4f6-4018-bab6-b150c8afb6ab', l.id, 5, '2026-10-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b6d2a55-ef34-4cf9-9703-cfc70dd3b841', l.id, 6, '2026-10-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b396c607-ad21-4739-b6e8-bfb1bc2238fa', l.id, 7, '2026-10-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6548d6f3-fcbb-475c-8df2-6762cc2d8ac7', l.id, 8, '2026-11-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bddeefce-1a58-490b-9de1-21c640027139', l.id, 9, '2026-11-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42b796f1-a834-43e2-aa34-09b6454e28f3', l.id, 10, '2026-11-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #90: venkat (sengadu motur)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('831e6a14-0289-4171-b3bb-e60eb528e206', '9100000090', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd47e033d-f3df-4756-b50a-ee20b3bf0a91', u.id, 'venkat (sengadu motur)', '9100000090', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000090'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f1066abb-1802-43f6-ae28-204c6c27c3dc', c.id, 'LN-090', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000090'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b4aaa9a-0aac-4a29-b018-9acf4b380484', l.id, 1, '2026-09-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69b8444c-a5c4-4da6-bb25-5b3aecfc4b1d', l.id, 2, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '104d585d-6297-4268-8f38-a899bb18c346', l.id, 3, '2026-10-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b195830a-5cf8-4f15-a182-4354ca06973a', l.id, 4, '2026-10-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7604d13c-4e9d-4204-a499-ff0208edb4a0', l.id, 5, '2026-10-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '00000247-d68d-431b-b763-b6024b8aa326', l.id, 6, '2026-10-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c026f0fb-2213-4826-8bcd-1bc2bb29a818', l.id, 7, '2026-10-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '600c8f2e-d0c5-4eee-b5b9-10a6a62f7569', l.id, 8, '2026-11-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6076d820-0d1d-42c2-8d23-78a760da4724', l.id, 9, '2026-11-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '52ef8370-e042-415f-b961-7c04186b5021', l.id, 10, '2026-11-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #91: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('edf3cda3-09ee-4590-9430-8680db1ada90', '9100000091', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6452ff64-1322-485f-869e-b16c0e4fc0ce', u.id, 'raghul (naren)', '9100000091', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000091'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '04f7fa31-720c-406d-9f81-d31e5e80e41f', c.id, 'LN-091', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-15T00:00:00.000Z', '2026-11-24T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000091'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1cd4077c-0836-4ceb-9024-fd5cee8ae2a9', l.id, 1, '2026-09-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8a94d6f9-d029-4a4a-a03b-5c419f680104', l.id, 2, '2026-09-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb62a588-4f65-4990-9f4f-6d6fe6a404c8', l.id, 3, '2026-10-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '93689b60-fa3a-42a6-ae2a-9d8ed150ff71', l.id, 4, '2026-10-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd73f7e4d-3f2b-4687-9956-9be3eabfa6b6', l.id, 5, '2026-10-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b6f04a9b-6aba-40c9-bb07-6d5631a8f174', l.id, 6, '2026-10-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2371bd4-e286-4e78-8829-8ed32203810d', l.id, 7, '2026-11-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c6e3f64b-a836-4deb-8ecd-28ecf0e7188d', l.id, 8, '2026-11-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eea18b80-d4f4-459d-842e-3428d62f28ce', l.id, 9, '2026-11-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f531765-0763-4650-af80-88031ec4fa71', l.id, 10, '2026-11-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #92: mohan (small)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('21da6652-7446-4349-b500-de096a5485a9', '9100000092', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f7ffe1e9-175d-4d34-bffd-0f8adc4e5381', u.id, 'mohan (small)', '9100000092', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000092'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '9990b1f3-c407-431c-bae3-bf4839af55e4', c.id, 'LN-092', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-09-16T00:00:00.000Z', '2027-02-16T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000092'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '51f8929b-3dc6-412b-8614-ec1e4feecd60', l.id, 1, '2026-10-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '66e01465-6b0c-4a58-9356-edac904f1a87', l.id, 2, '2026-11-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2ad1b423-4f5d-4e34-9e14-3c3112576952', l.id, 3, '2026-12-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df65f39a-70af-4c21-98c2-01314040d404', l.id, 4, '2027-01-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd26495b9-376c-4c98-a3a9-250b367ce1e4', l.id, 5, '2027-02-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #93: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('e31b9164-0158-4e38-a7e5-1d5b5c60f9b3', '9100000093', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6fd6572f-b179-45c6-8aff-be73d4fb291d', u.id, 'ajith (aali)', '9100000093', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000093'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ca70ac9f-122e-415f-8f0c-bd42172a5e85', c.id, 'LN-093', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-16T00:00:00.000Z', '2026-11-25T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000093'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1f8d5db6-fcb1-47a0-9b87-69c9b7c52493', l.id, 1, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f816ac0-151b-4d48-ab67-c3cee223ae85', l.id, 2, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a573fec8-4e41-4b55-ad69-ddae61a88df4', l.id, 3, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f34aa74f-6baa-4566-abf4-2bc2fdaee9c7', l.id, 4, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd55c6140-4215-474a-a82c-44fa51310e1f', l.id, 5, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31066f59-6e86-49ed-83eb-6cf4cf6a9337', l.id, 6, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '63ea66ae-beec-4616-9b0a-c175f8455e53', l.id, 7, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1135e6e2-cbe0-4c78-83fc-aae8f42fc638', l.id, 8, '2026-11-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a95dfbf-77bd-4821-8806-710b4c48af17', l.id, 9, '2026-11-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '57ed0375-b725-4be1-813f-bf2c4d2b91a6', l.id, 10, '2026-11-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #94: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7e0e13df-c582-47b8-921c-638cdc82999d', '9100000094', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'bf149b95-7310-4cd8-8f9c-c7d57aba420a', u.id, 'ragupathy', '9100000094', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000094'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c2ce6fda-30ec-44e4-a68c-450e3d39bf45', c.id, 'LN-094', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-18T00:00:00.000Z', '2026-11-27T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000094'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6e5f2635-1ceb-4059-8ae5-806023cb865b', l.id, 1, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3560305d-2695-499e-88aa-6a955181fa2e', l.id, 2, '2026-10-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b5753d0b-8505-4c7b-a2af-04e738c514a7', l.id, 3, '2026-10-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6ed7b893-ae80-4b93-8fd5-1208aeafeabd', l.id, 4, '2026-10-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27212cee-a127-4b05-b7d1-fbf69aa23db6', l.id, 5, '2026-10-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b4e37c21-88ea-46cf-97ea-1716cbb51b47', l.id, 6, '2026-10-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1dd41861-2ae2-4be4-9825-f207dbb6b7ad', l.id, 7, '2026-11-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd84c0f06-bb50-45be-a87b-6001fd9dbd34', l.id, 8, '2026-11-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd99b43f0-fea8-4632-ba28-ea9f6ce597b6', l.id, 9, '2026-11-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4415f7e-f57b-48f7-8c60-facecd537e62', l.id, 10, '2026-11-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #95: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('64edee9f-9f6b-48fc-ba41-41ca27948263', '9100000095', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '38671541-77f7-4ea0-a22a-ca0fe85d94bc', u.id, 'elango (pigga)', '9100000095', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000095'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ee39be83-7a2a-4493-be86-bdf8ab48b76e', c.id, 'LN-095', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-20T00:00:00.000Z', '2026-11-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000095'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '370fd14b-4cab-4691-ad89-0250b950ce4d', l.id, 1, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f83cc756-9197-4701-917a-f5019d097804', l.id, 2, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '812d7e8e-1b73-4c1a-bf96-06d3f36ba941', l.id, 3, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0ad69c4b-9fba-439b-a416-a8e9e8ef9409', l.id, 4, '2026-10-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '878c5602-6eec-4a68-817c-5a39f0a0bc7c', l.id, 5, '2026-10-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f9e11cc6-bcee-4525-8ae1-f50f5f2a6fba', l.id, 6, '2026-11-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2f263820-3d55-4212-a3d1-8489211fef3c', l.id, 7, '2026-11-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd89fb80b-affc-439e-a92f-1e6427b7a3d2', l.id, 8, '2026-11-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b4572126-5fd3-4b5e-8470-f58c5590c4e7', l.id, 9, '2026-11-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c4a8c10-f112-48d0-ba25-471e368484b4', l.id, 10, '2026-11-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #96: ramesh (eli)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('41a6f953-cbd6-4116-995a-057163732517', '9100000096', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '8263f00f-e251-468f-9046-a49bc5fc603e', u.id, 'ramesh (eli)', '9100000096', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000096'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7cc863ad-8c4b-4a9d-96bc-b21931ae7677', c.id, 'LN-096', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-20T00:00:00.000Z', '2026-11-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000096'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd5ec0709-c4cb-4190-8e07-83d1bb95afa7', l.id, 1, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ccebf4b6-2912-4b68-91e6-6ae20327fe9d', l.id, 2, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd84601b-bdd9-4043-964e-ddebfb65d7af', l.id, 3, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f54f715-62d6-48b0-b7a8-4cdcd012b9e7', l.id, 4, '2026-10-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f4068274-b5ff-4f4b-a285-bf7fff769c95', l.id, 5, '2026-10-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2a41c62-1a4a-429c-bd80-56812fda7caa', l.id, 6, '2026-11-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '76e7c0b2-2eb4-4605-bb0f-8e1fec9477be', l.id, 7, '2026-11-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb9bc857-9406-47ca-bb25-e8b0432b72ca', l.id, 8, '2026-11-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '74154296-fcf9-43c8-90e1-650b17734ef4', l.id, 9, '2026-11-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ed6715d1-0bc7-4df2-9f35-0fda3882ba5b', l.id, 10, '2026-11-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #97: dayalan (manda)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('619db9db-6985-4fe6-a78e-e43746933588', '9100000097', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '0b322a57-e503-4639-ac39-f705b7a209d0', u.id, 'dayalan (manda)', '9100000097', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000097'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'bc60334a-1978-4e51-895b-17b43176d440', c.id, 'LN-097', 'WEEKLY', 6000, 10, 0, 5400, 0.00, '2026-09-21T00:00:00.000Z', '2026-11-30T00:00:00.000Z', 10, 600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000097'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4d15d622-6368-4e69-bc73-05aca46faf5e', l.id, 1, '2026-09-28T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '95b45a4d-9aa2-457a-a3d1-0b4f6833165a', l.id, 2, '2026-10-05T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e53f1675-b22d-4bda-8c96-377b881b2174', l.id, 3, '2026-10-12T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff3e6d66-92e1-48d2-ab33-d7d8afdfc2f9', l.id, 4, '2026-10-19T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '79ed793e-c0c3-4de2-af3a-49daa42be615', l.id, 5, '2026-10-26T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d6593e2-343c-43e5-a55c-03c6e13e3cf5', l.id, 6, '2026-11-02T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '977cc122-6e31-4413-b41e-f5516d9d5420', l.id, 7, '2026-11-09T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fc13ac41-81c5-4720-8e18-c0add8d079a1', l.id, 8, '2026-11-16T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68cc2647-be0f-4558-9a35-fadcf9cd4741', l.id, 9, '2026-11-23T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fc644756-064d-4608-9bf2-69a3d16f3d7b', l.id, 10, '2026-11-30T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

COMMIT;
-- Completed import of 97 loans