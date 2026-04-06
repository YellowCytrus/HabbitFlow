<template>
  <v-dialog :model-value="open" max-width="420" rounded="lg" scrollable @update:model-value="onUpdate">
    <v-card>
      <v-card-title class="text-h6 font-weight-medium">{{ formattedTitle }}</v-card-title>
      <v-divider />
      <v-card-text class="pa-4">
        <ul v-if="habits.length" class="pl-4 mb-0">
          <li v-for="h in habits" :key="h.habit_id" class="mb-2">
            <span class="font-weight-medium">{{ h.title }}</span>
            — {{ statusRu(h.status) }}
          </li>
        </ul>
        <p v-else class="text-medium-emphasis mb-0">Нет записей на этот день.</p>
      </v-card-text>
      <v-card-actions class="px-4 pb-4">
        <v-spacer />
        <v-btn variant="text" class="text-none" @click="$emit('close')">Закрыть</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script setup>
import { computed } from "vue";

const props = defineProps({
  open: { type: Boolean, default: false },
  date: { type: String, default: "" },
  habits: { type: Array, default: () => [] },
});

const emit = defineEmits(["close"]);

const formattedTitle = computed(() => {
  if (!props.date) return "День";
  const [y, m, d] = props.date.split("-").map(Number);
  const dt = new Date(y, m - 1, d);
  return new Intl.DateTimeFormat("ru-RU", {
    weekday: "long",
    day: "numeric",
    month: "long",
    year: "numeric",
  }).format(dt);
});

function statusRu(s) {
  if (s === "full") return "выполнено";
  if (s === "micro") return "микро-шаг";
  if (s === "missed") return "пропуск";
  return "ожидает";
}

function onUpdate(v) {
  if (!v) emit("close");
}
</script>
