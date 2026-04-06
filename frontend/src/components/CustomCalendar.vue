<template>
  <div class="custom-calendar">
    <div class="cal-nav">
      <v-btn
        variant="outlined"
        size="small"
        class="cal-nav__btn text-none"
        prepend-icon="mdi-chevron-left"
        @click="shift(-1)"
      >
        Пред.
      </v-btn>
      <h2 class="cal-nav__title text-h6 font-weight-medium">
        {{ monthTitle }}
      </h2>
      <v-btn
        variant="outlined"
        size="small"
        class="cal-nav__btn text-none"
        append-icon="mdi-chevron-right"
        @click="shift(1)"
      >
        След.
      </v-btn>
    </div>

    <div class="cal-frame rounded-lg elevation-1">
      <table class="cal-table" role="grid" :aria-label="monthTitle">
        <thead>
          <tr>
            <th v-for="w in weekdays" :key="w" class="cal-th" scope="col">{{ w }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(week, wi) in weeks" :key="wi" class="cal-tr">
            <td v-for="cell in week" :key="cell.key" class="cal-td" :class="{ 'cal-td--pad': !cell.inMonth }">
              <button
                v-if="cell.inMonth"
                type="button"
                class="cal-cell"
                :class="{ 'cal-cell--today': isToday(cell.iso) }"
                :aria-label="ariaDay(cell)"
                @click="emit('select', cell.iso)"
              >
                <span class="cal-cell__num">{{ cell.dayNum }}</span>
                <span
                  v-if="shadeLevel(cell.iso) >= 0"
                  class="cal-cell__bar"
                  :class="`cal-cell__bar--${shadeLevel(cell.iso)}`"
                />
              </button>
              <div v-else class="cal-cell cal-cell--ghost" aria-hidden="true">
                <span class="cal-cell__num cal-cell__num--ghost">{{ cell.dayNum }}</span>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";

const props = defineProps({
  year: { type: Number, required: true },
  month: { type: Number, required: true },
  intensities: { type: Object, default: () => ({}) },
});

const emit = defineEmits(["select", "update:year", "update:month"]);

const weekdays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];

const monthTitle = computed(() => {
  const d = new Date(props.year, props.month - 1, 1);
  return new Intl.DateTimeFormat("ru-RU", { month: "long", year: "numeric" }).format(d);
});

function todayIso() {
  const d = new Date();
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

const todayStr = todayIso();

function isToday(iso) {
  return iso === todayStr;
}

function shadeLevel(iso) {
  if (!props.intensities || typeof props.intensities !== "object") return -1;
  const v = props.intensities[iso];
  return v !== undefined ? v : -1;
}

function ariaDay(cell) {
  if (!cell.inMonth) return "";
  const lvl = shadeLevel(cell.iso);
  const part =
    lvl <= 0 ? "нет данных" : lvl === 4 ? "всё выполнено" : lvl >= 2 ? "частично" : "низкая активность";
  return `${cell.dayNum} ${monthTitle.value}, ${part}`;
}

function shift(delta) {
  let m = props.month + delta;
  let y = props.year;
  while (m < 1) {
    m += 12;
    y -= 1;
  }
  while (m > 12) {
    m -= 12;
    y += 1;
  }
  emit("update:year", y);
  emit("update:month", m);
}

function toIso(d) {
  const y = d.getFullYear();
  const mo = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${mo}-${day}`;
}

const cells = computed(() => {
  const first = new Date(props.year, props.month - 1, 1);
  const startWeekday = (first.getDay() + 6) % 7;
  const daysInMonth = new Date(props.year, props.month, 0).getDate();
  const list = [];
  let key = 0;
  for (let i = 0; i < startWeekday; i += 1) {
    const d = new Date(props.year, props.month - 1, 1 - (startWeekday - i));
    list.push({
      key: key++,
      inMonth: false,
      dayNum: d.getDate(),
      iso: toIso(d),
    });
  }
  for (let d = 1; d <= daysInMonth; d += 1) {
    const dt = new Date(props.year, props.month - 1, d);
    list.push({
      key: key++,
      inMonth: true,
      dayNum: d,
      iso: toIso(dt),
    });
  }
  while (list.length % 7 !== 0) {
    const last = list[list.length - 1];
    const dt = new Date(last.iso);
    dt.setDate(dt.getDate() + 1);
    list.push({
      key: key++,
      inMonth: false,
      dayNum: dt.getDate(),
      iso: toIso(dt),
    });
  }
  return list;
});

const weeks = computed(() => {
  const c = cells.value;
  const rows = [];
  for (let i = 0; i < c.length; i += 7) {
    rows.push(c.slice(i, i + 7));
  }
  return rows;
});
</script>

<style scoped>
.custom-calendar {
  width: 100%;
  max-width: 100%;
  box-sizing: border-box;
}

.cal-nav {
  display: grid;
  grid-template-columns: minmax(0, auto) minmax(0, 1fr) minmax(0, auto);
  align-items: center;
  gap: 8px 12px;
  margin-bottom: 16px;
}

.cal-nav__title {
  margin: 0;
  text-align: center;
  min-width: 0;
  line-height: 1.3;
  padding: 0 4px;
  hyphens: auto;
  overflow-wrap: break-word;
}

.cal-nav__btn {
  flex-shrink: 0;
}

.cal-frame {
  border: 1px solid rgba(255, 255, 255, 0.55);
  background: rgba(255, 255, 255, 0.42);
  backdrop-filter: saturate(180%) blur(22px);
  -webkit-backdrop-filter: saturate(180%) blur(22px);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.07), inset 0 1px 0 rgba(255, 255, 255, 0.85);
  overflow: hidden;
  width: 100%;
}

.cal-table {
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
  font-size: inherit;
}

.cal-th {
  padding: 10px 4px;
  text-align: center;
  font-weight: 600;
  font-size: 0.75rem;
  letter-spacing: 0.02em;
  color: rgba(var(--v-theme-on-surface-variant), 0.95);
  background: rgba(250, 250, 252, 0.72);
  border-bottom: 1px solid rgba(var(--v-theme-outline), 0.18);
  border-right: 1px solid rgba(var(--v-theme-outline), 0.1);
  width: 14.28%;
  box-sizing: border-box;
}

.cal-th:last-child {
  border-right: none;
}

.cal-td {
  padding: 0;
  vertical-align: top;
  border-right: 1px solid rgba(var(--v-theme-outline), 0.1);
  border-bottom: 1px solid rgba(var(--v-theme-outline), 0.1);
  background: rgba(255, 255, 255, 0.28);
  width: 14.28%;
  box-sizing: border-box;
}

.cal-td:last-child {
  border-right: none;
}

.cal-tr:last-child .cal-td {
  border-bottom: none;
}

.cal-td--pad {
  background: rgba(250, 250, 252, 0.45);
}

.cal-cell {
  appearance: none;
  -webkit-appearance: none;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  align-items: stretch;
  justify-content: flex-start;
  width: 100%;
  min-height: 76px;
  margin: 0;
  padding: 8px 6px 6px;
  border: none;
  background: transparent;
  cursor: pointer;
  font: inherit;
  text-align: left;
  transition: background-color 0.15s ease;
}

@media (min-width: 600px) {
  .cal-cell {
    min-height: 92px;
    padding: 10px 8px 8px;
  }
}

.cal-cell:hover {
  background: rgba(var(--v-theme-primary), 0.06);
}

.cal-cell:focus-visible {
  outline: 2px solid rgb(var(--v-theme-primary));
  outline-offset: -2px;
  z-index: 1;
  position: relative;
}

.cal-cell--ghost {
  cursor: default;
  pointer-events: none;
}

.cal-cell--ghost:hover {
  background: transparent;
}

.cal-cell__num {
  position: relative;
  z-index: 1;
  display: inline-block;
  font-size: 0.8125rem;
  font-weight: 600;
  line-height: 1.2;
  color: rgb(var(--v-theme-on-surface));
}

.cal-cell__num--ghost {
  color: rgba(var(--v-theme-on-surface), 0.38);
}

@media (min-width: 600px) {
  .cal-cell__num {
    font-size: 0.9375rem;
  }
}

.cal-cell--today .cal-cell__num {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 1.625rem;
  min-height: 1.625rem;
  padding: 0 6px;
  border-radius: 999px;
  background: rgb(var(--v-theme-primary));
  color: rgb(var(--v-theme-on-primary));
}

.cal-cell__bar {
  display: block;
  margin-top: auto;
  width: 100%;
  height: 6px;
  border-radius: 4px;
  flex-shrink: 0;
}

.cal-cell__bar--0 {
  background: rgba(var(--v-theme-outline), 0.2);
  box-shadow: inset 0 0 0 1px rgba(var(--v-theme-outline), 0.2);
}

.cal-cell__bar--1 {
  background: rgba(var(--v-theme-primary), 0.45);
}

.cal-cell__bar--2 {
  background: rgba(var(--v-theme-primary), 0.58);
}

.cal-cell__bar--3 {
  background: rgba(var(--v-theme-primary), 0.75);
}

.cal-cell__bar--4 {
  background: rgb(var(--v-theme-primary));
}
</style>
