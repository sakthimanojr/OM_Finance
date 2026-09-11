/**
 * chitPayment.service.js
 * Records and queries monthly member contributions for a chit fund.
 */
const prisma = require('../../config/database');
const ApiError = require('../../utils/apiError');
const notificationService = require('../notification/notification.service');

async function recordPayment(chitId, payload, adminUserId) {
  const member = await prisma.chitMember.findFirst({
    where: { id: payload.memberId, chitId },
    include: { customer: true },
  });
  if (!member) throw ApiError.notFound('Member not found in this chit fund');

  const month = await prisma.chitMonth.findFirst({
    where: { id: payload.monthId, chitId },
  });
  if (!month) throw ApiError.notFound('Month not found');
  if (month.status === 'CLOSED') throw ApiError.badRequest('Month is already closed');

  // Find or create the payment record for this member/month
  let payment = await prisma.chitMemberPayment.findUnique({
    where: { memberId_monthId: { memberId: payload.memberId, monthId: payload.monthId } },
  });

  if (!payment) {
    payment = await prisma.chitMemberPayment.create({
      data: {
        chitId,
        memberId: payload.memberId,
        monthId: payload.monthId,
        amountDue: Number(member.monthlyContribution),
        amountPaid: 0,
        dueDate: month.periodStart,
        status: 'PENDING',
      },
    });
  }

  if (payment.status === 'PAID') {
    throw ApiError.badRequest('Member has already paid in full for this month');
  }

  const newAmountPaid =
    Math.round((Number(payment.amountPaid) + Number(payload.amountPaid)) * 100) / 100;
  const amountDue = Number(payment.amountDue);

  let status;
  if (newAmountPaid >= amountDue) {
    status = 'PAID';
  } else if (newAmountPaid > 0) {
    status = 'PARTIAL';
  } else {
    status = payload.status || 'PENDING';
  }

  if (payload.status === 'WAIVED' || payload.status === 'FAILED') {
    status = payload.status;
  }

  const updated = await prisma.chitMemberPayment.update({
    where: { id: payment.id },
    data: {
      amountPaid: newAmountPaid,
      paidDate: status === 'PAID' ? (payload.paidDate ? new Date(payload.paidDate) : new Date()) : null,
      status,
      paymentReference: payload.paymentReference || null,
      paymentMethod: payload.paymentMethod || null,
    },
  });

  // Update month collected amount
  const allPayments = await prisma.chitMemberPayment.findMany({ where: { monthId: payload.monthId } });
  const totalCollected = allPayments.reduce((s, p) => s + Number(p.amountPaid), 0);
  await prisma.chitMonth.update({
    where: { id: payload.monthId },
    data: { amountCollected: Math.round(totalCollected * 100) / 100 },
  });

  if (status === 'PAID') {
    try {
      await notificationService.sendManual(
        member.customer.id,
        `Your chit fund monthly contribution of ₹${newAmountPaid.toFixed(2)} for Month #${month.monthNumber} has been received. Thank you!`,
        'SMS'
      );
    } catch (_) {}
  }

  return updated;
}

async function listPayments(chitId, { monthId, memberId, status, page, limit } = {}) {
  page = parseInt(page, 10) || 1;
  limit = parseInt(limit, 10) || 50;

  const where = { chitId };
  if (monthId) where.monthId = monthId;
  if (memberId) where.memberId = memberId;
  if (status) where.status = status;

  const [items, total] = await Promise.all([
    prisma.chitMemberPayment.findMany({
      where,
      include: {
        member: {
          include: { customer: { select: { id: true, name: true, phone: true } } },
        },
        month: { select: { monthNumber: true, periodStart: true } },
      },
      orderBy: [{ month: { monthNumber: 'asc' } }, { member: { joinedAt: 'asc' } }],
      skip: (page - 1) * limit,
      take: limit,
    }),
    prisma.chitMemberPayment.count({ where }),
  ]);

  return { items, total, page, limit, totalPages: Math.ceil(total / limit) };
}

async function getMonthPaymentStatus(chitId, monthId) {
  const members = await prisma.chitMember.findMany({
    where: { chitId, status: 'ACTIVE' },
    include: {
      customer: { select: { id: true, name: true, phone: true } },
      payments: { where: { monthId } },
    },
  });

  return members.map((m) => {
    const payment = m.payments[0] || null;
    return {
      memberId: m.id,
      customerName: m.customer.name,
      customerPhone: m.customer.phone,
      amountDue: Number(m.monthlyContribution),
      amountPaid: payment ? Number(payment.amountPaid) : 0,
      status: payment ? payment.status : 'PENDING',
      paymentRef: payment?.paymentReference || null,
    };
  });
}

module.exports = { recordPayment, listPayments, getMonthPaymentStatus };
