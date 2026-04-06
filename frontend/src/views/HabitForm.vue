<template>
  <div class="habit-form-page pb-8">
    <v-btn variant="text" class="text-none pl-0 mb-2" prepend-icon="mdi-arrow-left" :to="cancelTarget">
      Назад
    </v-btn>

    <h1 class="text-h5 font-weight-medium mb-2">{{ isEdit ? "Редактировать" : "Новая привычка" }}</h1>
    <p class="text-body-2 text-medium-emphasis mb-8">
      Добавьте привычку и её микро-версию для сложных дней.
    </p>

    <v-alert v-if="error" type="error" variant="tonal" class="mb-6" rounded="lg" closable @click:close="error = ''">
      {{ error }}
    </v-alert>

    <v-form @submit.prevent="submit">
      <p class="text-subtitle-2 font-weight-medium mb-3">Иконка</p>
      <div class="d-flex flex-wrap ga-2 mb-8">
        <v-btn
          v-for="em in iconChoices"
          :key="em"
          size="large"
          variant="outlined"
          class="icon-pick"
          :color="selectedEmoji === em ? 'primary' : undefined"
          :class="{ 'icon-pick--on': selectedEmoji === em }"
          @click="selectedEmoji = em"
        >
          <span class="text-h6">{{ em }}</span>
        </v-btn>
      </div>

      <v-text-field
        v-model="titlePlain"
        label="Название привычки"
        placeholder="Например: Медитация"
        class="mb-2"
        required
      />
      <v-text-field
        v-model="microStep"
        label="Микро-шаг"
        placeholder="Например: 1 глубокий вдох"
        class="mb-2"
        required
      />
      <p class="text-caption text-medium-emphasis mb-6">
        Что можно сделать за 30 секунд, когда совсем нет сил?
      </p>

      <v-card class="pa-6 mb-8" variant="outlined" rounded="lg" color="surface">
        <h2 class="text-subtitle-1 font-weight-bold mb-2">Зачем микро-шаг?</h2>
        <p class="text-body-2 text-medium-emphasis mb-0">
          В тяжёлые дни можно отметить микро-шаг вместо полного выполнения. Это лучше, чем ничего, и помогает
          сохранить привычку.
        </p>
      </v-card>

      <v-expansion-panels class="mb-8" variant="accordion" rounded="lg">
        <v-expansion-panel>
          <v-expansion-panel-title>Дополнительно</v-expansion-panel-title>
          <v-expansion-panel-text>
            <v-text-field
              v-model="reminderTime"
              label="Время напоминания"
              type="time"
              class="mb-4"
              hint="Необязательно"
              persistent-hint
            />
            <v-switch
              v-model="adaptiveReminder"
              label="Адаптивное напоминание"
              color="primary"
              class="mb-4"
              hide-details
            />
            <RecurrencePicker v-model="recurrenceRule" class="mb-4" />
            <TimeSlotPicker
              :deadline-type="deadlineType"
              :deadline-value="deadlineValue"
              @update:deadline-type="deadlineType = $event"
              @update:deadline-value="deadlineValue = $event"
            />
          </v-expansion-panel-text>
        </v-expansion-panel>
      </v-expansion-panels>

      <div class="d-flex flex-column flex-sm-row ga-3">
        <v-btn type="submit" color="primary" size="large" class="text-none flex-grow-1 flex-sm-grow-0" min-width="200">
          {{ isEdit ? "Сохранить" : "Создать привычку" }}
        </v-btn>
        <v-btn variant="outlined" size="large" class="text-none" min-width="160" :to="cancelTarget"> Отмена </v-btn>
      </div>
    </v-form>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { api } from "../api/client";
import RecurrencePicker from "../components/RecurrencePicker.vue";
import TimeSlotPicker from "../components/TimeSlotPicker.vue";
import { habitTitleWithEmoji, splitHabitTitle } from "../util/habitDisplay";

const route = useRoute();
const router = useRouter();
const habitId = computed(() => route.params.id);
const isEdit = computed(() => Boolean(habitId.value));
const cancelTarget = computed(() => (isEdit.value ? { name: "habits-show", params: { id: habitId.value } } : { name: "habits" }));

const iconChoices = ["🧘", "📖", "🚶", "💪", "🎨", "✍️", "🎵", "🌱", "💤", "🍎"];

const selectedEmoji = ref("🌱");
const titlePlain = ref("");
const microStep = ref("");
const reminderTime = ref("");
const adaptiveReminder = ref(false);
const recurrenceRule = ref({ type: "daily" });
const deadlineType = ref("slot");
const deadlineValue = ref("morning");
const error = ref("");

onMounted(async () => {
  if (!isEdit.value) return;
  try {
    const { data } = await api.get(`/api/v1/habits/${habitId.value}`);
    const split = splitHabitTitle(data.title);
    selectedEmoji.value = split.emoji || "🌱";
    titlePlain.value = split.text || data.title;
    microStep.value = data.micro_step || "";
    reminderTime.value = data.reminder_time ? String(data.reminder_time).slice(0, 5) : "";
    adaptiveReminder.value = data.adaptive_reminder;
    recurrenceRule.value = data.recurrence_rule || { type: "daily" };
    deadlineType.value = data.deadline_type;
    deadlineValue.value = data.deadline_value;
  } catch {
    error.value = "Не удалось загрузить привычку.";
  }
});

async function submit() {
  error.value = "";
  const fullTitle = habitTitleWithEmoji(selectedEmoji.value, titlePlain.value);
  const plain = titlePlain.value.trim();
  if (!plain) {
    error.value = "Укажите название.";
    return;
  }
  if (!microStep.value.trim()) {
    error.value = "Укажите микро-шаг.";
    return;
  }
  const body = {
    title: fullTitle,
    main_goal: plain,
    micro_step: microStep.value.trim(),
    reminder_time: reminderTime.value ? `${reminderTime.value}:00` : null,
    adaptive_reminder: adaptiveReminder.value,
    recurrence_rule: recurrenceRule.value,
    deadline_type: deadlineType.value,
    deadline_value: deadlineValue.value,
  };
  try {
    if (isEdit.value) {
      await api.put(`/api/v1/habits/${habitId.value}`, body);
    } else {
      await api.post("/api/v1/habits", body);
    }
    router.push({ name: "habits" });
  } catch (e) {
    error.value = e.response?.data?.detail || "Сохранение не удалось.";
  }
}
</script>

<style scoped>
.icon-pick {
  min-width: 3rem;
  transition: transform 0.15s ease;
}
.icon-pick--on {
  transform: scale(1.06);
}
</style>
