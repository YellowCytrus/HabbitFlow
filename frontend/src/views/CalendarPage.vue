<template>
  <div class="calendar-page pb-8">
    <h1 class="text-h5 font-weight-medium mb-6">Календарь</h1>

    <transition name="calendar-swap" mode="out-in">
      <div :key="`${year}-${month}`" class="calendar-swap-block">
        <CustomCalendar
          v-model:year="year"
          v-model:month="month"
          :intensities="intensityByDate"
          @select="openDay"
        />
      </div>
    </transition>

    <p v-if="error" class="text-error text-body-2 mt-4">{{ error }}</p>

    <div class="d-flex flex-wrap justify-center ga-4 mt-8 text-caption text-medium-emphasis">
      <span class="d-flex align-center ga-2">
        <ColorIntensitySquare :level="4" class="legend-sq" /> Все выполнено
      </span>
      <span class="d-flex align-center ga-2">
        <ColorIntensitySquare :level="2" class="legend-sq" /> Частично
      </span>
      <span class="d-flex align-center ga-2">
        <ColorIntensitySquare :level="1" class="legend-sq" /> Низкая активность
      </span>
      <span class="d-flex align-center ga-2">
        <ColorIntensitySquare :level="0" class="legend-sq" /> Нет данных
      </span>
    </div>

    <DayDetailsModal
      :open="modalOpen"
      :date="modalDate"
      :habits="modalHabits"
      @close="modalOpen = false"
    />
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from "vue";
import { api } from "../api/client";
import ColorIntensitySquare from "../components/ColorIntensitySquare.vue";
import CustomCalendar from "../components/CustomCalendar.vue";
import DayDetailsModal from "../components/DayDetailsModal.vue";

const now = new Date();
const year = ref(now.getFullYear());
const month = ref(now.getMonth() + 1);
const error = ref("");
const modalOpen = ref(false);
const modalDate = ref("");
const modalHabits = ref([]);

const intensityByDate = ref({});

watch([year, month], load);

async function load() {
  error.value = "";
  try {
    const { data } = await api.get("/api/v1/calendar", {
      params: { year: year.value, month: month.value },
    });
    const map = {};
    data.days.forEach((d) => {
      map[d.date] = d.intensity;
    });
    intensityByDate.value = map;
  } catch {
    error.value = "Не удалось загрузить календарь.";
  }
}

async function openDay(iso) {
  modalDate.value = iso;
  modalOpen.value = true;
  try {
    const { data } = await api.get("/api/v1/calendar/day", { params: { date: iso } });
    modalHabits.value = data.habits;
  } catch {
    modalHabits.value = [];
  }
}

onMounted(load);
</script>

<style scoped>
.legend-sq {
  width: 14px;
  height: 14px;
  flex-shrink: 0;
}
</style>
