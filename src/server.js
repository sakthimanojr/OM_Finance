const app = require('./app');
const env = require('./config/env');
const logger = require('./utils/logger');
const prisma = require('./config/database');

const { scheduleDueReminderJob } = require('./jobs/dueReminder.job');
const { scheduleOverdueCheckerJob } = require('./jobs/overdueChecker.job');
const { scheduleBackupJob } = require('./jobs/backupScheduler.job');

const server = app.listen(env.PORT, '0.0.0.0', () => {
  logger.info(`Finance App backend listening on port ${env.PORT} [${env.NODE_ENV}]`);
  logger.info(`Swagger docs: http://localhost:${env.PORT}/api-docs`);

  scheduleDueReminderJob();
  scheduleOverdueCheckerJob();
  scheduleBackupJob();

  // Auto-ensure users table has canEdit column on startup
  prisma.$executeRawUnsafe('ALTER TABLE "users" ADD COLUMN IF NOT EXISTS "canEdit" BOOLEAN DEFAULT false;').catch((err) => {
    logger.warn(`canEdit column check warning: ${err.message}`);
  });

  // Auto-cleanup any invalid loans without numbers or customers with no loans
  const { cleanupInvalidLoans } = require('./modules/admin/admin.service');
  cleanupInvalidLoans()
    .then((res) => {
      if (res.deletedLoansCount > 0 || res.deletedCustomersCount > 0) {
        logger.info(`Startup cleanup: removed ${res.deletedLoansCount} invalid loans and ${res.deletedCustomersCount} orphaned customers`);
      }
    })
    .catch((err) => {
      logger.warn(`Startup cleanup warning: ${err.message}`);
    });
});

async function shutdown(signal) {
  logger.info(`Received ${signal}, shutting down gracefully...`);
  server.close(async () => {
    await prisma.$disconnect();
    logger.info('Shutdown complete.');
    process.exit(0);
  });
  // Force exit if not closed within 10s
  setTimeout(() => process.exit(1), 10000).unref();
}

process.on('SIGINT', () => shutdown('SIGINT'));
process.on('SIGTERM', () => shutdown('SIGTERM'));
process.on('unhandledRejection', (reason) => {
  logger.error(`Unhandled rejection: ${reason}`);
});
process.on('uncaughtException', (err) => {
  logger.error(`Uncaught exception: ${err.message}`, { stack: err.stack });
  process.exit(1);
});
