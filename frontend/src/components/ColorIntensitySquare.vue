<template>
  <span
    class="color-intensity-square"
    :class="[`color-intensity-square--${palette}`]"
    :data-level="level"
    role="img"
    :aria-label="ariaLabel"
  />
</template>

<script setup>
import { computed } from "vue";

const props = defineProps({
  level: { type: Number, required: true },
  /** intensity: дни календаря (0–4 от API). semantic: привычка (0 нет, 2 пропуск, 3 микро, 4 готово). */
  palette: { type: String, default: "intensity" },
});

const ariaLabel = computed(() => {
  if (props.palette === "semantic") {
    const labels = { 4: "Готово", 3: "Микро-шаг", 2: "Пропуск", 0: "Нет данных" };
    return labels[props.level] ?? `Статус ${props.level}`;
  }
  const labels = {
    4: "Все выполнено",
    3: "Высокая активность",
    2: "Частично",
    1: "Низкая активность",
    0: "Нет данных",
  };
  return labels[props.level] ?? `Интенсивность ${props.level}`;
});
</script>

<style scoped>
.color-intensity-square {
  display: inline-block;
  width: 100%;
  height: 100%;
  min-width: 8px;
  min-height: 8px;
  border-radius: 6px;
  box-sizing: border-box;
  transition: background-color 0.2s ease;
}

/* Календарь: градации primary */
.color-intensity-square--intensity[data-level="4"] {
  background: rgb(var(--v-theme-primary));
}
.color-intensity-square--intensity[data-level="3"] {
  background: rgb(var(--v-theme-primary));
  opacity: 0.72;
}
.color-intensity-square--intensity[data-level="2"] {
  background: rgb(var(--v-theme-primary));
  opacity: 0.48;
}
.color-intensity-square--intensity[data-level="1"] {
  background: rgb(var(--v-theme-primary));
  opacity: 0.26;
}
.color-intensity-square--intensity[data-level="0"] {
  background: rgb(var(--v-theme-surface));
  border: 1px solid rgba(var(--v-theme-outline), 0.22);
}

/* Деталь привычки: готово / микро / пропуск / пусто */
.color-intensity-square--semantic[data-level="4"] {
  background: rgb(var(--v-theme-primary));
  opacity: 1;
}
.color-intensity-square--semantic[data-level="3"] {
  background: rgb(var(--v-theme-tertiary));
  opacity: 0.9;
}
.color-intensity-square--semantic[data-level="2"] {
  background: rgb(var(--v-theme-secondary));
  opacity: 0.4;
}
.color-intensity-square--semantic[data-level="0"] {
  background: rgb(var(--v-theme-surface));
  border: 1px solid rgba(var(--v-theme-outline), 0.25);
  opacity: 1;
}
</style>
