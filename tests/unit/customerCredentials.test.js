const mockPrisma = require('../mocks/prismaMock');
jest.mock('../../src/config/database', () => mockPrisma);

const bcrypt = require('bcryptjs');
const customerService = require('../../src/modules/customer/customer.service');

describe('Customer Credentials & Management Service', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('createCustomer', () => {
    it('defaults password to mobile number when password is not provided', async () => {
      mockPrisma.user.findUnique.mockResolvedValueOnce(null);

      mockPrisma.user.create.mockImplementationOnce(({ data }) => {
        return Promise.resolve({ id: 'user-123', ...data });
      });

      mockPrisma.customer.create.mockImplementationOnce(({ data }) => {
        return Promise.resolve({ id: 'cust-123', ...data });
      });

      const payload = {
        name: 'Ramesh Kumar',
        phone: '9876543210',
      };

      const result = await customerService.createCustomer(payload);

      expect(result.id).toBe('cust-123');
      expect(result.status).toBe('ACTIVE');
      expect(mockPrisma.user.create).toHaveBeenCalledTimes(1);

      const createdUserData = mockPrisma.user.create.mock.calls[0][0].data;
      expect(createdUserData.phone).toBe('9876543210');
      expect(createdUserData.isActive).toBe(true);
      expect(createdUserData.role).toBe('CUSTOMER');

      // Password hash should match the phone number
      const passwordMatches = await bcrypt.compare('9876543210', createdUserData.passwordHash);
      expect(passwordMatches).toBe(true);
    });

    it('uses custom password if provided', async () => {
      mockPrisma.user.findUnique.mockResolvedValueOnce(null);

      mockPrisma.user.create.mockImplementationOnce(({ data }) => {
        return Promise.resolve({ id: 'user-456', ...data });
      });

      mockPrisma.customer.create.mockImplementationOnce(({ data }) => {
        return Promise.resolve({ id: 'cust-456', ...data });
      });

      const payload = {
        name: 'Suresh Raina',
        phone: '9848022338',
        password: 'CustomSecret@123',
      };

      const result = await customerService.createCustomer(payload);

      const createdUserData = mockPrisma.user.create.mock.calls[0][0].data;
      const passwordMatches = await bcrypt.compare('CustomSecret@123', createdUserData.passwordHash);
      expect(passwordMatches).toBe(true);
    });
  });

  describe('updateCustomer', () => {
    it('updates customer password and syncs user credentials', async () => {
      mockPrisma.customer.findUnique.mockResolvedValueOnce({
        id: 'cust-123',
        userId: 'user-123',
        phone: '9876543210',
        name: 'Ramesh Kumar',
      });

      mockPrisma.user.update.mockResolvedValueOnce({ id: 'user-123' });
      mockPrisma.customer.update.mockResolvedValueOnce({
        id: 'cust-123',
        userId: 'user-123',
        name: 'Ramesh Kumar',
        phone: '9876543210',
        status: 'ACTIVE',
      });

      const result = await customerService.updateCustomer('cust-123', {
        password: 'NewPassword@987',
      });

      expect(mockPrisma.user.update).toHaveBeenCalledTimes(1);
      const userUpdateCall = mockPrisma.user.update.mock.calls[0][0];
      expect(userUpdateCall.where.id).toBe('user-123');

      const isMatch = await bcrypt.compare('NewPassword@987', userUpdateCall.data.passwordHash);
      expect(isMatch).toBe(true);
    });

    it('updates phone number and checks uniqueness', async () => {
      mockPrisma.customer.findUnique.mockResolvedValueOnce({
        id: 'cust-123',
        userId: 'user-123',
        phone: '9876543210',
        name: 'Ramesh Kumar',
      });

      mockPrisma.user.findFirst.mockResolvedValueOnce(null); // phone is unique
      mockPrisma.user.update.mockResolvedValueOnce({ id: 'user-123' });
      mockPrisma.customer.update.mockResolvedValueOnce({
        id: 'cust-123',
        userId: 'user-123',
        name: 'Ramesh Kumar',
        phone: '9899999999',
        status: 'ACTIVE',
      });

      await customerService.updateCustomer('cust-123', {
        phone: '9899999999',
      });

      expect(mockPrisma.user.findFirst).toHaveBeenCalledWith({
        where: {
          phone: '9899999999',
          id: { not: 'user-123' },
        },
      });

      const userUpdateCall = mockPrisma.user.update.mock.calls[0][0];
      expect(userUpdateCall.data.phone).toBe('9899999999');

      const custUpdateCall = mockPrisma.customer.update.mock.calls[0][0];
      expect(custUpdateCall.data.phone).toBe('9899999999');
    });
  });
});
