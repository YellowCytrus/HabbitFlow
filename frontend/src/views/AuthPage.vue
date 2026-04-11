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
              hide-details
              @blur="emailTouched = true"
            />
            <v-expand-transition>
              <div v-show="showEmailValidation" class="validation-slot mb-3">
                <v-card class="validation-card validation-card--email" variant="tonal" rounded="lg">
                  <div class="validation-title text-body-2 font-weight-medium mb-2">Проверка email</div>
                  <div class="d-flex align-center ga-2 mb-1 validation-item">
                    <v-icon
                      size="18"
                      :icon="emailChecks.noSpaces ? 'mdi-check-circle' : 'mdi-close-circle'"
                      :class="emailChecks.noSpaces ? 'validation-icon--ok' : 'validation-icon--warn'"
                    />
                    <span class="text-body-2">Без пробелов</span>
                  </div>
                  <div class="d-flex align-center ga-2 validation-item">
                    <v-icon
                      size="18"
                      :icon="emailChecks.hasSimpleFormat ? 'mdi-check-circle' : 'mdi-close-circle'"
                      :class="emailChecks.hasSimpleFormat ? 'validation-icon--ok' : 'validation-icon--warn'"
                    />
                    <span class="text-body-2">Формат: name@domain.tld</span>
                  </div>
                </v-card>
              </div>
            </v-expand-transition>
            <v-text-field
              v-model="regPassword"
              type="password"
              label="Пароль"
              autocomplete="new-password"
              class="mb-3"
              hide-details
              @blur="passwordTouched = true"
            />
            <v-expand-transition>
              <div v-show="showPasswordValidation" class="validation-slot mb-3">
                <v-card class="validation-card validation-card--password" variant="tonal" rounded="lg">
                  <div class="validation-title text-body-2 font-weight-medium mb-2">Сложность пароля</div>
                  <div
                    v-for="item in passwordChecklistItems"
                    :key="item.label"
                    class="d-flex align-center ga-2 mb-1 validation-item"
                  >
                    <v-icon
                      size="18"
                      :icon="item.valid ? 'mdi-check-circle' : 'mdi-close-circle'"
                      :class="item.valid ? 'validation-icon--ok' : 'validation-icon--warn'"
                    />
                    <span class="text-body-2">{{ item.label }}</span>
                  </div>
                </v-card>
              </div>
            </v-expand-transition>
            <v-text-field
              v-model="regPasswordConfirm"
              type="password"
              label="Повторите пароль"
              autocomplete="new-password"
              class="mb-4"
              hide-details
              @blur="passwordConfirmTouched = true"
            />
            <v-fade-transition>
              <div v-if="showPasswordMismatch" class="validation-slot validation-slot--compact mb-4">
                <v-card class="validation-card validation-card--mismatch" variant="tonal" rounded="lg">
                  <div class="d-flex align-center ga-2 validation-item">
                    <v-icon size="18" icon="mdi-alert-circle-outline" class="validation-icon--warn" />
                    <span class="text-body-2">Пароли не совпадают</span>
                  </div>
                </v-card>
              </div>
            </v-fade-transition>
            <v-alert v-if="message" type="info" variant="tonal" density="compact" class="mb-4" rounded="lg">
              {{ message }}
            </v-alert>
            <v-btn type="submit" color="primary" block size="large" class="text-none mb-4" :disabled="!isRegisterFormValid">
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
              type="tel"
              inputmode="numeric"
              pattern="[0-9]*"
              maxlength="6"
              counter="6"
              autocomplete="one-time-code"
              class="mb-4"
              @update:model-value="onRegCodeInput"
              @keydown="onRegCodeKeydown"
              @paste="onRegCodePaste"
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
import { watchDebounced } from "@vueuse/core";
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
const regPasswordConfirm = ref("");
const regCode = ref("");
const pendingEmail = ref("");
const message = ref("");
const emailTouched = ref(false);
const passwordTouched = ref(false);
const passwordConfirmTouched = ref(false);

const apiRoot = import.meta.env.VITE_API_URL || "";

const yandexUrl = computed(() => `${apiRoot}/api/v1/auth/oauth/yandex`);
const vkStubSnack = ref(false);

const emailChecks = computed(() => {
  const value = regEmail.value.trim();
  return {
    noSpaces: !/\s/.test(value),
    hasSimpleFormat: /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value),
  };
});

const passwordChecks = computed(() => {
  const value = regPassword.value;
  return {
    minLength: value.length >= 8,
    lowercase: /[a-z]/.test(value),
    uppercase: /[A-Z]/.test(value),
    digit: /\d/.test(value),
    special: /[^A-Za-z0-9]/.test(value),
  };
});

const passwordsMatch = computed(
  () => regPasswordConfirm.value.length > 0 && regPassword.value === regPasswordConfirm.value,
);

const isEmailValid = computed(() => Object.values(emailChecks.value).every(Boolean));
const isPasswordValid = computed(() => Object.values(passwordChecks.value).every(Boolean));
const isRegisterFormValid = computed(
  () => regName.value.trim().length > 0 && isEmailValid.value && isPasswordValid.value && passwordsMatch.value,
);

const passwordChecklistItems = computed(() => [
  { label: "Минимум 8 символов", valid: passwordChecks.value.minLength },
  { label: "Строчная буква", valid: passwordChecks.value.lowercase },
  { label: "Заглавная буква", valid: passwordChecks.value.uppercase },
  { label: "Цифра", valid: passwordChecks.value.digit },
  { label: "Спецсимвол", valid: passwordChecks.value.special },
]);

const showEmailValidation = computed(() => emailTouched.value || regEmail.value.length > 0);
const showPasswordValidation = computed(() => passwordTouched.value || regPassword.value.length > 0);
const showPasswordMismatch = computed(
  () =>
    (passwordConfirmTouched.value || regPasswordConfirm.value.length > 0) &&
    regPasswordConfirm.value.length > 0 &&
    !passwordsMatch.value,
);

watchDebounced(
  [regEmail, regPassword, regPasswordConfirm],
  () => {
    if (registerStep.value !== "form") return;
    if (!regEmail.value && !regPassword.value && !regPasswordConfirm.value) return;
    emailTouched.value = true;
    passwordTouched.value = true;
    passwordConfirmTouched.value = true;
  },
  { debounce: 250, maxWait: 700 },
);

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
  regPasswordConfirm.value = "";
  emailTouched.value = false;
  passwordTouched.value = false;
  passwordConfirmTouched.value = false;
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
  emailTouched.value = true;
  passwordTouched.value = true;
  passwordConfirmTouched.value = true;
  if (!isRegisterFormValid.value) {
    message.value = "Исправьте ошибки в форме регистрации.";
    return;
  }
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
      code: sanitizeRegCode(regCode.value),
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

function sanitizeRegCode(value = "") {
  return String(value).replace(/\D/g, "").slice(0, 6);
}

function onRegCodeInput(value = "") {
  regCode.value = sanitizeRegCode(value);
}

function onRegCodeKeydown(event) {
  if (event.ctrlKey || event.metaKey || event.altKey) return;

  const allowedControlKeys = ["Backspace", "Delete", "Tab", "ArrowLeft", "ArrowRight", "Home", "End"];
  if (allowedControlKeys.includes(event.key)) return;

  const isDigit = /^\d$/.test(event.key);
  const hasSelection = (event.target?.selectionStart ?? 0) !== (event.target?.selectionEnd ?? 0);
  const hasRoom = regCode.value.length < 6;

  if (!isDigit || (!hasSelection && !hasRoom)) {
    event.preventDefault();
  }
}

function onRegCodePaste(event) {
  event.preventDefault();
  const pastedText = event.clipboardData?.getData("text") ?? "";
  const input = event.target;
  const start = input?.selectionStart ?? regCode.value.length;
  const end = input?.selectionEnd ?? regCode.value.length;
  const nextValue = `${regCode.value.slice(0, start)}${pastedText}${regCode.value.slice(end)}`;
  regCode.value = sanitizeRegCode(nextValue);
}
</script>

<style scoped>
.auth-wrap {
  max-width: var(--hf-content-max);
  margin: 0 auto;
  padding-left: 12px;
  padding-right: 12px;
}
@media (min-width: 480px) {
  .auth-wrap {
    padding-left: 16px;
    padding-right: 16px;
  }
  .auth-wrap__bar {
    margin: -8px -16px 24px;
  }
}
@media (min-width: 768px) {
  .auth-wrap {
    padding-left: 24px;
    padding-right: 24px;
  }
  .auth-wrap__bar {
    margin: -8px -24px 26px;
  }
}
.auth-wrap__bar {
  padding: 12px 16px;
  margin: -8px -12px 24px;
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
.validation-slot {
  min-height: 112px;
}
.validation-slot--compact {
  min-height: 56px;
}
.validation-card {
  padding: 12px 14px;
  transition: transform 180ms ease, box-shadow 180ms ease, opacity 180ms ease;
}
.validation-card--password {
  min-height: 112px;
}
.validation-card--email {
  min-height: 88px;
}
.validation-title {
  line-height: 1.1;
}
.validation-item {
  line-height: 1.1;
}
.validation-icon--ok {
  color: rgb(var(--v-theme-success));
}
.validation-icon--warn {
  color: #c45f5f;
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
@media (max-width: 374px) {
  .auth-wrap__bar {
    margin: -4px -12px 20px;
    padding: 10px 12px;
    border-radius: 0 0 14px 14px;
  }
}
@media (min-width: 1280px) {
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
