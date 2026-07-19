/**
 * A jest-mock stand-in for the Prisma client, used by integration tests that
 * need the real Express app/routes/middleware wired up but without a live
 * database. Every model exposes the query methods this codebase actually
 * calls, each as a jest.fn() so individual tests can `.mockResolvedValueOnce(...)`
 * whatever they need.
 *
 * This intentionally mirrors config/database.js's shape (a plain PrismaClient
 * instance) so `require('../../src/config/database')` can be swapped for this
 * via `jest.mock(...)` with zero code changes in the modules under test.
 */
function buildModelMock() {
  return {
    findUnique: jest.fn(),
    findFirst: jest.fn(),
    findMany: jest.fn().mockResolvedValue([]),
    create: jest.fn(),
    createMany: jest.fn(),
    update: jest.fn(),
    updateMany: jest.fn().mockResolvedValue({ count: 0 }),
    delete: jest.fn(),
    count: jest.fn().mockResolvedValue(0),
    aggregate: jest.fn().mockResolvedValue({ _sum: {} }),
  };
}

const mockPrisma = {
  user: buildModelMock(),
  customer: buildModelMock(),
  document: buildModelMock(),
  loan: buildModelMock(),
  due: buildModelMock(),
  payment: buildModelMock(),
  receipt: buildModelMock(),
  notification: buildModelMock(),
  auditLog: buildModelMock(),
  adminConfig: buildModelMock(),
  closedLoan: buildModelMock(),
  // Most services call `prisma.$transaction(async (tx) => { ... })` — running
  // the callback with this same mock client is enough for route/middleware
  // level tests since the individual tx.model.method() calls are what's
  // actually asserted on or stubbed per-test.
  $transaction: jest.fn((callbackOrArray) => {
    if (typeof callbackOrArray === 'function') {
      return callbackOrArray(mockPrisma);
    }
    return Promise.all(callbackOrArray);
  }),
  $disconnect: jest.fn(),
};

module.exports = mockPrisma;
