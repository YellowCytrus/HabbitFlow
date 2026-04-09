export const COMMON_TIMEZONES = [
  "Asia/Krasnoyarsk",
  "Europe/Moscow",
  "Asia/Novosibirsk",
  "Asia/Irkutsk",
  "Asia/Vladivostok",
  "Europe/London",
  "Europe/Berlin",
  "America/New_York",
  "America/Los_Angeles",
  "Asia/Tokyo",
  "Asia/Shanghai",
  "UTC",
];

export function timezoneOptions() {
  const labels = new Set(COMMON_TIMEZONES);
  return Array.from(labels).map((value) => ({ value, title: value })).sort((a, b) => a.title.localeCompare(b.title));
}

export function resolveBrowserTimezone() {
  try {
    return Intl.DateTimeFormat().resolvedOptions().timeZone || "UTC";
  } catch {
    return "UTC";
  }
}
