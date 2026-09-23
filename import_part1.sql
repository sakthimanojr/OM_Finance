BEGIN;
-- Record #1: pattu (mani)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a591a3d8-8b35-42e2-9838-9c87153483f9', '8825696877', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '0fc45676-1984-4e36-9225-a9435a6e1131', u.id, 'pattu (mani)', '8825696877', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '8825696877'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '38a0f13f-fe54-4cb0-ae2a-1ca57c3f1b3a', c.id, 'LN-001', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-16T00:00:00.000Z', '2026-06-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '8825696877'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec908902-f8b5-4333-866b-e6806b78ff8f', l.id, 1, '2026-04-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9ba6562e-b8bc-4dc2-b626-0bc8e4061ce5', l.id, 2, '2026-04-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cccc6e44-f0c1-4ef4-a87d-9e04afc1fc7e', l.id, 3, '2026-05-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e317332a-6d70-4ac9-9863-5e031fc44f39', l.id, 4, '2026-05-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '796787d4-be20-4cc5-81cc-45a752344d37', l.id, 5, '2026-05-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f03c28aa-8e2d-462c-a4f0-e16a68e843fd', l.id, 6, '2026-05-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4141d0ae-2ef0-4d5b-b0a1-c6143ec88acb', l.id, 7, '2026-06-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb208964-d888-4790-988b-ee99296810bf', l.id, 8, '2026-06-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '672ca019-19c4-4637-ad0a-2c4c834216fd', l.id, 9, '2026-06-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46906ddc-c9be-46dc-b1a0-f9dcfbd30f25', l.id, 10, '2026-06-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #2: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c4f81cbd-42e9-4dbc-a571-1cbd4a93dcd4', '9655320968', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'dd2d0541-1c81-4f6f-9ced-7c10dee92f9f', u.id, 'ragupathy', '9655320968', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9655320968'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '833dbc12-6129-4eb3-a8a4-02036648afdd', c.id, 'LN-002', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-16T00:00:00.000Z', '2026-06-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9655320968'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '56046d90-c6cf-4899-a6d4-82f8076edf27', l.id, 1, '2026-04-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54e91bf7-3aa3-4238-ad6f-526e2e5bdf47', l.id, 2, '2026-04-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ceeb3032-6a16-454a-977b-bd88f4fd75c6', l.id, 3, '2026-05-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dd4b0643-7f77-41b1-8daa-ae39bf7c47d2', l.id, 4, '2026-05-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1f3507c6-8218-4665-b221-6eff6c548ac5', l.id, 5, '2026-05-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f322c021-6b88-46e3-92c7-16c13c9a2baf', l.id, 6, '2026-05-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5692b11c-795d-411c-bd58-c89c2dba34d6', l.id, 7, '2026-06-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1d3e642-43b7-4dab-9721-79628c9e7956', l.id, 8, '2026-06-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a3de5ea-2d3d-4142-8d4c-eb17fcb3103a', l.id, 9, '2026-06-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7893317e-c559-454e-838c-e95c316d7e3b', l.id, 10, '2026-06-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #3: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4ca29114-8f3b-4248-8ae5-79e9d799c4c3', '9655550366', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '208d0c78-4b4f-4de5-83da-75f01f3f6ea1', u.id, 'venkatesan (kv)', '9655550366', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9655550366'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '576d74bc-cf26-418f-9977-1289ce6f2d12', c.id, 'LN-003', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-15T00:00:00.000Z', '2026-06-24T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9655550366'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0b38bac-c494-4aee-9695-97754a2c0fd1', l.id, 1, '2026-04-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5831763b-c2c6-4aad-928a-9b2a403f920e', l.id, 2, '2026-04-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '25dbf9d5-ddaa-4252-9499-6c5f3a6fe479', l.id, 3, '2026-05-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f9d91e9f-760c-4cbe-85ed-a08196d5d87f', l.id, 4, '2026-05-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bcbafd8a-2025-480c-9e82-f08592afac30', l.id, 5, '2026-05-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '823dc3b6-16f2-49bd-9af4-6bbd646b4506', l.id, 6, '2026-05-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3bef8670-373e-4ed9-8e15-7397648f88f5', l.id, 7, '2026-06-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'af358f0d-1dba-49e4-821b-d81c3fabb3e8', l.id, 8, '2026-06-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d8d042b-f645-4ac6-88bb-65ed74910bfa', l.id, 9, '2026-06-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f73bb55-21c2-4f58-b247-64d5cce8e495', l.id, 10, '2026-06-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #4: naga (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ac5c5d9f-c1e4-4354-8637-fda92c6d9afe', '6383153440', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '72441a88-2eb6-4281-8872-31c1db601940', u.id, 'naga (mesthiri)', '6383153440', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6383153440'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b180018a-bd5f-4667-841b-992fb5cbccfc', c.id, 'LN-004', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6383153440'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '360e9865-c38a-4767-8414-60839d32db97', l.id, 1, '2026-04-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f49bbeed-56f3-40bb-ac91-6ee6fb355435', l.id, 2, '2026-05-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f1cceb9-6bb0-4c3f-bd8b-0ff38cc41874', l.id, 3, '2026-05-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '535ee876-5f64-445e-b457-a3807ae6ef1d', l.id, 4, '2026-05-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '708842a2-aa89-49bd-b48d-49a5b3603963', l.id, 5, '2026-05-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5b588381-1a6e-4335-8893-237391b4846d', l.id, 6, '2026-06-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4497686f-a4ab-4f79-8103-a22cab263962', l.id, 7, '2026-06-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3fc1abee-b05c-46be-8a67-fd10a4eee585', l.id, 8, '2026-06-15T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e781637b-1741-4068-bb42-393c4926ee8a', l.id, 9, '2026-06-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a60fe08-b55c-478e-9213-3004e7da8f68', l.id, 10, '2026-06-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #5: ajith aali
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('bf951701-af97-41f8-ba40-c8fcfab02d92', '9100000005', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2382ca5d-5725-42e2-8074-d3e17da720d3', u.id, 'ajith aali', '9100000005', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000005'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a5cee186-6757-44d6-873e-3c7d336d4389', c.id, 'LN-005', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000005'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e606dc83-4a4f-42eb-afab-cfae4275f3c5', l.id, 1, '2026-04-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3b213a1-fc2e-4194-9071-391069d5ea5a', l.id, 2, '2026-05-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '425f597f-4067-4cd3-be83-7a1239674796', l.id, 3, '2026-05-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4570996b-75e1-4b07-aa7b-c700328c5865', l.id, 4, '2026-05-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37068e08-1c1b-4d66-a80e-666868375173', l.id, 5, '2026-05-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'abf3b6cc-ce6e-45d2-9db2-d9fb0e958766', l.id, 6, '2026-06-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7bfac57b-2de0-4333-8bc4-33fe9c6ca736', l.id, 7, '2026-06-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c10c1db4-45b8-4233-8ced-8741dd5d4bb2', l.id, 8, '2026-06-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '048457be-49be-43e0-804e-6a2a596d94a6', l.id, 9, '2026-06-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b40361e4-74d3-4891-b2e7-7f8b9ff47f7c', l.id, 10, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #6: praveen (baguti)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('53ee28d9-8d5a-48d7-9d27-1f5ae3b23a47', '7825985142', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '679cc63b-7b25-40ae-8553-5610ef5cbf41', u.id, 'praveen (baguti)', '7825985142', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7825985142'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b47b4ded-f665-440c-99d6-75f56730e844', c.id, 'LN-006', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7825985142'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf955c3c-4ca4-406d-9e43-ff2394f13f64', l.id, 1, '2026-04-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e20b8703-0b00-4a43-a62b-be73cc48193e', l.id, 2, '2026-05-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75379873-08b0-4c26-a61c-d4d414334669', l.id, 3, '2026-05-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f09c958-8202-4dbf-838d-dc29a8a3092c', l.id, 4, '2026-05-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '51868196-4cb0-434b-ad0f-197651e6e427', l.id, 5, '2026-05-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '655344e1-76ef-4c9c-bab0-fca403ee89bf', l.id, 6, '2026-06-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f67ab17-784c-4947-89c0-16dc625c0f59', l.id, 7, '2026-06-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c4d9bca4-3175-4104-9738-69f2c77036f3', l.id, 8, '2026-06-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16be31c6-1e4e-4cb8-a47a-6b27629cf0cb', l.id, 9, '2026-06-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9e2fbca8-5ec0-4021-82a5-53850a111357', l.id, 10, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #7: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('bd8e111b-43cc-43fa-8d46-ee5afcb1b075', '9100000007', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9cca03cf-2ca9-410a-b5d5-d9eaabd3ad8c', u.id, 'elango (pigga)', '9100000007', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000007'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4b2bab4f-59b8-49eb-917d-eae504686969', c.id, 'LN-007', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000007'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '56acb54c-7bf4-4252-b04d-b5900147d8f1', l.id, 1, '2026-04-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75b57cdf-8fc6-4711-beb4-aa1da0636559', l.id, 2, '2026-05-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '043e18cc-7508-4cdc-af9f-47608c3cee3f', l.id, 3, '2026-05-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ef3a98b3-ac7b-46db-8543-c69f9cdad576', l.id, 4, '2026-05-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '508a8d26-03ce-457f-aadb-5c81caf38b76', l.id, 5, '2026-05-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9186267a-a0f7-48af-8644-fe3e1ad7a9dc', l.id, 6, '2026-06-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '36a5ba5e-1d8b-4911-83bb-7d736c16aa23', l.id, 7, '2026-06-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1cbec56e-374d-4179-98bd-7f3bf344e8bc', l.id, 8, '2026-06-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0218e8f1-1575-4ceb-8e1d-930ff2922afe', l.id, 9, '2026-06-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c3a34a2d-b1d6-4ec8-9418-2541f48c5926', l.id, 10, '2026-06-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #8: arvind (sb)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a975f678-1067-4291-a206-8200247742fc', '9100000008', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '18339aae-4f6a-4418-ae7e-dccdbf934248', u.id, 'arvind (sb)', '9100000008', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000008'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '644d3519-19f2-4126-ab13-a1510d0fe159', c.id, 'LN-008', 'WEEKLY', 25000, 10, 0, 22500, 0.00, '2026-04-25T00:00:00.000Z', '2026-07-04T00:00:00.000Z', 10, 2500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000008'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '150843be-3d24-44c0-af09-98f663beeeda', l.id, 1, '2026-05-02T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4b93885b-bd14-4db3-bc80-569df7241128', l.id, 2, '2026-05-09T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1a39947f-3a02-4a97-b8bd-1ca7c0d0b327', l.id, 3, '2026-05-16T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '716d884a-b7c9-4ee9-9f43-1be80814088d', l.id, 4, '2026-05-23T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '79968330-9760-47a2-b67c-6eebae1f62ed', l.id, 5, '2026-05-30T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f0ba18e0-978c-49ae-95ab-e572249512da', l.id, 6, '2026-06-06T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0198fa43-ce08-4537-948a-f0b9942a0e1c', l.id, 7, '2026-06-13T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5e372393-a81e-49aa-aa6b-4475626cf746', l.id, 8, '2026-06-20T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4fa0e03f-6ea3-4594-bd78-717b42fad1d4', l.id, 9, '2026-06-27T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '04acf055-238d-4325-bdda-aaa308d9a7d6', l.id, 10, '2026-07-04T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #9: sakthivel
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3352c014-be5a-4cc3-9bbf-369a3bf286c1', '9100000009', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f6e2f994-965b-4d08-8daf-2ad9c6f70873', u.id, 'sakthivel', '9100000009', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000009'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'be5c3e3c-e685-4c08-9ba6-cd423f6653c7', c.id, 'LN-009', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-04-28T00:00:00.000Z', '2026-07-07T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000009'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2917ee0f-0e49-4b86-a6cf-dbde80ea9099', l.id, 1, '2026-05-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0a862a47-0632-4b0a-a990-2ca1ad124554', l.id, 2, '2026-05-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '559a7994-51ba-47fd-ade7-f9790aec568e', l.id, 3, '2026-05-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1efcee39-ae8d-48af-8431-33f94303451d', l.id, 4, '2026-05-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '05f868da-502e-4a6d-b653-7cc3797fc0d9', l.id, 5, '2026-06-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '223953c8-5eb2-454e-b8f8-525e24a104cd', l.id, 6, '2026-06-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f5144a1e-dc5b-4921-ab92-9b7fb7af1aac', l.id, 7, '2026-06-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '480cc47b-9267-4db4-86d1-4ac6f0987856', l.id, 8, '2026-06-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bd4549ee-b7f9-4f86-be2a-fd13347d5cfc', l.id, 9, '2026-06-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c167aa7-b7e1-4866-88b6-7897699fac58', l.id, 10, '2026-07-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #10: kisoth (sappa)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2ffbe7e7-962a-4319-874d-ece0037bbcb9', '9100000010', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '40e4968c-d289-428c-a153-a81b3daf8b7a', u.id, 'kisoth (sappa)', '9100000010', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000010'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '580f91d9-ad51-4a6f-bf3e-fa9d193ddb72', c.id, 'LN-010', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-04-28T00:00:00.000Z', '2026-09-28T00:00:00.000Z', 5, 3000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000010'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f8e3e5da-2e83-4eb5-b78d-65cb8b478c36', l.id, 1, '2026-05-28T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '12af428c-0382-4061-9f50-a5634b541ffe', l.id, 2, '2026-06-28T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7de4a8d9-1e97-41c5-955a-2f35d1e7c4ad', l.id, 3, '2026-07-28T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd5d2d204-340a-40b7-a814-3bab4a2744b3', l.id, 4, '2026-08-28T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '234e56cd-ba46-4348-94a9-df5838a8d4e1', l.id, 5, '2026-09-28T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #11: balaraman
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('87625215-835c-41eb-bc71-26e8ba453ee7', '9100000011', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7e355c70-3096-42d8-9e28-cff9b778cada', u.id, 'balaraman', '9100000011', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000011'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '973886fb-b962-432a-b212-8eb42bea474a', c.id, 'LN-011', 'WEEKLY', 30000, 10, 0, 27000, 0.00, '2026-04-27T00:00:00.000Z', '2026-07-06T00:00:00.000Z', 10, 3000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000011'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e35db9f6-c271-479c-9b92-b281e42e7cb4', l.id, 1, '2026-05-04T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e662863d-5b72-41b1-9a7a-e54a4ce7a5d8', l.id, 2, '2026-05-11T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dbf96b12-d53c-4588-a9be-53f887fd2419', l.id, 3, '2026-05-18T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0a8a1e93-2a1d-4184-b8b6-5cda5399534f', l.id, 4, '2026-05-25T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b4b598e2-b3bd-4cca-9eb4-01f1dd6f0228', l.id, 5, '2026-06-01T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6c378af4-914f-4a07-86f8-31184a0e7db7', l.id, 6, '2026-06-08T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '52c65f0a-d98b-4955-a803-a8dba2cb8b44', l.id, 7, '2026-06-15T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9b5d674e-bf94-4893-b554-6a2541bd6b36', l.id, 8, '2026-06-22T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec9169dd-16b1-4d82-b3e8-e5d9abb9869a', l.id, 9, '2026-06-29T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '925037e8-fc01-45cb-9fbf-861bd1fbcf94', l.id, 10, '2026-07-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #12: ajith (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8cf4b6a6-9eeb-483d-837d-275372321be3', '7270276690', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '02b9ad99-bb83-43f9-aee9-39e3a92cf658', u.id, 'ajith (metu)', '7270276690', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7270276690'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '2b6d9a7e-5ba0-4f29-ad8d-4d818dfa5e91', c.id, 'LN-012', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-09T00:00:00.000Z', '2026-06-18T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7270276690'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01d37322-fb2e-4847-814f-8465b9163eb4', l.id, 1, '2026-04-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c5547bb-4269-4808-9a1b-7acfae88f526', l.id, 2, '2026-04-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '71d2eb10-bfcc-4d08-9dcb-782b6bfa0b9e', l.id, 3, '2026-04-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8ae9966-e021-455c-b168-584f1367abfb', l.id, 4, '2026-05-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '729ba31f-a1b8-4ca1-bacb-abc5bb0935ba', l.id, 5, '2026-05-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec76ee7a-6964-4b7a-b3e9-32f4321295a8', l.id, 6, '2026-05-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '045ea24c-49fb-44f2-a140-a615d24c39ce', l.id, 7, '2026-05-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1513e490-d2da-4cb4-b750-ce9970c32745', l.id, 8, '2026-06-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f059e9b7-9670-4691-add0-450ba1551172', l.id, 9, '2026-06-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46ed4a63-592a-47bf-8283-f157710d65a9', l.id, 10, '2026-06-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #13: manimaran (laddu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('14805441-e8e3-468b-bb86-93072cd23c3e', '9100000013', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6d2b6f6a-8395-4f79-9f4f-9476e26ef644', u.id, 'manimaran (laddu)', '9100000013', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000013'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4387188f-a382-4d7f-b922-050a1cd7ee5f', c.id, 'LN-013', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-29T00:00:00.000Z', '2026-07-08T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000013'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7baacd0d-6c50-4b1f-a571-bf7cfd300f85', l.id, 1, '2026-05-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d23a97a-68ed-4eef-bd67-3acedb74180f', l.id, 2, '2026-05-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '364875b7-338d-45e8-8d4a-aa49b814e2c4', l.id, 3, '2026-05-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1f959991-abd0-4423-a843-5c976d351032', l.id, 4, '2026-05-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c422362-1ccf-48df-8612-c0ab733b8482', l.id, 5, '2026-06-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8c86d914-07d4-4d44-b03b-1acbc50d2da0', l.id, 6, '2026-06-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f95f3374-beed-49b7-8a15-f1f2f7a289cc', l.id, 7, '2026-06-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75815990-84cb-4fbc-82c0-541706c11542', l.id, 8, '2026-06-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5cf2458d-fc04-439b-bd41-2e34698cc863', l.id, 9, '2026-07-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eec69e89-dccc-46c7-be39-0678ab6aafce', l.id, 10, '2026-07-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #14: yuvaraj (goindthan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('63132771-125b-4fa5-a1f9-7ea28dc4cd31', '6383032175', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '953296e0-aa40-4df0-8651-4f9f8b3a368c', u.id, 'yuvaraj (goindthan)', '6383032175', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6383032175'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5b10722e-03ca-4742-a51e-5aad7dbdac05', c.id, 'LN-014', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-07T00:00:00.000Z', '2026-07-16T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6383032175'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3e807c03-1e1f-4e29-9f33-3c2b58473640', l.id, 1, '2026-05-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c1d2b58e-a489-4431-a000-d50ac779fe14', l.id, 2, '2026-05-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26b9a679-de71-483e-a3ca-0efd0a163cb3', l.id, 3, '2026-05-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3cede64f-2523-4846-99f7-28c6666af783', l.id, 4, '2026-06-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '82daeb8d-df4d-43eb-9b47-32be324f8fc1', l.id, 5, '2026-06-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77b3d4b8-c284-4778-a866-66e66de632a9', l.id, 6, '2026-06-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b0864e4e-cb32-4777-9be5-edc990fa2654', l.id, 7, '2026-06-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cdeeb58e-612c-429f-bcbd-8dbf28e7f565', l.id, 8, '2026-07-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6448fb4b-8c29-4eaa-9b60-7b6e3a3bbe35', l.id, 9, '2026-07-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bcf79cd3-f013-402b-bc9f-6eba7092fff5', l.id, 10, '2026-07-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #15: Dayalan (manda)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7b29948a-275a-4430-9d98-33016e2d890a', '9100000015', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '254e9203-89c5-41aa-8e3b-19ad7bd9bfdb', u.id, 'Dayalan (manda)', '9100000015', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000015'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'cd6f397a-7483-4cdb-9615-df5ba0431ab5', c.id, 'LN-015', 'WEEKLY', 6000, 10, 0, 5400, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000015'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '186d88c1-fe78-440e-a8f1-40c48c987a69', l.id, 1, '2026-06-07T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '41a183a7-fc39-4e14-bb23-30d07dcb66aa', l.id, 2, '2026-06-14T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68f4586d-e4d1-4f45-aced-62bf51bcdbeb', l.id, 3, '2026-06-21T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f40f40f-5806-49cc-bfde-71eec5a11fd9', l.id, 4, '2026-06-28T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fda85a3b-6dc7-461f-a91f-b03b119dc857', l.id, 5, '2026-07-05T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '502b5fbb-7bf3-462a-b479-854d1ecbb858', l.id, 6, '2026-07-12T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '30b5d816-0c98-43c2-9400-82e94acc9aab', l.id, 7, '2026-07-19T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'de86c0b6-cb73-4f39-bcbd-6cd51bc78417', l.id, 8, '2026-07-26T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '042715aa-8359-489a-8342-a2ba0ba89cec', l.id, 9, '2026-08-02T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69736435-9e7d-40ef-a8ed-39b6bdb18edf', l.id, 10, '2026-08-09T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #16: Mani (Jolly)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('db19c7e0-771f-4bb4-ac3d-9defe94d145d', '9345396573', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a092cc6c-0046-4c9f-a407-8ff7da8f399c', u.id, 'Mani (Jolly)', '9345396573', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9345396573'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '76ebee9a-7aae-4dd6-adfa-2ff008c2224f', c.id, 'LN-016', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9345396573'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f16002d-4dd3-4894-8b79-8a197c0ed8e9', l.id, 1, '2026-06-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4de2a0dd-40e7-4f7b-bf71-cda199509c7e', l.id, 2, '2026-06-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3df5fe16-aba0-458f-a1da-7efcd98d5b83', l.id, 3, '2026-06-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '40cce7cd-cfd0-4bf4-aad7-a14096ae8a59', l.id, 4, '2026-06-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3fed898-b1c9-4a2e-8268-81faa2da4eb1', l.id, 5, '2026-07-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9ee4249d-2831-41d6-8917-7beab593947d', l.id, 6, '2026-07-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7783339b-e5e7-4809-a243-4fcb738e5b5b', l.id, 7, '2026-07-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68c8f8bf-fb0c-4164-9343-64d482088fbf', l.id, 8, '2026-07-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b0c79b26-6344-41b6-a597-46dd02f16adb', l.id, 9, '2026-08-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1adfaf5e-5087-47e0-922c-3692493f29ee', l.id, 10, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #17: Ashok
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2a2e4a9a-9434-41b4-8cb7-6d1581428f58', '9100000017', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '035fac95-2d01-4a26-a9d4-e0036c7254c1', u.id, 'Ashok', '9100000017', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000017'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '03e1254f-6e9b-4a94-b27f-12a4d5721c10', c.id, 'LN-017', 'WEEKLY', 35000, 10, 0, 31500, 0.00, '2026-05-21T00:00:00.000Z', '2026-07-30T00:00:00.000Z', 10, 3500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000017'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '071d360a-dcf4-4af6-a8e3-6c322a9a1174', l.id, 1, '2026-05-28T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9805db07-224c-4be6-9b52-f25c46ffc4ce', l.id, 2, '2026-06-04T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '18989e00-c83c-4441-8eed-3f7d888c2edd', l.id, 3, '2026-06-11T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4f233b7d-40ae-457d-95b0-6e064bd3c739', l.id, 4, '2026-06-18T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77effed1-9162-4dad-92bf-9f5dc92519ed', l.id, 5, '2026-06-25T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b5b0bc93-e010-4566-9845-3bf577888572', l.id, 6, '2026-07-02T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b09d214-2f16-4a8b-ae70-bd7846598ed3', l.id, 7, '2026-07-09T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31aa6cfc-1466-4fe7-85d4-74c8b4f6c6b9', l.id, 8, '2026-07-16T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c56423f2-8bb2-4952-b694-629518e9de73', l.id, 9, '2026-07-23T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c2ac3b9b-1ac6-4604-a631-1c11e90d90c9', l.id, 10, '2026-07-30T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #18: Raj (rice)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f9f0ab81-9ffb-4199-a419-025bf4cc486b', '9100000018', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '793605e1-ade6-4088-9898-5e625a206b39', u.id, 'Raj (rice)', '9100000018', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000018'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c56a472b-1deb-4934-9958-299ec2380ebb', c.id, 'LN-018', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-05-20T00:00:00.000Z', '2026-07-29T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000018'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4de4a382-ab8d-4632-ae40-b28a656577c4', l.id, 1, '2026-05-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2ec7f98d-73c8-4b3c-ae90-a09e0aa4f454', l.id, 2, '2026-06-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd4d6ba3b-9de0-4125-95d0-c38988c57b07', l.id, 3, '2026-06-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '15bce035-182c-4601-a726-27278d35114b', l.id, 4, '2026-06-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '058ece95-59cb-484d-b47f-f30a043e05eb', l.id, 5, '2026-06-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f0a43c78-bea9-4f0f-8f94-5d8330e5c248', l.id, 6, '2026-07-01T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77bceec6-45e7-48f3-87cb-e326eeb97d2c', l.id, 7, '2026-07-08T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6dfb701b-00df-4de8-a678-1f16eb112596', l.id, 8, '2026-07-15T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '86eb10e1-889e-4545-b29c-14a86ba57e60', l.id, 9, '2026-07-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '86d03a2c-7a98-4215-80ba-8ad12faa1e25', l.id, 10, '2026-07-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #19: sakthivel (mangalam)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f7ddc2eb-ee24-4795-a1ba-9b91da05219a', '9848757747', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b4e6b6c2-955b-462d-8a71-cc7262005586', u.id, 'sakthivel (mangalam)', '9848757747', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9848757747'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c71ded3d-7d0e-4f8f-a1de-1ff92ee2b11b', c.id, 'LN-019', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-16T00:00:00.000Z', '2026-07-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9848757747'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b710df2c-6462-488f-bc4c-04b8f5b001d5', l.id, 1, '2026-05-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9f71c643-1044-45ce-9f38-6c01616af560', l.id, 2, '2026-05-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '28658b16-ce20-4872-8e80-0bb77d0e5ad4', l.id, 3, '2026-06-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd263eec1-9b56-4d45-b0f3-9217ff5a2a2e', l.id, 4, '2026-06-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bee4029a-0181-43ba-9885-6c7d2be2208e', l.id, 5, '2026-06-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e9356e53-aa34-4d3f-a490-064f76460d64', l.id, 6, '2026-06-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '11cd5760-00c8-40fd-9f78-5b1e05a9c38f', l.id, 7, '2026-07-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '519b40ff-f01c-4a70-a523-2ee0eaf8afff', l.id, 8, '2026-07-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf3119ff-ab7e-4e0a-a6bc-a36264909e56', l.id, 9, '2026-07-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a443ca23-0c16-4209-a4a3-f5db230a01b1', l.id, 10, '2026-07-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #20: murugan (painter)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('42c12b6b-ce58-4804-b1df-851fb6e0af99', '9843173422', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '4070dff3-801a-461f-8b3c-f9d48bc70534', u.id, 'murugan (painter)', '9843173422', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9843173422'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd6b4f365-7902-47ad-bb7b-7e0367574028', c.id, 'LN-020', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-16T00:00:00.000Z', '2026-07-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9843173422'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '73050b52-cc52-4c0c-a556-6436f38f50b6', l.id, 1, '2026-05-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '21859ebb-7330-4c89-9c75-d2cad3802237', l.id, 2, '2026-05-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'be31d5a4-014a-40dd-884f-fa14ae80d148', l.id, 3, '2026-06-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0592c120-7c62-468f-a4fc-92e7f6057dfe', l.id, 4, '2026-06-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '84c46b7f-5bd5-4d8c-9e2e-b69d9cce53fe', l.id, 5, '2026-06-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e041de4d-d5a2-42fe-96dc-f6424f9334e4', l.id, 6, '2026-06-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ebdbb5c9-2d47-4ab8-9ca2-2511c9ffd138', l.id, 7, '2026-07-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0bc184f0-6602-48e3-9dd8-c2edd9b68ef5', l.id, 8, '2026-07-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fc51a8fe-3da3-44eb-abe7-89b7a325e15f', l.id, 9, '2026-07-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9edbae84-676c-4016-a664-25da2f393d24', l.id, 10, '2026-07-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #21: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('33fb8a3d-ebfd-4e52-a1d5-e93cdb506533', '9100000021', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6d0d2a69-7e31-4a47-ac54-d73a45ff73e0', u.id, 'raghul (naren)', '9100000021', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000021'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'cc4d79a4-0ff1-41b2-a80f-e54b4bd3581e', c.id, 'LN-021', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-21T00:00:00.000Z', '2026-07-30T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000021'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b1029b0-9ba4-469e-ba46-9cb8c7ad4f72', l.id, 1, '2026-05-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c2155727-24a1-41c3-98a6-8fc1b0690477', l.id, 2, '2026-06-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6c71028-a5c2-4ee4-ae02-f67dff041cb5', l.id, 3, '2026-06-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4c214bc4-145c-4d07-9751-abace56c7179', l.id, 4, '2026-06-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c7486ab4-5f4f-4742-b71b-810ad0efce0f', l.id, 5, '2026-06-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bbd85511-8340-4d7b-a5c7-f8881e835b97', l.id, 6, '2026-07-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '634c3ef2-291d-4f30-ae58-b71113e18311', l.id, 7, '2026-07-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9b748cb5-44e8-48ad-8b83-ea4bd883ce42', l.id, 8, '2026-07-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0797a09-5c46-4f13-b1bc-06df3b6ba3e5', l.id, 9, '2026-07-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '440f4b93-74ff-4bca-8c05-caf7aa89152b', l.id, 10, '2026-07-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #22: Jai (pichai)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f3fa6249-c99a-4032-bf36-299ebe51a682', '9100000022', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c30919fe-ce98-47a2-84fb-921ab6662a23', u.id, 'Jai (pichai)', '9100000022', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000022'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'bc95fcb4-c97e-415b-a5b7-48e64566f780', c.id, 'LN-022', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-23T00:00:00.000Z', '2026-08-01T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000022'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aaa918ce-12f3-4d5f-9cdc-e7be03629ad9', l.id, 1, '2026-05-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ecde5f4b-08cf-4952-ba91-24e4eb0a544f', l.id, 2, '2026-06-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a34260c3-31a6-42bf-8531-4ccbb99cafbc', l.id, 3, '2026-06-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '533aa224-a636-4ed7-be6b-1ea3967ec93d', l.id, 4, '2026-06-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7a00a491-b55e-4475-ba10-a4d304cb16b4', l.id, 5, '2026-06-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8292e242-79a6-4443-9f7f-13e03651e148', l.id, 6, '2026-07-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0d359291-8f71-4123-adb6-a7a89d389888', l.id, 7, '2026-07-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9962f27a-88a5-47b2-bee3-0085907af147', l.id, 8, '2026-07-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aee5dc0d-0f54-4c58-b0c6-4f14a91efd06', l.id, 9, '2026-07-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb227da0-9982-4dc6-86ee-55f46c90915e', l.id, 10, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #23: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1c81accf-5743-453c-96a2-0445a4a156de', '9100000023', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '63077fdb-9997-4182-98f2-b1091e868036', u.id, 'ragupathy', '9100000023', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000023'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c183d01f-c198-441a-a37a-ecf53daddf01', c.id, 'LN-023', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000023'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a69a664d-9c6d-4d1d-b936-93027e20c914', l.id, 1, '2026-06-01T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0fb2d394-7e6d-4a0a-9aa1-813000b55410', l.id, 2, '2026-06-08T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8a406fd4-2f6c-44ff-9909-fc4590010194', l.id, 3, '2026-06-15T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d1a8c34-b9a1-4be0-9e2c-db62be2ee5d4', l.id, 4, '2026-06-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '74d8e195-e214-40b0-814d-908124604709', l.id, 5, '2026-06-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '18e3ca99-b598-4ed6-b4ef-73bba6916601', l.id, 6, '2026-07-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd247d601-e631-44d8-ab64-a822742e67c7', l.id, 7, '2026-07-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb983de5-6487-49f6-8db6-c9e50a1f8f80', l.id, 8, '2026-07-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dc4ab68a-6a68-4270-a5a8-b842ddb827f5', l.id, 9, '2026-07-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '60732f42-336a-4e37-9c80-cf1f9d89ab61', l.id, 10, '2026-08-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #24: ranjith
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('681f1630-ac7f-4ad0-bf97-8a434be10956', '9100000024', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3267f87a-8962-49bd-8a3d-e86bdf89490b', u.id, 'ranjith', '9100000024', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000024'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a7c85dba-1e26-4ef3-b311-35039b2a5fec', c.id, 'LN-024', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000024'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2f4ef85c-54ee-42c4-84e2-da14664af00c', l.id, 1, '2026-06-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c9c073a4-6149-4ee1-8f7b-7d44d79d00d3', l.id, 2, '2026-06-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ee0fb847-3d75-42b9-b75b-2d89e3538893', l.id, 3, '2026-06-15T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '50585365-02b7-4331-b2fa-c729d3b72abe', l.id, 4, '2026-06-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bfc28dfd-6f06-4355-a2ca-1522468bf1fe', l.id, 5, '2026-06-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c9d85df3-9827-4f1e-805b-93e5bd5263a7', l.id, 6, '2026-07-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cdeaf042-13a0-4878-b1b4-979ff6a0b4bd', l.id, 7, '2026-07-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5971e567-5258-4ba5-a824-4e5871cea2b4', l.id, 8, '2026-07-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a093f9d8-156a-43db-800d-99fec85210e9', l.id, 9, '2026-07-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9cbbcbd6-67ba-4d38-856e-ed3288072560', l.id, 10, '2026-08-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #25: Shanmugavel (KP)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('91f849b6-1eda-4544-9b44-3d4ee21e20d7', '9100000025', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'fa685452-98c3-4d1e-bd07-d3310cce7fc1', u.id, 'Shanmugavel (KP)', '9100000025', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000025'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a38bcd6f-f338-4cfb-a845-b7aa99eef4b5', c.id, 'LN-025', 'WEEKLY', 35000, 10, 0, 31500, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 3500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000025'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f71e8670-3974-46f4-bf63-72a3a352cf69', l.id, 1, '2026-06-01T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb41cbb2-05d5-4035-b10c-b658d49d813c', l.id, 2, '2026-06-08T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b003aa31-6c9e-4f24-a98e-42869047c327', l.id, 3, '2026-06-15T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0bb7e89-15ee-4db4-bdbd-99392c17f841', l.id, 4, '2026-06-22T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9fe350e0-71e7-4073-9ae9-4e4fce219b9b', l.id, 5, '2026-06-29T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'baed036a-1957-4cce-b436-0aaec70256e8', l.id, 6, '2026-07-06T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ffc881d0-bdd7-4045-bd83-b266d628d65a', l.id, 7, '2026-07-13T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ebbd5942-bc2c-479f-8bc9-cbc08a393b47', l.id, 8, '2026-07-20T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd872b56c-e73d-45a2-8bc3-e3a9e23cc223', l.id, 9, '2026-07-27T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '692f3503-43a4-4ad6-8ccc-6298d6157bc2', l.id, 10, '2026-08-03T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #26: mani (tails)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ce45d53d-62a7-4f15-901d-dc37860627c7', '9100000026', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2ca10d97-fa48-4e4f-9360-141baee7329f', u.id, 'mani (tails)', '9100000026', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000026'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '2be6bc53-6b74-45da-81e5-d39da61aecec', c.id, 'LN-026', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000026'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '62e7aa65-1b73-4688-86f3-32fce200dd3a', l.id, 1, '2026-06-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0c1653ee-1f35-419f-9479-6096762fe1e3', l.id, 2, '2026-06-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cfbd6584-a5b9-425e-b2ce-dd5397daecc0', l.id, 3, '2026-06-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ae4c26bb-5f8b-4592-a5eb-1d22c4e34ba8', l.id, 4, '2026-06-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '917e9c82-ec3f-4236-9b92-2536d04239d8', l.id, 5, '2026-06-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '653978a9-782e-4823-ba8b-88aba43c33b7', l.id, 6, '2026-07-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d09c812-9fed-451f-86c5-ce2caa88e372', l.id, 7, '2026-07-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '07384122-ae80-4c24-a8fe-d03bd06945aa', l.id, 8, '2026-07-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7b0fc170-a838-4c69-82e6-cfa850c8ccf2', l.id, 9, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e1afdb9b-7ad4-41b4-a94a-d473da0a3a1c', l.id, 10, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #27: praveen (baguti)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4939ee45-3009-4684-b585-3d1be98fce49', '9100000027', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '82271b91-fe5e-4f21-8e1f-702f79a48b65', u.id, 'praveen (baguti)', '9100000027', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000027'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '9c0daeed-82a3-4cfd-9fca-bf094e783a1f', c.id, 'LN-027', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000027'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '354058f6-ab16-4df8-a95d-5178e78115b9', l.id, 1, '2026-06-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27430749-7a09-424f-ae60-dfc3cd89695d', l.id, 2, '2026-06-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7caf4fee-8b60-4163-9919-a873df2d0991', l.id, 3, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd26dca61-c9b8-49a3-bb6f-b9458f92a2d4', l.id, 4, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9649db90-1079-44bb-85a6-e5be92babdd7', l.id, 5, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '11fffd3b-e423-489d-9fe7-a9aecf0c09c1', l.id, 6, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b02df1a-dc52-4e6d-bca7-d0543436f3a2', l.id, 7, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f926cc39-83d3-4569-8a91-65f10e94c8fe', l.id, 8, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '66a3d047-18ef-4d73-8ca3-8dbc71137dd1', l.id, 9, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '249cd65f-6cd1-40c8-a186-97bd977cb2e2', l.id, 10, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #28: arunachalam (master)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5fef2f78-744c-4a84-ad16-7dbdd3f40201', '9100000028', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '1700c304-7bd9-428e-982e-ca06daec397a', u.id, 'arunachalam (master)', '9100000028', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000028'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '42e1c8d9-bb28-4d1c-b137-f93112cdb3ff', c.id, 'LN-028', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000028'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'be466944-43a3-4aef-a647-675937a67814', l.id, 1, '2026-06-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7da90f8b-0cea-477c-a763-5432de3d2961', l.id, 2, '2026-06-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '81bfff89-daba-467e-9eeb-c9c8cdfa8d17', l.id, 3, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '40982115-4c6d-41ba-aee8-4020c3163baf', l.id, 4, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7696ef87-51de-4f08-924d-e1680e3563bb', l.id, 5, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '231f95e2-3bc8-4962-8271-eef4855da8fe', l.id, 6, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e6fc5f14-aca2-4568-b09e-14d8af286d0a', l.id, 7, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '977564db-78cb-47a0-b95e-77f96a9b92af', l.id, 8, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '98509e9e-fd2b-4707-b6c6-059a4e55dade', l.id, 9, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6667a0f8-9e5d-47f5-84a1-afb619f2ef62', l.id, 10, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #29: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c8e379e3-6f5b-44c5-83cf-37233ae907a0', '9100000029', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '318feaf6-64d7-4c43-b578-ccaa4cbdf1ec', u.id, 'ajith (aali)', '9100000029', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000029'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '90fd7215-f88b-4af3-999e-711c38ec6a5c', c.id, 'LN-029', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-30T00:00:00.000Z', '2026-08-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000029'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '92703ebf-0118-4630-ad43-ddfb198f014c', l.id, 1, '2026-06-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6d74b4b2-988d-4233-a2ee-355d7c808c7d', l.id, 2, '2026-06-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7e6c5d26-6504-428f-a517-976f2001e8e5', l.id, 3, '2026-06-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '313746b7-bb32-4502-8ce2-7205991b5f2c', l.id, 4, '2026-06-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7d60b425-1d6d-4ec9-88ce-e8b1f58bd886', l.id, 5, '2026-07-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ed7e8f12-e3d8-4fdb-89e3-b1f4dff5baf4', l.id, 6, '2026-07-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '38c91047-47ee-4562-aff5-6e3452619a26', l.id, 7, '2026-07-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd2d57750-0ccc-4235-a800-12920d312430', l.id, 8, '2026-07-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b795a3bb-2d2d-4c9f-8e36-48b93f586cf8', l.id, 9, '2026-08-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f85662b8-29a8-44e0-86e7-78c61d21f1a4', l.id, 10, '2026-08-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #30: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('47442fbe-5327-4cb3-b547-c600953e03a4', '9100000030', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'cd1352db-5cd1-4fe7-b52a-47144b26b2ec', u.id, 'vicky (metu)', '9100000030', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000030'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c9425304-d513-435c-ba9a-eab8dacbd769', c.id, 'LN-030', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000030'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0ed4e51-f9b7-41d9-bfd3-abe7824e1666', l.id, 1, '2026-06-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '29356b7f-cfc1-495e-b15a-94400cc1249b', l.id, 2, '2026-06-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac342e8e-607f-456b-8192-722547d2eb62', l.id, 3, '2026-06-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb410ab5-c8a6-4431-a1c0-c922cca32883', l.id, 4, '2026-06-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8376c4e5-db24-4ea0-b8d6-b0a3071d99b5', l.id, 5, '2026-07-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c40434f-1714-4c28-a8ad-876c6cd21699', l.id, 6, '2026-07-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61a6fbaf-4942-4072-8ae2-c769ae66333a', l.id, 7, '2026-07-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bdaf091b-0a5a-4b21-ae28-778ac79c54bc', l.id, 8, '2026-07-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c1b0dd9-5886-4870-8587-b96d0a84018d', l.id, 9, '2026-08-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e373fab2-97de-41ce-8439-1773186c9dea', l.id, 10, '2026-08-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #31: yuvaraj (3)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ac2e554c-1061-4e81-83d9-d87f09543d30', '9100000031', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '09a9acfa-a05a-49f4-9ae5-dd69505412f5', u.id, 'yuvaraj (3)', '9100000031', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000031'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b1c232d5-335b-4061-84c5-541e807c3c99', c.id, 'LN-031', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-06-06T00:00:00.000Z', '2026-11-06T00:00:00.000Z', 5, 3000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000031'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a5ba03e0-8bf1-45f5-8309-b6c91474f4e4', l.id, 1, '2026-07-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ed27d31d-3465-47d1-b722-4a780747f7b0', l.id, 2, '2026-08-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fee64c6b-b31e-405d-bf57-66a35752dc46', l.id, 3, '2026-09-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '35a7db46-ad65-4284-9ed1-df1f29dd8802', l.id, 4, '2026-10-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '97fc48ee-d87f-444e-a454-bb5c8b5a0713', l.id, 5, '2026-11-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #32: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('e77681f1-c179-4ca1-99a1-28ae57b34cea', '9100000032', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '31e0a620-ceeb-41b4-99c4-c55d8062219d', u.id, 'ragupathy', '9100000032', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000032'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '53370a4a-b94b-43bf-a26d-9a0b9e677131', c.id, 'LN-032', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-09T00:00:00.000Z', '2026-08-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000032'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '02710460-7cb3-4dc4-811c-c02bcff9eb45', l.id, 1, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd08c6cee-cd55-4510-b3bf-b3a6870bf407', l.id, 2, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '50ac7f73-b685-4427-a505-cadac5961e88', l.id, 3, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5079093a-4003-46cb-a0a6-5c9c80b9e2d6', l.id, 4, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '261c103c-8646-4a62-a2a6-d75a28b797bc', l.id, 5, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a35b273-10e5-4832-ae32-16a19cf35147', l.id, 6, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6bf17b5c-5863-48b3-bc3b-e467b3e0ee77', l.id, 7, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '43abd015-037e-4278-bd4d-1503a28f6a39', l.id, 8, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c3c9fb04-9cc0-48d6-92ed-fe16ef612b8a', l.id, 9, '2026-08-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '640eea1d-1b58-4f1c-8973-a7759c8be095', l.id, 10, '2026-08-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #33: babu (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('282f99be-1914-4ac4-b1ba-3c2f5bdc9443', '9100000033', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9fefc857-ce36-46de-be1f-3800a0c15b52', u.id, 'babu (metu)', '9100000033', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000033'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b5206b90-f799-4203-bd52-bbff21d5d6f6', c.id, 'LN-033', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-06-13T00:00:00.000Z', '2026-08-22T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000033'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0eb06bd0-32ee-46ce-8e55-55c81d7e01af', l.id, 1, '2026-06-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '39f624fc-e1db-47a1-9fcf-23ef2f2bf369', l.id, 2, '2026-06-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '92aedfc6-6b25-4290-a7d5-877cf7310805', l.id, 3, '2026-07-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '02333709-6cd4-4142-82b4-245dd4270083', l.id, 4, '2026-07-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9f6fafb0-806d-4143-96ee-3bb60402d0d8', l.id, 5, '2026-07-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf35688e-ba93-4c79-b6f1-aad36d4c02cf', l.id, 6, '2026-07-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8ee83f2b-94c6-4f4f-b241-f371c96f349b', l.id, 7, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f62a4d7-493d-4425-8975-e390d794fe4c', l.id, 8, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2800ba5e-8c05-42bc-92c8-cec281c51638', l.id, 9, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '89e76d9b-35f1-4ce8-b37b-d131581254cb', l.id, 10, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #34: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('eeba987c-df65-4fbd-b763-1128b1948de2', '9100000034', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '4a6070b4-6475-409d-beab-a82165bd4f65', u.id, 'venkatesan (kv)', '9100000034', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000034'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a30970a4-8966-4d90-ac46-7b1038be931f', c.id, 'LN-034', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-14T00:00:00.000Z', '2026-08-23T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000034'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '85fc8d78-0b41-4c2e-9061-2cf7c3c6bbb1', l.id, 1, '2026-06-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec38c87d-f5dc-4114-896b-2cb0a8dfdd22', l.id, 2, '2026-06-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5159a86c-44a4-474c-ab58-225e7c0ab423', l.id, 3, '2026-07-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3d471d12-2b08-43c1-bc53-35f754b4037f', l.id, 4, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'baff0eee-875e-4d79-9151-9f115ae68cad', l.id, 5, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bbd22a72-9d83-46bb-ba43-21851e4c32da', l.id, 6, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c1f474e3-a4c8-44f9-b5ff-5090581abd3c', l.id, 7, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7450b1ba-f166-48e8-a54e-9bbe6ae42494', l.id, 8, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e2b8f5a4-16cc-4e59-a886-fd029d163a2f', l.id, 9, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '512228ca-a914-4131-bd77-e88a69aba8fe', l.id, 10, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #35: Ashok
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('846af790-60cf-482b-96e7-c5c2483284ba', '9100000035', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c286457e-b14c-491a-b34f-b2dbcfd4f6e1', u.id, 'Ashok', '9100000035', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000035'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f976e57f-2a71-4b80-a686-09bd754eeea7', c.id, 'LN-035', 'WEEKLY', 3500, 10, 0, 3150, 0.00, '2026-06-15T00:00:00.000Z', '2026-08-24T00:00:00.000Z', 10, 350, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000035'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '780f4b31-95df-4244-ad29-1af2f599d2ac', l.id, 1, '2026-06-22T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61563bc4-797e-46bf-8d54-400e790591c4', l.id, 2, '2026-06-29T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c68bc3f5-6c10-4f20-9e48-d132604cf195', l.id, 3, '2026-07-06T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b17554c5-ee81-4974-99bb-bd699d14a195', l.id, 4, '2026-07-13T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '66aa8061-8501-4532-89ea-58f7ea8e3bb9', l.id, 5, '2026-07-20T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '14b6c542-9463-4185-9df0-dcb7fa1ab8e9', l.id, 6, '2026-07-27T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4e994fcf-8e15-4120-9582-ba1b3d93113a', l.id, 7, '2026-08-03T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '229e7692-1f73-44cc-b8c6-2706eed84c71', l.id, 8, '2026-08-10T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c001e52-ba76-45cc-8591-1f38aeaf76ca', l.id, 9, '2026-08-17T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '91d771b9-82ea-4ca4-8208-4e96dc58c241', l.id, 10, '2026-08-24T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

COMMIT;