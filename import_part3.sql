BEGIN;
-- Record #71: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a3b51afb-8c06-4db1-a28b-2983157ee71a', '9100000071', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a4e2acf0-3929-4e18-b29c-2a235bac9273', u.id, 'vicky (metu)', '9100000071', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000071'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '98bc2bc5-cd4d-4772-81c8-6e57b31e2002', c.id, 'LN-071', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-08-13T00:00:00.000Z', '2026-10-22T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000071'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4659b999-fe7a-4560-8751-7ed4fd57abb1', l.id, 1, '2026-08-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34bc3998-f407-4ce5-ab41-c64a936d380a', l.id, 2, '2026-08-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5a3ab50d-6f00-463c-a086-1a0cd4c13c29', l.id, 3, '2026-09-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f38bbe3f-64fc-4c62-81cb-53c33287172e', l.id, 4, '2026-09-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '597a8526-c177-4336-9ce4-918b9bb2d165', l.id, 5, '2026-09-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '841a0411-a946-45ff-9fb7-00d54737ff94', l.id, 6, '2026-09-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '67dfd984-99c4-43cd-b12d-3de7ae3d1cc6', l.id, 7, '2026-10-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '035dd76d-7d59-42f2-83bf-71b98ebd858f', l.id, 8, '2026-10-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0641734f-61ca-4189-b5f2-6d53d9317656', l.id, 9, '2026-10-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '010071b1-0bbe-4d8a-985b-09232eb3cd7e', l.id, 10, '2026-10-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-071'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #72: rathinavel (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('a64a5dd6-e11e-4dcb-9338-ca8ee9d019c1', '9100000072', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c1bebcb7-09c5-4761-ba7e-7951703977ce', u.id, 'rathinavel (kv)', '9100000072', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000072'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5777e10d-313c-4acc-ba0a-fa25d3466bfe', c.id, 'LN-072', 'MONTHLY', 20000, 15, 0, 17000, 0.00, '2026-08-15T00:00:00.000Z', '2027-01-15T00:00:00.000Z', 5, 4600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000072'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f14e5408-bf35-4e2b-8bfe-2accb465a94a', l.id, 1, '2026-09-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '78a85ddc-1975-4ca4-9529-9e80453029a0', l.id, 2, '2026-10-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c242c9a-3de8-494b-9ca3-4cb018eced09', l.id, 3, '2026-11-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fd724667-a124-4251-b373-fe968323c5c9', l.id, 4, '2026-12-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ddf2de79-ff4a-447c-bdd3-4bb180cd2ddc', l.id, 5, '2027-01-15T00:00:00.000Z', 4600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-072'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #73: manimaran (laddu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('00ad4893-356a-47c9-a11b-4387d9476402', '9100000073', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2d75f8df-59cb-4204-88d5-d0cfcfa039ad', u.id, 'manimaran (laddu)', '9100000073', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000073'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '03f3146e-68ff-47c0-80b1-99ec525fb8ee', c.id, 'LN-073', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-17T18:30:00.000Z', '2026-10-26T18:30:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000073'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7d78204b-863d-47c2-8e56-e39e08ce6eb0', l.id, 1, '2026-08-24T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f22fac7-1fb9-4916-9d08-6908cc12fa29', l.id, 2, '2026-08-31T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '154acbef-1f3c-4ebc-9401-ae0144962d03', l.id, 3, '2026-09-07T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ca862f12-5915-49e9-b008-07201a39782d', l.id, 4, '2026-09-14T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '19295880-2833-4481-bd36-3c8dbc07fdaf', l.id, 5, '2026-09-21T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fc5ceef7-e6ba-4876-9887-328d39b28cea', l.id, 6, '2026-09-28T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2aaa49ab-2f7f-4e93-8c4b-d4d70f54f068', l.id, 7, '2026-10-05T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '433c5970-5585-4360-8bef-452ee3168ce1', l.id, 8, '2026-10-12T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cd97c36d-0aa1-4056-8225-791793817489', l.id, 9, '2026-10-19T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f47aa922-d91c-4f20-bf7c-2daaef28c4b3', l.id, 10, '2026-10-26T18:30:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-073'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #74: logesh (don)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('cc8800a0-31f8-409e-875d-bdc593aaa46f', '9100000074', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ff9ba5c8-0ab6-47d7-92c5-ba36124ecf8e', u.id, 'logesh (don)', '9100000074', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000074'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '6b12b22c-5f9a-4b44-b7fa-287b34e7dd57', c.id, 'LN-074', 'WEEKLY', 12000, 10, 0, 10800, 0.00, '2026-08-10T00:00:00.000Z', '2026-10-19T00:00:00.000Z', 10, 1200, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000074'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0dcfe889-83ce-46d7-852a-6b74d53ac050', l.id, 1, '2026-08-17T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '32362a48-3129-4b62-8e93-39abc85adc67', l.id, 2, '2026-08-24T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ddf56cec-4698-442f-84dc-cf7149a282e7', l.id, 3, '2026-08-31T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9100d049-1676-473f-ab85-db2bd6b4c1f2', l.id, 4, '2026-09-07T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '07b16d82-b13d-43ef-866c-e6c4a3565706', l.id, 5, '2026-09-14T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f7162925-5148-44df-b447-276e7cbe3cc4', l.id, 6, '2026-09-21T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd39aec2a-a1de-480c-b7d0-4b782d196498', l.id, 7, '2026-09-28T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4d31388-53f1-4839-b7ed-a6323eb417c5', l.id, 8, '2026-10-05T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3861488b-b439-477c-80f9-f8da67f22ee0', l.id, 9, '2026-10-12T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '520952e5-81c9-481e-9c0e-63d3d84ebc41', l.id, 10, '2026-10-19T00:00:00.000Z', 1200, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-074'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #75: dhanush (vv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('016f2cf0-6e82-45ac-a794-eb03c2877cee', '9100000075', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9b0e63fd-bcab-4c1a-bf9e-0bd25a129e56', u.id, 'dhanush (vv)', '9100000075', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000075'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd2b31fc5-0bb1-41ec-b86c-7caa1ab62f95', c.id, 'LN-075', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-08-22T00:00:00.000Z', '2026-10-31T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000075'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8de7b52b-a555-4b83-b1cc-9602d56b0387', l.id, 1, '2026-08-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '72b6c1a5-7583-4924-a3ca-dcad2dff98b5', l.id, 2, '2026-09-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f324676-e3e4-4faa-960f-e9cda91d6882', l.id, 3, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '266ce87c-6ca0-44e5-a9bc-393b996d57e8', l.id, 4, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd4178ea5-d7a8-4153-9916-7eca8286e831', l.id, 5, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b00482a9-4cb3-4224-9b30-09e3c2eb1a96', l.id, 6, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f6a6e1ce-3f9b-4d6b-abed-8379e5d658e2', l.id, 7, '2026-10-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b32238b3-8341-4977-b0e3-17ff91ae82b3', l.id, 8, '2026-10-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c1ed19a6-f1bd-44c3-94de-faacce2c044c', l.id, 9, '2026-10-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '15f60318-b661-474f-95f8-76491bda1fa2', l.id, 10, '2026-10-31T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-075'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #76: bass (khan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('97ddc600-618c-4771-8382-0e93162eb1a8', '9100000076', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a078bf98-1276-4e0a-9d25-8e393eecad4c', u.id, 'bass (khan)', '9100000076', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000076'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '49b77135-20bf-44db-97ba-193f7eede315', c.id, 'LN-076', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-08-22T00:00:00.000Z', '2026-10-31T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000076'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '715727ba-2309-483d-99cd-33db47d41e4a', l.id, 1, '2026-08-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2715e1dc-02c3-477e-acf6-2fe5d61223ba', l.id, 2, '2026-09-05T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7fcd234b-d40d-418a-a48c-da8285a373f6', l.id, 3, '2026-09-12T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a2ea1d1-239a-429a-95b4-7942d3d18c1e', l.id, 4, '2026-09-19T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac3d53eb-5b42-465c-9975-460a87e5e40a', l.id, 5, '2026-09-26T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a666f25-516f-48bd-ac72-bed3fe0b062e', l.id, 6, '2026-10-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1862e71b-5d55-4971-8792-4c4d68f1a6c8', l.id, 7, '2026-10-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4b29cee3-0093-440a-bf5a-2a0fe7c6f712', l.id, 8, '2026-10-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b1ffd919-72a8-4523-8cd3-adc39f2bbc22', l.id, 9, '2026-10-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3ae3b561-ff20-4e66-aa41-76d316c6ab88', l.id, 10, '2026-10-31T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-076'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #77: arvind (sb)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3f7bf0e0-ff22-4bcd-afec-9a773fc1a34c', '9100000077', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '6ae59274-989c-4a53-af65-20297ba8e695', u.id, 'arvind (sb)', '9100000077', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000077'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '2090ba13-f7f4-48c9-a1db-231103da2d5a', c.id, 'LN-077', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-29T00:00:00.000Z', '2026-11-07T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000077'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f7fbf172-511f-4a00-a88e-a48cbcf02d82', l.id, 1, '2026-09-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a592fd5e-359b-415c-86ab-ac3bf81568cf', l.id, 2, '2026-09-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eb6dcbf8-a1e4-4a11-bdbb-69df2ae63a4b', l.id, 3, '2026-09-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47ce4aa0-3170-40b3-9cea-14e055e4abf8', l.id, 4, '2026-09-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8cdc7ef3-d144-479f-bca8-468d867dc85f', l.id, 5, '2026-10-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '79744ce1-8cfd-4ed6-9c4a-acb5028baacb', l.id, 6, '2026-10-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '259086a4-0536-460d-81b3-ec6a1d01d53e', l.id, 7, '2026-10-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd59119f8-9326-4d36-915d-ce078f5f4adf', l.id, 8, '2026-10-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f7d45008-2c68-42bd-a018-81cbc6e1e437', l.id, 9, '2026-10-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6241ba80-876a-44c7-9eac-b28efb9c1bb3', l.id, 10, '2026-11-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-077'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #78: madhan (makku)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6a965928-60b7-4fc6-aed4-83000bec14b7', '9100000078', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '30ae8443-3b22-437d-83df-6cf5f829a64a', u.id, 'madhan (makku)', '9100000078', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000078'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ccf7231d-544e-4cc7-8cb1-ea49066c9f47', c.id, 'LN-078', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-08-29T00:00:00.000Z', '2026-11-07T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000078'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aeb168c5-30ac-4024-9ee8-3055eee5f18d', l.id, 1, '2026-09-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf3015da-e552-4ca8-8e0a-e8242b77f4e5', l.id, 2, '2026-09-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '986ee2a6-5394-41f0-8b47-c55b9ee3f1df', l.id, 3, '2026-09-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5a567d0f-05eb-457f-9fc1-1cf3ee2dfce0', l.id, 4, '2026-09-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3e889bed-1d50-402c-b662-2c1ac33c818e', l.id, 5, '2026-10-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '02a4256b-39f3-4ca6-b91b-11054e148d35', l.id, 6, '2026-10-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '452ae33f-bb31-4de5-ac28-58498d7099d9', l.id, 7, '2026-10-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '18a0e057-9c2d-49fb-8381-68ebc345b379', l.id, 8, '2026-10-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9238b2ee-cb73-4285-aa7b-b455845b5272', l.id, 9, '2026-10-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '056a4523-7713-4e59-b775-b9ce1f86a7cb', l.id, 10, '2026-11-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-078'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #79: udhaya (rd st)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ce56de6e-5fd1-42d9-98d3-be2ee9a1e171', '9100000079', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '0b61d0c8-171c-4ded-bdb3-27a8b23ff007', u.id, 'udhaya (rd st)', '9100000079', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000079'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '18122669-5268-4ab8-9411-7f3855d46174', c.id, 'LN-079', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-09-05T00:00:00.000Z', '2026-11-14T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000079'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34fa1647-4bb9-4810-9f55-63fbd5945415', l.id, 1, '2026-09-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '17af47de-0475-4f05-9ba3-e5bfa6455d65', l.id, 2, '2026-09-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7bbf3cbf-2d5c-4103-a508-16283cbe37eb', l.id, 3, '2026-09-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6dc5c323-c33f-4b62-aae6-eecfeaf98c5d', l.id, 4, '2026-10-03T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8b39fed8-0cb3-491d-9cf6-338c8af74bc1', l.id, 5, '2026-10-10T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f14cbb0d-9e69-4614-9bcc-4735ebfb83a7', l.id, 6, '2026-10-17T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '55a754f4-19bd-47f6-a40f-5e9e0ad099d9', l.id, 7, '2026-10-24T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2a5f983-1d88-447d-b132-d7d7c3b3a2b5', l.id, 8, '2026-10-31T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e5609cb3-5c3f-434f-9209-d3911ef7c2f3', l.id, 9, '2026-11-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3732ef39-96d5-4513-bb47-feb4280753d1', l.id, 10, '2026-11-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-079'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #80: barath (mia)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4b99690b-3b6f-4844-b208-59ea46ec8e66', '9100000080', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b3597920-3aa0-4429-a723-5437666e47cf', u.id, 'barath (mia)', '9100000080', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000080'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '69829515-e35c-43dc-bec8-8b64cf7e52f1', c.id, 'LN-080', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-08-26T00:00:00.000Z', '2026-11-04T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000080'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf322edc-71e5-4886-959c-aa51b4cefb8f', l.id, 1, '2026-09-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f8107344-e354-4477-9a9f-0d5e058c0f4c', l.id, 2, '2026-09-09T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e776bb5a-7f86-450f-a85a-35c14845a1a6', l.id, 3, '2026-09-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '89707ad1-da61-424b-8b39-1f910b6b1168', l.id, 4, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c9a1e09-8945-4f26-b372-2a06b9e84a44', l.id, 5, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0c0e7524-b36e-48a2-8ac4-f20146fdf9dc', l.id, 6, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '71d578d7-95dd-4788-b218-69ec21742b89', l.id, 7, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '34dd529b-cfad-4ef9-8fb5-06b7a8049a57', l.id, 8, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd38fda16-2243-4fbc-9192-21a7583b3c34', l.id, 9, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8cc75bab-1af4-4377-a250-61c027760128', l.id, 10, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-080'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #81: shanmugavel (kp)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5a41eceb-2c97-41ec-abef-30a57e1c143a', '9100000081', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '695428c0-7ab8-4579-b79d-2a0ae5f323a2', u.id, 'shanmugavel (kp)', '9100000081', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000081'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd2816d0c-1a88-469c-92dd-d0a09c95b6cc', c.id, 'LN-081', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-05T00:00:00.000Z', '2026-11-14T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000081'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b9f65b85-b326-49d7-b753-6a69f87c489c', l.id, 1, '2026-09-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5bc3bd0b-a6b1-4b5e-8fe9-2db087f001db', l.id, 2, '2026-09-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5687ee22-cc9e-4aa0-a801-a81123e29390', l.id, 3, '2026-09-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '53fba372-70b6-4fe6-a8a8-715ae5030c58', l.id, 4, '2026-10-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4e50efd9-3d46-450e-a136-c7204647666b', l.id, 5, '2026-10-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a3533927-eafd-4ef3-9383-dc2460d62308', l.id, 6, '2026-10-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a2704cd4-a5c6-41ef-bf77-3c3f5b5f1fd5', l.id, 7, '2026-10-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b634570c-a3d6-4ad3-91ca-aa75d31ca109', l.id, 8, '2026-10-31T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0170a583-1a9f-4cff-ab2c-45e5d217095c', l.id, 9, '2026-11-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4b1b890f-a236-4251-b902-0650ac6926a3', l.id, 10, '2026-11-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-081'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #82: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4279d214-aa01-446e-a2d4-b2d38f79ef54', '9100000082', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3aaeb753-1ebb-4073-a1c0-001105366fe6', u.id, 'vicky (metu)', '9100000082', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000082'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b5396f25-185e-41c8-b4f7-29fb0e3430cd', c.id, 'LN-082', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-09-07T00:00:00.000Z', '2026-11-16T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000082'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d542fce-e071-441e-b50d-349a98058ea1', l.id, 1, '2026-09-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'faa65d15-5097-4fa3-9540-efa0cbad10f1', l.id, 2, '2026-09-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e5a768aa-0139-4503-815f-ae436a17de3e', l.id, 3, '2026-09-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5d29bc62-9fc7-4cee-bcc0-67a20a2357a9', l.id, 4, '2026-10-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '022489d4-4b7a-41f9-9b39-243d28effa12', l.id, 5, '2026-10-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7405b484-a8e6-465c-8adf-10dd285c204d', l.id, 6, '2026-10-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a4990304-8639-4099-9826-40c5b2750faa', l.id, 7, '2026-10-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd8744194-9bfc-41d5-b2b0-056e18d52345', l.id, 8, '2026-11-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '007da527-55cb-49da-a23c-6e3d68b3c48a', l.id, 9, '2026-11-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8a702f06-d240-4b0f-a904-d4dd980b5f5f', l.id, 10, '2026-11-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-082'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #83: mani (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1bbf4497-c563-4d23-9040-2a70ac51ff37', '9100000083', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '5b47916d-9e95-4fc1-874d-d22fb22dc8ae', u.id, 'mani (metu)', '9100000083', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000083'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ee7540c5-e37a-4c1f-ba80-08e2f2250170', c.id, 'LN-083', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-06T00:00:00.000Z', '2026-11-15T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000083'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8e884b7-3b10-455b-be6f-2db25be81fd1', l.id, 1, '2026-09-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ba2c8b6e-209e-465a-a621-b0d3c6be33b8', l.id, 2, '2026-09-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '47f27845-9388-44bc-9509-689fb45a51b6', l.id, 3, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7f3b665-575f-468a-aad8-ae67d05578c5', l.id, 4, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '502e09da-ee59-499a-8a1b-fbfd9385aad5', l.id, 5, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '41ebdde3-d22f-43a5-b555-c0fc2abcb30e', l.id, 6, '2026-10-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c3e8eb50-c590-4d51-beec-baf40c0bd2e8', l.id, 7, '2026-10-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '78fa16b1-4e13-43fd-98af-09792ab827c5', l.id, 8, '2026-11-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1fb22491-6aa4-4344-9332-adcb00e63665', l.id, 9, '2026-11-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd372ca59-6251-4667-b92e-b702229da714', l.id, 10, '2026-11-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-083'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #84: balaji
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f2a4096b-0b36-42d0-9f3f-56cea4b04607', '9100000084', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f7e7738f-8171-4cba-b3b2-5167c9103d8a', u.id, 'balaji', '9100000084', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000084'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '6a045367-2c01-4046-888c-6f95d416f166', c.id, 'LN-084', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-08T00:00:00.000Z', '2026-11-17T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000084'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c0f673c-c2a2-4be3-80f2-326c39fedda8', l.id, 1, '2026-09-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '266bdc73-e479-46e9-9708-d3235eaf846a', l.id, 2, '2026-09-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cf2d556f-339b-444a-8c3a-07d738187804', l.id, 3, '2026-09-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0b99df16-f052-45f4-aaa1-042af8e033b4', l.id, 4, '2026-10-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8fa2e611-6f54-4313-86f1-91c34ee7cff9', l.id, 5, '2026-10-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75dedb99-e0b3-4d6c-97d4-c7347db5c1a4', l.id, 6, '2026-10-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '82150b2d-4881-4c4c-82bf-eb494a0c47df', l.id, 7, '2026-10-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42c760bd-7282-4cc7-bf38-7e5cd64a5781', l.id, 8, '2026-11-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8c5b30a-fe2f-4771-beb8-20ec657f3324', l.id, 9, '2026-11-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9d26abb4-a6a4-482d-9d9b-e198473f5784', l.id, 10, '2026-11-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-084'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #85: raman (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('6935d0d7-5a80-49c0-b3ba-8bc7ca6c9350', '9100000085', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '28af3f26-3790-4671-95ef-b3e20266707e', u.id, 'raman (metu)', '9100000085', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000085'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '34bb7090-af40-4995-b20b-6c9991b0e4ee', c.id, 'LN-085', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000085'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46d90f85-0dda-47b1-8205-481dad35c48c', l.id, 1, '2026-09-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e35aeee5-7e50-46b7-a198-f831b407e291', l.id, 2, '2026-09-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7997a2f8-fcbe-46fc-9df0-f41b1412af9a', l.id, 3, '2026-10-02T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '83986cff-3e3a-4fb8-8bfb-6732e356c6da', l.id, 4, '2026-10-09T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a8d25b1a-9ecd-4c52-afb5-fb2ce3c55e9a', l.id, 5, '2026-10-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b2ec2553-c734-40de-8068-b865c02fdfb2', l.id, 6, '2026-10-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aec3be86-793e-41d4-a057-6904f50c20e5', l.id, 7, '2026-10-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1117fb9-8779-42d4-b64a-827dc5af33d1', l.id, 8, '2026-11-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '22dd9b01-d2e4-4c3f-a09c-a84fb8d4e84f', l.id, 9, '2026-11-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6f4a475-b92d-4097-8c26-4abc64c8d198', l.id, 10, '2026-11-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-085'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #86: raman (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('300c6a41-39a0-4f6b-a720-18a6aebe6298', '9100000086', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '35efc8da-f5f9-41bb-b712-457434f5988f', u.id, 'raman (metu)', '9100000086', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000086'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'da93d519-13ac-4e3e-a661-17d43a284dc9', c.id, 'LN-086', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000086'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a9ea227e-d8d2-425b-afe1-5752f116e0b0', l.id, 1, '2026-09-16T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e90d071b-e8cc-4fa0-baa0-e961ca33e3dc', l.id, 2, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b1bd2816-0896-40e6-bbbd-5c88a2798f45', l.id, 3, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec649fa7-d3b8-4329-a8a0-b56c65d60835', l.id, 4, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ddfc9b3f-28e6-49ac-81a1-b42eef194244', l.id, 5, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '968e9b5b-10fd-4a16-8931-aefd81bbe08e', l.id, 6, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4ae34cbb-bf7c-4063-aecd-c93673b6c591', l.id, 7, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '733a8e97-4581-476e-8df6-56706d9b3570', l.id, 8, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e70aec3c-e31a-478b-827f-976ac717f759', l.id, 9, '2026-11-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '66c2f5ce-ca24-418b-80f3-2ff479c6172a', l.id, 10, '2026-11-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-086'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #87: raja (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1b65c8b2-eaf4-4d40-b74b-c89fc5bdb5c9', '9100000087', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '947081ae-ba7d-4bae-892c-76b856074abf', u.id, 'raja (metu)', '9100000087', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000087'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ab073aa4-e5c2-411d-9b93-9b57926d7b9a', c.id, 'LN-087', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000087'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7a903853-658a-4215-9156-f4819a08f074', l.id, 1, '2026-09-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b9ac3ec4-706c-45da-86c4-ee85d5a82e0c', l.id, 2, '2026-09-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a3df5f9a-4fc2-4f36-97bd-09edeb870323', l.id, 3, '2026-09-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e467b92-0499-4b8d-b4f5-ce3abc6d2037', l.id, 4, '2026-10-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '597de378-9d46-4040-95b3-b81a9be519b9', l.id, 5, '2026-10-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea976a23-1e93-432d-aa54-a382ee6548f2', l.id, 6, '2026-10-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '807afe66-1ae0-43d7-9ba3-957b4008edfe', l.id, 7, '2026-10-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '022273bc-2b3f-4e17-bd19-609fdb8b90ba', l.id, 8, '2026-11-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'abd3e216-2d7c-4da2-b9dc-ebab9ccee91c', l.id, 9, '2026-11-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '097cdff5-7016-42c3-8ac7-f1d6e96219e0', l.id, 10, '2026-11-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-087'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #88: main (pattu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2d37d78a-49d7-4dd5-8ff6-f7db08a90ce1', '9100000088', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9cc2623c-18b2-4e91-85ac-4698b137b124', u.id, 'main (pattu)', '9100000088', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000088'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '53369d91-00a9-48f0-ab23-9c67b6351beb', c.id, 'LN-088', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-09-09T00:00:00.000Z', '2026-11-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000088'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8ded0102-b8c9-40af-b4e9-2e76e7bc3e6d', l.id, 1, '2026-09-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd1d7e378-47a8-4a8a-90cb-e28f05ca3257', l.id, 2, '2026-09-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a22a886-2131-4c69-a27b-8cd76677cae5', l.id, 3, '2026-09-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e2e015a7-5b56-45b6-a044-30014352632b', l.id, 4, '2026-10-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '909dd717-6c70-4118-ab3d-3c65109da5a2', l.id, 5, '2026-10-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb983914-d75d-495d-9ba7-5d952d4d8668', l.id, 6, '2026-10-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c1c16a35-369c-48d4-a671-bb5d84875564', l.id, 7, '2026-10-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6a466d54-0d4f-415c-b933-c4a1c0f4e732', l.id, 8, '2026-11-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '35c6829f-c931-4569-a1b2-53b0eeec32de', l.id, 9, '2026-11-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bae9f9d6-91fc-411d-b2d9-ad4e3fa41246', l.id, 10, '2026-11-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-088'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #89: dhakshinesh (sakthi)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0e22aadf-cd84-41ef-8cda-9268e212408f', '9100000089', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '1af4affa-b247-4e0b-bfa0-574acebf0fb6', u.id, 'dhakshinesh (sakthi)', '9100000089', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000089'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'e6d929af-de65-45ae-8612-4d49c13e60e3', c.id, 'LN-089', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000089'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c9f4008-73fb-4bdf-a650-9d470aaa4ba3', l.id, 1, '2026-09-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7d2e2b3f-86f7-40d7-89c3-00adefe76d7f', l.id, 2, '2026-09-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5424a419-76f3-456a-8ec3-5a6b94136548', l.id, 3, '2026-10-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46b168c7-488b-4b21-a2ba-1728f307624c', l.id, 4, '2026-10-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '76c22d05-1c67-470a-b741-6809a6d1a963', l.id, 5, '2026-10-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8cd9c616-e175-467e-abcd-5f83129c034c', l.id, 6, '2026-10-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a5814df-86a9-4861-a7d4-ea3e65315407', l.id, 7, '2026-10-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0c4b2c78-35f2-4cd8-925d-3b964db29558', l.id, 8, '2026-11-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '80017893-469d-4de2-89b4-48f10d9da337', l.id, 9, '2026-11-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd0082cfb-ea08-4626-97b3-6de1cd60b994', l.id, 10, '2026-11-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-089'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #90: venkat (sengadu motur)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('c5b99db2-1b8e-456e-b89f-1f5944f78f54', '9100000090', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'db5e0cac-a903-4a84-b4e3-d18b7c40897a', u.id, 'venkat (sengadu motur)', '9100000090', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000090'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '119b434f-4719-4b56-9ce3-ee3a1f6b376a', c.id, 'LN-090', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-11T00:00:00.000Z', '2026-11-20T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000090'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a648a2a7-0618-4e46-af23-f24ea14a6328', l.id, 1, '2026-09-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5b711a61-5d9c-4b49-9417-11e59ca1231b', l.id, 2, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6ff878e8-602b-48dc-8470-b67400a95258', l.id, 3, '2026-10-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f8c892dc-c758-4a99-b4ec-c426f768f839', l.id, 4, '2026-10-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '878e2214-4bbe-42db-9f9c-bf35a750a3dd', l.id, 5, '2026-10-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5ecd4fd8-75ce-490f-ba5c-4149178d8d4f', l.id, 6, '2026-10-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac574ae0-7005-4869-b4fa-4cec65670dee', l.id, 7, '2026-10-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '05041353-b590-40eb-a19c-e7607d01365e', l.id, 8, '2026-11-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fbedb790-fa22-4c08-87de-0ab1e9bb88bc', l.id, 9, '2026-11-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c2d440d3-1927-46a4-88ee-e7f0fb65a025', l.id, 10, '2026-11-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-090'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #91: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0dc1fcb3-e55f-4a89-b43a-8f1acc121ad2', '9100000091', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '4b6aff80-3ba5-44cc-8d6d-9eb0aa714049', u.id, 'raghul (naren)', '9100000091', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000091'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8e49965a-c8e1-40f5-b5fb-15cb95fe7d30', c.id, 'LN-091', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-15T00:00:00.000Z', '2026-11-24T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000091'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '02999ad3-3480-4032-9e02-16a1cbb25ef0', l.id, 1, '2026-09-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a839b0a3-c020-49c7-b9bf-8b98957924c2', l.id, 2, '2026-09-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0718fdc6-180a-4e8b-b2b7-df11a9099698', l.id, 3, '2026-10-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '30b96360-49f2-437a-a071-b5e7e04d730c', l.id, 4, '2026-10-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2eea99b2-de80-4635-ac3e-b5e3489959af', l.id, 5, '2026-10-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8708e996-ab52-4423-9cd0-9fdafdc0b57f', l.id, 6, '2026-10-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb4c6b2e-160f-4459-b6ea-205071443ab1', l.id, 7, '2026-11-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '35674d18-fa5c-404e-8c72-894497d17bf7', l.id, 8, '2026-11-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0f261099-2ce0-4e76-b4ba-195b87a87362', l.id, 9, '2026-11-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '98111720-f1a2-4bdc-be07-ca7d33b2efd9', l.id, 10, '2026-11-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-091'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #92: mohan (small)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d4f71405-7c99-42e5-9cbd-d8a52ae8665f', '9100000092', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '20131680-14a5-49fa-b4d7-8dddd9d12200', u.id, 'mohan (small)', '9100000092', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000092'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '26399f6f-3afc-48ab-b370-da9a6a084eda', c.id, 'LN-092', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-09-16T00:00:00.000Z', '2027-02-16T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000092'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f55feaa-c721-496d-9541-58863421a832', l.id, 1, '2026-10-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7b2d416c-cd2c-4217-82e0-51b61fe9f9bf', l.id, 2, '2026-11-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1015b4e4-9a7e-43dd-84e1-4fc72f0f38eb', l.id, 3, '2026-12-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2ebcb60a-6f03-4b68-bec5-dd2d72d996c1', l.id, 4, '2027-01-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '04f7f867-b335-4941-a84b-83dd0e07f161', l.id, 5, '2027-02-16T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-092'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #93: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1ddd1402-7e59-4e58-91ac-a2770322b1b9', '9100000093', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a980c503-0704-4c78-9c33-e909ebbd02c2', u.id, 'ajith (aali)', '9100000093', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000093'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '546460ea-6dab-4337-85f1-b9a2b7f6a932', c.id, 'LN-093', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-09-16T00:00:00.000Z', '2026-11-25T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000093'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a54454a6-4525-49d2-b9ff-42f5744b0d12', l.id, 1, '2026-09-23T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '965bee01-b620-47f6-b076-a7026885bda1', l.id, 2, '2026-09-30T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ad752943-9ad8-4dfc-ad0e-a0e035e84601', l.id, 3, '2026-10-07T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4fa298be-9fbb-429c-9045-20a799a6d6b8', l.id, 4, '2026-10-14T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b7d3c87c-a703-4bf7-8729-1d2b82fe34f0', l.id, 5, '2026-10-21T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aec3d714-a43c-49dc-9bcc-d42cea2ae4bf', l.id, 6, '2026-10-28T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd86879fe-08c0-429f-a5cc-374563413532', l.id, 7, '2026-11-04T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c4f818d1-433a-41af-b0f1-95737e4f4da4', l.id, 8, '2026-11-11T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a72d63cb-066d-4c00-b4d4-293fa195ac70', l.id, 9, '2026-11-18T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9762dce8-099b-43be-abf0-2b4d31f3847b', l.id, 10, '2026-11-25T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-093'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #94: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('96583a52-9e2c-4f58-bc01-bfe8fb821a7e', '9100000094', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7213f3a9-f5b6-455a-a263-a64a06cc5ad4', u.id, 'ragupathy', '9100000094', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000094'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7acf53c9-453d-43ad-9287-188fe7d8583d', c.id, 'LN-094', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-18T00:00:00.000Z', '2026-11-27T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000094'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4b64fcb8-28c6-40cc-bcd0-9090bd364ead', l.id, 1, '2026-09-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aa2fd29c-2f0b-4fbc-86ef-19b9c811447d', l.id, 2, '2026-10-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '173a6c2c-3752-4f98-a5d0-929d6c1a0405', l.id, 3, '2026-10-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2c99d920-4464-435d-a5f5-85c1fdf0380b', l.id, 4, '2026-10-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '36b33171-2f0e-4775-857e-e822c51ac4ef', l.id, 5, '2026-10-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f5207431-535d-458a-bf74-bb7355cd6a65', l.id, 6, '2026-10-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '89b3758b-e3d8-4fe8-8a7b-f0d7a0d5d870', l.id, 7, '2026-11-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd3089415-da1e-49f9-8ead-262f088ae46f', l.id, 8, '2026-11-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '09e84d0a-0ee5-44c0-bb51-e9eefaf3812c', l.id, 9, '2026-11-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f5a5a56-f471-4570-906e-7273e417248a', l.id, 10, '2026-11-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-094'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #95: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8355e6c6-755f-48f3-a87d-f9fbb8f366f1', '9100000095', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3e348d8a-1f0e-4a51-945a-3893d36f81ee', u.id, 'elango (pigga)', '9100000095', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000095'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'e81b5d6a-1217-4f0f-a598-f08f719a444e', c.id, 'LN-095', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-20T00:00:00.000Z', '2026-11-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000095'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0765401e-e2eb-497c-a9ba-c274abb5a65a', l.id, 1, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3e40e553-afb6-431b-871f-3458cf4c77f9', l.id, 2, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9cc8b31e-4b3c-4753-9a07-3c5ec185b3fb', l.id, 3, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '278ed44f-b94d-453d-ab75-6cb16d943b0f', l.id, 4, '2026-10-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a06bdf3b-3b11-4fbb-8796-c8b437e27395', l.id, 5, '2026-10-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '267ecc6b-bb5b-4897-98ce-cd21df24a552', l.id, 6, '2026-11-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8325158d-e51d-4251-b018-bcaf8554cdaa', l.id, 7, '2026-11-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b72af1df-f75b-4a76-8753-d7b12fcfe005', l.id, 8, '2026-11-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a09d2b5c-152e-4e71-b95b-de9c62cc2629', l.id, 9, '2026-11-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b03da367-0794-4d50-9936-28f54c5530a0', l.id, 10, '2026-11-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-095'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #96: ramesh (eli)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7fc6a400-6657-4f4c-b75f-9df5d76c5552', '9100000096', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'ed6f0cec-702a-498c-ac64-ce81cb77a3b3', u.id, 'ramesh (eli)', '9100000096', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000096'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0661ffe8-155a-4912-b7ad-db22c48ce257', c.id, 'LN-096', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-09-20T00:00:00.000Z', '2026-11-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000096'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6bacfcdd-7fa8-45d5-8025-3d8538a60ace', l.id, 1, '2026-09-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eea40dea-ad9d-45d2-9233-8a6ed8af6f70', l.id, 2, '2026-10-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e43be2a9-d040-436d-9be3-7a39613e02d1', l.id, 3, '2026-10-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bba2a70b-e91c-4b01-b368-be3a15b5a0f8', l.id, 4, '2026-10-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ab746685-b9b9-44ec-a4f7-31ecf6825bd3', l.id, 5, '2026-10-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a97e0b32-39ce-4354-a8fb-a57eeaa1feb8', l.id, 6, '2026-11-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f342e29b-e725-40d2-9fd6-35c8a3c77735', l.id, 7, '2026-11-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e92b7369-01a5-4d0f-b8f9-260d7c3978e3', l.id, 8, '2026-11-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fbc0011c-72a6-460f-b1e1-8d542fe053d3', l.id, 9, '2026-11-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e086d52e-3516-48fe-9dbe-1f697af03a7f', l.id, 10, '2026-11-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-096'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #97: dayalan (manda)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('321bab6a-62f7-4f5a-bea8-e463f0e2be34', '9100000097', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '207254c5-f6e9-41bd-a1da-7b050494e475', u.id, 'dayalan (manda)', '9100000097', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000097'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '29357fe0-a3d6-4e50-9cfe-492de62da108', c.id, 'LN-097', 'WEEKLY', 6000, 10, 0, 5400, 0.00, '2026-09-21T00:00:00.000Z', '2026-11-30T00:00:00.000Z', 10, 600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000097'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dc02974d-5782-4a08-b1c5-f8f3ec7d88cf', l.id, 1, '2026-09-28T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '63541ca6-c637-450c-b6af-4423c9f02d18', l.id, 2, '2026-10-05T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c713363f-1ee3-4f78-a868-0b3bc383fe79', l.id, 3, '2026-10-12T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '43402c72-feea-4e53-90bf-a9dc4bd8f74e', l.id, 4, '2026-10-19T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7c3e74bc-bbaf-4c3f-af7e-84f0155c98bd', l.id, 5, '2026-10-26T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '11de0870-922e-4139-ab24-f0638c0a3a00', l.id, 6, '2026-11-02T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '317ea8e2-c5ae-4adb-8b61-f0050b43a928', l.id, 7, '2026-11-09T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1449351-754a-402b-97de-544fc6a8cc25', l.id, 8, '2026-11-16T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bd8aeca1-6e01-423f-900f-8e1bd2d6f97d', l.id, 9, '2026-11-23T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8f52e30c-8540-41c6-9cac-1a47292a2ad4', l.id, 10, '2026-11-30T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-097'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

COMMIT;