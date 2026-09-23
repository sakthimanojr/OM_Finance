const dailyRecordService = require('./dailyRecord.service');

async function getRecord(req, res, next) {
  try {
    const { date } = req.query;
    const result = await dailyRecordService.getDailyRecord(date);
    res.json({
      status: 'success',
      data: result,
    });
  } catch (err) {
    next(err);
  }
}

async function saveRecord(req, res, next) {
  try {
    const adminId = req.user?.id || null;
    const result = await dailyRecordService.saveDailyRecord(req.body, adminId);
    res.status(200).json({
      status: 'success',
      data: result,
    });
  } catch (err) {
    next(err);
  }
}

module.exports = {
  getRecord,
  saveRecord,
};
