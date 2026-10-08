BEGIN;

-- ====================================================================
-- STEP 1: CLEANUP / DELETE EXISTING RECORDS FOR LOANS 52, 56, 57, 59, 60, 61, 70, 86, 90
-- ====================================================================

-- 1. Delete receipts attached to any payments of these loans
DELETE FROM receipts 
WHERE "paymentId" IN (
    SELECT p.id FROM payments p
    JOIN loans l ON p."loanId" = l.id
    WHERE l."loanNumber" IN ('LN-052', 'LN-056', 'LN-057', 'LN-059', 'LN-060', 'LN-061', 'LN-070', 'LN-086', 'LN-090')
);

-- 2. Delete payments attached to these loans
DELETE FROM payments 
WHERE "loanId" IN (
    SELECT id FROM loans 
    WHERE "loanNumber" IN ('LN-052', 'LN-056', 'LN-057', 'LN-059', 'LN-060', 'LN-061', 'LN-070', 'LN-086', 'LN-090')
);

-- 3. Delete dues for these loans
DELETE FROM dues 
WHERE "loanId" IN (
    SELECT id FROM loans 
    WHERE "loanNumber" IN ('LN-052', 'LN-056', 'LN-057', 'LN-059', 'LN-060', 'LN-061', 'LN-070', 'LN-086', 'LN-090')
);

-- 4. Delete the loans themselves
DELETE FROM loans 
WHERE "loanNumber" IN ('LN-052', 'LN-056', 'LN-057', 'LN-059', 'LN-060', 'LN-061', 'LN-070', 'LN-086', 'LN-090');

-- ====================================================================
-- STEP 2: RE-INSERT CUSTOMERS, LOANS AND DUES
-- ====================================================================

-- Record #52: sarath (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6eac5633-8024-46a2-bfb2-9e7315edd79e', '9100000052', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e0bc50c9-43da-45aa-a6de-5e4f6b27639e', u.id, 'sarath (kv)', '9100000052', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000052'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '6cb9d8c3-0ebf-4286-a981-2ce1d0d9c54e', c.id, 'LN-052', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-17T00:00:00.000Z', '2026-12-17T00:00:00.000Z', 5, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000052'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf8eea3d-d650-4587-b0a7-075f9a9c8b08', l.id, 1, '2026-08-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '11966a8b-f8c4-4f74-8a45-a3d1b93cd06b', l.id, 2, '2026-09-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1958ed69-e9b5-49d3-88d5-1a175a74fe7f', l.id, 3, '2026-10-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1900c1d7-3737-4523-b851-bf13920e445c', l.id, 4, '2026-11-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '252981f6-63de-4014-af64-7136aa79563f', l.id, 5, '2026-12-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #56: sakthivel (mangalam)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('fa71db14-f75b-4922-b23a-693c2ea97d34', '9847557749', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '570c7084-72dc-4da7-8611-58999c5e2382', u.id, 'sakthivel (mangalam)', '9847557749', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9847557749'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b8990d5c-49da-49cd-808e-a4333e54d521', c.id, 'LN-056', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9847557749'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2cb9a0ef-1a36-4e3e-ad0d-4e4e9c3be98a', l.id, 1, '2026-07-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'beaf6aaf-c62c-4858-acb2-55876471dc4a', l.id, 2, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9faac600-001b-4b30-aaaa-e79ca8c67e72', l.id, 3, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4bbcdb70-86fb-44a7-b0b9-1258d0dbc0ce', l.id, 4, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ecc489e6-35c1-461d-a31d-48a925ec386b', l.id, 5, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '673186ae-4a74-49d3-8c6e-52ff5267dafe', l.id, 6, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0c7d153-0746-4439-821f-f34cf766d46d', l.id, 7, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '20f11b16-e173-47e1-93ac-dd8442ab490a', l.id, 8, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '925f5193-dbc1-4cd6-a48a-a1ee4677d47f', l.id, 9, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '24dc9d82-e631-43cf-a42e-d3a01efaf04f', l.id, 10, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #57: ranjith
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('cca179da-e2d2-4904-9c2d-25208af52010', '9100000057', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '71a5815f-5777-45ed-a1e7-ab94d17c7867', u.id, 'ranjith', '9100000057', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000057'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'e9074264-cfc4-4c4e-83d0-f6c7af689cae', c.id, 'LN-057', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000057'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c5bc01dd-f383-40d9-bda5-cb9b402f0f2d', l.id, 1, '2026-07-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '13635c6d-404b-4b05-b1b1-758ab1e92371', l.id, 2, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '38131e36-310a-4d0f-ae21-84c4288c7ead', l.id, 3, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '607c70ca-486a-4ff4-b81a-ce6a40ff4b13', l.id, 4, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e86681de-693c-4de5-a3b7-11608857af17', l.id, 5, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd4df12c6-7c06-4fc5-83a4-d8a211d936c0', l.id, 6, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '08bbfb89-32f9-450d-9712-14d1f001f50f', l.id, 7, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '184457af-6e2d-4619-beb7-73c8a93a75f4', l.id, 8, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '74759572-b85d-41de-9181-23d0d34d98c8', l.id, 9, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd1481a91-d04b-4f14-af93-5de0272c9e27', l.id, 10, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #59: ajith (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f2ac877c-67a4-4fae-9763-53a3d1ce5e47', '9100000059', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'bf93f080-01b4-48f5-98cc-4bb78be16c85', u.id, 'ajith (metu)', '9100000059', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000059'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '81dd06bb-e15b-4798-bb4a-59b6e2f4f1e0', c.id, 'LN-059', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-07-24T00:00:00.000Z', '2026-10-02T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000059'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c56e0bd-9231-4bf6-a68c-07b67ede6569', l.id, 1, '2026-07-31T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bd443d9c-6ca8-4389-a040-aa2565f91d22', l.id, 2, '2026-08-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dbf20a68-9153-4d49-b8b5-bce58e72b0a4', l.id, 3, '2026-08-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b37e332e-7dc5-462c-b7bb-36749e055c8f', l.id, 4, '2026-08-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7d7759bd-7651-4fae-b8ce-688293e40984', l.id, 5, '2026-08-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6c326464-c3ae-4499-8334-79c2be168678', l.id, 6, '2026-09-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0a324030-65c6-4524-8a89-8a0413899ab9', l.id, 7, '2026-09-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5e8b5e0a-f6a0-49f5-9a75-59cbd703066c', l.id, 8, '2026-09-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '67889e3f-c92f-40c6-8668-caadbc31cbb5', l.id, 9, '2026-09-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aceb7780-7045-4437-87c8-fe0e5d23b40e', l.id, 10, '2026-10-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #60: ganesh (karesh)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('b2f60022-49aa-4779-8437-488325a2cf57', '9100000060', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9a389383-c81f-4dc2-815b-e453b688d72e', u.id, 'ganesh (karesh)', '9100000060', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000060'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '837a9502-f56d-4ed0-bb9e-17da381f6734', c.id, 'LN-060', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-24T00:00:00.000Z', '2026-12-24T00:00:00.000Z', 5, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000060'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd6d0f2c-4f91-481b-9eed-baf7b2b4a5ed', l.id, 1, '2026-08-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f94f61cd-f715-4ebf-9430-d0e35d9bb527', l.id, 2, '2026-09-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3ee18f6f-9264-4e88-9dc7-198ab73afecc', l.id, 3, '2026-10-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7eaebe63-722c-4f3c-b849-310ffcd47c9a', l.id, 4, '2026-11-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd7129a8e-8bf8-4650-96dc-0b34863cd559', l.id, 5, '2026-12-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #61: Suresh (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('80c3c1eb-619b-4b80-bdf5-cdc148969f8b', '9100000061', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '4d3f333c-51eb-4605-b262-46477775689a', u.id, 'Suresh (mesthiri)', '9100000061', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000061'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '30c1432f-fb02-4cff-9683-4cf9867de5e4', c.id, 'LN-061', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-25T00:00:00.000Z', '2026-10-03T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000061'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c413a128-729d-4e65-85f2-a2e57cc69d42', l.id, 1, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '068df260-9c5c-4087-91ea-0e46e496e237', l.id, 2, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5386721c-7f32-4e9d-a7e5-bd4ec0ef0523', l.id, 3, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '999a3473-e377-4b00-a200-522cd6aebd95', l.id, 4, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fe7815a1-71f6-4ac9-8231-5c8bf4eb62bc', l.id, 5, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '38104904-8e5d-4da4-8a3e-dca037222fda', l.id, 6, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '697e8f43-5548-48ea-9829-4612bc9b45f0', l.id, 7, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '077e3016-c74c-40a8-ac67-d6a5ac29e834', l.id, 8, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bcbe2412-4c76-40de-8737-d8743165ef19', l.id, 9, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c06b37c1-fb89-4d1d-a10c-31f831f3ff47', l.id, 10, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #70: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a64ff9b8-534a-4ea7-84a5-2118e856dc12', '9100000070', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '733cd7d6-496b-4977-847a-d7b20f1809ea', u.id, 'venkatesan (kv)', '9100000070', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000070'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1f82bff7-3056-4ef3-871b-d221c1c9f09a', c.id, 'LN-070', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-08-10T00:00:00.000Z', '2026-10-19T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000070'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1621f5f6-9c40-4b41-8e05-e9d897ba960a', l.id, 1, '2026-08-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a621e08f-44ed-4288-a2d4-8f49cdc31c28', l.id, 2, '2026-08-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e563ffee-ddda-43e6-af21-e37d67ddf6b9', l.id, 3, '2026-08-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '066998ab-a5c2-4662-b9d4-2176ce866e19', l.id, 4, '2026-09-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c63829d9-ee3d-4a7b-a301-3d39a944f9ec', l.id, 5, '2026-09-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f39fb32a-2bfc-4d70-98f8-5f3b4dbc33fe', l.id, 6, '2026-09-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c574111-d798-40b5-92ff-aed8c2addbfc', l.id, 7, '2026-09-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '159f89f9-915a-419f-be09-f986d255b59b', l.id, 8, '2026-10-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8c9aacd-5a6d-43ad-9919-f738ff344887', l.id, 9, '2026-10-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '213cb5bd-2037-4f05-8d76-02fc3c98222e', l.id, 10, '2026-10-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #86: raman (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('efbd8437-cae2-49e8-b5bb-403a049a98c4', '9100000086', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '66138b5c-6ded-48d0-830c-e9d34eeb71bc', u.id, 'raman (metu)', '9100000086', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000086'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0894a982-9145-445e-aecc-584089c6c173', c.id, 'LN-086', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000086'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd3b45cdc-b17c-45b9-b368-21178f32a94f', l.id, 1, '2026-09-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d11fe18-4a0e-4082-a12a-8105690ad7a4', l.id, 2, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bc1e0e54-cf3e-47b3-af23-a38d9a8a5d2f', l.id, 3, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '35d23a51-c676-4e03-b21b-1d8491fc3b95', l.id, 4, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '72448779-1795-4c25-b836-5d56070d6dea', l.id, 5, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f4bcae9-f496-4f5d-8eab-0317b04d146a', l.id, 6, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '033219db-f894-4a0a-b074-1432d89293f1', l.id, 7, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b67f06ef-9755-4848-96d6-18f5f50c7081', l.id, 8, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f10465e8-7ebb-41d7-a2b5-4446188cadbb', l.id, 9, '2026-11-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b429dc07-8485-416a-bf51-b9210dd48ea1', l.id, 10, '2026-11-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #90: venkat (sengadu motur)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6dba3f37-1074-48dc-a9f6-240361af872e', '9100000090', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3adb0c5d-18c2-4478-89e2-c6c4f03daec0', u.id, 'venkat (sengadu motur)', '9100000090', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000090'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0366df78-783d-4b04-a520-a2eb10461f1a', c.id, 'LN-090', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000090'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6bc8d4de-a467-41bd-805d-43d87e3e4fbf', l.id, 1, '2026-09-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac4570ae-47fa-48a6-8761-d588274c8017', l.id, 2, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2183f30f-e400-48f2-94f2-efacb6e61e98', l.id, 3, '2026-10-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3e4b789-3a60-467f-803d-bb95048b4f14', l.id, 4, '2026-10-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8ab2cf5d-0ae4-4832-8a5e-0e2e20056105', l.id, 5, '2026-10-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '50d00520-084a-480d-ac9e-3cfdae8da022', l.id, 6, '2026-10-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c5787594-8971-40f6-b60f-a5230573fc8d', l.id, 7, '2026-10-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'de914a81-c25d-4aa7-a9ef-a1e89df29ed6', l.id, 8, '2026-11-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b9dc6452-a3ae-42af-9acd-21230557961c', l.id, 9, '2026-11-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '815d33af-9973-4a87-9069-f0967d503a40', l.id, 10, '2026-11-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

COMMIT;
