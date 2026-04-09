<template>
  <div class="pb-8">
    <h1 class="text-h5 font-weight-medium mb-6">Тест уведомлений</h1>

    <v-alert v-if="!notificationSupported" type="warning" variant="tonal" class="mb-4" rounded="lg">
      В этом браузере уведомления недоступны.
    </v-alert>

    <v-card class="pa-6 mb-6" elevation="2">
      <h2 class="text-subtitle-1 font-weight-bold mb-4">Параметры</h2>
      <v-row>
        <v-col cols="12" md="6">
          <v-switch v-model="globalEnabled" label="Глобально включено" color="primary" hide-details class="mb-2" />
          <v-select
            v-model="tone"
            label="Тон"
            :items="[
              { value: 'soft', title: 'Мягкий' },
              { value: 'neutral', title: 'Нейтральный' },
            ]"
            item-title="title"
            item-value="value"
            class="mb-2"
          />
          <v-text-field v-model="title" label="Заголовок" class="mb-2" />
          <v-textarea v-model="body" label="Текст уведомления" rows="2" auto-grow />
        </v-col>
        <v-col cols="12" md="6">
          <v-switch v-model="respectQuietHours" label="Учитывать тихие часы" color="primary" hide-details class="mb-2" />
          <v-text-field v-model="quietStart" label="Тихие часы: начало (HH:MM)" class="mb-2" />
          <v-text-field v-model="quietEnd" label="Тихие часы: конец (HH:MM)" class="mb-4" />
          <v-text-field v-model.number="delayMinutes" type="number" min="1" label="Отправить через N минут" />
        </v-col>
      </v-row>

      <div class="d-flex flex-wrap ga-2 mt-3">
        <v-btn color="secondary" variant="tonal" class="text-none" @click="requestPermission">Запросить разрешение</v-btn>
        <v-btn color="primary" class="text-none" :disabled="!canSend" @click="sendNow">Отправить сейчас</v-btn>
        <v-btn color="primary" variant="outlined" class="text-none" :disabled="!canSend" @click="scheduleInMinutes">
          Запланировать через N минут
        </v-btn>
        <v-btn color="error" variant="text" class="text-none" @click="cancelAll">Отменить отложенные</v-btn>
      </div>
    </v-card>

    <v-card class="pa-6" elevation="1">
      <h2 class="text-subtitle-1 font-weight-bold mb-4">Лог</h2>
      <p class="text-body-2 text-medium-emphasis mb-3">Permission: {{ permission }}</p>
      <v-list density="comfortable">
        <v-list-item v-for="row in logs" :key="row.id" :title="row.title" :subtitle="row.subtitle" />
        <v-list-item v-if="logs.length === 0" title="Пока пусто" subtitle="Сделайте тестовую отправку" />
      </v-list>
    </v-card>
  </div>
</template>

<script setup>
import { computed, ref } from "vue";

const notificationSupported = typeof Notification !== "undefined";
const permission = ref(notificationSupported ? Notification.permission : "denied");

const globalEnabled = ref(true);
const tone = ref("neutral");
const title = ref("HabitFlow");
const body = ref("Тестовое уведомление");
const delayMinutes = ref(1);
const respectQuietHours = ref(false);
const quietStart = ref("23:00");
const quietEnd = ref("07:00");

const logs = ref([]);
const pendingTimers = ref([]);

const canSend = computed(() => notificationSupported && permission.value === "granted");

function pushLog(message, details = "") {
  logs.value.unshift({
    id: crypto.randomUUID(),
    title: message,
    subtitle: `${new Date().toLocaleTimeString()} ${details}`.trim(),
  });
}

function parseTimeToMinutes(str) {
  const match = /^(\d{1,2}):(\d{2})$/.exec(String(str || "").trim());
  if (!match) return null;
  const h = Number.parseInt(match[1], 10);
  const m = Number.parseInt(match[2], 10);
  if (h < 0 || h > 23 || m < 0 || m > 59) return null;
  return h * 60 + m;
}

function inQuietHours(now) {
  if (!respectQuietHours.value) return false;
  const start = parseTimeToMinutes(quietStart.value);
  const end = parseTimeToMinutes(quietEnd.value);
  if (start == null || end == null) return false;
  const cur = now.getHours() * 60 + now.getMinutes();
  if (start <= end) return cur >= start && cur < end;
  return cur >= start || cur < end;
}

function buildBody() {
  if (tone.value === "soft") return `${body.value} (мягкий тон)`;
  return body.value;
}

async function requestPermission() {
  if (!notificationSupported) return;
  permission.value = await Notification.requestPermission();
  pushLog("Проверка разрешения", `-> ${permission.value}`);
}

function emitNotification(source) {
  if (!globalEnabled.value) {
    pushLog("Пропуск", "global_enabled = false");
    return;
  }
  if (inQuietHours(new Date())) {
    pushLog("Пропуск", "сейчас тихие часы");
    return;
  }
  try {
    new Notification(title.value, {
      body: buildBody(),
      tag: `notif-test-${Date.now()}`,
    });
    pushLog("Отправлено", `(${source})`);
  } catch {
    pushLog("Ошибка", "браузер не показал уведомление");
  }
}

function sendNow() {
  emitNotification("now");
}

function scheduleInMinutes() {
  const mins = Number(delayMinutes.value);
  if (!Number.isFinite(mins) || mins <= 0) {
    pushLog("Ошибка", "N минут должно быть > 0");
    return;
  }
  const ms = Math.round(mins * 60_000);
  const dueAt = new Date(Date.now() + ms);
  const timerId = window.setTimeout(() => {
    emitNotification(`delay ${mins}m`);
    pendingTimers.value = pendingTimers.value.filter((x) => x.id !== timerId);
  }, ms);
  pendingTimers.value.push({ id: timerId });
  pushLog("Запланировано", `на ${dueAt.toLocaleTimeString()}`);
}

function cancelAll() {
  pendingTimers.value.forEach((x) => clearTimeout(x.id));
  const count = pendingTimers.value.length;
  pendingTimers.value = [];
  pushLog("Отменено", `таймеров: ${count}`);
}
</script>
