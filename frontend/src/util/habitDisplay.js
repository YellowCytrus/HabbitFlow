const LEADING_EMOJI_RE =
  /^([\u{1F300}-\u{1F9FF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}]|[\uD83C][\uDF00-\uDFFF]|[\uD83D][\uDC00-\uDDFF]|[\uD83E][\uDD00-\uDDFF])\s*/u;

export function splitHabitTitle(title) {
  if (!title || typeof title !== "string") {
    return { emoji: "", text: title || "" };
  }
  const m = title.match(LEADING_EMOJI_RE);
  if (m) {
    return { emoji: m[1], text: title.slice(m[0].length).trim() || title };
  }
  return { emoji: "", text: title.trim() };
}

export function habitTitleWithEmoji(emoji, text) {
  const t = (text || "").trim();
  const e = (emoji || "").trim();
  if (!e) return t;
  return `${e} ${t}`.trim();
}
