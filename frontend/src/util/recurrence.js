/** @param {Record<string, unknown> | null | undefined} rule */
/** @param {Date} d local calendar date */
export function isHabitDueOn(rule, d) {
  const r = rule || {};
  const t = r.type || "daily";
  if (t === "daily") return true;
  if (t === "weekly") {
    const days = r.days || [];
    const jsDay = d.getDay();
    const iso = jsDay === 0 ? 7 : jsDay;
    return days.includes(iso);
  }
  return true;
}
