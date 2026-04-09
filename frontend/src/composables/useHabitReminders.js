import { api } from "../api/client";
import { localToday } from "../util/date";
import { isHabitDueOn } from "../util/recurrence";

const CACHE_MS = 120_000;
/** Не привязываемся к «целой» минуте: интервал 60 с легко перескакивает нужное время; в фоне вкладки таймеры ещё сильнее дрожат. */
const TICK_MS = 15_000;

let timerId = null;
let timezoneSyncDone = false;

function onTabVisibleAgain() {
  if (typeof document !== "undefined" && document.hidden) return;
  void tick();
}
const cache = {
  habits: [],
  settings: null,
  fetchedAt: 0,
};

/** @param {string | null | undefined} str */
function parseTimeToMinutes(str) {
  if (!str) return 0;
  const parts = String(str).split(":");
  const h = Number(parts[0]);
  const m = Number(parts[1] || 0);
  return h * 60 + m;
}

/**
 * @param {Date} now
 * @param {string | null | undefined} startStr
 * @param {string | null | undefined} endStr
 */
function isInQuietHours(now, startStr, endStr) {
  if (!startStr || !endStr) return false;
  const cur = now.getHours() * 60 + now.getMinutes();
  const start = parseTimeToMinutes(startStr);
  const end = parseTimeToMinutes(endStr);
  if (start <= end) return cur >= start && cur < end;
  return cur >= start || cur < end;
}

/**
 * @param {unknown} reminderTime API: "HH:MM:SS" или редко объект времени
 * @param {Date} now
 */
function reminderMatchesNow(reminderTime, now) {
  if (reminderTime == null || reminderTime === "") return false;
  let h;
  let m;
  if (typeof reminderTime === "object" && reminderTime !== null && "hour" in reminderTime) {
    const o = /** @type {{ hour?: number; minute?: number }} */ (reminderTime);
    h = o.hour;
    m = o.minute ?? 0;
  } else {
    const match = /^(\d{1,2}):(\d{2})/.exec(String(reminderTime).trim());
    if (!match) return false;
    h = Number.parseInt(match[1], 10);
    m = Number.parseInt(match[2], 10);
  }
  if (Number.isNaN(h) || Number.isNaN(m)) return false;
  return now.getHours() === h && now.getMinutes() === m;
}

/** @param {string} habitId */
function notifiedKey(habitId) {
  return `hf_habit_reminder_v2_${habitId}_${localToday()}`;
}

/** @param {string} key */
function dueNotificationKey(key) {
  return `hf_due_notification_${key}`;
}

/** @param {string} tone */
/** @param {string} title */
function bodyForTone(tone, title) {
  if (tone === "soft") {
    return `Время для «${title}» — без спешки, в своём темпе.`;
  }
  return `Напоминание: ${title}`;
}

/** @param {string} ymd */
function parseLocalDate(ymd) {
  const [y, mo, d] = ymd.split("-").map(Number);
  return new Date(y, mo - 1, d);
}

async function refreshCache() {
  const [habitsRes, profileRes] = await Promise.all([
    api.get("/api/v1/habits"),
    api.get("/api/v1/profile"),
  ]);
  cache.habits = habitsRes.data;
  cache.settings = profileRes.data.settings;
  cache.fetchedAt = Date.now();

  if (!timezoneSyncDone) {
    const browserTz = Intl.DateTimeFormat().resolvedOptions().timeZone || "UTC";
    if (cache.settings?.user_timezone !== browserTz) {
      try {
        await api.put("/api/v1/profile/settings", { user_timezone: browserTz });
        cache.settings.user_timezone = browserTz;
      } catch {
        /* не блокируем напоминания, если таймзону не удалось синхронизировать */
      }
    }
    timezoneSyncDone = true;
  }
}

async function tick() {
  try {
    if (typeof Notification === "undefined") return;
    if (Notification.permission !== "granted") return;

    if (!cache.settings || Date.now() - cache.fetchedAt > CACHE_MS) {
      await refreshCache();
    }

    if (!cache.settings?.global_enabled) return;

    const now = new Date();
    const qhStart = cache.settings.quiet_hours_start;
    const qhEnd = cache.settings.quiet_hours_end;
    if (qhStart != null && qhEnd != null && isInQuietHours(now, qhStart, qhEnd)) {
      return;
    }

    const today = localToday();
    const todayDate = parseLocalDate(today);
    const tone = cache.settings.reminder_tone || "neutral";
    const due = await api.get("/api/v1/notifications/due");
    for (const item of due.data || []) {
      if (sessionStorage.getItem(dueNotificationKey(item.idempotency_key))) continue;
      try {
        new Notification("HabitFlow", {
          body: item.payload?.body || bodyForTone(tone, item.payload?.title || "Habit"),
          tag: item.idempotency_key,
        });
        sessionStorage.setItem(dueNotificationKey(item.idempotency_key), "1");
      } catch {
        /* уведомление не показали — не ставим dedupe */
      }
    }

    for (const h of cache.habits) {
      if (!h.reminder_time) continue;
      if (!reminderMatchesNow(h.reminder_time, now)) continue;
      if (!isHabitDueOn(h.recurrence_rule, todayDate)) continue;
      if (sessionStorage.getItem(notifiedKey(h.id))) continue;

      const { data: logs } = await api.get(`/api/v1/habits/${h.id}/logs`, {
        params: { from: today, to: today },
      });
      const done = logs.some((log) => log.status === "full" || log.status === "micro");
      if (done) {
        sessionStorage.setItem(notifiedKey(h.id), "1");
        continue;
      }

      try {
        new Notification("HabitFlow", {
          body: bodyForTone(tone, h.title),
          tag: `habit-${h.id}-${today}`,
        });
        sessionStorage.setItem(notifiedKey(h.id), "1");
      } catch {
        /* уведомление не показали — не ставим dedupe, чтобы повторить на следующем тике */
      }
    }
  } catch {
    /* offline */
  }
}

export function startHabitReminders() {
  if (timerId != null) return;
  void refreshCache().catch(() => {});
  timerId = window.setInterval(() => void tick(), TICK_MS);
  document.addEventListener("visibilitychange", onTabVisibleAgain);
  window.addEventListener("focus", onTabVisibleAgain);
  void tick();
}

export function stopHabitReminders() {
  if (timerId != null) {
    clearInterval(timerId);
    timerId = null;
  }
  document.removeEventListener("visibilitychange", onTabVisibleAgain);
  window.removeEventListener("focus", onTabVisibleAgain);
}

export function useHabitReminders() {
  return { start: startHabitReminders, stop: stopHabitReminders };
}
