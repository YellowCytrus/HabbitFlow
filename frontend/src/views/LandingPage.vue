<template>
  <div ref="rootEl" class="landing">
    <div class="landing__liquid" aria-hidden="true">
      <svg class="landing__blob landing__blob--a" viewBox="0 0 600 600" role="presentation">
        <defs>
          <linearGradient id="landing-gradient-a" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" stop-color="#7f8cff" />
            <stop offset="55%" stop-color="#40c8ff" />
            <stop offset="100%" stop-color="#7ef6d3" />
          </linearGradient>
        </defs>
        <path
          d="M531.6 312.5c-13.5 98-114.4 156.7-215.7 173.5-95.7 15.9-201.8-6.9-245.2-87.6-45-83.8-21.9-194.7 53.2-256.5C193 83.5 293.8 95 385.6 125c97.6 31.8 160.7 88.7 146 187.5Z"
          fill="url(#landing-gradient-a)"
        />
      </svg>
      <svg class="landing__blob landing__blob--b" viewBox="0 0 600 600" role="presentation">
        <defs>
          <linearGradient id="landing-gradient-b" x1="20%" y1="0%" x2="80%" y2="100%">
            <stop offset="0%" stop-color="#ffc0f4" />
            <stop offset="45%" stop-color="#b495ff" />
            <stop offset="100%" stop-color="#66a6ff" />
          </linearGradient>
        </defs>
        <path
          d="M507.5 350.6c-25.3 105.3-142.1 170.6-252.4 154.8-95.4-13.6-170.4-89.4-177.7-184-7.6-98.6 30.6-212.8 126.7-249.1 94.7-35.7 211.9 20.2 270.4 103.3 35.8 50.8 47.8 112.2 33 175Z"
          fill="url(#landing-gradient-b)"
        />
      </svg>
      <div class="landing__grain" />
    </div>

    <header class="landing__top">
      <RouterLink to="/" class="landing__brand text-decoration-none text-primary">[HabitFlow]</RouterLink>
      <v-btn variant="outlined" color="primary" :to="{ name: 'auth' }" class="text-none">
        Войти
      </v-btn>
    </header>

    <section class="landing__hero text-center py-10 py-md-12 py-lg-16">
      <h1 class="landing__hero-title font-weight-medium mb-4" data-reveal>
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
import { onMounted, onUnmounted, ref } from "vue";
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

let cleanupPointerEffect = null;

onMounted(() => {
  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches || !rootEl.value) return;

  const el = rootEl.value;
  const onPointerMove = (event) => {
    const { innerWidth, innerHeight } = window;
    const px = (event.clientX / innerWidth - 0.5) * 2;
    const py = (event.clientY / innerHeight - 0.5) * 2;
    el.style.setProperty("--landing-tilt-x", `${px.toFixed(3)}`);
    el.style.setProperty("--landing-tilt-y", `${py.toFixed(3)}`);
  };
  const onPointerLeave = () => {
    el.style.setProperty("--landing-tilt-x", "0");
    el.style.setProperty("--landing-tilt-y", "0");
  };

  window.addEventListener("pointermove", onPointerMove, { passive: true });
  window.addEventListener("pointerleave", onPointerLeave, { passive: true });

  cleanupPointerEffect = () => {
    window.removeEventListener("pointermove", onPointerMove);
    window.removeEventListener("pointerleave", onPointerLeave);
  };
});

onUnmounted(() => {
  if (cleanupPointerEffect) cleanupPointerEffect();
});
</script>

<style scoped>
.landing {
  --landing-tilt-x: 0;
  --landing-tilt-y: 0;
  max-width: var(--hf-content-max);
  margin: 0 auto;
  padding: 12px 12px 0;
  position: relative;
  isolation: isolate;
}
.landing__hero-title {
  font-size: clamp(1.35rem, 2.8vw + 0.85rem, 2.125rem);
  line-height: 1.15;
  letter-spacing: -0.02em;
}
.landing > *:not(.landing__liquid) {
  position: relative;
  z-index: 1;
}
.landing__liquid {
  position: absolute;
  inset: -12% -10% auto;
  height: 620px;
  z-index: 0;
  pointer-events: none;
  filter: blur(0.4px);
}
.landing__blob {
  position: absolute;
  width: 520px;
  height: 520px;
  opacity: 0.48;
  transition: transform 280ms ease-out;
  will-change: transform;
}
.landing__blob--a {
  top: -48px;
  left: -120px;
  transform: translate3d(calc(var(--landing-tilt-x) * -18px), calc(var(--landing-tilt-y) * -14px), 0);
  animation: landing-float-a 18s ease-in-out infinite;
}
.landing__blob--b {
  right: -150px;
  top: 70px;
  opacity: 0.44;
  transform: translate3d(calc(var(--landing-tilt-x) * 20px), calc(var(--landing-tilt-y) * 16px), 0);
  animation: landing-float-b 22s ease-in-out infinite;
}
.landing__grain {
  position: absolute;
  inset: 0;
  background-image: radial-gradient(rgba(255, 255, 255, 0.2) 0.6px, transparent 0.6px);
  background-size: 4px 4px;
  opacity: 0.2;
  mask-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.8), transparent 76%);
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
  max-width: var(--hf-content-max);
  margin: 0 auto;
  padding-left: 12px;
  padding-right: 12px;
}
@keyframes landing-float-a {
  0%,
  100% {
    transform: translate3d(calc(var(--landing-tilt-x) * -18px), calc(var(--landing-tilt-y) * -14px), 0)
      rotate(0deg) scale(1);
  }
  50% {
    transform: translate3d(calc(var(--landing-tilt-x) * -14px), calc(var(--landing-tilt-y) * -10px), 0)
      rotate(4deg) scale(1.05);
  }
}
@keyframes landing-float-b {
  0%,
  100% {
    transform: translate3d(calc(var(--landing-tilt-x) * 20px), calc(var(--landing-tilt-y) * 16px), 0)
      rotate(0deg) scale(1);
  }
  50% {
    transform: translate3d(calc(var(--landing-tilt-x) * 16px), calc(var(--landing-tilt-y) * 12px), 0)
      rotate(-5deg) scale(1.07);
  }
}
@media (max-width: 374px) {
  .landing {
    padding: 8px 10px 0;
  }
  .landing__top {
    margin: -4px -10px 14px;
    padding: 10px 12px;
    border-radius: 0 0 14px 14px;
  }
  .landing__footer {
    padding-left: 10px;
    padding-right: 10px;
  }
}
@media (min-width: 480px) {
  .landing {
    padding: 14px 16px 0;
  }
  .landing__footer {
    padding-left: 16px;
    padding-right: 16px;
  }
}
@media (min-width: 768px) {
  .landing {
    padding: 20px 24px 0;
  }
  .landing__top {
    margin: -8px -24px 20px;
    padding: 12px 20px;
  }
  .landing__footer {
    padding-left: 24px;
    padding-right: 24px;
  }
}
@media (min-width: 1024px) {
  .landing__liquid {
    inset: -16% -9% auto;
    height: 640px;
  }
  .landing__blob--a {
    left: -90px;
  }
}
@media (min-width: 1280px) {
  .landing {
    padding: 24px 32px 0;
  }
  .landing__liquid {
    inset: -18% -8% auto;
    height: 700px;
  }
  .landing__blob--a {
    left: -70px;
  }
  .landing__top {
    margin: -12px -32px 24px;
    padding: 14px 24px;
  }
}
@media (max-width: 1023px) {
  .landing__liquid {
    height: 500px;
  }
  .landing__blob {
    width: 420px;
    height: 420px;
    opacity: 0.38;
  }
  .landing__blob--a {
    top: -34px;
    left: -140px;
  }
  .landing__blob--b {
    right: -170px;
    top: 70px;
  }
}
@media (min-width: 1920px) {
  .landing__liquid {
    height: 760px;
  }
  .landing__blob {
    opacity: 0.5;
  }
}
@media (prefers-reduced-motion: reduce) {
  .landing__blob {
    animation: none;
    transform: none;
  }
}
</style>
