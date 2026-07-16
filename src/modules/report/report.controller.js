const reportService = require('./report.service');

async function sendWorkbook(res, workbook, filename) {
  res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  res.setHeader('Content-Disposition', `attachment; filename="${filename}"`);
  await workbook.xlsx.write(res);
  res.end();
}

async function collections(req, res, next) {
  try {
    const { fromDate, toDate } = req.query;
    const workbook = await reportService.collectionsReport(fromDate, toDate);
    await sendWorkbook(res, workbook, 'collections-report.xlsx');
  } catch (err) {
    next(err);
  }
}

async function loanPortfolio(req, res, next) {
  try {
    const workbook = await reportService.loanPortfolioReport();
    await sendWorkbook(res, workbook, 'loan-portfolio-report.xlsx');
  } catch (err) {
    next(err);
  }
}

async function overdue(req, res, next) {
  try {
    const workbook = await reportService.overdueReport();
    await sendWorkbook(res, workbook, 'overdue-report.xlsx');
  } catch (err) {
    next(err);
  }
}

module.exports = { collections, loanPortfolio, overdue };
