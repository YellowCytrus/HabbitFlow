<template>
  <div class="auth-wrap py-8 py-md-12">
    <header class="auth-wrap__bar d-flex align-center justify-space-between mb-8">
      <RouterLink to="/" class="text-decoration-none text-primary font-weight-bold">[HabitFlow]</RouterLink>
    </header>

    <v-card class="mx-auto auth-card" max-width="440" elevation="4">
      <v-card-text class="pa-8">
        <div class="d-flex mb-6" role="tablist">
          <v-btn
            variant="text"
            class="text-none flex-grow-1"
            :color="tab === 'login' ? 'primary' : undefined"
            :aria-selected="tab === 'login'"
            @click="tab = 'login'"
          >
            Вход
          </v-btn>
          <v-btn
            variant="text"
            class="text-none flex-grow-1"
            :color="tab === 'register' ? 'primary' : undefined"
            :aria-selected="tab === 'register'"
            @click="tab = 'register'"
          >
            Регистрация
          </v-btn>
        </div>

        <template v-if="tab === 'login'">
          <h1 class="text-h5 font-weight-medium mb-2">Вход</h1>
          <p class="text-body-2 text-medium-emphasis mb-6">
            Введите email и пароль. Для нового аккаунта переключитесь на «Регистрация».
          </p>
          <v-form @submit.prevent="onLogin">
            <v-text-field
              v-model="loginEmail"
              type="email"
              label="Email"
              placeholder="test@example.com"
              autocomplete="email"
              class="mb-3"
            />
            <v-text-field
              v-model="loginPassword"
              type="password"
              label="Пароль"
              autocomplete="current-password"
              class="mb-4"
            />
            <v-alert v-if="message" type="info" variant="tonal" density="compact" class="mb-4" rounded="lg">
              {{ message }}
            </v-alert>
            <v-btn type="submit" color="primary" block size="large" class="text-none mb-4">Войти</v-btn>
          </v-form>
        </template>

        <template v-else-if="registerStep === 'form'">
          <h1 class="text-h5 font-weight-medium mb-2">Регистрация</h1>
          <p class="text-body-2 text-medium-emphasis mb-6">
            Создайте аккаунт — на почту придёт 6-значный код (только для регистрации по email, не для Яндекс/VK).
          </p>
          <v-form @submit.prevent="onRegister">
            <v-text-field v-model="regName" label="Имя" autocomplete="name" class="mb-3" />
            <v-text-field
              v-model="regEmail"
              type="email"
              label="Email"
              autocomplete="email"
              class="mb-3"
            />
            <v-text-field
              v-model="regPassword"
              type="password"
              label="Пароль"
              hint="Минимум 8 символов"
              persistent-hint
              autocomplete="new-password"
              class="mb-4"
            />
            <v-alert v-if="message" type="info" variant="tonal" density="compact" class="mb-4" rounded="lg">
              {{ message }}
            </v-alert>
            <v-btn type="submit" color="primary" block size="large" class="text-none mb-4">
              Зарегистрироваться
            </v-btn>
          </v-form>
        </template>

        <template v-else>
          <h1 class="text-h5 font-weight-medium mb-2">Подтверждение email</h1>
          <p class="text-body-2 text-medium-emphasis mb-2">
            Введите 6-значный код из письма, отправленного на
            <strong>{{ pendingEmail }}</strong>
          </p>
          <p class="text-body-2 text-medium-emphasis mb-6">
            После подтверждения будет создан аккаунт в системе, профиль и настройки.
          </p>
          <v-form @submit.prevent="onConfirmCode">
            <v-text-field
              v-model="regCode"
              label="Код"
              inputmode="numeric"
              maxlength="6"
              counter="6"
              autocomplete="one-time-code"
              class="mb-4"
              @update:model-value="regCode = ($event || '').replace(/\D/g, '').slice(0, 6)"
            />
            <v-alert v-if="message" type="info" variant="tonal" density="compact" class="mb-4" rounded="lg">
              {{ message }}
            </v-alert>
            <v-btn type="submit" color="primary" block size="large" class="text-none mb-2" :disabled="regCode.length !== 6">
              Подтвердить
            </v-btn>
            <v-btn variant="text" block class="text-none mb-4" @click="onResendCode">Отправить код снова</v-btn>
            <v-btn variant="text" block class="text-none" @click="backToRegisterForm">Назад к форме</v-btn>
          </v-form>
        </template>

        <div class="d-flex flex-wrap ga-3 justify-center align-center mb-4 auth-oauth">
          <v-btn
            variant="outlined"
            size="default"
            :href="yandexUrl"
            class="text-none auth-oauth__btn"
            aria-label="Продолжить с Яндекс"
          >
            <img :src="yandexLogo" alt="" class="auth-oauth__logo auth-oauth__logo--yandex" width="88" height="20" />
          </v-btn>
          <v-btn
            variant="outlined"
            size="default"
            class="text-none auth-oauth__btn"
            aria-label="Продолжить с VK"
            @click="vkStubSnack = true"
          >
            <img :src="vkLogo" alt="" class="auth-oauth__logo auth-oauth__logo--vk" width="28" height="28" />
          </v-btn>
        </div>

        <v-snackbar v-model="vkStubSnack" location="bottom" rounded="lg">
          Вход и регистрация через VK пока в разработке.
        </v-snackbar>

        <div class="text-center">
          <RouterLink class="text-body-2 text-primary text-decoration-none" to="/">
            <v-icon icon="mdi-arrow-left" size="small" class="mr-1" />
            На главную
          </RouterLink>
        </div>
      </v-card-text>
    </v-card>
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import axios from "axios";
import { useAuthStore } from "../stores/auth";
import yandexLogo from "../../icons/yandex-text-logo.svg";
import vkLogo from "../../icons/vk-logo.svg";

const route = useRoute();
const router = useRouter();
const auth = useAuthStore();

const tab = ref("login");
const registerStep = ref("form"); // form | code
const loginEmail = ref("");
const loginPassword = ref("");
const regName = ref("");
const regEmail = ref("");
const regPassword = ref("");
const regCode = ref("");
const pendingEmail = ref("");
const message = ref("");

const apiRoot = import.meta.env.VITE_API_URL || "";

const yandexUrl = computed(() => `${apiRoot}/api/v1/auth/oauth/yandex`);
const vkStubSnack = ref(false);

watch(
  () => route.query.tab,
  (t) => {
    if (t === "register") tab.value = "register";
    if (t === "login") tab.value = "login";
  },
  { immediate: true },
);

watch(tab, (t) => {
  if (t === "register") return;
  registerStep.value = "form";
  regCode.value = "";
  pendingEmail.value = "";
});

onMounted(async () => {
  if (route.query.oauth_error) message.value = "OAuth не удался. Попробуйте ещё раз или войдите по email.";
  const at = route.query.access_token;
  const rt = route.query.refresh_token;
  if (typeof at === "string" && typeof rt === "string") {
    auth.setTokens(at, rt);
    const next = typeof route.query.next === "string" ? route.query.next : "/habits";
    router.replace(next);
    return;
  }
  const verify = route.query.verify;
  if (typeof verify === "string") {
    try {
      await axios.post(`${apiRoot}/api/v1/auth/verify-email`, { token: verify });
      message.value = "Новый email подтверждён по ссылке из письма. Можно войти.";
      tab.value = "login";
    } catch {
      message.value = "Недействительная ссылка подтверждения.";
    }
  }
});

async function onLogin() {
  message.value = "";
  try {
    const { data } = await axios.post(`${apiRoot}/api/v1/auth/login`, {
      email: loginEmail.value,
      password: loginPassword.value,
    });
    auth.setTokens(data.access_token, data.refresh_token);
    const next = typeof route.query.next === "string" ? route.query.next : "/habits";
    router.push(next);
  } catch (e) {
    const detail = e?.response?.data?.detail;
    if (detail === "Email not verified") {
      message.value = "Сначала подтвердите email кодом из письма (вкладка «Регистрация»).";
    } else {
      message.value = "Не удалось войти. Проверьте email и пароль.";
    }
  }
}

async function onRegister() {
  message.value = "";
  try {
    const { data } = await axios.post(`${apiRoot}/api/v1/auth/register`, {
      email: regEmail.value,
      password: regPassword.value,
      name: regName.value,
    });
    pendingEmail.value = data.email || regEmail.value;
    registerStep.value = "code";
    regCode.value = "";
    message.value = "Код отправлен на почту. Введите его ниже.";
  } catch {
    message.value = "Регистрация не удалась. Возможно, email уже занят или привязан к OAuth.";
  }
}

async function onConfirmCode() {
  message.value = "";
  try {
    const { data } = await axios.post(`${apiRoot}/api/v1/auth/verify-registration`, {
      email: pendingEmail.value,
      code: regCode.value,
    });
    auth.setTokens(data.access_token, data.refresh_token);
    registerStep.value = "form";
    const next = typeof route.query.next === "string" ? route.query.next : "/habits";
    router.push(next);
  } catch (e) {
    const detail = e?.response?.data?.detail;
    if (detail === "Code expired") {
      message.value = "Код истёк. Запросите новый.";
    } else {
      message.value = "Неверный код или email.";
    }
  }
}

async function onResendCode() {
  message.value = "";
  try {
    await axios.post(`${apiRoot}/api/v1/auth/resend-registration-code`, {
      email: pendingEmail.value,
    });
    message.value = "Если аккаунт ждёт подтверждения, мы отправили новый код.";
  } catch {
    message.value = "Не удалось отправить код. Попробуйте позже.";
  }
}

function backToRegisterForm() {
  registerStep.value = "form";
  regCode.value = "";
  message.value = "";
}
</script>

<style scoped>
.auth-wrap {
  max-width: 1120px;
  margin: 0 auto;
  padding-left: 20px;
  padding-right: 20px;
}
.auth-wrap__bar {
  padding: 12px 16px;
  margin: -8px -16px 24px;
  border-radius: 0 0 18px 18px;
  background: rgba(255, 255, 255, 0.48);
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.65);
  border-top: none;
  box-shadow: 0 8px 28px rgba(0, 0, 0, 0.05), inset 0 1px 0 rgba(255, 255, 255, 0.85);
}
.auth-card {
  border-radius: 20px !important;
}
.auth-oauth__btn {
  min-width: 0;
  padding-inline: 16px;
  height: 44px !important;
}
.auth-oauth__logo {
  display: block;
  object-fit: contain;
}
.auth-oauth__logo--yandex {
  height: 18px;
  width: auto;
  max-width: 88px;
}
.auth-oauth__logo--vk {
  height: 28px;
  width: 28px;
}
@media (min-width: 960px) {
  .auth-wrap {
    padding-left: 32px;
    padding-right: 32px;
  }
  .auth-wrap__bar {
    margin: -12px -32px 28px;
    padding: 14px 24px;
  }
}
</style>
