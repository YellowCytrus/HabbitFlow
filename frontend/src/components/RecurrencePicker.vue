<template>
  <fieldset class="recurrence-picker">
    <legend class="recurrence-picker__legend">Repetition</legend>
    <label class="recurrence-picker__label">
      <span>Type</span>
      <select v-model="localType" class="recurrence-picker__select" @change="emitRule">
        <option value="daily">Daily</option>
        <option value="weekly">Weekly</option>
      </select>
    </label>
    <div v-if="localType === 'weekly'" class="recurrence-picker__days">
      <span class="recurrence-picker__days-label">Days (ISO weekday 1=Mon)</span>
      <div class="recurrence-picker__day-grid">
        <label v-for="d in dayOptions" :key="d" class="recurrence-picker__day">
          <input v-model="selectedDays" type="checkbox" :value="d" @change="emitRule" />
          {{ d }}
        </label>
      </div>
    </div>
  </fieldset>
</template>

<script setup>
import { ref, watch, onMounted } from "vue";

const props = defineProps({
  modelValue: { type: Object, default: () => ({ type: "daily" }) },
});

const emit = defineEmits(["update:modelValue"]);

const localType = ref("daily");
const selectedDays = ref([]);
const dayOptions = [1, 2, 3, 4, 5, 6, 7];

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
