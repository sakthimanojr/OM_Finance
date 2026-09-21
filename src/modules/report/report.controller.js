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

async function monthlyCollectionsJson(req, res, next) {
  try {
    const data = await reportService.monthlyCollections();
    res.json({ success: true, data });
  } catch (err) { next(err); }
}

async function loanPortfolioJsonHandler(req, res, next) {
  try {
    const data = await reportService.loanPortfolioJson();
    res.json({ success: true, data });
  } catch (err) { next(err); }
}

async function interestProfitHandler(req, res, next) {
  try {
    const data = await reportService.interestProfitSummary();
    res.json({ success: true, data });
  } catch (err) { next(err); }
}

async function overdueDetailHandler(req, res, next) {
  try {
    const data = await reportService.overdueDetailJson();
    res.json({ success: true, data });
  } catch (err) { next(err); }
}

async function disbursementSummaryHandler(req, res, next) {
  try {
    const data = await reportService.disbursementSummary();
    res.json({ success: true, data });
  } catch (err) { next(err); }
}

module.exports = { collections, loanPortfolio, overdue, monthlyCollectionsJson, loanPortfolioJsonHandler, interestProfitHandler, overdueDetailHandler, disbursementSummaryHandler };
