<template>
  <v-card
    class="habit-card pa-4 mb-3 transition-surface"
    :class="{ 'habit-card--active': isHighlighted }"
    elevation="2"
    rounded="lg"
    @click="$emit('click')"
  >
    <div class="d-flex flex-column flex-sm-row align-sm-center ga-4">
      <div class="habit-card__icon text-h4 flex-shrink-0">{{ displayEmoji || defaultIcon }}</div>
      <div class="flex-grow-1 min-w-0">
        <h3 class="text-subtitle-1 font-weight-bold mb-1">{{ displayTitle }}</h3>
        <p v-if="microLine" class="text-body-2 text-medium-emphasis mb-0">{{ microLine }}</p>
      </div>
      <div class="d-flex flex-wrap ga-2 flex-shrink-0 justify-sm-end">
        <v-btn
          size="small"
          color="primary"
          class="text-none"
          :disabled="todayStatus === 'full'"
          @click.stop="$emit('done')"
        >
          Готово
        </v-btn>
        <v-btn
          v-if="habit.micro_step"
          size="small"
          color="tertiary"
          variant="tonal"
          class="text-none"
          :disabled="todayStatus === 'full' || todayStatus === 'micro'"
          @click.stop="$emit('micro')"
        >
          Микро
        </v-btn>
        <v-btn
          size="small"
          variant="outlined"
          class="text-none"
          :disabled="todayStatus === 'missed' || todayStatus === 'full'"
          @click.stop="$emit('skip')"
        >
          Пропуск
        </v-btn>
      </div>
    </div>
  </v-card>
</template>

<script setup>
import { computed } from "vue";
import { splitHabitTitle } from "../util/habitDisplay";

const props = defineProps({
  habit: { type: Object, required: true },
  todayStatus: { type: String, default: "none" },
});

defineEmits(["click", "done", "micro", "skip"]);

const parsed = computed(() => splitHabitTitle(props.habit.title));
const displayEmoji = computed(() => parsed.value.emoji);
const displayTitle = computed(() => parsed.value.text || props.habit.title);

const defaultIcon = "🌿";

const microLine = computed(() => {
  if (props.habit.micro_step) {
    return `Микро-шаг: ${props.habit.micro_step}`;
  }
  return "";
});

const isHighlighted = computed(() => props.todayStatus === "micro" || props.todayStatus === "full");
</script>

<style scoped>
.habit-card--active {
  background: rgba(var(--v-theme-primary-container), 0.35) !important;
  border: 1px solid rgba(var(--v-theme-primary), 0.35);
}
.transition-surface {
  cursor: pointer;
  transition:
    background-color 0.2s cubic-bezier(0.2, 0, 0, 1),
    box-shadow 0.2s cubic-bezier(0.2, 0, 0, 1),
    border-color 0.2s ease;
}
.habit-card__icon {
  line-height: 1.2;
  width: 2.5rem;
  text-align: center;
}
</style>
