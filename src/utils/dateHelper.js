const dayjsLike = {
  addDays(date, days) {
    const d = new Date(date);
    d.setDate(d.getDate() + days);
    return d;
  },
  addWeeks(date, weeks) {
    return dayjsLike.addDays(date, weeks * 7);
  },
  addMonths(date, months) {
    const d = new Date(date);
    const targetMonth = d.getMonth() + months;
    d.setMonth(targetMonth);
    return d;
  },
  startOfDay(date) {
    const d = new Date(date);
    d.setHours(0, 0, 0, 0);
    return d;
  },
  daysBetween(a, b) {
    const MS_PER_DAY = 1000 * 60 * 60 * 24;
    return Math.floor((dayjsLike.startOfDay(b) - dayjsLike.startOfDay(a)) / MS_PER_DAY);
  },
  isBefore(a, b) {
    return new Date(a).getTime() < new Date(b).getTime();
  },
};

module.exports = dayjsLike;
