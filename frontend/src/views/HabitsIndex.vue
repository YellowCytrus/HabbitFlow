<template>
  <div class="habits-dashboard">
    <p class="text-body-2 text-medium-emphasis mb-1">{{ formattedDate }}</p>
    <h1 class="text-h5 font-weight-medium mb-6">Добрый день{{ greetingName }}!</h1>

    <v-card class="pa-6 mb-8 text-center quote-card" elevation="1" rounded="lg" color="surface-variant">
      <p class="text-body-1 font-italic mb-0">«Ты молодец, что здесь!»</p>
    </v-card>

    <v-row class="mb-8" dense>
      <v-col cols="12" sm="4">
        <v-card class="pa-4 text-center h-100" elevation="2">
          <div class="text-h4 font-weight-medium text-primary">{{ stats.done }}</div>
          <div class="text-body-2 text-medium-emphasis">Выполнено</div>
        </v-card>
      </v-col>
      <v-col cols="12" sm="4">
        <v-card class="pa-4 text-center h-100" elevation="2">
          <div class="text-h4 font-weight-medium text-tertiary">{{ stats.micro }}</div>
          <div class="text-body-2 text-medium-emphasis">Микро-шаг</div>
        </v-card>
      </v-col>
      <v-col cols="12" sm="4">
        <v-card class="pa-4 text-center h-100" elevation="2">
          <div class="text-h4 font-weight-medium">{{ stats.total }}</div>
          <div class="text-body-2 text-medium-emphasis">Всего привычек</div>
        </v-card>
      </v-col>
    </v-row>

    <div class="d-flex align-center justify-space-between mb-4">
      <h2 class="text-h6 font-weight-medium">Сегодня</h2>
      <v-btn color="primary" class="text-none" :to="{ name: 'habits-new' }" prepend-icon="mdi-plus">
        Добавить
      </v-btn>
    </div>

    <v-alert v-if="error" type="error" variant="tonal" class="mb-4" rounded="lg" closable @click:close="error = ''">
      {{ error }}
    </v-alert>

    <div v-if="!habits.length && !error" class="text-body-2 text-medium-emphasis py-8 text-center">
      Пока нет привычек на сегодня. Добавьте первую.
    </div>

    <HabitCard
      v-for="h in habits"
      :key="h.id"
      :habit="h"
      :today-status="statusByHabit[h.id] || 'none'"
      @done="mark(h, 'full')"
      @micro="mark(h, 'micro')"
      @skip="mark(h, 'missed')"
    />
  </div>
</template>

<script setup>
import { computed, onMounted, reactive, ref } from "vue";
import { api } from "../api/client";
import { localToday } from "../util/date";
import HabitCard from "../components/HabitCard.vue";

const today = localToday();
const habits = ref([]);
const statusByHabit = reactive({});
const error = ref("");
const userName = ref("");

const formattedDate = computed(() => {
  const [y, m, d] = today.split("-").map(Number);
  const dt = new Date(y, m - 1, d);
  return new Intl.DateTimeFormat("ru-RU", {
    weekday: "long",
    day: "numeric",
    month: "long",
  }).format(dt);
});

const greetingName = computed(() => (userName.value ? `, ${userName.value}` : ""));

const stats = computed(() => {
  let done = 0;
  let micro = 0;
  for (const h of habits.value) {
    const s = statusByHabit[h.id] || "none";
    if (s === "full") done += 1;
    if (s === "micro") micro += 1;
  }
  return { done, micro, total: habits.value.length };
});

async function load() {
  error.value = "";
  try {
    const profileRes = await api.get("/api/v1/profile").catch(() => ({ data: null }));
    if (profileRes.data) userName.value = profileRes.data.user?.name || "";

    const { data: all } = await api.get("/api/v1/habits", { params: { for_date: today } });
    habits.value = all;
    const statuses = await Promise.all(
      all.map((h) =>
        api
          .get(`/api/v1/habits/${h.id}/logs`, { params: { from: today, to: today } })
          .then((r) => ({ id: h.id, rows: r.data }))
          .catch(() => ({ id: h.id, rows: [] })),
      ),
    );
    statuses.forEach(({ id, rows }) => {
      statusByHabit[id] = rows[0]?.status || "none";
    });
  } catch {
    error.value = "Не удалось загрузить привычки.";
  }
}

async function mark(h, status) {
  error.value = "";
  try {
    await api.post(`/api/v1/habits/${h.id}/logs`, { status, date: today });
    await load();
  } catch (e) {
    error.value = e.response?.data?.detail || "Не удалось сохранить.";
  }
}

onMounted(load);
</script>

<style scoped>
.quote-card {
  border: 1px solid rgba(var(--v-theme-outline), 0.12);
}
</style>
