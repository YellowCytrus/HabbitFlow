<template>
  <div ref="rootEl" class="landing">
    <header class="landing__top">
      <RouterLink to="/" class="landing__brand text-decoration-none text-primary">[HabitFlow]</RouterLink>
      <v-btn variant="outlined" color="primary" :to="{ name: 'auth' }" class="text-none">
        Войти
      </v-btn>
    </header>

    <section class="landing__hero text-center py-12 py-md-16">
      <h1 class="text-h4 text-md-h3 font-weight-medium mb-4" data-reveal>
        Добрый трекер привычек
      </h1>
      <p class="text-body-1 text-medium-emphasis mx-auto landing__lead mb-8" style="max-width: 36rem" data-reveal>
        Без красных крестиков. Без чувства вины. Только маленькие шаги и мягкий прогресс.
      </p>
      <v-btn
        color="primary"
        size="large"
        min-width="220"
        class="text-none"
        :to="{ name: 'auth', query: { tab: 'register' } }"
        data-reveal
      >
        Начать бесплатно
      </v-btn>
    </section>

    <v-container class="py-8 py-md-12 px-0">
      <h2 class="text-h5 font-weight-medium mb-6" data-reveal>Философия</h2>
      <v-row dense>
        <v-col cols="12" sm="6" data-reveal>
          <v-card class="h-100 pa-6" elevation="2">
            <v-card-title class="text-subtitle-1 font-weight-bold pa-0 pb-2">Микро-шаги</v-card-title>
            <p class="text-body-2 text-medium-emphasis mb-0">
              Не можете медитировать 20 минут? Сделайте один глубокий вдох. Это тоже считается.
            </p>
          </v-card>
        </v-col>
        <v-col cols="12" sm="6" data-reveal>
          <v-card class="h-100 pa-6" elevation="2">
            <v-card-title class="text-subtitle-1 font-weight-bold pa-0 pb-2">Без красного</v-card-title>
            <p class="text-body-2 text-medium-emphasis mb-0">
              Пропустили день? Просто серая клетка. Никакого давления, никакой вины.
            </p>
          </v-card>
        </v-col>
        <v-col cols="12" sm="6" data-reveal>
          <v-card class="h-100 pa-6" elevation="2">
            <v-card-title class="text-subtitle-1 font-weight-bold pa-0 pb-2">Мягкие напоминания</v-card-title>
            <p class="text-body-2 text-medium-emphasis mb-0">
              «Привет! Сегодня отличный день для маленького шага» вместо «Вы пропустили 5 дней!!»
            </p>
          </v-card>
        </v-col>
        <v-col cols="12" sm="6" data-reveal>
          <v-card class="h-100 pa-6" elevation="2">
            <v-card-title class="text-subtitle-1 font-weight-bold pa-0 pb-2">Поддержка</v-card-title>
            <p class="text-body-2 text-medium-emphasis mb-0">
              Добрые сообщения каждый день. Как заботливый друг, а не строгий тренер.
            </p>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-divider class="my-8" />

    <v-container class="py-8 py-md-12 px-0">
      <h2 class="text-h5 font-weight-medium mb-8" data-reveal>Как это работает</h2>
      <v-card
        v-for="(step, i) in steps"
        :key="i"
        class="mb-4 pa-6"
        elevation="2"
        :data-reveal="''"
      >
        <div class="d-flex align-start ga-4">
          <span class="text-h5 font-weight-bold text-primary" style="min-width: 2rem">{{ i + 1 }}</span>
          <div>
            <h3 class="text-subtitle-1 font-weight-bold mb-1">{{ step.title }}</h3>
            <p class="text-body-2 text-medium-emphasis mb-0">{{ step.text }}</p>
          </div>
        </div>
      </v-card>
    </v-container>

    <v-container class="py-8 pb-16 px-0">
      <v-card class="pa-8 pa-md-10 text-center" elevation="3" color="primary-container" data-reveal>
        <h2 class="text-h5 font-weight-medium mb-3 text-on-primary-container">Готовы начать мягко?</h2>
        <p class="text-body-1 text-on-primary-container mb-8">Бесплатно. Без давления. В своём темпе.</p>
        <v-btn
          color="primary"
          size="large"
          min-width="240"
          class="text-none"
          :to="{ name: 'auth', query: { tab: 'register' } }"
        >
          Создать аккаунт
        </v-btn>
      </v-card>
    </v-container>

    <footer class="landing__footer text-center text-body-2 text-medium-emphasis pb-10">
      <v-divider class="mb-6" />
      HabitFlow — трекер привычек с заботой о вас
    </footer>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useReveal } from "../composables/useReveal";

const rootEl = ref(null);
useReveal(rootEl);

const steps = [
  {
    title: "Добавьте привычку",
    text: "Например: «Читать» с микро-шагом «Прочитать 1 страницу».",
  },
  {
    title: "Отмечайте прогресс",
    text: "Готово, микро-шаг или пропуск — все варианты ок.",
  },
  {
    title: "Наблюдайте рост",
    text: "Мягкий календарь без красного. Зелёный, жёлтый, серый.",
  },
];
</script>

<style scoped>
.landing {
  max-width: 1120px;
  margin: 0 auto;
  padding: 16px 20px 0;
}
.landing__top {
  position: sticky;
  top: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  margin: -8px -16px 20px;
  border-radius: 0 0 18px 18px;
  background: rgba(255, 255, 255, 0.48);
  backdrop-filter: saturate(180%) blur(20px);
  -webkit-backdrop-filter: saturate(180%) blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.65);
  border-top: none;
  box-shadow: 0 8px 28px rgba(0, 0, 0, 0.05), inset 0 1px 0 rgba(255, 255, 255, 0.85);
}
.landing__brand {
  font-weight: 700;
  letter-spacing: 0.02em;
  font-size: 1.125rem;
}
.landing__footer {
  max-width: 1120px;
  margin: 0 auto;
  padding-left: 20px;
  padding-right: 20px;
}
@media (min-width: 960px) {
  .landing {
    padding: 24px 32px 0;
  }
  .landing__top {
    margin: -12px -32px 24px;
    padding: 14px 24px;
  }
}
</style>
