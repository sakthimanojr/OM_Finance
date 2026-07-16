const cron = require('node-cron');
const prisma = require('../config/database');
const notificationService = require('../modules/notification/notification.service');
const logger = require('../utils/logger');

async function runDueReminders() {
  const dues = await require('../modules/due/due.service').getUpcoming(2); // remind 2 days before
  for (const due of dues) {
    try {
      await notificationService.sendDueReminder(due.loan.customer, due);
    } catch (err) {
      logger.error(`Failed to send due reminder for due ${due.id}: ${err.message}`);
    }
  }
  logger.info(`Due reminder job processed ${dues.length} upcoming due(s).`);
}

function scheduleDueReminderJob() {
  // Runs every day at 9:00 AM server time
  cron.schedule('0 9 * * *', () => {
    runDueReminders().catch((err) => logger.error(`Due reminder job failed: ${err.message}`));
  });
  logger.info('Due reminder job scheduled (daily 09:00).');
}

module.exports = { scheduleDueReminderJob, runDueReminders };
