<template>
  <div class="habit-show pb-8">
    <v-btn variant="text" class="text-none pl-0 mb-4" prepend-icon="mdi-arrow-left" :to="{ name: 'habits' }">
      Назад
    </v-btn>

    <v-alert v-if="error" type="error" variant="tonal" class="mb-4" rounded="lg">{{ error }}</v-alert>

    <template v-if="habit">
      <header class="d-flex flex-column flex-md-row align-md-center justify-space-between ga-4 mb-8">
        <div class="d-flex align-start ga-4">
          <div class="text-h3 habit-show__emoji">{{ habitEmoji }}</div>
          <div>
            <h1 class="text-h5 font-weight-medium mb-1">{{ habitTitle }}</h1>
            <p v-if="habit.micro_step" class="text-body-2 text-medium-emphasis mb-0">
              Микро-шаг: {{ habit.micro_step }}
            </p>
          </div>
        </div>
        <v-btn variant="outlined" class="text-none align-self-start" :to="`/habits/${habit.id}/edit`">
          Редактировать
        </v-btn>
      </header>

      <v-row dense class="mb-10">
        <v-col v-for="(s, i) in statCards" :key="i" cols="6" sm="3">
          <v-card class="pa-4 text-center h-100" elevation="2">
            <div class="text-h5 font-weight-medium text-primary">{{ s.value }}</div>
            <div class="text-caption text-medium-emphasis">{{ s.label }}</div>
          </v-card>
        </v-col>
      </v-row>

      <h2 class="text-subtitle-1 font-weight-bold mb-4">Последние 30 дней</h2>
      <div class="habit-calendar rounded-lg elevation-1 mb-3">
        <table class="habit-calendar__table" role="grid" aria-label="Прогресс за последние 30 дней">
          <thead>
            <tr>
              <th v-for="w in weekdays" :key="w" class="habit-calendar__th" scope="col">{{ w }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(week, wi) in heatmapWeeks" :key="wi">
              <td
                v-for="cell in week"
                :key="cell.iso"
                class="habit-calendar__td"
                :class="{ 'habit-calendar__td--pad': !cell.inRange }"
              >
                <div
                  class="habit-calendar__cell"
                  :class="{ 'habit-calendar__cell--today': cell.iso === todayIso }"
                  :title="`${cell.iso}: ${statusLabel(cell.status)}`"
                >
                  <span class="habit-calendar__num">{{ cell.dayNum }}</span>
                  <ColorIntensitySquare
                    class="habit-calendar__bar"
                    palette="semantic"
                    :level="levelForStatus(cell.status)"
                  />
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="d-flex flex-wrap ga-4 mb-10 text-caption text-medium-emphasis">
        <span class="d-flex align-center ga-2">
          <ColorIntensitySquare palette="semantic" :level="4" class="legend-sq" /> Готово
        </span>
        <span class="d-flex align-center ga-2">
          <ColorIntensitySquare palette="semantic" :level="3" class="legend-sq" /> Микро
        </span>
        <span class="d-flex align-center ga-2">
          <ColorIntensitySquare palette="semantic" :level="2" class="legend-sq" /> Пропуск
        </span>
        <span class="d-flex align-center ga-2">
          <ColorIntensitySquare palette="semantic" :level="0" class="legend-sq" /> Нет данных
        </span>
      </div>

      <v-divider class="mb-6" />

      <h2 class="text-subtitle-1 font-weight-bold mb-4">Действия</h2>
      <div class="d-flex flex-column flex-sm-row ga-3">
        <v-btn variant="tonal" color="secondary" size="large" class="text-none flex-grow-1" @click="onPause">
          Приостановить
        </v-btn>
        <v-btn variant="outlined" color="secondary" size="large" class="text-none flex-grow-1" @click="onArchive">
          Архивировать
        </v-btn>
      </div>
    </template>

    <v-snackbar v-model="snackPause" location="bottom" rounded="lg">Скоро здесь можно будет ставить привычку на паузу.</v-snackbar>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { api } from "../api/client";
import ColorIntensitySquare from "../components/ColorIntensitySquare.vue";
import { splitHabitTitle } from "../util/habitDisplay";

const route = useRoute();
const router = useRouter();
const habit = ref(null);
const logsByDate = ref({});
const error = ref("");
const snackPause = ref(false);

const habitEmoji = computed(() => splitHabitTitle(habit.value?.title || "").emoji || "🌿");
const habitTitle = computed(() => splitHabitTitle(habit.value?.title || "").text || habit.value?.title || "");
const weekdays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];

const range = computed(() => {
  const days = [];
  for (let i = 29; i >= 0; i -= 1) {
    const d = new Date();
    d.setHours(12, 0, 0, 0);
    d.setDate(d.getDate() - i);
    const y = d.getFullYear();
    const m = String(d.getMonth() + 1).padStart(2, "0");
    const day = String(d.getDate()).padStart(2, "0");
    days.push(`${y}-${m}-${day}`);
  }
  return days;
});

const todayIso = computed(() => {
  const d = new Date();
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
});

const heatmapWeeks = computed(() => {
  const firstDate = isoToDate(range.value[0]);
  const lastDate = isoToDate(range.value[range.value.length - 1]);

  const start = new Date(firstDate);
  const startWeekday = (start.getDay() + 6) % 7;
  start.setDate(start.getDate() - startWeekday);

  const end = new Date(lastDate);
  const endWeekday = (end.getDay() + 6) % 7;
  end.setDate(end.getDate() + (6 - endWeekday));

  const rangeSet = new Set(range.value);
  const cells = [];
  const cursor = new Date(start);

  while (cursor <= end) {
    const iso = toIso(cursor);
    cells.push({
      iso,
      dayNum: cursor.getDate(),
      inRange: rangeSet.has(iso),
      status: logsByDate.value[iso] || "none",
    });
    cursor.setDate(cursor.getDate() + 1);
  }

  const weeks = [];
  for (let i = 0; i < cells.length; i += 7) weeks.push(cells.slice(i, i + 7));
  return weeks;
});

const statCards = computed(() => {
  const h = habit.value;
  if (!h) return [];
  let full = 0;
  let micro = 0;
  let missed = 0;
  for (const iso of range.value) {
    const st = logsByDate.value[iso];
    if (st === "full") full += 1;
    else if (st === "micro") micro += 1;
    else if (st === "missed") missed += 1;
  }
  return [
    { label: "Серия", value: h.streak },
    { label: "Выполнено", value: full },
    { label: "Микро", value: micro },
    { label: "Пропуск", value: missed },
  ];
});

function levelForStatus(st) {
  if (st === "full") return 4;
  if (st === "micro") return 3;
  if (st === "missed") return 2;
  return 0;
}

function statusLabel(st) {
  if (st === "full") return "Готово";
  if (st === "micro") return "Микро";
  if (st === "missed") return "Пропуск";
  return "Нет данных";
}

function isoToDate(iso) {
  const [y, m, d] = iso.split("-").map(Number);
  return new Date(y, m - 1, d, 12, 0, 0, 0);
}

function toIso(d) {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

async function load() {
  error.value = "";
  try {
    const { data: h } = await api.get(`/api/v1/habits/${route.params.id}`);
    habit.value = h;
    const from = range.value[0];
    const to = range.value[range.value.length - 1];
    const { data: rows } = await api.get(`/api/v1/habits/${route.params.id}/logs`, {
      params: { from, to },
    });
    const map = {};
    rows.forEach((row) => {
      map[row.date] = row.status;
    });
    logsByDate.value = map;
  } catch {
    error.value = "Не удалось загрузить привычку.";
  }
}

function onPause() {
  snackPause.value = true;
}

async function onArchive() {
  if (!habit.value) return;
  if (!window.confirm("Архивировать и удалить привычку? Это действие нельзя отменить.")) return;
  try {
    await api.delete(`/api/v1/habits/${habit.value.id}`);
    router.push({ name: "habits" });
  } catch {
    error.value = "Не удалось удалить.";
  }
}

onMounted(load);
</script>

<style scoped>
.habit-show__emoji {
  line-height: 1.2;
}
.habit-calendar {
  border: 1px solid rgba(255, 255, 255, 0.55);
  background: rgba(255, 255, 255, 0.42);
  backdrop-filter: saturate(180%) blur(22px);
  -webkit-backdrop-filter: saturate(180%) blur(22px);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.07), inset 0 1px 0 rgba(255, 255, 255, 0.85);
  overflow: hidden;
}
.habit-calendar__table {
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
}
.habit-calendar__th {
  padding: 10px 4px;
  text-align: center;
  font-weight: 600;
  font-size: 0.75rem;
  letter-spacing: 0.02em;
  color: rgba(var(--v-theme-on-surface-variant), 0.95);
  background: rgba(250, 250, 252, 0.72);
  border-bottom: 1px solid rgba(var(--v-theme-outline), 0.18);
  border-right: 1px solid rgba(var(--v-theme-outline), 0.1);
}
.habit-calendar__th:last-child {
  border-right: none;
}
.habit-calendar__td {
  padding: 0;
  vertical-align: top;
  border-right: 1px solid rgba(var(--v-theme-outline), 0.1);
  border-bottom: 1px solid rgba(var(--v-theme-outline), 0.1);
  background: rgba(255, 255, 255, 0.28);
}
.habit-calendar__td:last-child {
  border-right: none;
}
tbody tr:last-child .habit-calendar__td {
  border-bottom: none;
}
.habit-calendar__td--pad {
  background: rgba(250, 250, 252, 0.45);
}
.habit-calendar__cell {
  display: flex;
  flex-direction: column;
  min-height: 64px;
  padding: 8px 6px 6px;
}
.habit-calendar__num {
  font-size: 0.8125rem;
  font-weight: 600;
  line-height: 1.2;
  color: rgb(var(--v-theme-on-surface));
}
.habit-calendar__cell--today .habit-calendar__num {
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
.habit-calendar__bar {
  display: block;
  margin-top: auto;
  width: 100%;
  height: 8px;
  border-radius: 4px;
  flex-shrink: 0;
}
@media (min-width: 600px) {
  .habit-calendar__cell {
    min-height: 78px;
    padding: 10px 8px 8px;
  }
  .habit-calendar__num {
    font-size: 0.9375rem;
  }
}
.legend-sq {
  display: inline-block;
  width: 14px;
  height: 14px;
  vertical-align: middle;
}
</style>
