const express = require('express');
const controller = require('./loan.controller');
const validate = require('../../middlewares/validate.middleware');
const schemas = require('./loan.validation');
const authMiddleware = require('../../middlewares/auth.middleware');
const roleGuard = require('../../middlewares/role.middleware');

const router = express.Router();
router.use(authMiddleware);

/**
 * @openapi
 * /loans:
 *   post:
 *     summary: Create a new loan (disburses funds, generates due schedule)
 *     tags: [Loans]
 */
router.post('/', roleGuard('SUPER_ADMIN'), validate(schemas.createLoan), controller.createLoan);
router.get('/', validate(schemas.listLoans), controller.listLoans);
router.get('/:id', validate(schemas.loanIdParam), controller.getLoan);
router.patch('/:id/close', roleGuard('SUPER_ADMIN'), validate(schemas.closeLoan), controller.closeLoan);
router.post(
  '/:id/repay-principal',
  roleGuard('SUPER_ADMIN', 'VIEW_ADMIN'),
  validate(schemas.repayPrincipal),
  controller.repayPrincipal
);

module.exports = router;
