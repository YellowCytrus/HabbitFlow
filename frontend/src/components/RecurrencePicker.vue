<template>
  <v-card variant="flat" color="surface-variant" rounded="lg" class="pa-4 recurrence-picker">
    <p class="text-subtitle-2 font-weight-medium mb-3 recurrence-picker__title">Повторяемость</p>
    <v-radio-group v-model="localType" inline hide-details class="mb-2" @update:model-value="emitRule">
      <v-radio label="Каждый день" value="daily" />
      <v-radio label="По дням недели" value="weekly" />
    </v-radio-group>
    <v-slide-y-transition>
      <div v-if="localType === 'weekly'">
        <p class="text-body-2 mb-2 recurrence-picker__hint">Выберите дни</p>
        <v-chip-group
          v-model="selectedDays"
          multiple
          selected-class="text-primary"
          @update:model-value="emitRule"
        >
          <v-chip v-for="day in dayOptions" :key="day.value" :value="day.value" variant="outlined" filter>
            {{ day.label }}
          </v-chip>
        </v-chip-group>
      </div>
    </v-slide-y-transition>
  </v-card>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";

const props = defineProps({
  modelValue: { type: Object, default: () => ({ type: "daily" }) },
});

const emit = defineEmits(["update:modelValue"]);

const localType = ref("daily");
const selectedDays = ref([]);
const dayOptions = [
  { value: 1, label: "Пн" },
  { value: 2, label: "Вт" },
  { value: 3, label: "Ср" },
  { value: 4, label: "Чт" },
  { value: 5, label: "Пт" },
  { value: 6, label: "Сб" },
  { value: 7, label: "Вс" },
];

function emitRule() {
  if (localType.value === "daily") {
    emit("update:modelValue", { type: "daily" });
    return;
  }
  emit("update:modelValue", { type: "weekly", days: [...selectedDays.value].sort((a, b) => a - b) });
}

function hydrate() {
  const r = props.modelValue || { type: "daily" };
  localType.value = r.type === "weekly" ? "weekly" : "daily";
  selectedDays.value = Array.isArray(r.days) ? [...r.days] : [];
}

onMounted(() => {
  hydrate();
  emitRule();
});
watch(
  () => props.modelValue,
  () => hydrate(),
  { deep: true },
);
</script>

<style scoped>
.recurrence-picker {
  border: 1px solid rgba(0, 0, 0, 0.08);
}

.recurrence-picker__title {
  color: rgb(var(--v-theme-on-surface));
}

.recurrence-picker__hint {
  color: rgb(var(--v-theme-on-surface-variant));
}

.recurrence-picker :deep(.v-selection-control) {
  min-height: 34px;
}

.recurrence-picker :deep(.v-label),
.recurrence-picker :deep(.v-chip__content) {
  color: rgb(var(--v-theme-on-surface));
}
</style>
