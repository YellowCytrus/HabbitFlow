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
      <div class="heatmap d-grid mb-3" role="grid" aria-label="Прогресс за 30 дней">
        <button
          v-for="cell in heatmapCells"
          :key="cell.iso"
          type="button"
          class="heatmap__cell"
          :title="`${cell.iso}: ${statusLabel(cell.status)}`"
        >
          <ColorIntensitySquare
            class="heatmap__sq"
            palette="semantic"
            :level="levelForStatus(cell.status)"
          />
        </button>
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

const heatmapCells = computed(() => range.value.map((iso) => ({ iso, status: logsByDate.value[iso] || "none" })));

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
.heatmap {
  grid-template-columns: repeat(10, 1fr);
  gap: 6px;
  max-width: 420px;
}
.heatmap__cell {
  padding: 0;
  border: none;
  background: transparent;
  cursor: default;
  border-radius: 6px;
  overflow: hidden;
  transition: transform 0.12s ease;
}
.heatmap__cell:hover {
  transform: scale(1.08);
}
.heatmap__sq {
  display: block;
  width: 100%;
  aspect-ratio: 1;
  border-radius: 6px;
}
.legend-sq {
  display: inline-block;
  width: 14px;
  height: 14px;
  vertical-align: middle;
}
@media (prefers-reduced-motion: reduce) {
  .heatmap__cell:hover {
    transform: none;
  }
}
</style>
