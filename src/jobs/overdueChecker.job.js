const cron = require('node-cron');
const dueService = require('../modules/due/due.service');
const notificationService = require('../modules/notification/notification.service');
const logger = require('../utils/logger');

async function runOverdueChecker() {
  const { updatedCount } = await dueService.markOverdueDues();

  const overdueDues = await dueService.getOverdue();
  for (const due of overdueDues) {
    const overdueDays = Math.floor((Date.now() - new Date(due.dueDate)) / (1000 * 60 * 60 * 24));
    try {
      await notificationService.sendOverdueNotice(due.loan.customer, due, overdueDays);
    } catch (err) {
      logger.error(`Failed to send overdue notice for due ${due.id}: ${err.message}`);
    }
  }

  logger.info(`Overdue checker job: marked ${updatedCount} due(s) as missed, notified ${overdueDues.length}.`);
}

function scheduleOverdueCheckerJob() {
  // Runs every day at midnight
  cron.schedule('0 0 * * *', () => {
    runOverdueChecker().catch((err) => require('../utils/logger').error(`Overdue checker job failed: ${err.message}`));
  });
  require('../utils/logger').info('Overdue checker job scheduled (daily 00:00).');
}

module.exports = { scheduleOverdueCheckerJob, runOverdueChecker };
