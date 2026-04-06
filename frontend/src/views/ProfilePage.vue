<template>
  <div class="profile-page pb-8">
    <h1 class="text-h5 font-weight-medium mb-8">Профиль</h1>

    <v-snackbar v-model="snackOk" color="primary" location="bottom" rounded="lg">{{ message }}</v-snackbar>
    <v-alert v-if="error" type="error" variant="tonal" class="mb-6" rounded="lg" closable @click:close="error = ''">
      {{ error }}
    </v-alert>

    <v-row>
      <v-col cols="12" lg="7">
        <v-card class="pa-6 mb-6" elevation="2">
          <h2 class="text-subtitle-1 font-weight-bold mb-6">Статистика</h2>
          <v-row dense>
            <v-col cols="6">
              <div class="text-h4 font-weight-medium text-primary mb-1">{{ metrics.active }}</div>
              <div class="text-body-2 text-medium-emphasis">Активных привычек</div>
            </v-col>
            <v-col cols="6">
              <div class="text-h4 font-weight-medium text-primary mb-1">{{ metrics.streakMax }}</div>
              <div class="text-body-2 text-medium-emphasis">Дней подряд (макс.)</div>
            </v-col>
            <v-col cols="6" class="mt-4">
              <div class="text-h4 font-weight-medium text-primary mb-1">{{ metrics.done30 }}</div>
              <div class="text-body-2 text-medium-emphasis">Выполнено (30 дн.)</div>
            </v-col>
            <v-col cols="6" class="mt-4">
              <div class="text-h4 font-weight-medium text-primary mb-1">{{ metrics.micro30 }}</div>
              <div class="text-body-2 text-medium-emphasis">Микро-шагов (30 дн.)</div>
            </v-col>
          </v-row>
          <v-divider class="my-6" />
          <p class="text-body-2 text-medium-emphasis mb-0">{{ memberLine }}</p>
        </v-card>

        <v-card class="pa-6 mb-6 text-center quote-card" elevation="1" color="surface-variant">
          <p class="text-body-1 font-italic mb-0">
            «{{ quoteSteps }} шагов сделано. Каждый из них — это победа!»
          </p>
        </v-card>
      </v-col>

      <v-col cols="12" lg="5">
        <v-card class="pa-6 mb-6" elevation="2">
          <h2 class="text-subtitle-1 font-weight-bold mb-6">Настройки</h2>
          <v-form @submit.prevent="saveProfile">
            <v-text-field v-model="name" label="Имя" autocomplete="name" class="mb-4" />
            <v-text-field v-model="email" label="Email" type="email" autocomplete="email" class="mb-6" />
            <v-btn type="submit" color="primary" class="text-none" :loading="savingProfile">Сохранить</v-btn>
          </v-form>
        </v-card>

        <v-expansion-panels variant="accordion" class="mb-6" rounded="lg">
          <v-expansion-panel>
            <v-expansion-panel-title>Уведомления и пароль</v-expansion-panel-title>
            <v-expansion-panel-text>
              <v-form class="mb-6" @submit.prevent="saveSettings">
                <v-switch v-model="globalEnabled" label="Глобальные уведомления" color="primary" hide-details class="mb-4" />
                <p v-if="notificationSupported" class="text-body-2 text-medium-emphasis mb-3">
                  Напоминания приходят в браузере в время, указанное у каждой привычки. Сайт должен быть открыт (вкладка может
                  быть в фоне).
                  <span v-if="notificationPermissionLabel" class="d-block mt-1">Статус: {{ notificationPermissionLabel }}</span>
                </p>
                <v-alert v-else type="info" variant="tonal" density="compact" class="mb-4" rounded="lg">
                  В этом браузере уведомления недоступны (нужен HTTPS или localhost).
                </v-alert>
                <v-btn
                  v-if="notificationSupported && notificationPermission === 'default'"
                  type="button"
                  color="secondary"
                  variant="tonal"
                  class="text-none mb-4"
                  @click="requestBrowserNotifications"
                >
                  Разрешить уведомления в браузере
                </v-btn>
                <template v-if="notificationSupported && notificationPermission === 'denied'">
                  <v-alert type="warning" variant="tonal" density="comfortable" class="mb-3" rounded="lg">
                    Вы нажали «Блокировать» — браузер больше не покажет этот запрос сам. Включите уведомления вручную: значок
                    замка или «i» слева от адреса → разрешения сайта → уведомления → разрешить для этого сайта. Потом нажмите
                    кнопку ниже.
                  </v-alert>
                  <v-btn
                    type="button"
                    color="secondary"
                    variant="tonal"
                    class="text-none mb-4"
                    @click="recheckNotificationPermission"
                  >
                    Проверить снова
                  </v-btn>
                </template>
                <v-select
                  v-model="reminderTone"
                  label="Тон напоминаний"
                  :items="[
                    { value: 'soft', title: 'Мягкий' },
                    { value: 'neutral', title: 'Нейтральный' },
                  ]"
                  item-title="title"
                  item-value="value"
                  class="mb-4"
                />
                <v-btn type="submit" color="primary" variant="tonal" class="text-none">Сохранить настройки</v-btn>
              </v-form>
              <v-divider class="my-4" />
              <p class="text-subtitle-2 font-weight-medium mb-3">Смена пароля</p>
              <v-form @submit.prevent="changePassword">
                <v-text-field
                  v-model="oldPassword"
                  label="Текущий пароль"
                  type="password"
                  autocomplete="current-password"
                  class="mb-3"
                />
                <v-text-field
                  v-model="newPassword"
                  label="Новый пароль"
                  type="password"
                  hint="Минимум 8 символов"
                  persistent-hint
                  autocomplete="new-password"
                  class="mb-4"
                />
                <v-btn type="submit" variant="outlined" class="text-none">Обновить пароль</v-btn>
              </v-form>
            </v-expansion-panel-text>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-col>
    </v-row>
  </div>
</template>

<script setup>
import { computed, onMounted, onUnmounted, ref } from "vue";
import { api } from "../api/client";
import { localToday } from "../util/date";

const notificationSupported = typeof Notification !== "undefined";
const notificationPermission = ref(
  notificationSupported ? Notification.permission : "denied",
);

const notificationPermissionLabel = computed(() => {
  const p = notificationPermission.value;
  if (p === "granted") return "разрешены";
  if (p === "denied") return "запрещены в настройках браузера";
  if (p === "default") return "ещё не запрошено";
  return "";
});

async function requestBrowserNotifications() {
  if (!notificationSupported) return;
  const r = await Notification.requestPermission();
  notificationPermission.value = r;
}

function recheckNotificationPermission() {
  if (!notificationSupported) return;
  notificationPermission.value = Notification.permission;
  if (notificationPermission.value === "granted") {
    message.value = "Уведомления для сайта разрешены.";
    snackOk.value = true;
  } else if (notificationPermission.value === "denied") {
    message.value = "Браузер всё ещё блокирует уведомления — проверьте настройки сайта.";
    snackOk.value = true;
  }
}

async function maybeRequestNotificationPermission() {
  if (!notificationSupported || !globalEnabled.value) return;
  if (Notification.permission !== "default") return;
  const r = await Notification.requestPermission();
  notificationPermission.value = r;
}

const profile = ref(null);
const name = ref("");
const email = ref("");
const globalEnabled = ref(true);
const reminderTone = ref("neutral");
const oldPassword = ref("");
const newPassword = ref("");
const message = ref("");
const error = ref("");
const snackOk = ref(false);
const savingProfile = ref(false);

const metrics = ref({
  active: 0,
  streakMax: 0,
  done30: 0,
  micro30: 0,
});

const memberLine = computed(() => "Спасибо, что вы с HabitFlow — забота о вас в каждой детали.");

const quoteSteps = computed(() => metrics.value.done30 + metrics.value.micro30);

async function loadStats() {
  try {
    const { data: habits } = await api.get("/api/v1/habits");
    const today = localToday();
    const end = new Date();
    const start = new Date();
    start.setDate(start.getDate() - 29);
    const pad = (n) => String(n).padStart(2, "0");
    const from = `${start.getFullYear()}-${pad(start.getMonth() + 1)}-${pad(start.getDate())}`;
    const to = today;

    const details = await Promise.all(
      habits.map((h) => api.get(`/api/v1/habits/${h.id}`).then((r) => r.data)),
    );
    const streakMax = details.length ? Math.max(...details.map((d) => d.streak || 0)) : 0;

    let done30 = 0;
    let micro30 = 0;
    await Promise.all(
      habits.map(async (h) => {
        const { data: logs } = await api.get(`/api/v1/habits/${h.id}/logs`, { params: { from, to } });
        logs.forEach((row) => {
          if (row.status === "full") done30 += 1;
          if (row.status === "micro") micro30 += 1;
        });
      }),
    );

    metrics.value = {
      active: habits.length,
      streakMax,
      done30,
      micro30,
    };
  } catch {
    /* ignore stats if habits fail */
  }
}

async function load() {
  error.value = "";
  try {
    const { data } = await api.get("/api/v1/profile");
    profile.value = data;
    name.value = data.user.name;
    email.value = data.user.email;
    globalEnabled.value = data.settings.global_enabled;
    reminderTone.value = data.settings.reminder_tone;
    await loadStats();
  } catch {
    error.value = "Не удалось загрузить профиль.";
  }
}

async function saveProfile() {
  message.value = "";
  error.value = "";
  savingProfile.value = true;
  try {
    await api.put("/api/v1/profile", { name: name.value, email: email.value });
    message.value = "Профиль сохранён.";
    snackOk.value = true;
    await load();
  } catch (e) {
    error.value = e.response?.data?.detail || "Не удалось обновить.";
  } finally {
    savingProfile.value = false;
  }
}

async function saveSettings() {
  message.value = "";
  error.value = "";
  try {
    if (globalEnabled.value) {
      await maybeRequestNotificationPermission();
    }
    await api.put("/api/v1/profile/settings", {
      global_enabled: globalEnabled.value,
      reminder_tone: reminderTone.value,
    });
    message.value = "Настройки сохранены.";
    snackOk.value = true;
    await load();
  } catch (e) {
    error.value = e.response?.data?.detail || "Ошибка сохранения.";
  }
}

async function changePassword() {
  message.value = "";
  error.value = "";
  try {
    await api.post("/api/v1/profile/change-password", {
      old_password: oldPassword.value,
      new_password: newPassword.value,
    });
    message.value = "Пароль обновлён.";
    snackOk.value = true;
    oldPassword.value = "";
    newPassword.value = "";
  } catch (e) {
    error.value = e.response?.data?.detail || "Смена пароля не удалась.";
  }
}

function syncNotificationPermissionFromBrowser() {
  if (notificationSupported) {
    notificationPermission.value = Notification.permission;
  }
}

onMounted(() => {
  syncNotificationPermissionFromBrowser();
  window.addEventListener("focus", syncNotificationPermissionFromBrowser);
  load();
});

onUnmounted(() => {
  window.removeEventListener("focus", syncNotificationPermissionFromBrowser);
});
</script>

<style scoped>
.quote-card {
  border: 1px solid rgba(var(--v-theme-outline), 0.12);
}
</style>
