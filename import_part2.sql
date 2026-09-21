BEGIN;
-- Record #36: balu (tha)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8fe90f85-fbe5-468f-b6d0-36a3c6c0f942', '9100000036', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7bc13270-4390-4890-8a9b-54f260c9afb8', u.id, 'balu (tha)', '9100000036', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000036'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '06824ad3-a379-447b-9b87-f4e7da987c71', c.id, 'LN-036', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-20T00:00:00.000Z', '2026-08-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000036'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '88be3d69-5f8c-4aa0-9bfb-8d885e623eae', l.id, 1, '2026-06-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c4a14b9-d1dd-4a44-bc6e-bca2b794d65f', l.id, 2, '2026-07-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b244cd07-4b2a-4cbe-8241-3131efa68c2c', l.id, 3, '2026-07-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '831bee0d-dce4-4535-bfa7-4c0f1d036a48', l.id, 4, '2026-07-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99d3f659-ff30-4f7c-a6b7-6484d1539b73', l.id, 5, '2026-07-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '909806f4-6d10-421c-a112-c2b481171f27', l.id, 6, '2026-08-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '064cca3f-b729-41e6-ad83-4300842bd3ce', l.id, 7, '2026-08-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac6d967a-4909-4701-9f24-96d4954a155f', l.id, 8, '2026-08-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fe5905ff-c1aa-4c63-a653-aa810575d98c', l.id, 9, '2026-08-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b6c044a9-629c-41a6-9aae-f73ca668d91d', l.id, 10, '2026-08-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-036'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #37: bass (khan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('455932fc-fc19-4a0e-acf4-2c758133247d', '9199566430', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '658ca99d-dd44-4e67-bea4-69bb489cad5a', u.id, 'bass (khan)', '9199566430', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9199566430'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c17217dd-11d1-4bff-872f-dff708411384', c.id, 'LN-037', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-21T00:00:00.000Z', '2026-08-30T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9199566430'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5ef52aaf-30c2-4d30-939c-37acbc279fa6', l.id, 1, '2026-06-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f0cd8a5-77fa-4506-8306-9cd640d57df2', l.id, 2, '2026-07-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e645d5d2-c475-4225-afed-dde88e9272a5', l.id, 3, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'af5d8913-dbaa-43e3-8971-827aa634688b', l.id, 4, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8d065abc-b187-41bf-bfb4-efec382544a4', l.id, 5, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e771f96c-3390-4b5c-9c66-d7bf9fb12f3d', l.id, 6, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b4055b12-6a9d-4f8b-bc10-4af621941b56', l.id, 7, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd1be59f3-5a5d-4caa-86d3-1c25901c8b47', l.id, 8, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7084964-fb97-4e8c-b5c2-b1930d03511e', l.id, 9, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8830e3eb-39cb-4f86-8715-6005194baaac', l.id, 10, '2026-08-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-037'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #38: Balamuthu
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8b2c5dc5-486a-480a-a629-d2039856f3df', '9100000038', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2664ea2f-e0ce-43cb-9195-2cf0a792832a', u.id, 'Balamuthu', '9100000038', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000038'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0b151c20-8d08-4cc4-95f0-b7f50da552b4', c.id, 'LN-038', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-21T00:00:00.000Z', '2026-08-30T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000038'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '08b374e6-9db6-4d23-ae73-89cc5db0a214', l.id, 1, '2026-06-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c967be2a-ec92-480c-a1e3-256fe14ddd6d', l.id, 2, '2026-07-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd256fadf-0c2d-4cb5-b9d4-ad0e94cb784c', l.id, 3, '2026-07-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2867fc2d-3aac-4dbd-b66e-60b87cf9fa17', l.id, 4, '2026-07-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3af41382-5594-47f8-b9dc-ac5c894137ea', l.id, 5, '2026-07-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7b19d2f3-21fd-41d5-abe6-01018ec90dd0', l.id, 6, '2026-08-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dc890ba8-2b7d-4625-af9b-22755b87cdd8', l.id, 7, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48f1dc8e-6929-46b9-bddb-a66e9a3504ea', l.id, 8, '2026-08-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '646997cb-231f-45c8-bc00-e8d8ccc5c45d', l.id, 9, '2026-08-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8a8fd9f-ac49-44be-9d02-c75b4efbafab', l.id, 10, '2026-08-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-038'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #39: simabu (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('08a79586-e0d5-4e4f-b7c1-fac45cee769e', '9100000039', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a4d4361d-27d1-4e50-8a98-1ce9322f0ea6', u.id, 'simabu (kv)', '9100000039', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000039'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'eec5515b-a332-4e3d-9878-565e74eacbc1', c.id, 'LN-039', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-22T00:00:00.000Z', '2026-08-31T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000039'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c67831bd-b188-492b-9d47-5928feb466a7', l.id, 1, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2524dad3-f23e-4c99-a1f0-ee9d5819f0e6', l.id, 2, '2026-07-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2339459b-2852-4301-a794-88651cf02b9c', l.id, 3, '2026-07-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a9e88fc5-5249-407f-96c8-49f04cb087b9', l.id, 4, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3064dda7-b448-4d57-bc99-7a0a2d4bf15d', l.id, 5, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a76b2f4d-675f-4d08-93b9-54ed81c0706e', l.id, 6, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3639dc14-d8a1-49fe-82ea-87ff4b54cc78', l.id, 7, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b28529af-5f11-420f-b2b2-4a465140326d', l.id, 8, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8cf95318-6759-46b9-9384-83119500c2e9', l.id, 9, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4eb70ff2-d715-447e-9dab-e10a8e1fa1df', l.id, 10, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-039'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #40: madhan (makku)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('77017f77-e415-4e7a-83b6-2363dfd185ef', '9100000040', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7da073b2-a480-4dea-8f80-5262cfe34090', u.id, 'madhan (makku)', '9100000040', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000040'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '33e29992-1486-4efb-b26b-d405a2b5b221', c.id, 'LN-040', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-26T00:00:00.000Z', '2026-09-04T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000040'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3730de5-e1e8-43a5-baa3-d929f3dc8f06', l.id, 1, '2026-07-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5358f527-078a-4b79-9435-1f451abba03d', l.id, 2, '2026-07-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e06ee159-a2e7-4701-847d-85358d57fdac', l.id, 3, '2026-07-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '19af78ac-4885-4d8a-8958-029e8afee3c4', l.id, 4, '2026-07-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '10d44047-48d5-4163-ae56-1c56f771c7d9', l.id, 5, '2026-07-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fd3df211-eb52-4e81-880a-c166d8f8f166', l.id, 6, '2026-08-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c86193a9-4cef-4066-a1b4-96ca75458a1d', l.id, 7, '2026-08-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '30ef4406-b875-4967-9648-4d652c5d08d8', l.id, 8, '2026-08-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '10f73bc0-bad5-4512-82a1-8d4663cd3855', l.id, 9, '2026-08-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8c8df5d-7e0d-4166-934b-1eae62cf9f8b', l.id, 10, '2026-09-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-040'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #41: magi (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3ddec5a7-a5c4-46f5-b8b6-1877738d0417', '9100000041', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '08529573-1964-4bb5-a481-0983b8ed3a49', u.id, 'magi (kv)', '9100000041', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000041'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '49213eb3-f3f5-4d7a-b0d8-13215eeff92f', c.id, 'LN-041', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-29T00:00:00.000Z', '2026-09-07T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000041'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '68bfddda-5748-45ac-884d-ab5c9b60f7c1', l.id, 1, '2026-07-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5964c2a2-2300-4140-9a1a-66c81d1c022f', l.id, 2, '2026-07-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '78dde3c8-7383-473c-9426-7febdb235483', l.id, 3, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b7c6afe8-dd06-4976-bb20-95c92dac9c04', l.id, 4, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6e56e22-879c-49be-9239-e47c37fa400c', l.id, 5, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2be17dfb-92f8-4c4a-b07e-a6b3f70265bf', l.id, 6, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bd52db14-222e-49be-bf96-4eafb71faeac', l.id, 7, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3eff2e87-3454-4ac9-9214-36f8cd0c989d', l.id, 8, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8509eeb-5d9c-4a91-a7b5-ad029a0066e8', l.id, 9, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48ffd79e-3a80-4ab0-bc64-0710c3015154', l.id, 10, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-041'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #42: babu (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('872c9bc5-16b5-4a46-b28f-25b9e833f514', '9100000042', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '8a04eff8-77fa-47ad-b491-181339cbfec3', u.id, 'babu (metu)', '9100000042', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000042'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'aa529e91-5496-4d05-b896-bf2a2c92d156', c.id, 'LN-042', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-06-30T00:00:00.000Z', '2026-09-08T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000042'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cf75b6bd-6e51-4827-ba44-0e607b9ddd39', l.id, 1, '2026-07-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7e00a509-10c3-4a7c-9af1-f1218c79471d', l.id, 2, '2026-07-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6e564936-65a0-429e-939a-841eb2d2044a', l.id, 3, '2026-07-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aaa634b6-874d-4ba7-9443-161eb6e0d146', l.id, 4, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e17a9672-b8d8-469d-9e65-1755607e6aed', l.id, 5, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b983dcb-9ca2-4f31-9ba5-6251e8b5e2f5', l.id, 6, '2026-08-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd80e6e72-c038-4be5-a94f-290245166983', l.id, 7, '2026-08-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '49a94af1-fd85-459b-abd1-00f51a568810', l.id, 8, '2026-08-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6416e235-ffdf-45e0-abd1-b69dc49b54f0', l.id, 9, '2026-09-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '09acc304-29a3-44fc-a306-aacfab4c1675', l.id, 10, '2026-09-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-042'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #43: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ca6ab3e6-2c60-4aaf-8493-792b9d102a1d', '9100000043', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '80ada6ae-03d0-44b4-8622-128eb138bbbc', u.id, 'raghul (naren)', '9100000043', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000043'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4daf7175-f67a-4514-9ce8-1f1d0733178b', c.id, 'LN-043', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-30T00:00:00.000Z', '2026-09-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000043'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '38774c4f-7391-44a6-ace1-34076565826c', l.id, 1, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9756cec-3628-40b7-a232-89be11997d21', l.id, 2, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f94ee2ce-837b-41ff-9991-8ebb3b6b9ce0', l.id, 3, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c89fd0d3-621c-42e7-bdec-a0873d395511', l.id, 4, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'db3913a7-4843-4b0d-9bfc-70de28181748', l.id, 5, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26a47128-6bcd-42d7-9900-e13475f9e7fb', l.id, 6, '2026-08-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd5a7a633-136b-473f-86f7-ee78cbef430a', l.id, 7, '2026-08-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0ab11660-90f7-4e30-b89f-7d0df996c6c2', l.id, 8, '2026-08-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7efe3e60-461e-4cb2-b284-cb54d447b096', l.id, 9, '2026-09-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0f18709-f6ae-4ab3-855f-b62bb32d12ec', l.id, 10, '2026-09-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-043'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #44: Prakash (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('32211295-c585-4d21-8ed2-b942687fd222', '9100000044', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c50b80ac-37c0-4ecf-8222-be0c42e6a00c', u.id, 'Prakash (metu)', '9100000044', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000044'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fe14c2de-e300-43e0-9066-83af81aee407', c.id, 'LN-044', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-01T00:00:00.000Z', '2026-09-09T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000044'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dd5afa25-91dc-46f9-85a8-2186ac1cbc88', l.id, 1, '2026-07-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '702f8f14-ca5b-4df5-9a5a-77ce035b80b7', l.id, 2, '2026-07-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ce47d71a-b034-48a4-8930-7da018791046', l.id, 3, '2026-07-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6438f024-315a-4bcb-8b7b-89b74018f96f', l.id, 4, '2026-07-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34d3372c-dbcf-4e5e-8f2a-36da50d39f05', l.id, 5, '2026-08-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'beb8eb4d-99b3-400a-95cc-7d3e5b1a4436', l.id, 6, '2026-08-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd4c9952e-163a-4e40-b269-78166ae03ea0', l.id, 7, '2026-08-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '36775280-cb5b-418f-8f4c-069b69fec4a2', l.id, 8, '2026-08-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f58b232-c128-451c-832d-86e7b2e6a9e9', l.id, 9, '2026-09-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '56bf8240-0a75-4418-be0d-ff3c5e2cc75b', l.id, 10, '2026-09-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-044'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #45: Sundar Santhosh
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7f9cc0af-0454-40ed-ab81-ca71970ca658', '9100000045', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a7253edf-eef4-47c7-a1a3-db28624f4c63', u.id, 'Sundar Santhosh', '9100000045', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000045'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f2910090-709e-40ab-a748-ede80f937bab', c.id, 'LN-045', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-03T00:00:00.000Z', '2026-09-11T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000045'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55928ee3-7617-4097-bb3c-dc1906055e8b', l.id, 1, '2026-07-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '50578069-b801-425e-b068-77cde1f3f45d', l.id, 2, '2026-07-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c0ba8fe-b50a-4e41-9fcc-90f9fd38cc96', l.id, 3, '2026-07-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e55a68fa-bd36-407b-8ea7-6aa20fd5db86', l.id, 4, '2026-07-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0360d923-6ae2-49ce-8e27-2a24c0b243dd', l.id, 5, '2026-08-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75f5f3ea-1a32-404b-b513-292680bc7ba7', l.id, 6, '2026-08-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '10d5b97d-b7ac-4aa0-b3b6-54eb620804bc', l.id, 7, '2026-08-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '773df0e0-9f33-4321-88e0-86cfa3be299e', l.id, 8, '2026-08-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'db9ed0f2-a1d5-403f-a43a-7d230d4b1824', l.id, 9, '2026-09-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26c74028-c9e3-4be0-900a-74c7c0f7a44b', l.id, 10, '2026-09-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-045'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #46: Mohan (Small)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f2de3b59-9d2c-4699-b412-61bd4ded4b06', '9100000046', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b9799305-7304-459e-975b-62e67ee81fbd', u.id, 'Mohan (Small)', '9100000046', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000046'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '197f1a95-4a01-4bac-a355-e02508b05e1e', c.id, 'LN-046', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-07-04T00:00:00.000Z', '2026-12-04T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000046'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1d99f8c9-44f3-449b-aa87-295df2637233', l.id, 1, '2026-08-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea5cdf19-5850-4eb0-a683-7955f179d408', l.id, 2, '2026-09-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fcd0ba60-c1a1-41b0-88c5-3d8f378e0df7', l.id, 3, '2026-10-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '267ab37d-bbe3-4755-9f37-9039ec531243', l.id, 4, '2026-11-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4bd36deb-6920-45b5-b1e2-381da5086908', l.id, 5, '2026-12-04T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-046'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #47: Kotti (karthi)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ff10f89d-aea4-4880-a926-91c8f2c1644b', '9944328194', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9ff87cf5-e678-4381-9448-85bdf866abc0', u.id, 'Kotti (karthi)', '9944328194', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9944328194'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '83dff53e-927c-4763-907d-b47192b725d7', c.id, 'LN-047', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-04T00:00:00.000Z', '2026-12-04T00:00:00.000Z', 5, 2300, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9944328194'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7a3e8d55-b0c0-441e-9a0b-b4dd7ce36bc5', l.id, 1, '2026-08-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cf5f144c-f92e-4ef2-9212-2d917a356f51', l.id, 2, '2026-09-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bfee14a5-a682-4d79-bc62-dd23c4dcad4d', l.id, 3, '2026-10-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '62938a7c-5cf4-4abd-8382-debd8d6f2bf0', l.id, 4, '2026-11-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8942dd8-bc98-4b7c-a1ea-eec8a142223e', l.id, 5, '2026-12-04T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-047'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #48: diva (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d807a72e-659b-42ef-bd93-1386e56a08dd', '7418302940', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b841ec3a-51ca-48cd-80c4-6b7b9d772a87', u.id, 'diva (metu)', '7418302940', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7418302940'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1112bbfd-a8a9-44b8-bb85-c8b2c3d099e1', c.id, 'LN-048', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-05T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7418302940'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '39de58e4-2e4c-4e48-b5b7-6218d376185e', l.id, 1, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '19166087-e41a-439e-90c3-493b0a38afb9', l.id, 2, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd30be545-4597-4747-988c-52946c78b96e', l.id, 3, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1858862c-ae0b-4cce-91a5-dc88741a960c', l.id, 4, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75cc4c43-5e4f-42d0-9e16-2868c317ec71', l.id, 5, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f135b522-9ffb-4671-8eb5-51eb51e07cbd', l.id, 6, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e294df4-bfb4-4b9a-ad8e-433d63dd7834', l.id, 7, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e58bf7cc-753d-45cc-9081-90275e4a92c6', l.id, 8, '2026-08-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b8eceeb-6f1d-4ab2-847b-ab8c94c132dd', l.id, 9, '2026-09-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df3dfd19-1bfe-4de4-a262-a8cbfe34da29', l.id, 10, '2026-09-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-048'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #49: naga (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6a439a97-acfc-4970-8e9b-45bd9949a280', '6373153440', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e9049185-2ece-40b9-8097-9d484f9a577f', u.id, 'naga (mesthiri)', '6373153440', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6373153440'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '6f89fb5b-6650-4031-add4-ba2a52493ef7', c.id, 'LN-049', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-06T00:00:00.000Z', '2026-09-14T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6373153440'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd66da0db-fc8d-4aae-9163-74d7ee506ca4', l.id, 1, '2026-07-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6c91c33-ac76-46e3-8a86-845dcc70f18a', l.id, 2, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '93d07948-8782-4817-bc20-972e6cbd3739', l.id, 3, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cee2e017-d785-49f6-9db0-1951a601c099', l.id, 4, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c51c3fbc-bbc5-4df1-80fb-b025f10e0776', l.id, 5, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e90d6363-faef-4e97-a8c5-73ea2fc5036d', l.id, 6, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'afbdce64-b923-4773-8e50-f6afd3cd867e', l.id, 7, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f12d11dd-183a-4616-ae41-825454f64646', l.id, 8, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8945444e-c60b-4f6c-8b9c-9aba7991abd4', l.id, 9, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1bfe6ecd-b04b-4312-83ad-5a38f27fd1c4', l.id, 10, '2026-09-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-049'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #50: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3a540d9f-471e-45f3-8211-3d3eca4ddbc8', '9100000050', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'eea35c59-6721-4c52-84a5-a442c0ca8d7f', u.id, 'elango (pigga)', '9100000050', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000050'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '2784e849-5564-4f0e-8895-e2b45d15225b', c.id, 'LN-050', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-13T00:00:00.000Z', '2026-09-21T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000050'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e93774bb-9139-45b8-8bce-121b839e10de', l.id, 1, '2026-07-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '45e014e9-6568-4626-8bf7-e8b3f2f96edc', l.id, 2, '2026-07-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '60de49f0-8418-4256-b8b2-713e57f4839c', l.id, 3, '2026-08-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '417be3e7-b6b9-4f11-bcd6-eaf6fb9576ee', l.id, 4, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1b2c9816-118d-4452-8ee7-334bdb715008', l.id, 5, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '51ec9384-6a3b-486b-aec6-f24c107b43c6', l.id, 6, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5ee9c5d1-44eb-4fde-b623-40aa35ba45e5', l.id, 7, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'accca138-acb7-4a2c-a1e0-857f5c6d5c4f', l.id, 8, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7726cfae-f2cc-443c-acfa-2fe0caa3848d', l.id, 9, '2026-09-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '435a25b1-baa1-4fb7-bd85-ffa608b2c983', l.id, 10, '2026-09-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-050'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #51: Diva (om)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6559a17e-82a8-4e63-89bb-7da47534cdd2', '9100000051', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '43b9371d-cc29-481d-a549-3b5a61a03a45', u.id, 'Diva (om)', '9100000051', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000051'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd80b5b4c-1a27-4000-93d8-2a4146eddd6b', c.id, 'LN-051', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-17T00:00:00.000Z', '2026-09-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000051'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'da1273f2-6b74-496b-b4e1-66c5d60002c3', l.id, 1, '2026-07-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd139d15f-3a9f-437b-ab6e-2f30996949f9', l.id, 2, '2026-07-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4f75201a-ec80-438a-b87f-5469b685fa7d', l.id, 3, '2026-08-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aebca119-15c4-4f67-bda5-3ed5f7b0c29d', l.id, 4, '2026-08-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ce1f4daf-465d-4168-a9ac-e46410414924', l.id, 5, '2026-08-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9958b445-5cc1-4356-b5cd-e358debe107c', l.id, 6, '2026-08-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '06806bf8-dc42-4aba-b07a-969058edfec5', l.id, 7, '2026-09-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff3f3244-f251-4fbd-97bc-00720bc86ade', l.id, 8, '2026-09-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7efe177d-eb45-46f2-87d1-2c01d0647c26', l.id, 9, '2026-09-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df76f0c5-4830-49ef-ab1e-55975fb06366', l.id, 10, '2026-09-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-051'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #52: sarath (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('bbae9413-a212-42cd-a0fd-e442df50450e', '9100000052', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3d0a3db3-2d3e-4ba8-a023-7a254e3bbf3d', u.id, 'sarath (kv)', '9100000052', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000052'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7446421b-220b-477e-b727-f77ff90d6cf6', c.id, 'LN-052', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-17T00:00:00.000Z', '2026-12-17T00:00:00.000Z', 5, 2300, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000052'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '370af484-5188-41f7-af59-97f97d10287a', l.id, 1, '2026-08-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '08247431-8e2a-4c17-919b-94df25455c73', l.id, 2, '2026-09-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '732f1d7d-3344-4e43-8b93-1a42516f5300', l.id, 3, '2026-10-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8c661904-edb7-4452-ac10-b064d1297032', l.id, 4, '2026-11-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '97ff73ac-8e7d-4bfb-aa67-c506bd5ef495', l.id, 5, '2026-12-17T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-052'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #53: sundu santhosh
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('95d42ebd-4e6f-4096-9434-307edca45a2b', '9100000053', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e1cb720a-fa2e-4e78-93c0-6f58e4786e65', u.id, 'sundu santhosh', '9100000053', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000053'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'de56e406-aa2e-493e-a601-7bbaa02f35fe', c.id, 'LN-053', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-17T00:00:00.000Z', '2026-09-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000053'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '773e2518-d522-4958-9842-d7f5e0006349', l.id, 1, '2026-07-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '110ed5b4-7d74-4242-9a1d-0b3a84c2c2aa', l.id, 2, '2026-07-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3f58c441-3a1a-4146-b863-8bde20a47ef1', l.id, 3, '2026-08-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'abb98d88-c8c7-4ffe-a0f4-843a1ee8cc5e', l.id, 4, '2026-08-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '00ca9e37-6c9e-4300-be99-6141044b9ab0', l.id, 5, '2026-08-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8679b7da-60f1-40ff-8f76-cafae9106c50', l.id, 6, '2026-08-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e0110e3-a4c7-4177-b69c-b549fe51458c', l.id, 7, '2026-09-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dcd0cf1c-3a8c-4218-8e2a-2e119c643584', l.id, 8, '2026-09-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd1010a6-a0a5-4eb1-bb85-397f92023d52', l.id, 9, '2026-09-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '33e4c9eb-f1a2-4bb2-9951-aab6cc398cf6', l.id, 10, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-053'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #54: Raman
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('05e09404-a6bb-44bb-83ca-0a2962d84568', '9843560642', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'cd1901c9-6599-42a1-bf8b-bb8a65651107', u.id, 'Raman', '9843560642', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9843560642'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c959c8fb-56fb-45d8-b5d1-e4e60ec0abdc', c.id, 'LN-054', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-21T00:00:00.000Z', '2026-09-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9843560642'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c52a60b5-749c-49ad-8d33-dcc562f760ad', l.id, 1, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '033ca29b-2120-4db1-a0b7-a336284164bd', l.id, 2, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '337d1465-8209-433c-8838-957a9c420d0e', l.id, 3, '2026-08-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '83de1743-45fe-45b8-a08f-3318d5ce6c2c', l.id, 4, '2026-08-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9ffa531d-7c7a-4c1b-8f6d-883774973b07', l.id, 5, '2026-08-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fa099bc7-191a-4085-a693-88ee1b74a2ac', l.id, 6, '2026-09-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '19bc0b39-6b0f-4e3d-9a5b-234307b03a10', l.id, 7, '2026-09-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6e0e0dd1-07dc-4e3c-b72f-9b95e29af74c', l.id, 8, '2026-09-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '043c0e98-0e88-4562-a249-902e8d634db0', l.id, 9, '2026-09-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f58582b-5526-478b-95ba-a6837bca5ba0', l.id, 10, '2026-09-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-054'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #55: mani (pattu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('b5890c5e-7478-4171-91cb-b9938bb5a312', '9100000055', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '99d54d79-3840-4c80-b2f7-863de8b77962', u.id, 'mani (pattu)', '9100000055', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000055'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fd856018-6e96-4a4c-b221-df1a1ed2fa69', c.id, 'LN-055', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-07-21T00:00:00.000Z', '2026-09-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000055'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '84806a82-35e0-404d-a1ad-59c6d6cfca69', l.id, 1, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dcca38a6-12af-4f4d-98a0-b9548d2ed37f', l.id, 2, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a192a35-beda-49e0-a0a9-efee20a76965', l.id, 3, '2026-08-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8cb100c-41e2-4c99-aed6-4d78fda9ddc9', l.id, 4, '2026-08-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7008872a-72c8-4659-9629-0c12741c8387', l.id, 5, '2026-08-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f1b1a76-934d-440b-843e-11c8bc790fef', l.id, 6, '2026-09-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1692579f-60ca-41c1-974f-9f930c6d846d', l.id, 7, '2026-09-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '65d8bb9c-2c64-42a4-99ee-43b2d84358c6', l.id, 8, '2026-09-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '73fa8f6c-d921-4515-a3ba-46eb30d8ab10', l.id, 9, '2026-09-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8183b034-d118-458c-a0e8-2324c5662054', l.id, 10, '2026-09-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-055'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #56: sakthivel (mangalam)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2140b76d-2361-4ffb-83fa-c00b4bcddcab', '9847557749', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3fbbc5a8-d1d8-40b8-97b8-59720aee835e', u.id, 'sakthivel (mangalam)', '9847557749', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9847557749'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'acc68095-817e-4e8f-95ea-ac7efa9e385b', c.id, 'LN-056', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9847557749'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7c77f861-5697-487a-9081-7fc28913df69', l.id, 1, '2026-07-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4407f2d5-b1f9-4cd6-8ee2-ddd304121642', l.id, 2, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7fd875d6-f1e3-42ac-aae4-38b46891f5a9', l.id, 3, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff5fb5d4-0276-4077-806c-74bd6cc24e51', l.id, 4, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7a7931ca-1f1f-46f5-80af-4a7b2c70d870', l.id, 5, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f1c6deda-c939-4805-baa5-ff8fc15b66f0', l.id, 6, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '933c975a-39a2-49fb-ac33-a5e85e79a2ae', l.id, 7, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f5f4587-ba98-47a4-b665-04cf0bdd0a35', l.id, 8, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8eb49ba7-ad65-4878-b0cd-a5f26c15c53a', l.id, 9, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7c538a34-2644-4000-a93c-2e95690bc666', l.id, 10, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-056'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #57: ranjith
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4a49af94-e5f0-4ade-bc12-a325e497a312', '9100000057', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a1dc8b47-8695-49ef-9dad-a8df5425337d', u.id, 'ranjith', '9100000057', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000057'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '2bd44e98-8132-4d73-91c1-e1550dda7bf7', c.id, 'LN-057', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000057'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e6d17bc0-1416-401a-8602-645358d02f0f', l.id, 1, '2026-07-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c9c48da-5a4e-4a1e-81db-b3844c3d4a4c', l.id, 2, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd99dc7c2-09f5-4e12-a97f-f4de625018af', l.id, 3, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '933ad1dc-6b14-4090-9707-39a3d1be3f94', l.id, 4, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31d59ef7-d18b-4a56-84a1-667efad0a01e', l.id, 5, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2a905648-7a99-4144-ad3a-ae7fcedb4eda', l.id, 6, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c8f56f1-3120-4674-b5bb-0e5db61a772e', l.id, 7, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1bb46c71-5f1c-44cd-b44c-9d65b1a761bf', l.id, 8, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '59e3f1d2-86a2-4303-879e-6ec67588d44f', l.id, 9, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0a0105ac-c66b-43af-bd1e-48fca7207161', l.id, 10, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-057'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #58: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5d4f3345-4c73-4232-b4c0-2de7f91fef4c', '9100000058', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c55539e3-8525-455d-8744-6746597f3a16', u.id, 'ragupathy', '9100000058', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000058'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '42c1a4f9-4449-4fe7-aad6-c858a5f0368b', c.id, 'LN-058', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-23T00:00:00.000Z', '2026-10-01T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000058'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4ce0023-d49a-47f7-93d7-81d04e269376', l.id, 1, '2026-07-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7ff7466a-681f-4634-8502-c07c1727e4e3', l.id, 2, '2026-08-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd56947fc-c0bc-474f-8c61-0867c0b49d22', l.id, 3, '2026-08-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f6c94a6-309b-4b1e-a648-be745b36130f', l.id, 4, '2026-08-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f7e03098-2108-4a10-b0bc-9adf3568db54', l.id, 5, '2026-08-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5e03bdd0-cc79-4168-8a04-81d9a30c03a3', l.id, 6, '2026-09-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '10d63b62-d69f-4460-aeb5-d46aca1248f0', l.id, 7, '2026-09-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01b8d7bd-c37e-48f4-8728-1b6ed1ab0c04', l.id, 8, '2026-09-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '275d1b07-7ffd-43cf-b2ce-7b60d934e671', l.id, 9, '2026-09-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd9f13f41-de09-437b-8418-b61534e1396b', l.id, 10, '2026-10-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-058'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #59: ajith (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ba74a22b-66f5-445a-bef5-93f222a0d2db', '9100000059', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6af56e77-95ba-441c-bef5-df224207d93b', u.id, 'ajith (metu)', '9100000059', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000059'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '56481d80-4363-4cb4-8a8c-9e9e06d6a5e3', c.id, 'LN-059', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-07-24T00:00:00.000Z', '2026-10-02T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000059'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8b66cca0-f9e8-41b5-9ea7-64d72c2e233f', l.id, 1, '2026-07-31T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f58c990-9d85-42ac-81d2-6d1f250ea792', l.id, 2, '2026-08-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8dcc898c-b2ca-4dde-a7b6-8a846e426d20', l.id, 3, '2026-08-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9facef9d-5bf4-4468-97ef-71df36f7e0c8', l.id, 4, '2026-08-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '90faf03c-3181-47f3-bc83-19aa5ed21ff6', l.id, 5, '2026-08-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb356540-e30a-4378-8b3d-bfab93a2d899', l.id, 6, '2026-09-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e822c541-cd66-487b-bd1d-8255cfbe04b0', l.id, 7, '2026-09-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6db310be-7308-49b1-a62e-835b2c200907', l.id, 8, '2026-09-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8519ad81-70bd-4483-b897-ff7bf5aa5d59', l.id, 9, '2026-09-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0b4eee3d-41dc-47cb-8ab4-54f62408fa9d', l.id, 10, '2026-10-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-059'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #60: ganesh (karesh)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('e3e56ded-4e7d-4749-aeca-8c09094d11f5', '9100000060', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '920b3cd6-4b3e-4260-bcd6-3aeb998bdb65', u.id, 'ganesh (karesh)', '9100000060', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000060'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f7cd178c-9c2d-45b4-923e-acb5f1077ab8', c.id, 'LN-060', 'MONTHLY', 10000, 15, 0, 8500, 0.00, '2026-07-24T00:00:00.000Z', '2026-12-24T00:00:00.000Z', 5, 2300, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000060'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7761cdbc-038d-40dc-83f3-b5f0896f245a', l.id, 1, '2026-08-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e14ac0e-a6cc-4656-b939-75326e58c998', l.id, 2, '2026-09-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1060e75b-b9c6-4682-910e-36d9e51edaf5', l.id, 3, '2026-10-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f304ab1b-4f33-4526-8014-d5c7fea5a645', l.id, 4, '2026-11-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '351d71c3-d514-4930-b656-3877cf08fc44', l.id, 5, '2026-12-24T00:00:00.000Z', 2300, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-060'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #61: Suresh (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('75b547ff-88b0-4b29-a761-fb569325763e', '9100000061', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd3df7b8c-47bf-4fd0-b6d7-19f532d475ec', u.id, 'Suresh (mesthiri)', '9100000061', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000061'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a1657a61-26ce-497d-8ae0-7c946ff81141', c.id, 'LN-061', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-25T00:00:00.000Z', '2026-10-03T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000061'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '06e6f13d-63ca-4a1e-be3c-7cda20179ed9', l.id, 1, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3749fc69-dd27-4bf5-ad98-a14d48073c92', l.id, 2, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7b7062ce-c62a-4265-80f8-2924d4f78bd5', l.id, 3, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f6cc9202-987e-4d8d-8452-e67fb426f851', l.id, 4, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '36140236-51a3-4f60-a94b-cd01703d494b', l.id, 5, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e54ad956-aa58-4fe1-85ba-10b7c6bec323', l.id, 6, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '901a3c0b-aca8-4199-ac6d-d060e571eafe', l.id, 7, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a14dc15f-ae22-42e3-9574-deab04c8ba01', l.id, 8, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '53cd9ea3-2add-4dac-9d2b-05f7f035714d', l.id, 9, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3d88ddcb-84cc-4499-8cba-7a0511acfc64', l.id, 10, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-061'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #62: yuvaraj (Gowinthan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f45ba000-c64e-4539-a2fe-4c0c6d39de6d', '9100000062', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f2405664-48b5-49b7-b54c-33614212b765', u.id, 'yuvaraj (Gowinthan)', '9100000062', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000062'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd8df72fb-caf5-44be-9504-a1b3ab992542', c.id, 'LN-062', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-07-25T00:00:00.000Z', '2026-10-03T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000062'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34632e82-98ab-46c0-8beb-67e2db4ff63b', l.id, 1, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '21ef610d-a9ab-4493-bf9b-2d829113e672', l.id, 2, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1e66bbf5-64a3-48c2-ae88-ed52d9d890ae', l.id, 3, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '478446b2-461d-4c46-a440-8e579ed0ba73', l.id, 4, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e49852b-58ad-41a4-b63f-1150b423dafb', l.id, 5, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '521f445b-2a40-43c0-a2fa-0ef2bd8210b5', l.id, 6, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '90b140ae-a07a-4f56-8c68-6f1539758b05', l.id, 7, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '062421f3-8c18-4659-a92f-9378fce3d73f', l.id, 8, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f24a4fcc-be4e-41cd-8321-994cbf6822f1', l.id, 9, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '63bfc9b6-26c9-4cba-bc46-f512ebccdc08', l.id, 10, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-062'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #63: Mani (Tails)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0838a58d-d8ba-4e19-9420-1f1f7d7aac78', '9100000063', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'cd5b741c-e37c-481c-b3ac-3f0d8daff71a', u.id, 'Mani (Tails)', '9100000063', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000063'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '38d79476-bb6b-40a2-aa45-86142f77cddf', c.id, 'LN-063', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-07-26T00:00:00.000Z', '2026-10-04T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000063'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e16f92d3-3a96-49b7-9dc4-294569f123d5', l.id, 1, '2026-08-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd6dcb7b1-db26-4a8a-901f-0518bd1194f3', l.id, 2, '2026-08-09T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '53062a5f-ff6e-4d9c-beda-38cd9a0b818e', l.id, 3, '2026-08-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec925470-6ddf-4afd-a31e-9da880fe0163', l.id, 4, '2026-08-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2050b7d1-0cdf-49e1-b80b-ca84737e8b13', l.id, 5, '2026-08-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55db8ad2-7948-49c7-b123-ae99c4292ca4', l.id, 6, '2026-09-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f0f0d5f0-161b-42a9-98f5-7527dfe4b038', l.id, 7, '2026-09-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '88f1f9d0-889d-4111-87b8-336e2d2083e9', l.id, 8, '2026-09-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b2746c1e-6f57-4a24-91f7-02be99e15de7', l.id, 9, '2026-09-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69bd3165-ac51-4adf-bed6-d0f024f31135', l.id, 10, '2026-10-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-063'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #64: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4f3a13f3-c339-4e11-ab4a-947d17066e23', '9100000064', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9766ce0d-52cc-40b4-8380-fdf2f00c2ed3', u.id, 'ajith (aali)', '9100000064', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000064'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'e7f7b303-3639-496b-a67a-9fa58372843d', c.id, 'LN-064', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-29T00:00:00.000Z', '2026-10-07T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000064'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd1df0fa6-eca2-4306-baa4-1c89d2cd485b', l.id, 1, '2026-08-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7ea3aef1-2109-4aed-ae5f-d8b6c35a9274', l.id, 2, '2026-08-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac38d234-1715-4e5a-a413-6bc894475463', l.id, 3, '2026-08-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0fb52d35-bb96-4f50-9ba7-db91cfdd04ac', l.id, 4, '2026-08-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0356ae2c-6db8-4fa0-a1f9-01f48f567c4d', l.id, 5, '2026-09-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4358fb32-f04a-4549-bcc4-fa290e3fe649', l.id, 6, '2026-09-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '193cf7e6-7d53-44aa-9626-2260710b87ec', l.id, 7, '2026-09-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8caf975-7e76-4192-a451-fa4cee88106e', l.id, 8, '2026-09-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f08ba549-116a-499b-91cb-299dc344604a', l.id, 9, '2026-09-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9bb4a92d-eff6-4df7-8b74-016f88491c9d', l.id, 10, '2026-10-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-064'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #65: arunachalam (master)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('93964298-ed46-4b1f-8db9-7bfe9c7dc644', '9100000065', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9456acb7-fd37-4887-8a9b-6c69d149574e', u.id, 'arunachalam (master)', '9100000065', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000065'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '515a7b41-64b8-4388-8545-ba95dbae352a', c.id, 'LN-065', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-07-30T00:00:00.000Z', '2026-10-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000065'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '564fb0a7-572a-4a6c-9f6b-6cecea811f17', l.id, 1, '2026-08-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd1fdd8ec-cbd6-4d26-bd00-956e7b2fe699', l.id, 2, '2026-08-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c82169f0-0247-4865-bad0-956916426e53', l.id, 3, '2026-08-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a4381adb-73ee-4ca9-9946-679690dc3fae', l.id, 4, '2026-08-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f81c450-fbe3-4342-8b3f-95ff4e51c715', l.id, 5, '2026-09-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb8ed113-c6f6-4c7f-a3fa-ae3ea0a5bab8', l.id, 6, '2026-09-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01f4a5d8-f5aa-4254-8acd-9c59846c8567', l.id, 7, '2026-09-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff2983b3-e0fe-40b6-87e6-0d686f544a28', l.id, 8, '2026-09-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '29efa9a2-e0c7-4d8e-99b7-36b2a65b3ee5', l.id, 9, '2026-10-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55329d6c-448d-4c8b-a4e7-9d01d3a7de91', l.id, 10, '2026-10-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-065'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #66: karthi (kendu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f45da5ef-0c8b-444b-a4e8-7cb0db747318', '9100000066', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ff2bfa41-b522-4025-8592-f40da2d2b8f6', u.id, 'karthi (kendu)', '9100000066', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000066'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0a3ee835-9d97-471d-a05f-63353c843a97', c.id, 'LN-066', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-07-31T00:00:00.000Z', '2026-12-31T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000066'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '08cc2062-d25d-4b19-b18e-aa1338c05d72', l.id, 1, '2026-08-31T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '91cae57d-aee9-485b-8fa3-418a7da8eaf4', l.id, 2, '2026-10-01T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e50495cc-dc3e-49e2-9945-55804d55fe50', l.id, 3, '2026-10-31T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37acbceb-00a0-4786-9ba9-07df4f840de3', l.id, 4, '2026-12-01T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b563f5c8-225b-4591-8cb7-d52f6a3cb353', l.id, 5, '2026-12-31T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-066'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #67: babu (acheri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('dfe4d8ed-fb30-49fa-ba7d-5c12a675e23b', '9100000067', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2023f2d5-60fa-42c9-8c37-f4bb2d2cd338', u.id, 'babu (acheri)', '9100000067', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000067'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5ac423ad-caa0-45f5-8fd5-913ed10c20e2', c.id, 'LN-067', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-02T00:00:00.000Z', '2026-10-11T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000067'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '700f035e-b595-4626-ba30-5e404beca384', l.id, 1, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ccc9a921-7a9f-40e0-831e-3b7f20afc378', l.id, 2, '2026-08-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2987803-9f60-422f-ac6a-16016da45c75', l.id, 3, '2026-08-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cac73154-78af-4ece-a193-7be204b4afe9', l.id, 4, '2026-08-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac9a98e9-487d-4a74-b20b-8f30ce1161fe', l.id, 5, '2026-09-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61055592-d777-4549-bf61-fe866cda60a9', l.id, 6, '2026-09-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f388d8b1-9324-4bbb-ad83-4e35b9a38168', l.id, 7, '2026-09-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c40c92a8-966a-4118-8f3e-1ad4e8832b8a', l.id, 8, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01de0dfb-184b-42be-9243-77553c0b18e9', l.id, 9, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2eda1d65-c033-4530-90a0-ace0a6966caf', l.id, 10, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-067'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #68: Naveen (puthupet)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('9d02c21b-dd36-4634-a1fb-03c898dd3fe7', '9100000068', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '19ad0a1a-adde-4bbd-8dcd-e0872bb83f28', u.id, 'Naveen (puthupet)', '9100000068', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000068'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fa0c0fd8-6852-4905-9553-f0552d64e0b3', c.id, 'LN-068', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-03T00:00:00.000Z', '2026-10-12T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000068'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1128fd4e-b6dc-438e-9385-b9068e2235a8', l.id, 1, '2026-08-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '646dc252-a640-45f2-92e0-b6b579738130', l.id, 2, '2026-08-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1ae16238-68a3-4c1d-918d-1b28cfad961b', l.id, 3, '2026-08-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f49643bf-e0cb-4d1c-96a0-3672d1614290', l.id, 4, '2026-08-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8c91ad6-d8cb-4377-b5d1-c36f94621fb6', l.id, 5, '2026-09-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bfb1c62c-e8fa-4a37-a8fd-8396d7263aa9', l.id, 6, '2026-09-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7269e049-acc5-4de2-b58f-ec9d2967cda1', l.id, 7, '2026-09-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aa5e1cb3-d4a2-462c-adb6-1328ec645e09', l.id, 8, '2026-09-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3b0c8113-fbcb-48b0-9a4a-6d2bf5569267', l.id, 9, '2026-10-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fac8b8ad-f496-4b7d-9210-0f6c42579e80', l.id, 10, '2026-10-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-068'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #69: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0e24005d-9edd-47cf-808a-7e88d1ce7ee0', '9100000069', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ea54ba1b-d5cc-4e89-b05c-d1882e1c6b8e', u.id, 'ragupathy', '9100000069', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000069'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '787265ca-07fb-48ec-a162-1f9d0c07696b', c.id, 'LN-069', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-08-03T00:00:00.000Z', '2026-10-12T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000069'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f5843f5-cced-4b84-8ebe-60e289d6b163', l.id, 1, '2026-08-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ed3c5dae-5581-43a7-8529-3996f0d56a39', l.id, 2, '2026-08-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '661ff500-7736-4e58-8a4b-8c94b53319b3', l.id, 3, '2026-08-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16cfa823-b16d-4b9b-9175-a97e3f3d4cdf', l.id, 4, '2026-08-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f349c58e-44f8-4946-a937-a0c91d8b4a6a', l.id, 5, '2026-09-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '01802fce-9cd6-4259-be92-b98fbb36487c', l.id, 6, '2026-09-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8048861-57d5-461b-ad60-850bd10d26ea', l.id, 7, '2026-09-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c5f90e7b-de1e-49b3-a84c-0ebf15281b31', l.id, 8, '2026-09-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '360ce40d-946e-4d77-9128-379aee91b4a9', l.id, 9, '2026-10-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '903b4eca-5905-4054-906f-adf7fa25df4e', l.id, 10, '2026-10-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-069'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #70: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('157f73b2-fe3c-48c6-bb6e-ea4ac54592f1', '9100000070', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c4e204a9-8b28-42c0-9811-090a6507932d', u.id, 'venkatesan (kv)', '9100000070', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000070'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '519b3d3b-6ebb-4c4d-81f1-2b39de6af4bf', c.id, 'LN-070', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-08-10T00:00:00.000Z', '2026-10-19T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000070'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb79d8f7-509d-4153-8d11-2b4c41738ede', l.id, 1, '2026-08-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4468c725-3fc8-4793-81e8-a7baed7829b5', l.id, 2, '2026-08-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd1fbc4f3-6e06-4cb3-ada7-f6857bab5908', l.id, 3, '2026-08-31T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b3b25a6b-fbd4-4466-a972-1daf3193ab26', l.id, 4, '2026-09-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0aa85d3f-9678-433a-809c-49bab95552b0', l.id, 5, '2026-09-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c9bb5059-f29f-4638-9630-1c8a148a0bfc', l.id, 6, '2026-09-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '660969bb-b0f6-410c-b3cc-c5567badb5cf', l.id, 7, '2026-09-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f6635ca-ea55-4b77-b109-793ca0916cf7', l.id, 8, '2026-10-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd943dc74-3555-4053-a660-274731d4c005', l.id, 9, '2026-10-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '785c0562-9969-4734-b681-cfb9f8aaeb7f', l.id, 10, '2026-10-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-070'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

COMMIT;