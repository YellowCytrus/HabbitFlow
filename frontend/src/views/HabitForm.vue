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
          :variant="selectedEmoji === em ? 'flat' : 'outlined'"
          class="icon-pick"
          :color="selectedEmoji === em ? 'primary-container' : undefined"
          :class="{ 'icon-pick--on': selectedEmoji === em }"
          @click="selectedEmoji = em"
        >
          <span class="text-h6" :class="{ 'icon-pick__emoji--on': selectedEmoji === em }">{{ em }}</span>
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

      <v-card class="pa-6 mb-8" variant="outlined" rounded="lg" color="surface-variant">
        <h2 class="text-subtitle-1 font-weight-bold mb-2 habit-help-title">Зачем микро-шаг?</h2>
        <p class="text-body-2 mb-0 habit-help-text">
          В тяжёлые дни можно отметить микро-шаг вместо полного выполнения. Это лучше, чем ничего, и помогает
          сохранить привычку.
        </p>
      </v-card>

      <v-expansion-panels class="mb-8" variant="accordion" rounded="lg">
        <v-expansion-panel>
          <v-expansion-panel-title>Дополнительно</v-expansion-panel-title>
          <v-expansion-panel-text>
            <v-text-field
              :model-value="reminderTimeLabel"
              label="Время напоминания (необязательно)"
              prepend-inner-icon="mdi-clock-outline"
              class="mb-4"
              readonly
              @click="openTimePicker"
            />
            <v-dialog v-model="timePickerOpen" max-width="360">
              <v-card>
                <v-card-title class="text-subtitle-1 font-weight-medium pt-5 pb-2">Время напоминания</v-card-title>
                <v-card-text class="pt-0">
                  <v-time-picker
                    v-model="timePickerValue"
                    format="24hr"
                    title=""
                    color="primary"
                    class="habit-time-picker"
                  />
                </v-card-text>
                <v-card-actions class="px-5 pb-5">
                  <v-btn variant="text" class="text-none" @click="clearTime">Очистить</v-btn>
                  <v-spacer />
                  <v-btn variant="text" class="text-none" @click="cancelTimePicker">Отмена</v-btn>
                  <v-btn color="primary" class="text-none" @click="applyTimePicker">Готово</v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
            <v-switch
              v-model="adaptiveReminder"
              label="Адаптивное напоминание"
              color="primary"
              class="mb-4"
              hide-details
            />
            <RecurrencePicker v-model="recurrenceRule" class="mb-4" />
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
const timePickerOpen = ref(false);
const timePickerValue = ref("08:00");
const adaptiveReminder = ref(false);
const recurrenceRule = ref({ type: "daily" });
const error = ref("");
const reminderTimeLabel = computed(() => reminderTime.value || "Не выбрано");

function openTimePicker() {
  timePickerValue.value = reminderTime.value || "08:00";
  timePickerOpen.value = true;
}

function cancelTimePicker() {
  timePickerOpen.value = false;
}

function applyTimePicker() {
  reminderTime.value = timePickerValue.value || "";
  timePickerOpen.value = false;
}

function clearTime() {
  reminderTime.value = "";
  timePickerOpen.value = false;
}

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
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}
.icon-pick--on {
  transform: scale(1.06);
  box-shadow: 0 6px 18px rgba(0, 113, 227, 0.22);
}

.icon-pick__emoji--on {
  filter: saturate(1.15);
}

.habit-help-title {
  color: rgb(var(--v-theme-on-surface));
}

.habit-help-text {
  color: rgb(var(--v-theme-on-surface-variant));
}

.habit-form-page :deep(.v-expansion-panel-title) {
  font-weight: 600;
}

.habit-form-page :deep(.v-expansion-panel-text__wrapper) {
  padding-top: 8px;
}

.habit-time-picker {
  border-radius: 16px;
}
</style>
