# HabitFlow — снимок реализации дизайна (для ИИ)

## Как использовать в чате (Cursor / Claude)

- **Точный перенос стилей и анимаций:** приложите этот файл. Для смысла и связности добавьте [HABITFLOW_DESIGN_PHILOSOPHY_AND_COHESION.md](./HABITFLOW_DESIGN_PHILOSOPHY_AND_COHESION.md).
- **Рекомендуемый порядок:** сначала философия (что сохранить), затем этот снимок (как это сделано в коде).
- Полные исходники лежат по указанным путям — при переносе на другой стек копируйте **числа и структуру**, а не обязательно Vuetify.

---

## Стек и точки входа

| Роль | Путь |
|------|------|
| Bootstrap приложения | [frontend/src/main.js](../../frontend/src/main.js) — Pinia, router, Vuetify, **`import "./styles/app.scss"`** |
| Тема Vuetify + брейкпоинты JS | [frontend/src/plugins/vuetify.js](../../frontend/src/plugins/vuetify.js) |
| Глобальные токены и «лицо» UI | [frontend/src/styles/app.scss](../../frontend/src/styles/app.scss) |
| Сетка Vuetify (Sass) = те же px, что `display.thresholds` | [frontend/src/styles/vuetify-settings.scss](../../frontend/src/styles/vuetify-settings.scss) |
| Подключение Sass-настроек | [frontend/vite.config.js](../../frontend/vite.config.js) → `vuetify({ styles: { configFile: "src/styles/vuetify-settings.scss" } })` |
| Корневая вёрстка, фон, переходы маршрутов | [frontend/src/App.vue](../../frontend/src/App.vue) |
| Шрифт | [frontend/index.html](../../frontend/index.html) — Google Fonts **Inter** |

---

## CSS-токены (`:root`) и базовая типографика

Источник: [frontend/src/styles/app.scss](../../frontend/src/styles/app.scss) (файл целиком — единственный глобальный слой поверх Vuetify).

```css
:root {
  --hf-bp-sm: 480px;
  --hf-bp-md: 768px;
  --hf-bp-lg: 1024px;
  --hf-bp-xl: 1280px;
  --hf-bp-xxl: 1920px;
  --hf-content-max: 1200px;
  --hf-black: #1d1d1f;
  --hf-white: #ffffff;
  --hf-light-gray: #f5f5f7;
  --hf-apple-blue: #0071e3;
  --hf-link-blue: #0066cc;
  --hf-gray-80: rgba(0, 0, 0, 0.8);
  --hf-gray-48: rgba(0, 0, 0, 0.48);
  --hf-border: #d2d2d7;
  --hf-shadow-card: rgba(0, 0, 0, 0.22) 3px 5px 30px 0px;
  --hf-font-display: "Inter", -apple-system, BlinkMacSystemFont, "SF Pro Display", "Helvetica Neue", Helvetica, Arial, sans-serif;
  --hf-font-text: "Inter", -apple-system, BlinkMacSystemFont, "SF Pro Text", "Helvetica Neue", Helvetica, Arial, sans-serif;
  --hf-glass-bg: rgba(255, 255, 255, 0.58);
  --hf-glass-border: rgba(255, 255, 255, 0.72);
  --hf-glass-highlight: rgba(255, 255, 255, 0.92);
  --hf-glass-shadow: 0 8px 32px rgba(0, 0, 0, 0.07), 0 1px 2px rgba(0, 0, 0, 0.04);
  --hf-glass-inset: inset 0 1px 0 var(--hf-glass-highlight);
  --hf-blur: saturate(180%) blur(20px);
}

html,
body {
  margin: 0;
  min-height: 100%;
  font-family: var(--hf-font-text);
  font-size: 17px;
  font-weight: 400;
  line-height: 1.47;
  letter-spacing: -0.02em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

---

## Тема Vuetify: палитра, defaults, `display`

Источник: [frontend/src/plugins/vuetify.js](../../frontend/src/plugins/vuetify.js)

```js
const appleLiquid = {
  dark: false,
  colors: {
    background: "#f5f5f7",
    surface: "#ffffff",
    "surface-variant": "#fafafc",
    "on-surface": "#1d1d1f",
    "on-surface-variant": "#636366",
    primary: "#0071e3",
    "on-primary": "#ffffff",
    secondary: "#1d1d1f",
    "on-secondary": "#ffffff",
    tertiary: "#2997ff",
    "on-tertiary": "#ffffff",
    error: "#ff3b30",
    "on-error": "#ffffff",
    success: "#34c759",
    warning: "#ff9500",
    info: "#0071e3",
    "primary-container": "#d6eaff",
    "on-primary-container": "#001428",
    "secondary-container": "#e8e8ed",
    "on-secondary-container": "#1d1d1f",
    outline: "#d2d2d7",
    "outline-variant": "#e5e5ea",
  },
};

export default createVuetify({
  display: {
    mobileBreakpoint: "lg",
    thresholds: { xs: 0, sm: 480, md: 768, lg: 1024, xl: 1280, xxl: 1920 },
  },
  theme: { defaultTheme: "habitflow", themes: { habitflow: appleLiquid } },
  defaults: {
    global: { ripple: true },
    VBtn: { variant: "flat", rounded: "xl" },
    VCard: { rounded: "lg", elevation: 0 },
    VTextField: { variant: "outlined", density: "comfortable", color: "primary" },
  },
});
```

Синхронизация сетки с JS (классы `v-col`, responsive utilities):

```scss
/* frontend/src/styles/vuetify-settings.scss */
@forward "vuetify/settings" with (
  $grid-breakpoints: (
    "xs": 0,
    "sm": 480px,
    "md": 768px,
    "lg": 1024px,
    "xl": 1280px,
    "xxl": 1920px,
  )
);
```

---

## Глобальные переопределения: стекло, shell, кнопки, поля

Всё в [frontend/src/styles/app.scss](../../frontend/src/styles/app.scss). Кратко по смыслу:

- **`.hf-app.v-application`** — прозрачный фон приложения (виден liquid-слой сзади).
- **`.v-card`** — матовое стекло: `backdrop-filter: var(--hf-blur)`, лёгкая граница через `color-mix`, тень + inset highlight; **hover** усиливает тень (`--hf-shadow-card`).
- **`.hf-app-bar`**, **`.hf-footer`**, **`.hf-nav-drawer`** — тот же язык: полупрозрачный белый + blur + тонкая граница.
- **`.v-btn.bg-primary`** — pill (`border-radius: 980px`), без `text-transform`, hover: лёгкое затемнение + синее свечение.
- **Outlined / tonal кнопки** — лёгкий blur на фоне кнопки.
- **Поля** — светлый фон поля, мягкая обводка, focus ring `0 0 0 3px rgba(0, 113, 227, 0.2)`.
- **Диалоги** — карточка в оверлее чуть плотнее: `rgba(255,255,255,0.82)`.
- **`@supports not (color-mix)`** — fallback границы карточки.

---

## Маршрутизация, motion, scroll-reveal

### Переход между страницами

[frontend/src/App.vue](../../frontend/src/App.vue):

```vue
<transition :name="r.name === 'habits' ? 'route-fade-fixed-safe' : 'route-fade'" mode="out-in">
  <component :is="Component" :key="r.name ?? r.path" />
</transition>
```

- **`route-fade`** — обычный opacity fade (easing ниже).
- **`route-fade-fixed-safe`** — тот же визуально, для маршрута `habits`, чтобы не ломать fixed-фон при enter.

Классы в `app.scss`:

```css
.route-fade-enter-active {
  transition: opacity 0.32s cubic-bezier(0.25, 0.1, 0.25, 1);
}
.route-fade-leave-active {
  transition: opacity 0.22s cubic-bezier(0.4, 0, 0.2, 1);
}
.route-fade-enter-from,
.route-fade-leave-to {
  opacity: 0;
}
/* route-fade-fixed-safe-* — те же длительности и opacity */
```

### Scroll reveal

Стили в `app.scss`:

```css
[data-reveal] {
  opacity: 0;
  transform: translateY(18px);
  transition:
    opacity 0.6s cubic-bezier(0.25, 0.1, 0.25, 1),
    transform 0.6s cubic-bezier(0.25, 0.1, 0.25, 1);
}
[data-reveal].is-visible {
  opacity: 1;
  transform: none;
}
```

Логика: [frontend/src/composables/useReveal.js](../../frontend/src/composables/useReveal.js) — `IntersectionObserver` на `[data-reveal]` внутри переданного root, `rootMargin: "0px 0px -8% 0px"`, `threshold: 0.08`; при отсутствии API — сразу `.is-visible`.

Пример разметки: [frontend/src/views/LandingPage.vue](../../frontend/src/views/LandingPage.vue) — атрибут `data-reveal` на hero, карточках, CTA.

### Календарь (смена месяца)

В `app.scss`: классы **`.calendar-swap-*`** — opacity + лёгкий `translateX(16px)` на enter/leave; отдельный блок **`prefers-reduced-motion`** отключает transition и сбрасывает transform.

### `prefers-reduced-motion`

В `app.scss` отключаются: route transitions, `[data-reveal]`, анимации **`.liquid-bg__mesh`** (см. ниже), и приводятся к финальному виду без motion.

---

## Фон приложения: `SeededLiquidBackground`

Файл: [frontend/src/components/SeededLiquidBackground.vue](../../frontend/src/components/SeededLiquidBackground.vue).

### Описание слоёв

**Слои (сверху вниз по шаблону):**

1. **Три mesh-слоя** (`.liquid-bg__mesh--base`, `--accent`, `--ambient`) — радиальные градиенты; цвета задаются CSS-переменными, сгенерированными от **seed**. **Base** — основные пятна (4 круга + общий линейный градиент 135° в пастельных бело-голубых тонах как основа). **Accent** — три дополнительных радиальных пятна с `mix-blend-mode: soft-light`. **Ambient** — почти белые блики по углам, без привязки к seed (статичные `rgba(255,255,255,…)`).
2. **Два SVG-вектора** (верх/низ) — мягкие «волны» с линейными градиентами; `stop-color` через `var(--hf-liquid-top-a/b)`, `var(--hf-liquid-bottom-a/b)` с **fallback** в шаблоне (если переменные не заданы).
3. **Контур** (`.liquid-bg__contour`) — две линии `path`, `stroke: var(--hf-liquid-contour)`, без заливки.

**Анимации:** `liquid-mesh-shift` (20s / 27s reverse на accent), `liquid-vector-top` (18s), `liquid-vector-bottom` (24s). При **`prefers-reduced-motion: reduce`** — `animation: none` на mesh и vector.

**Позиционирование:** `position: fixed`, `z-index: 0`, большие отрицательные `inset` для «заливки» экрана; SVG маскируются градиентом по горизонтали (мягкое затухание к краям).

**Адаптив в компоненте:** `@media (max-width: 1023px)` и `(min-width: 1920px)` — меняются inset, opacity, размеры векторов (в ногу с остальной сеткой сайта).

**Подключение:** [frontend/src/App.vue](../../frontend/src/App.vue) — `SeededLiquidBackground` при `route.meta.liquidBackground !== false` (по умолчанию фон включён; чтобы скрыть — явно `meta: { liquidBackground: false }`).

### Палитра и генерация цветов

Цвета фона **не захардкожены одним набором hex** в рантайме: при монтировании вызывается `applyLiquidThemeFromSeed()` — случайный целочисленный **seed** (1…2³¹−1), PRNG **mulberry32(seed)**, результат пишется в `localStorage` (`hf:global:bg-seed`) и в **inline-стиль** корня `.liquid-bg` как набор CSS-переменных `hsla(…)`.

**Идея палитры:** выбирается одна из **8 «семейств» оттенков** (диапазоны hue `hMin`–`hMax` на цветовом круге + два сдвига `d2`, `d3` для гармоничных вторичных оттенков). Из семейства случайно берутся `h1`, затем `h2 = hueShift(h1, d2)`, `h3 = hueShift(h1, d3)`. Добавляются малые случайные **satBoost** (−4…+6%) и **lightBoost** (−3…+5%) для вариативности, но **светлость и альфа** остаются высокими/умеренными — фон остаётся **пастельным и воздушным**, не конкурирует с `#1d1d1f` текста и `#0071e3` кнопок.

| Семейство (смысл) | Диапазон hue `h1` (°) | Примечание |
|-------------------|------------------------|------------|
| Ледяной сине-голубой | 194–212 | ближе всего к primary UI |
| Мятный / бирюзовый | 164–186 | |
| Фиолетово-сиреневый | 260–286 | |
| Тёплый персик | 16–34 | |
| Розово-малиновый | 314–336 | |
| Зелёный | 146–166 | |
| Жёлто-золотой | 42–58 | |
| Сине-бирюзовый широкий | 202–224 | |

**Куда попадают переменные** (имена совпадают с кодом):

| Переменная | Роль |
|------------|------|
| `--hf-liquid-mesh-a` … `--hf-liquid-mesh-d` | четыре радиальных пятна base-mesh + производное от `h2` |
| `--hf-liquid-accent-a` … `--hf-liquid-accent-c` | accent-mesh (soft-light) |
| `--hf-liquid-top-a`, `--hf-liquid-top-b` | градиент верхней SVG-волны (очень светлые, высокая L) |
| `--hf-liquid-bottom-a`, `--hf-liquid-bottom-b` | градиент нижней волны (чуть насыщеннее, α ~0.28–0.34) |
| `--hf-liquid-contour` | цвет штриха контура (светлый, высокая L, умеренная α) |

**Формат:** `hsla(H S% L% / α)` в современном синтаксисе (без запятой между L и `/`), как в `hsla()` в компоненте.

**Fallback в разметке** (если скрипт не отработал): верхняя волна `rgba(255,255,255,0.88)` → `rgba(255,255,255,0.15)`; нижняя `rgba(150,193,255,0.36)` → `rgba(203,168,255,0.28)` — холодно-лавандовый микс, согласованный с общей эстетикой.

---

## Лендинг (маркетинговый эталон)

Файл: [frontend/src/views/LandingPage.vue](../../frontend/src/views/LandingPage.vue).

### Палитра фона лендинга (отдельно от глобального liquid)

На `/` глобальный [SeededLiquidBackground](../../frontend/src/components/SeededLiquidBackground.vue) всё равно может быть включён; **локальный** слой **`.landing__liquid`** — самостоятельные **два SVG-блоба** с **фиксированными** линейными градиентами (не seed):

- **Блоб A:** `#7f8cff` → `#40c8ff` → `#7ef6d3` (холодный индиго / циан / мятный).
- **Блоб B:** `#ffc0f4` → `#b495ff` → `#66a6ff` (розовый / сирень / небесный).

Поверх — **`.landing__grain`**: мелкий radial-dot noise + вертикальный mask (сверху плотнее, к низу растворяется). Это **другая** эстетика, чем приложение: чуть **игривее и контрастнее**, но в той же хроматической «семье», что и глобальный UI (синие и пастельные вторые тона).

**Структура:**

- **`.landing__liquid`** — два SVG-блоба с фиксированными градиентами + **`.landing__grain`** (мелкая точечная сетка + mask).
- **`.landing__top`** — sticky, стеклянная плашка (blur + border + inset highlight), бренд + кнопка «Войти».
- **Hero** — заголовок с **`clamp()`** (класс `.landing__hero-title`), lead, primary CTA.
- Секции на **Vuetify** `v-container` / `v-row` / `v-card`, элементы с **`data-reveal`**.
- **Pointer tilt** (в `onMounted`): CSS-переменные `--landing-tilt-x/y` для лёгкого сдвига блобов; при `prefers-reduced-motion` не используется.

**Характерные значения:**

```css
.landing__hero-title {
  font-size: clamp(1.35rem, 2.8vw + 0.85rem, 2.125rem);
  line-height: 1.15;
  letter-spacing: -0.02em;
}
```

**Блобы:** `@keyframes landing-float-a` / `landing-float-b` (18s / 22s ease-in-out); при reduced motion — `animation: none`.

**Ширина контента:** `max-width: var(--hf-content-max)` у `.landing` и footer; ступенчатые padding и размеры liquid по брейкпоинтам 374 / 480 / 768 / 1024 / 1280 / 1920 (см. конец `<style scoped>` в файле).

---

## Chrome и фон: роутер

[frontend/src/router/index.js](../../frontend/src/router/index.js):

- **`meta.chrome: false`** — на `/` и `/auth`: не показываются [AppHeader](../../frontend/src/components/AppHeader.vue) и [AppFooter](../../frontend/src/components/AppFooter.vue) (`showChrome` в `App.vue`).
- Остальные маршруты по умолчанию с chrome; глобальный liquid остаётся, если не задан `liquidBackground: false`.

---

## Адаптив: сетка, shell, примеры

| Имя | От (px) | Где задано |
|-----|---------|------------|
| xs | 0 | — |
| sm | 480 | `display.thresholds`, `$grid-breakpoints`, `--hf-bp-sm` |
| md | 768 | то же |
| lg | 1024 | то же; **drawer + меню** в шапке при `mdAndDown` |
| xl | 1280 | то же; типичный «широкий» контент |
| xxl | 1920 | то же; усиление фона на лендинге / liquid |

**Контент приложения:** [frontend/src/App.vue](../../frontend/src/App.vue) — `.hf-main__inner`: `max-width: var(--hf-content-max)`, padding ступенями 480 / 768 / 1280.

**Шапка:** [frontend/src/components/AppHeader.vue](../../frontend/src/components/AppHeader.vue) — `useDisplay()` из Vuetify; при **viewport &lt; 1024** (`mdAndDown`) — `v-navigation-drawer` + иконка меню; при **`lgAndUp`** — горизонтальные `v-btn`. Контейнер app bar: `max-width` 1200px от **1280px**. Класс **`hf-nav-drawer`** стилизован в `app.scss`.

**Календарь (узкие экраны):** [frontend/src/components/CustomCalendar.vue](../../frontend/src/components/CustomCalendar.vue) — при **max-width: 479px** подписи «Пред./След.» визуально скрыты (screen-reader friendly clip), уменьшены ячейки и отступы; крупнее ячейки от **768px**.

---

## Референс в репозитории

Статический превью-токены: [apple_preview.html](../../apple_preview.html) — изначальное выравнивание палитры и «liquid glass» (комментарий в `app.scss`).

---

## Чеклист для модели при переносе в другой проект

1. Сохранить **палитру** (фон `#f5f5f7`, primary `#0071e3`, текст `#1d1d1f`, контейнеры и outline как в теме).
2. Сохранить **стекло**: `saturate(180%) blur(20px)` (или эквивалент), полупрозрачный белый фон карточек ~0.58, inset highlight + мягкая внешняя тень.
3. Сохранить **easing маршрутов**: 0.32s / 0.22s и указанные `cubic-bezier`.
4. Сохранить **scroll-reveal**: старт `opacity:0` + `translateY(18px)`, длительность ~0.6s, те же easing; observer с отступом снизу.
5. Обязательно **`prefers-reduced-motion`**: отключить анимации фона, reveal, route transitions, calendar-swap.
6. **max-width контента** ~1200px и согласованные горизонтальные padding на мобиле/планшете/десктопе.
7. Primary CTA: **pill**, без ALL CAPS, лёгкий hover-glow в синем.
8. **Фон:** глобально — слои mesh / SVG / контур + **пастельная HSLA-палитра** из узких hue-семейств (см. таблицы выше); лендинг — **фиксированные** градиенты блобов; при упрощении до статики сохраните светлость и холодноватый уклон, не конкурируйте с текстом и primary.

---

*Связный рассказ «зачем так» и как слои склеены:* [HABITFLOW_DESIGN_PHILOSOPHY_AND_COHESION.md](./HABITFLOW_DESIGN_PHILOSOPHY_AND_COHESION.md)
