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
