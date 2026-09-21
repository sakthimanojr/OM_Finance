BEGIN;
-- Record #1: pattu (mani)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('b93c5867-1958-4610-ad07-e0f392337f55', '8825696877', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7384fe42-3198-49f2-be03-6719032be99e', u.id, 'pattu (mani)', '8825696877', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '8825696877'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '07ff0d46-8ae3-444d-9935-8ebe38eb6f77', c.id, 'LN-001', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-16T00:00:00.000Z', '2026-06-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '8825696877'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '98f7e019-4f7f-46ef-8aa8-8a7c78616b37', l.id, 1, '2026-04-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '210fc749-4ae3-4dca-821d-1c514bab6e1e', l.id, 2, '2026-04-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '53a88e06-ec7e-45c5-9e14-218bd33d02a8', l.id, 3, '2026-05-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f83d9641-1041-4159-9f1a-b57991080d69', l.id, 4, '2026-05-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7a8e2cc0-a9fe-4ada-b9af-324a6388466e', l.id, 5, '2026-05-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c21a42dd-db5f-421f-9bca-ba32f8acf43e', l.id, 6, '2026-05-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1957d2f5-7e25-4ba5-909e-ff391ccbbb28', l.id, 7, '2026-06-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b24778a9-73c0-4f10-94e9-6d8caa6209c6', l.id, 8, '2026-06-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2311aa2c-d92d-4f27-be60-edd2fc1275bc', l.id, 9, '2026-06-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b5e78acb-b767-4bbc-b291-be21265552c6', l.id, 10, '2026-06-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-001'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #2: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('b3d038ce-607b-473b-aa76-98e92881a28b', '9655320968', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f1d7e543-e931-46b4-ad41-ac13159c7a93', u.id, 'ragupathy', '9655320968', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9655320968'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '984491e0-add7-4265-902c-1c6c86802b28', c.id, 'LN-002', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-16T00:00:00.000Z', '2026-06-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9655320968'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5fe04781-59d8-422e-9414-36666e0757f1', l.id, 1, '2026-04-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b815b77f-9c2e-4842-a6ce-e8592772d351', l.id, 2, '2026-04-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '52b84dfd-0ba3-428a-b864-457d6f4d1251', l.id, 3, '2026-05-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f85fe1f2-7070-446f-a516-3662f4ebf609', l.id, 4, '2026-05-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6f76c6f1-70d3-4418-83df-70e9847e9cc1', l.id, 5, '2026-05-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '507ca282-cac0-43de-b047-d6ecd7550d31', l.id, 6, '2026-05-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c2cdb8ef-93aa-4b28-bc75-8916b53c0e91', l.id, 7, '2026-06-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a24625f4-0cd4-4623-b9e7-f9d1b24dd3d6', l.id, 8, '2026-06-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8fcfa51a-ad8f-4cfb-ac26-abdcfdf9230a', l.id, 9, '2026-06-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '23d07806-6234-47ce-9f10-b0c77ce53403', l.id, 10, '2026-06-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-002'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #3: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('8648a13c-5416-49b9-89d6-8a3ed22efe7c', '9655550366', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9a2ab77d-5fa0-4e1a-87dc-50dadf3ba6cd', u.id, 'venkatesan (kv)', '9655550366', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9655550366'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7b85e89e-0093-4956-9aa5-287d9d5a429d', c.id, 'LN-003', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-15T00:00:00.000Z', '2026-06-24T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9655550366'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a2f340e4-705e-471a-aa39-2ce89408532a', l.id, 1, '2026-04-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48238ae5-b6c9-4b9a-ad37-0cbf28635224', l.id, 2, '2026-04-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16e1222c-e33a-46ed-bf79-85953dcc53c4', l.id, 3, '2026-05-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c12ee10c-85ff-40e6-a6da-56131902a224', l.id, 4, '2026-05-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1bfaa1fd-b304-4f94-bac2-8122d94be460', l.id, 5, '2026-05-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '44e19e9c-673f-414e-92e4-d26b38424390', l.id, 6, '2026-05-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd2173226-7c9a-438c-85b1-3b70df9a6b80', l.id, 7, '2026-06-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c9c40d2c-c363-4673-9700-16f897d76f36', l.id, 8, '2026-06-10T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f06894ba-0d22-4753-aa31-890d6b14c061', l.id, 9, '2026-06-17T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a4163f3b-a109-439a-be6a-3f4647490c00', l.id, 10, '2026-06-24T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-003'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #4: naga (mesthiri)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('5c2d8183-b9c2-4acc-a0f7-6f3efebb1059', '6383153440', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9c89246f-1f02-493b-bcaf-1159e12c6a58', u.id, 'naga (mesthiri)', '6383153440', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6383153440'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1269f4b0-882c-4487-89c8-9a66553fd684', c.id, 'LN-004', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6383153440'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2374bc67-e70f-47e8-8356-afda87d8532e', l.id, 1, '2026-04-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ab857ae2-3a0a-4512-9611-7ffc529eacf4', l.id, 2, '2026-05-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '41fdc3da-b9d5-4b62-87ef-3feb6234da15', l.id, 3, '2026-05-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8a265c68-bc41-415a-9b98-e4953605dfd9', l.id, 4, '2026-05-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cb94fde5-19a1-41bd-99b7-a4b5eb12df15', l.id, 5, '2026-05-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37a714ee-9f52-4f16-96c9-50d262f8d348', l.id, 6, '2026-06-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5924b1fd-fc80-429a-99ac-f2d860dac7be', l.id, 7, '2026-06-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8646cd40-8e98-4308-b9b7-1629ed2cd821', l.id, 8, '2026-06-15T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2a66be31-2374-4140-8151-6dc8c818bc21', l.id, 9, '2026-06-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b03acc3-ddb0-4ac4-b726-f6ea5fd2eeed', l.id, 10, '2026-06-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-004'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #5: ajith aali
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0a36dc02-7463-498f-8ba2-4f0a61b50054', '9100000005', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'af5a00ef-cd2f-4adc-9b73-0872101788c4', u.id, 'ajith aali', '9100000005', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000005'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5b6bd336-4998-4e5a-9807-1437cfc5dbdd', c.id, 'LN-005', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000005'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dd3f4881-5453-4c8d-8763-5df73cd94646', l.id, 1, '2026-04-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a2cbe40-6934-47c8-b236-2121e36bb427', l.id, 2, '2026-05-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77d9e8f9-9ab7-4593-b274-0b993c0b8bc0', l.id, 3, '2026-05-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '313f536b-f937-40bd-817c-016dac1e42af', l.id, 4, '2026-05-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff11ad71-d093-482b-b527-9528728a063d', l.id, 5, '2026-05-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c60aed0-cf49-4835-9f30-0f8ffc3184eb', l.id, 6, '2026-06-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '335ae49e-5285-4944-bf60-bbc78cd5cf33', l.id, 7, '2026-06-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b1d3729e-2372-4ef6-b4e6-180c723523e1', l.id, 8, '2026-06-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ea9b4b8f-d7b1-44ae-8d9d-cc15354bad4d', l.id, 9, '2026-06-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '945b45e6-3b5d-4523-a490-f99088337eef', l.id, 10, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-005'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #6: praveen (baguti)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('ef356b11-78d9-40ef-93e2-1bc39ddd0160', '7825985142', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a8312b5b-6f17-4694-ad33-995f4e44f4e9', u.id, 'praveen (baguti)', '7825985142', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7825985142'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b68a98fc-d17c-4c29-98c3-8711a1222e51', c.id, 'LN-006', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7825985142'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b1cadca6-5ba8-4b82-97fb-64baca331676', l.id, 1, '2026-04-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '883ced24-1f64-40b6-aaaa-8d9b57f6f6bb', l.id, 2, '2026-05-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ee59512e-1942-4b19-b770-e8dbe4db605d', l.id, 3, '2026-05-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '994e008b-45b9-4ddb-b3b1-b99e07828cdd', l.id, 4, '2026-05-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1890ebfd-a0ff-4ef8-909b-0f2ca43941cc', l.id, 5, '2026-05-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f90c8dca-a7c9-4d05-9841-6fd89d6964c9', l.id, 6, '2026-06-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b72a2572-b033-4c25-ac57-20a1e9f716d6', l.id, 7, '2026-06-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '51e82a54-eb85-4321-95de-cb0b8dfe0fcf', l.id, 8, '2026-06-15T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7cecc682-1a1b-4209-9c02-53181f21228b', l.id, 9, '2026-06-22T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '09cc3164-a54d-4360-8284-10685963a8ae', l.id, 10, '2026-06-29T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-006'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #7: elango (pigga)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7ad913f2-ec6e-4f92-acfa-e44c0ef66ea9', '9100000007', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'dfdf8218-25d9-4965-a947-a0ecfac58b0a', u.id, 'elango (pigga)', '9100000007', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000007'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '3d3d6504-6687-4b7c-80a9-7912dcdc65dc', c.id, 'LN-007', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-04-20T00:00:00.000Z', '2026-06-29T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000007'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '35e5b41f-f7a6-4310-8584-cf8e351f3b54', l.id, 1, '2026-04-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '84865a38-5d21-4fb7-9e7a-6abf7813939a', l.id, 2, '2026-05-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6d1de629-0bd6-4f3b-937e-46d6b957fcc7', l.id, 3, '2026-05-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '841294d1-8189-4136-9276-44f5fbaa6778', l.id, 4, '2026-05-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ec36748c-9bb3-4045-bfbf-64208f0347c7', l.id, 5, '2026-05-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '51302942-dec5-4326-aa8e-e5beaa74f6b0', l.id, 6, '2026-06-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f4eff182-a5e3-47ff-a705-a8744292fb83', l.id, 7, '2026-06-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2b3812b9-3622-4807-937c-6d1671f77143', l.id, 8, '2026-06-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a67baa4-b325-478e-8cd8-94b9b3a4d415', l.id, 9, '2026-06-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c935c259-92c9-4bad-b487-570b1b94b2db', l.id, 10, '2026-06-29T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-007'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #8: arvind (sb)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('97e28899-9ed9-4963-95ae-3cbb6ea532b1', '9100000008', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'c3ca6f24-fa99-4bb6-87a2-0f4f51357602', u.id, 'arvind (sb)', '9100000008', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000008'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0be49e88-c4a0-44b6-a644-8097150b32b7', c.id, 'LN-008', 'WEEKLY', 25000, 10, 0, 22500, 0.00, '2026-04-25T00:00:00.000Z', '2026-07-04T00:00:00.000Z', 10, 2500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000008'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '81a168f3-01c0-46e5-89a7-2ee5c436ec56', l.id, 1, '2026-05-02T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '603f9f82-7195-4d3e-91e1-16c300e107ca', l.id, 2, '2026-05-09T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9f3007cd-f054-4fab-b827-a34db9022d6e', l.id, 3, '2026-05-16T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f33ce15-5ec0-4567-895c-28f6ad9531f0', l.id, 4, '2026-05-23T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2ebc25e8-b192-4b89-ad20-490c91f40081', l.id, 5, '2026-05-30T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1fd7362d-3c30-4ac0-8b55-8347f0a7e63f', l.id, 6, '2026-06-06T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7812211c-28e0-47ea-99d1-e1d133c14f0b', l.id, 7, '2026-06-13T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ab0f0885-135e-4c3c-a341-9264dcd80a9e', l.id, 8, '2026-06-20T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '594d77ba-c87e-424b-b0cf-70a6e6c5b706', l.id, 9, '2026-06-27T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '41695739-47f1-41e1-8dc9-3234aedeaeec', l.id, 10, '2026-07-04T00:00:00.000Z', 2500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-008'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #9: sakthivel
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('bb4801ff-9832-4ed4-94d4-da1d4fa807b2', '9100000009', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '3d496e61-5e37-4387-a739-5c35223b4b2f', u.id, 'sakthivel', '9100000009', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000009'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '9faa139c-0c10-459f-8c41-de6648998272', c.id, 'LN-009', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-04-28T00:00:00.000Z', '2026-07-07T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000009'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ff0ba220-889e-467f-b97c-0a9ddb9a5f44', l.id, 1, '2026-05-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '41adc701-7e97-4c5e-aa7f-7fa1b4703001', l.id, 2, '2026-05-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e3952602-5bf4-4453-a181-ae0073f86232', l.id, 3, '2026-05-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2d25c3e6-a691-4e46-9d90-72f516dfe3db', l.id, 4, '2026-05-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f63ac2d4-a8ae-4bfd-9558-9f48e167b88a', l.id, 5, '2026-06-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '613a201a-6cfa-4c75-9be2-57ce03faf4f6', l.id, 6, '2026-06-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f9f60a0-0883-473f-9048-992991c6a20a', l.id, 7, '2026-06-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'baf097b4-3c01-4406-b7c0-74fa2917f23b', l.id, 8, '2026-06-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b325779e-e0f2-40db-a2b6-c2678e66e569', l.id, 9, '2026-06-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eca9a540-6bfd-4995-a1d5-7688edcfe828', l.id, 10, '2026-07-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-009'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #10: kisoth (sappa)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3b4e4c8d-ec42-4dc7-875d-7cd10f8a826a', '9100000010', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'f8675b80-406e-4f4d-a159-1b0b8d17b949', u.id, 'kisoth (sappa)', '9100000010', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000010'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8e392809-13c4-402e-94c8-5f4b304cc15f', c.id, 'LN-010', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-04-28T00:00:00.000Z', '2026-09-28T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000010'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '27c0982d-a2f0-4911-845f-ef9629935921', l.id, 1, '2026-05-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3a70fe6b-4808-4bb0-9975-29607dcdf266', l.id, 2, '2026-06-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '99e3d0c0-adfe-4b45-93db-5f14ee77dcd2', l.id, 3, '2026-07-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48ee5906-99b6-4ef1-91de-33a18f5e1383', l.id, 4, '2026-08-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2131dab0-b63a-4636-a79f-54a0e417f006', l.id, 5, '2026-09-28T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-010'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #11: balaraman
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('cb2519c9-96d0-498d-9866-d51c416fca80', '9100000011', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'aff769a8-8008-4d10-a9a4-badfc0fc7804', u.id, 'balaraman', '9100000011', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000011'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd587cb34-1f18-4d65-b500-d78a0613d829', c.id, 'LN-011', 'WEEKLY', 30000, 10, 0, 27000, 0.00, '2026-04-27T00:00:00.000Z', '2026-07-06T00:00:00.000Z', 10, 3000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000011'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '31ca7702-acea-45ef-9297-c8f26dc19684', l.id, 1, '2026-05-04T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fbbcf0a9-6624-4275-ad7c-6e86db91a245', l.id, 2, '2026-05-11T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '864a7705-f63e-4ddc-a5c7-6d462ff816d5', l.id, 3, '2026-05-18T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '76ea1b61-d11e-4967-b98b-5e07ad4b7553', l.id, 4, '2026-05-25T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '81568c96-55d9-412a-80e5-5129e2fbd490', l.id, 5, '2026-06-01T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4a9af988-e56f-4a5d-9790-ce94f4f073ca', l.id, 6, '2026-06-08T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4ff74362-3e22-468f-8f93-b7e28f4935c5', l.id, 7, '2026-06-15T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ade8f9bc-576e-43cf-99d8-6dca5be29ff9', l.id, 8, '2026-06-22T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'daa5b326-2e4a-4ae0-bfd8-fa9e907847b7', l.id, 9, '2026-06-29T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb503180-f4a3-4c64-ad6f-756d3c68cb23', l.id, 10, '2026-07-06T00:00:00.000Z', 3000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-011'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #12: ajith (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('12fd9792-db00-4504-9e04-b0f723d5ee6e', '7270276690', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e63b6db6-3d9b-4062-8cb7-cde93d9fcdd6', u.id, 'ajith (metu)', '7270276690', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '7270276690'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4fd650b0-55c7-4c34-bf7c-d8b19c17b84b', c.id, 'LN-012', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-09T00:00:00.000Z', '2026-06-18T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '7270276690'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ad959679-d385-484a-9365-4d2d9593951c', l.id, 1, '2026-04-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8256c141-a67b-4ba8-a44e-7f1cf5bd9204', l.id, 2, '2026-04-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '621e9087-adbf-46df-a788-62123100eafb', l.id, 3, '2026-04-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '986216f2-0a56-42b3-9a08-429d18ce2465', l.id, 4, '2026-05-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c08477c1-f181-4dff-b229-a1833805f379', l.id, 5, '2026-05-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5081e761-8ff5-403d-aa49-d318a08f5913', l.id, 6, '2026-05-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '466068e9-2a77-473e-a184-c7b7255294ad', l.id, 7, '2026-05-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac3ac8df-0ea5-4c39-a29a-1f16d9f2e316', l.id, 8, '2026-06-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '32630553-e645-401b-9934-398c7be2068d', l.id, 9, '2026-06-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '091145b4-cc6a-41fe-ac4f-ea2d68da5410', l.id, 10, '2026-06-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-012'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #13: manimaran (laddu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('0423ef16-6694-4396-86e9-a43fc72acae5', '9100000013', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'bd758c76-0847-4c26-8751-26b9b859b6d2', u.id, 'manimaran (laddu)', '9100000013', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000013'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'a59ea710-bb23-4afa-b7c9-5a4faaf855f8', c.id, 'LN-013', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-04-29T00:00:00.000Z', '2026-07-08T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000013'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '60f97996-3398-408d-9982-abc00c301a24', l.id, 1, '2026-05-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0d08481e-b208-4e2f-a550-9343ada18ffc', l.id, 2, '2026-05-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '20976c10-53bb-4b58-94e7-e5f4eea74137', l.id, 3, '2026-05-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '45b5efc8-799a-43e1-bb9a-5a096e78585a', l.id, 4, '2026-05-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e5120260-c19c-463f-b2c7-f9c0e1f4d3af', l.id, 5, '2026-06-03T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37448296-5b14-4e1a-b5c7-3263d7697992', l.id, 6, '2026-06-10T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b9fa953b-0ef3-4f6c-a3b1-1714b7d73240', l.id, 7, '2026-06-17T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '26e09f96-897a-4801-9120-773ba37b232f', l.id, 8, '2026-06-24T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '88b74d0a-97b7-42f7-89c3-e8f986620ef3', l.id, 9, '2026-07-01T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '05ce669d-a7b0-4b35-bf35-6f7b8216ddee', l.id, 10, '2026-07-08T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-013'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #14: yuvaraj (goindthan)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('71d1d2ab-1e0c-4514-865f-b52a9f143946', '6383032175', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd1144c92-277f-4028-8ed0-84b0d48fb8a2', u.id, 'yuvaraj (goindthan)', '6383032175', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '6383032175'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'f5ef8694-e21c-4bb6-8bab-837a3b396a03', c.id, 'LN-014', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-07T00:00:00.000Z', '2026-07-16T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '6383032175'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '556f5423-6697-451b-8b66-7f08e4317a90', l.id, 1, '2026-05-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'dda34b91-755f-4daf-97a8-0f1e229e0c74', l.id, 2, '2026-05-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2f396a95-b190-4b8f-8346-03dd3d0fba32', l.id, 3, '2026-05-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a14b768b-8bd0-42b7-9006-7fd8a8a70334', l.id, 4, '2026-06-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f6af321a-91cc-45f0-b1a5-d047c0e3d83f', l.id, 5, '2026-06-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '607fffdf-bf92-4072-b2a6-3937f316c3ff', l.id, 6, '2026-06-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '071ba212-f4bf-405a-8994-302be252946b', l.id, 7, '2026-06-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8741a528-c782-4cee-b719-7d2cd9697eac', l.id, 8, '2026-07-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '18a68794-6497-41e2-8315-580ec70030d0', l.id, 9, '2026-07-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48d99a9e-cc46-40e0-a34a-fa7ac532b439', l.id, 10, '2026-07-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-014'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #15: Dayalan (manda)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('7302b05d-dde9-4d1d-b5e9-b95dbbd13ad4', '9100000015', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '9a140414-59e7-4a9a-b2ba-6ecf199d5660', u.id, 'Dayalan (manda)', '9100000015', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000015'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4c08129b-72bf-4073-8cf6-58251a9eacd3', c.id, 'LN-015', 'WEEKLY', 6000, 10, 0, 5400, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 600, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000015'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '42d3c0a6-cab6-42cf-8de5-353077e34a7c', l.id, 1, '2026-06-07T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b638e11c-b7c1-4640-8ed2-8225052dd8eb', l.id, 2, '2026-06-14T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c7dfed0e-1235-4625-b402-890f1b4c0abe', l.id, 3, '2026-06-21T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f3723d7a-c5d3-4405-b820-c7faab729bab', l.id, 4, '2026-06-28T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6ee7e6a0-2b95-4cad-8d0d-567982b59bd5', l.id, 5, '2026-07-05T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '75b91353-7a9a-4829-b339-bd75de6ffc74', l.id, 6, '2026-07-12T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '301653d6-0c69-456b-ac88-ea35c1860470', l.id, 7, '2026-07-19T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '915c0ea0-e1f2-4ffe-a7b1-7b6519f7b367', l.id, 8, '2026-07-26T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'da303dcb-7a98-446c-9f77-d0874b8f986c', l.id, 9, '2026-08-02T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '180ff12b-cd37-4f4c-9787-b90889f9ac14', l.id, 10, '2026-08-09T00:00:00.000Z', 600, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-015'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #16: Mani (Jolly)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1d591aa7-24f4-4b25-b679-b176e2257e97', '9345396573', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7c72e1bd-2d7a-416e-a3e7-f0af02b9a333', u.id, 'Mani (Jolly)', '9345396573', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9345396573'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '41a11da1-bce2-4ac9-add9-d36beb002138', c.id, 'LN-016', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9345396573'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c6b354e8-ac7f-4836-aed9-29d7df47d6f8', l.id, 1, '2026-06-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '62643c0d-e55f-4f77-a603-5ba5b26f44b8', l.id, 2, '2026-06-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7210f75f-12cb-47e9-b4f2-f33e9a404968', l.id, 3, '2026-06-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c540ffd-c67e-46bc-b0e5-3a73f8d5ee29', l.id, 4, '2026-06-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c988de89-b0fd-495e-884e-bd958f3c0ec9', l.id, 5, '2026-07-05T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1cda81b7-2a95-4b02-9c43-9c88fe071471', l.id, 6, '2026-07-12T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a1fa8f00-6eb4-498c-98da-1f3ab8cf6687', l.id, 7, '2026-07-19T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a4653332-0f82-4602-9163-9ddd23752aa9', l.id, 8, '2026-07-26T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cc202f67-b5f4-45f7-adba-1143efc24593', l.id, 9, '2026-08-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '874c057c-e4f7-4134-9139-1a6fa783bd95', l.id, 10, '2026-08-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-016'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #17: Ashok
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('709a0a18-7e9f-4c5e-be35-db723fba3979', '9100000017', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '177bbd9a-d393-4563-a6a5-2c7abbee6e1f', u.id, 'Ashok', '9100000017', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000017'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '8f9516b6-3779-4d48-b4fa-63b564e9a08f', c.id, 'LN-017', 'WEEKLY', 35000, 10, 0, 31500, 0.00, '2026-05-21T00:00:00.000Z', '2026-07-30T00:00:00.000Z', 10, 3500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000017'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e81b71d0-ebe7-4903-9dd8-a49a2b0c5be6', l.id, 1, '2026-05-28T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b62dcd81-60b8-4c13-9fcf-5ec4b754dddb', l.id, 2, '2026-06-04T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'eb342e88-2fd0-4fb0-bfa6-6b4bf4d3e5eb', l.id, 3, '2026-06-11T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'da9103b5-8e97-4eb0-91b4-7b9d2b0f4340', l.id, 4, '2026-06-18T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9027b974-f2fc-4a97-b5aa-2d54a0921948', l.id, 5, '2026-06-25T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e8f8ef11-e043-487a-89e9-16efefd54ac7', l.id, 6, '2026-07-02T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7144a9a8-0195-45bc-9a47-d9802827650b', l.id, 7, '2026-07-09T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5e1c54b9-2fe8-4b80-bee4-d83724a898d8', l.id, 8, '2026-07-16T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37f7dc65-d296-4874-9a83-1cf45a5bb7e0', l.id, 9, '2026-07-23T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c7abb4cc-5bae-4492-8637-fdc97d9ac70b', l.id, 10, '2026-07-30T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-017'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #18: Raj (rice)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d4de838e-532a-4bf6-87a4-895f02602176', '9100000018', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b57c46c3-234e-4e91-80f4-1481e363b300', u.id, 'Raj (rice)', '9100000018', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000018'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '37bf3609-9fd2-4c68-8a1b-cf7715ccc2a2', c.id, 'LN-018', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-05-20T00:00:00.000Z', '2026-07-29T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000018'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0bd19458-848a-4ab9-88cc-c012d8aea063', l.id, 1, '2026-05-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0266e393-1ae4-4dea-8db7-2472a7711c28', l.id, 2, '2026-06-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4cab5a1b-109b-436f-ad2a-c473a87af396', l.id, 3, '2026-06-10T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb067ceb-ae9f-41eb-8831-f5bc58fe86aa', l.id, 4, '2026-06-17T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bfd93990-bfcf-4abe-b994-47dbe165d42f', l.id, 5, '2026-06-24T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2ab7ea07-9191-4420-be4d-8c319916fab5', l.id, 6, '2026-07-01T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f554cf9c-da47-4307-b5b3-b1cefd9a1641', l.id, 7, '2026-07-08T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8e273526-98b3-4ec6-af26-1f2af689a7d9', l.id, 8, '2026-07-15T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9aad6aea-b10c-4f67-bceb-7ee2d9d0f076', l.id, 9, '2026-07-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c889564a-260a-4244-861a-20fdb0620c39', l.id, 10, '2026-07-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-018'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #19: sakthivel (mangalam)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('f5ad7934-c688-4171-b6b5-6f5786e89ea1', '9848757747', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '64beb64a-b7a3-42e5-a29e-5a011e299f55', u.id, 'sakthivel (mangalam)', '9848757747', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9848757747'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '3e75ae22-fbfc-409e-975d-39c37340ba9b', c.id, 'LN-019', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-16T00:00:00.000Z', '2026-07-25T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9848757747'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0403db8-ced4-4ba2-aec4-662faef80e95', l.id, 1, '2026-05-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '196bfe9d-21e1-4793-a39d-e8f78ace3880', l.id, 2, '2026-05-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '61bdd3f9-e8c9-4e72-8034-8c8002d79d84', l.id, 3, '2026-06-06T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '69607abf-f6c5-444c-b34b-40eb89f89fe8', l.id, 4, '2026-06-13T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9aa66abc-d069-4d98-89a8-1c57435ed5a7', l.id, 5, '2026-06-20T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3c8454cf-3e82-488a-8fcc-406959173c7b', l.id, 6, '2026-06-27T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '77c58f96-7741-4c65-adaf-170a90755f9a', l.id, 7, '2026-07-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2324ecba-8d66-49a6-ba4b-3ae85aa7a45f', l.id, 8, '2026-07-11T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd7df445c-0719-490b-95f5-cd529d1222af', l.id, 9, '2026-07-18T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9c8ffdd0-95e6-4636-bac4-a63f6c184faf', l.id, 10, '2026-07-25T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-019'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #20: murugan (painter)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('db5eff7d-7ed1-412a-81be-f458b7b37ca5', '9843173422', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '0f89c121-9cf8-4e14-88b0-2999ca1b5e8b', u.id, 'murugan (painter)', '9843173422', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9843173422'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '4e293673-0322-4321-8e26-988d6bd7534a', c.id, 'LN-020', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-16T00:00:00.000Z', '2026-07-25T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9843173422'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ad5176e9-7cd9-4cc6-be4b-1c79a1e97f38', l.id, 1, '2026-05-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8705748d-3e27-48fe-b164-e13d940e2b20', l.id, 2, '2026-05-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '37b6e052-caf4-4c1c-8e7d-7cfea993ff1a', l.id, 3, '2026-06-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '11a2c97b-4a59-4028-9510-e867c47a9247', l.id, 4, '2026-06-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1715af5b-d8c1-415a-926f-3c9148726496', l.id, 5, '2026-06-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '485dec74-4363-4c05-af21-11f6ddf11427', l.id, 6, '2026-06-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bf792994-272f-4d17-b922-eed80356ac6d', l.id, 7, '2026-07-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '773136db-4fe6-41e7-ab0d-acb700ff52ca', l.id, 8, '2026-07-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a18a11d-337f-44dd-b3cd-a1e2a94f7f59', l.id, 9, '2026-07-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '754aedb0-1444-4644-890e-40d13a9b4e36', l.id, 10, '2026-07-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-020'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #21: raghul (naren)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('fd4d375f-a77a-44ee-81c6-8a365a60cfa9', '9100000021', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd4ec664c-6a8c-45c9-9469-dfe1eb291413', u.id, 'raghul (naren)', '9100000021', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000021'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'b165c05f-cd47-4b8c-849a-7e3bfa522e24', c.id, 'LN-021', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-21T00:00:00.000Z', '2026-07-30T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000021'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '18d3758f-32c6-4d3a-b438-1e9a00ac6b46', l.id, 1, '2026-05-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a7de08e7-d80a-4a44-8f46-35f68ed4a616', l.id, 2, '2026-06-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd2de1d11-6ce6-4bc7-8f64-de8ffb295b71', l.id, 3, '2026-06-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7b006175-3779-497c-8896-e7c30a324056', l.id, 4, '2026-06-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e5381264-01c2-4aeb-adeb-88992653e32e', l.id, 5, '2026-06-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '912a4cae-5199-4ed2-a0fc-7e9f7b7c14fb', l.id, 6, '2026-07-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '691ac1b7-39ca-4650-91f9-f0be062c0726', l.id, 7, '2026-07-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '462a04ae-abb2-4c45-a206-343f54921274', l.id, 8, '2026-07-16T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2194f14d-fb67-4db6-8a95-720cfac207e1', l.id, 9, '2026-07-23T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7c336eb7-a806-408d-a08d-685d5ba89869', l.id, 10, '2026-07-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-021'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #22: Jai (pichai)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('e7f17610-01e9-49d2-842d-e1273d46eff8', '9100000022', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e5f7eaac-ccb4-4168-ab00-580af1c414e6', u.id, 'Jai (pichai)', '9100000022', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000022'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'aebbb0d2-684d-41b4-9e26-01092c293c03', c.id, 'LN-022', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-23T00:00:00.000Z', '2026-08-01T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000022'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0ccb0fbe-38e9-4a2c-9b2d-ea76ad2d2a07', l.id, 1, '2026-05-30T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b654b042-09d9-42e2-8a0d-b5cd08ba50cc', l.id, 2, '2026-06-06T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4c6d9a7-6f3b-469a-aab5-338f3dec94ad', l.id, 3, '2026-06-13T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3dcc23ee-7903-4339-83dd-4deaf928db2b', l.id, 4, '2026-06-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7fa28604-bc35-4cd8-821f-91c8666bda39', l.id, 5, '2026-06-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ebd7c3b4-c8a5-496a-960a-0295ed835e4d', l.id, 6, '2026-07-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ac8c6655-416d-4293-8ee7-9b44f3ec7e10', l.id, 7, '2026-07-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7e516664-6b92-4082-999a-7416d989a404', l.id, 8, '2026-07-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '29e36ab4-5d56-43b6-abd1-9f7956ed45cb', l.id, 9, '2026-07-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bb6a40f0-1052-400a-ae94-a163f3c3230c', l.id, 10, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-022'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #23: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4c2d52c2-0dd7-4db9-ba12-db1d3ec58c87', '9100000023', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '853501b6-69f1-40e0-a043-a488a28561d3', u.id, 'ragupathy', '9100000023', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000023'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'fa636ae9-e929-4708-b193-aa2eba5af780', c.id, 'LN-023', 'WEEKLY', 20000, 10, 0, 18000, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 2000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000023'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fca950a8-6010-4230-9cff-907145942a55', l.id, 1, '2026-06-01T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '589a7c4e-b661-4639-9206-31677e729ab5', l.id, 2, '2026-06-08T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8d72b226-2774-4946-956f-283352d611bc', l.id, 3, '2026-06-15T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'fb447d3f-9346-4474-8c5d-08389d446dd1', l.id, 4, '2026-06-22T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '15ba07f1-a801-46a1-8019-cfeb2c8c1ce6', l.id, 5, '2026-06-29T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a57c3005-95b5-4ccb-9978-02c83b7a02bc', l.id, 6, '2026-07-06T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '10fdca40-eb21-4276-8019-f31501ba16fa', l.id, 7, '2026-07-13T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cf4dc0a0-462d-44dd-9882-25fc36926b6e', l.id, 8, '2026-07-20T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '676ec20b-ee6a-4f28-a615-9781e51c30c8', l.id, 9, '2026-07-27T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9853e0b2-b4e1-4c7c-b521-dcf53e08e7f7', l.id, 10, '2026-08-03T00:00:00.000Z', 2000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-023'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #24: ranjith
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3d42b605-d4b3-4e69-a7b9-483ae513fd70', '9100000024', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'b4701625-2508-4fcb-a5da-23f8a1153bd4', u.id, 'ranjith', '9100000024', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000024'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1ca06c23-2155-4bd5-90ae-61b6570a0f49', c.id, 'LN-024', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000024'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c91d7763-2228-4d9a-a785-48bfdac929d7', l.id, 1, '2026-06-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1805e5f3-ebfd-4d5d-bdfd-1e1f9a3a4add', l.id, 2, '2026-06-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f997a7d2-b0c2-426f-8290-c7b1ed747f63', l.id, 3, '2026-06-15T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5f8a2b23-dff0-4980-ac85-e75872f4a94d', l.id, 4, '2026-06-22T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '293ed12e-6ef3-4470-8aa6-89d331b19ec7', l.id, 5, '2026-06-29T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e09bf032-119e-40bd-b110-512d69705050', l.id, 6, '2026-07-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9a8171f2-2f31-4a97-acba-e4b8726461b3', l.id, 7, '2026-07-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6de28ad9-cedf-4455-9adc-67255fae44ce', l.id, 8, '2026-07-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a6cce3e1-e57d-4193-83ae-a1dcbfaa06c3', l.id, 9, '2026-07-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '13921f07-c64e-47f9-9e9b-0620b45a1ed5', l.id, 10, '2026-08-03T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-024'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #25: Shanmugavel (KP)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('4cfdb206-73ac-41b6-a122-0188d8501ff5', '9100000025', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '7e5ea66d-adee-492a-9c5a-5e2695278d49', u.id, 'Shanmugavel (KP)', '9100000025', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000025'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '92139bdd-5372-4479-aac4-f0e0814ee42f', c.id, 'LN-025', 'WEEKLY', 35000, 10, 0, 31500, 0.00, '2026-05-25T00:00:00.000Z', '2026-08-03T00:00:00.000Z', 10, 3500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000025'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b234f3e7-a1f7-4989-bdef-1273112c7497', l.id, 1, '2026-06-01T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '48892176-7fa8-4ab9-922c-0ca81e266cda', l.id, 2, '2026-06-08T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c0c5e7bc-2aa5-4d89-a28f-bf738871b99c', l.id, 3, '2026-06-15T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '151aee5f-f363-41df-8620-1bba60b71eb5', l.id, 4, '2026-06-22T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2975dbdf-8a3a-4950-ad05-f558570a8ac1', l.id, 5, '2026-06-29T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f744502a-3b8e-4c3e-b81a-d96627ba9aa5', l.id, 6, '2026-07-06T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6ad4bbca-ddb8-4771-9385-8d8d2cdce913', l.id, 7, '2026-07-13T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'efbb822e-5792-4a81-8dc3-5a7ec514ac29', l.id, 8, '2026-07-20T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1617a195-ff7c-44a1-85b5-af43311d7b65', l.id, 9, '2026-07-27T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '16dfa086-f97b-4abc-b879-5ba54c1d0e36', l.id, 10, '2026-08-03T00:00:00.000Z', 3500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-025'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #26: mani (tails)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('9278742d-0dcb-45be-be78-5cbb8397d615', '9100000026', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a4099b36-2adb-4dfa-9857-b698e91341a2', u.id, 'mani (tails)', '9100000026', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000026'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c548b503-ab9a-4af4-ab44-0e57b16be085', c.id, 'LN-026', 'WEEKLY', 10000, 10, 0, 9000, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1000, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000026'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '400d92a4-f05d-420a-a683-c398c6a9d10c', l.id, 1, '2026-06-02T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8181be99-f800-41c2-9dcf-f69f163affd0', l.id, 2, '2026-06-09T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1c7d1698-750e-4ff3-9278-45808ab9996e', l.id, 3, '2026-06-16T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1eebb4f0-2bce-4160-b0f2-3898dd2de557', l.id, 4, '2026-06-23T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '721aeae7-f293-408c-a043-bc0d7ec94677', l.id, 5, '2026-06-30T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f422b6a-2b72-4a51-85ff-ffabcd03ec2d', l.id, 6, '2026-07-07T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '1caf9435-9a77-4a2c-b4b0-ebc9416fee4f', l.id, 7, '2026-07-14T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b8cb035a-90d1-45a3-9e5b-985f57d11775', l.id, 8, '2026-07-21T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0867d5be-bf3f-4bdc-850b-6b1398f04478', l.id, 9, '2026-07-28T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd0a9af6b-ef37-456d-ac92-7f1187017d65', l.id, 10, '2026-08-04T00:00:00.000Z', 1000, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-026'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #27: praveen (baguti)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('3fc14019-6ffd-497a-ae40-9f1c7b0a6927', '9100000027', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'd0544a6b-6c73-4f2a-ac3e-4244c6110a7b', u.id, 'praveen (baguti)', '9100000027', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000027'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '1e0e211d-42fd-4780-83d5-102976c62888', c.id, 'LN-027', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000027'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c8d4a29a-6189-44be-b4a8-ee72b448dc7b', l.id, 1, '2026-06-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '581530da-b2e2-4b36-8a68-38981064aba7', l.id, 2, '2026-06-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c4be9ac0-22e9-4190-b6b9-7ae36a12bb8f', l.id, 3, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '58ea8da5-db7d-41f8-ae49-f50c98131444', l.id, 4, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'acc13acd-640b-4816-8ffb-3058c545de1b', l.id, 5, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '406f0700-a4ad-4386-a9b3-3a1133f518c2', l.id, 6, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'e4ca6cf1-c7cd-43e8-b4ab-e50714e31386', l.id, 7, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ecad09f0-920c-4606-bda2-30c0b01c15a4', l.id, 8, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8425ea5b-4b66-494e-ad90-021567b133fb', l.id, 9, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '450df1cb-6c44-462c-b37b-4487a1c50ee6', l.id, 10, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-027'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #28: arunachalam (master)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d6475991-59be-4b59-b7e9-09cd7dd5aea4', '9100000028', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '2cd1b274-1155-41bf-9a08-d9821b6cc2a4', u.id, 'arunachalam (master)', '9100000028', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000028'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '7ea07de5-5fb9-4221-92a3-55a813fd9979', c.id, 'LN-028', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-26T00:00:00.000Z', '2026-08-04T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000028'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ffdec078-865d-47c7-a4b6-8fcdea35d4b7', l.id, 1, '2026-06-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd6f4214f-723b-4a81-a1a3-6dd6ad502e0d', l.id, 2, '2026-06-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cbdd21bf-13b3-4be8-bc5f-f9de4fcc5f71', l.id, 3, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '873257b2-8ea7-4466-8d37-a1a2e03b31d6', l.id, 4, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '46f970a3-008e-426b-8652-ab1a646c7ab4', l.id, 5, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9eb71b8e-3f01-4ad0-9379-812b6ac9dcb2', l.id, 6, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ad2e943b-3c9d-46f1-a8a8-d19a1fe7b0be', l.id, 7, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '880f2c00-519f-4f83-99ee-3aa6e1f824b9', l.id, 8, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2e26f95b-c7f4-445a-9f70-e62a5d47112a', l.id, 9, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd56a5501-7e95-4d1f-adea-aaa9c5f66311', l.id, 10, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-028'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #29: ajith (aali)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('aefda556-b1d0-498b-aef6-b94969860820', '9100000029', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '47954456-9b58-49cb-9efb-209f324b8de7', u.id, 'ajith (aali)', '9100000029', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000029'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ceb49cd1-3bb4-498a-b835-e0bad3239535', c.id, 'LN-029', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-05-30T00:00:00.000Z', '2026-08-08T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000029'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4fedb7f3-6a59-46b0-8683-1f9e87509ea9', l.id, 1, '2026-06-06T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '32e037a6-12c0-4146-9fcd-24d0c8b4c25a', l.id, 2, '2026-06-13T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'c88f442a-f929-42d5-bd30-3d90e2ab7f80', l.id, 3, '2026-06-20T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '20a04631-f00e-4cca-9172-1ca38e7b6c6d', l.id, 4, '2026-06-27T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a4e0a1c7-d3ef-4db0-b843-300367db6ff9', l.id, 5, '2026-07-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '2bdacbd6-9928-49f8-8687-613561443f20', l.id, 6, '2026-07-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4427cc76-a069-406a-b450-0b26bd36c0a5', l.id, 7, '2026-07-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '13515713-5b69-467e-8b2f-1ea9a05a2a88', l.id, 8, '2026-07-25T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'adec484b-622a-48c0-a0fd-5007ff75279a', l.id, 9, '2026-08-01T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df3f14c9-d232-46ed-bc17-d391c656248e', l.id, 10, '2026-08-08T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-029'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #30: vicky (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('66da3289-f733-41de-b820-9a735c07e12d', '9100000030', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'e3702c19-4d63-4433-9ff8-0ac490faedd3', u.id, 'vicky (metu)', '9100000030', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000030'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '0080fbfe-c8ca-4eda-9c80-d518a935ff56', c.id, 'LN-030', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-05-31T00:00:00.000Z', '2026-08-09T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000030'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f1256a49-bc1e-47b4-934a-316702a5de51', l.id, 1, '2026-06-07T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9b3e0655-2170-4042-9f94-1c720b61c666', l.id, 2, '2026-06-14T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '02ce6b00-834d-47b7-a427-46caebc79498', l.id, 3, '2026-06-21T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd31ecd23-841a-4705-9b54-afd225e5b3ad', l.id, 4, '2026-06-28T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ca9ab13d-d2cc-458b-96a6-7587bf65dd7e', l.id, 5, '2026-07-05T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0475107e-947f-45e8-a78c-e87c6691d1b7', l.id, 6, '2026-07-12T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3547571b-6b73-4f35-8684-1bc1d9a35b23', l.id, 7, '2026-07-19T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '80063b19-649c-4674-996d-d29fd7ee895c', l.id, 8, '2026-07-26T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a68f3693-e0d6-4a68-bccc-a67d79853c2c', l.id, 9, '2026-08-02T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6208fcfa-1362-4f17-a6ea-7ef5acb60d8b', l.id, 10, '2026-08-09T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-030'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #31: yuvaraj (3)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('1a09a39f-8d26-431c-a7ca-d03d05af2892', '9100000031', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT 'a309c56d-1a19-4bf3-b729-43b8e037c1c1', u.id, 'yuvaraj (3)', '9100000031', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000031'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'ea6e05b9-dc36-4d44-b4a6-e2630b4a2f0a', c.id, 'LN-031', 'MONTHLY', 15000, 15, 0, 12750, 0.00, '2026-06-06T00:00:00.000Z', '2026-11-06T00:00:00.000Z', 5, 3450, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000031'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ffb3367a-fd53-46d5-ba7f-f60f16d61287', l.id, 1, '2026-07-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0480624e-be5d-47a5-b9a8-526b03d20223', l.id, 2, '2026-08-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '257cb9dd-8cc4-4ab4-b98b-24466fe3e2fd', l.id, 3, '2026-09-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '71d4c913-6253-401a-b994-3fe086acb395', l.id, 4, '2026-10-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a8c99fad-b634-4b9d-9ca5-08c9ce032fa6', l.id, 5, '2026-11-06T00:00:00.000Z', 3450, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-031'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #32: ragupathy
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('2ab41bd9-8fff-4a93-8ddf-82fb64619a9e', '9100000032', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '0a1322a5-6951-4457-9d74-57b2e488f85b', u.id, 'ragupathy', '9100000032', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000032'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '830f6d94-b0c2-4481-9fbb-4dfbabdb209d', c.id, 'LN-032', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-09T00:00:00.000Z', '2026-08-18T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000032'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cfdc3b65-dd3f-477c-aa67-2e44407fa442', l.id, 1, '2026-06-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'a326eb89-3cba-4f91-9535-2a5557f730a9', l.id, 2, '2026-06-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '5c6307fc-160f-4ec3-a741-77dd7d6cce10', l.id, 3, '2026-06-30T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '15b3e14b-f99a-47b6-b032-f187c9cd8beb', l.id, 4, '2026-07-07T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '24eaebc5-0381-43de-8c2a-1a9a20e100ad', l.id, 5, '2026-07-14T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '07d87ddb-d0ed-41f2-9db6-07bed093c1c8', l.id, 6, '2026-07-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '96ae6ad2-4125-4baf-a9c4-baf986573e32', l.id, 7, '2026-07-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df1ec0eb-6874-4fca-8c42-ae5b3a002398', l.id, 8, '2026-08-04T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0eb5cdfa-15a2-43f3-a869-1502d2e7444f', l.id, 9, '2026-08-11T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0c5aefb1-244b-4862-bc7d-e624dda007db', l.id, 10, '2026-08-18T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-032'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #33: babu (metu)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('d1fbed14-f34a-4f47-ae1f-5cebacd75ce9', '9100000033', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '60fd4de2-7137-4f8b-ac0c-8cd990ba0124', u.id, 'babu (metu)', '9100000033', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000033'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'd6fd2fdc-5c65-4e4a-a099-a5c176c59324', c.id, 'LN-033', 'WEEKLY', 5000, 10, 0, 4500, 0.00, '2026-06-13T00:00:00.000Z', '2026-08-22T00:00:00.000Z', 10, 500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000033'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'b452c584-2d64-460c-b43c-6fb42a78ae19', l.id, 1, '2026-06-20T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4efa8e35-00f9-438b-af56-92914bedf8b3', l.id, 2, '2026-06-27T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'bd46d7ae-554c-42c7-99a7-6c9ae2ee60e6', l.id, 3, '2026-07-04T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '375bf852-ffa7-4919-be54-bc90a2cd7a3f', l.id, 4, '2026-07-11T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f2769955-4fd7-4d4a-9ec1-be5b51a534c5', l.id, 5, '2026-07-18T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'cce1b718-15ce-429b-be4a-baf9003b6f80', l.id, 6, '2026-07-25T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'f4fb9ac8-b5d3-4e84-b6e0-155fcb0edc6a', l.id, 7, '2026-08-01T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '931bc6d9-2a04-4b84-89e0-aeb5c9af0d40', l.id, 8, '2026-08-08T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '62c813d3-0d88-4c11-b7ca-b8710ce4b4fd', l.id, 9, '2026-08-15T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '4beb7365-161a-458f-a304-e28cf3ae5b98', l.id, 10, '2026-08-22T00:00:00.000Z', 500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-033'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #34: venkatesan (kv)
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('affcfcf4-e956-454b-9bd5-ce218dbf3e5b', '9100000034', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '1f978081-8fce-4b32-8739-0fba00782c25', u.id, 'venkatesan (kv)', '9100000034', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000034'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT 'c0b18ffa-1a19-4239-91f5-a3978a827d08', c.id, 'LN-034', 'WEEKLY', 15000, 10, 0, 13500, 0.00, '2026-06-14T00:00:00.000Z', '2026-08-23T00:00:00.000Z', 10, 1500, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000034'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df956339-b107-462e-abeb-90438e0c09af', l.id, 1, '2026-06-21T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'aa470c90-70c8-4836-ba00-3939f260096b', l.id, 2, '2026-06-28T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7817cc49-4888-4d6c-91f9-65d5234e75bf', l.id, 3, '2026-07-05T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '32777f3a-e9fd-4b51-99b8-fa5bdee2f555', l.id, 4, '2026-07-12T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '7f43bbb8-5441-4ff9-be98-07df2b39717d', l.id, 5, '2026-07-19T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '700c2f7b-acd9-42cd-827a-36a87e2e7e1f', l.id, 6, '2026-07-26T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd97d7e31-54ae-4821-b10b-c7239f9bdab1', l.id, 7, '2026-08-02T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0b0b0181-3db4-459d-89a0-dccc0f17722e', l.id, 8, '2026-08-09T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '143d8f97-ae0f-427b-89c2-ce1a81317d0a', l.id, 9, '2026-08-16T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '686d000e-e467-42a3-a6c6-5b61e9f28928', l.id, 10, '2026-08-23T00:00:00.000Z', 1500, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-034'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

-- Record #35: Ashok
INSERT INTO users (id, phone, "passwordHash", role, "isActive", "createdAt", "updatedAt")
VALUES ('bcf9aa8f-e0bb-4a92-ae8a-3b1cc08611d9', '9100000035', '$2a$10$7rMhR9L7.B3K5a5M8bLwLeH7pIu4fN6y6yZJz4Z9H3i7u8a9b0c1.', 'CUSTOMER', true, NOW(), NOW())
ON CONFLICT (phone) DO NOTHING;
INSERT INTO customers (id, "userId", name, phone, status, "createdAt", "updatedAt")
SELECT '98e88082-34c3-467d-b46b-c3017d3f8532', u.id, 'Ashok', '9100000035', 'ACTIVE', NOW(), NOW()
FROM users u WHERE u.phone = '9100000035'
LIMIT 1
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO loans (id, "customerId", "loanNumber", type, principal, "interestRate", "agreementFee", "disbursedAmount", "totalCollection", "startDate", "endDate", "termCount", "installmentAmount", status, "createdAt", "updatedAt")
SELECT '5a00933e-9af1-4596-89fe-47a0b87cd9b8', c.id, 'LN-035', 'WEEKLY', 3500, 10, 0, 3150, 0.00, '2026-06-15T00:00:00.000Z', '2026-08-24T00:00:00.000Z', 10, 350, 'ACTIVE', NOW(), NOW()
FROM customers c WHERE c.phone = '9100000035'
LIMIT 1
ON CONFLICT ("loanNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '9f00fa41-ec59-49cd-88c6-9fd798ed9198', l.id, 1, '2026-06-22T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '54172289-b589-42f3-9f14-6a453e94fa87', l.id, 2, '2026-06-29T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '0fc92e57-ee9d-45d2-bd88-2a99772d522d', l.id, 3, '2026-07-06T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'ee03a83f-54f7-4908-b7f3-083f5d78b86f', l.id, 4, '2026-07-13T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'd76cc2c1-7e9f-42f7-8c39-4652a6c6803d', l.id, 5, '2026-07-20T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT 'df61f03b-5465-4161-80db-918f0383c967', l.id, 6, '2026-07-27T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '518c46e1-80b8-472b-af51-f5c8e3c28647', l.id, 7, '2026-08-03T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '8b733216-89dc-4f32-91c2-6c9b83c91d37', l.id, 8, '2026-08-10T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '6b48091e-037a-4115-8c41-150f9a4e1e96', l.id, 9, '2026-08-17T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;
INSERT INTO dues (id, "loanId", "dueNumber", "dueDate", amount, status, "createdAt")
SELECT '3152c90f-27e0-4e74-a2ce-433d13a4ffe9', l.id, 10, '2026-08-24T00:00:00.000Z', 350, 'PENDING', NOW()
FROM loans l WHERE l."loanNumber" = 'LN-035'
LIMIT 1
ON CONFLICT ("loanId", "dueNumber") DO NOTHING;

COMMIT;