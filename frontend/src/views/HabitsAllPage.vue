<template>
  <div class="habits-all-page pb-8">
    <div class="d-flex align-center justify-space-between mb-4">
      <div>
        <p class="text-body-2 text-medium-emphasis mb-1">Полный список</p>
        <h1 class="text-h5 font-weight-medium mb-0">Все привычки</h1>
      </div>
      <v-btn color="primary" class="text-none" :to="{ name: 'habits-new' }" prepend-icon="mdi-plus">Добавить</v-btn>
    </div>

    <v-alert
      v-if="error"
      type="error"
      variant="tonal"
      class="mb-4"
      rounded="lg"
      closable
      @click:close="error = ''"
    >
      {{ error }}
    </v-alert>

    <div v-if="!habits.length && !error" class="text-body-2 text-medium-emphasis py-8 text-center">
      Пока нет привычек. Добавьте первую.
    </div>

    <HabitCard
      v-for="h in habits"
      :key="h.id"
      :habit="h"
      :today-status="statusByHabit[h.id] || 'none'"
      :loading-action="markingByHabit[h.id] || ''"
      @click="openDetails(h.id)"
      @done="mark(h, 'full')"
      @micro="mark(h, 'micro')"
      @skip="mark(h, 'missed')"
    />
  </div>
</template>

<script setup>
import { onMounted, reactive, ref } from "vue";
import { useRouter } from "vue-router";
import { api } from "../api/client";
import { localToday } from "../util/date";
import HabitCard from "../components/HabitCard.vue";

const router = useRouter();
const habits = ref([]);
const statusByHabit = reactive({});
const markingByHabit = reactive({});
const error = ref("");
const today = localToday();

async function load() {
  error.value = "";
  try {
    const { data: all } = await api.get("/api/v1/habits");
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
  if (markingByHabit[h.id]) return;
  error.value = "";
  markingByHabit[h.id] = status;
  try {
    await api.post(`/api/v1/habits/${h.id}/logs`, { status, date: today });
    await load();
  } catch (e) {
    error.value = e.response?.data?.detail || "Не удалось сохранить.";
  } finally {
    markingByHabit[h.id] = "";
  }
}

function openDetails(habitId) {
  router.push({ name: "habits-show", params: { id: habitId } });
}

onMounted(load);
</script>
