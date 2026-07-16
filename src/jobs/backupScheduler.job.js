const cron = require('node-cron');
const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');
const env = require('../config/env');
const logger = require('../utils/logger');

const BACKUP_DIR = path.join(process.cwd(), 'backups');

function runBackup() {
  fs.mkdirSync(BACKUP_DIR, { recursive: true });
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
  const outFile = path.join(BACKUP_DIR, `backup-${timestamp}.sql`);

  // Requires pg_dump available on the host / container and DATABASE_URL set.
  const cmd = `pg_dump "${env.DATABASE_URL}" -f "${outFile}"`;
  exec(cmd, (error) => {
    if (error) {
      logger.error(`Database backup failed: ${error.message}`);
      return;
    }
    logger.info(`Database backup created: ${outFile}`);
  });
}

function scheduleBackupJob() {
  // Runs every day at 2:00 AM
  cron.schedule('0 2 * * *', runBackup);
  logger.info('Backup job scheduled (daily 02:00). Requires pg_dump on PATH.');
}

module.exports = { scheduleBackupJob, runBackup };
