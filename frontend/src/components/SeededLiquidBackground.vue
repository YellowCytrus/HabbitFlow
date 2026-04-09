<template>
  <div class="liquid-bg" aria-hidden="true" :style="liquidTheme">
    <div class="liquid-bg__mesh liquid-bg__mesh--base"></div>
    <div class="liquid-bg__mesh liquid-bg__mesh--accent"></div>
    <div class="liquid-bg__mesh liquid-bg__mesh--ambient"></div>

    <svg class="liquid-bg__vector liquid-bg__vector--top" viewBox="0 0 1200 480" role="presentation">
      <defs>
        <linearGradient id="global-liquid-top" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stop-color="var(--hf-liquid-top-a, rgba(255,255,255,0.88))" />
          <stop offset="100%" stop-color="var(--hf-liquid-top-b, rgba(255,255,255,0.15))" />
        </linearGradient>
      </defs>
      <path d="M0,255 C120,195 260,145 410,170 C560,196 650,285 810,306 C960,324 1065,275 1200,200 L1200,0 L0,0 Z" fill="url(#global-liquid-top)" />
    </svg>

    <svg class="liquid-bg__vector liquid-bg__vector--bottom" viewBox="0 0 1200 540" role="presentation">
      <defs>
        <linearGradient id="global-liquid-bottom" x1="0%" y1="20%" x2="100%" y2="80%">
          <stop offset="0%" stop-color="var(--hf-liquid-bottom-a, rgba(150,193,255,0.36))" />
          <stop offset="100%" stop-color="var(--hf-liquid-bottom-b, rgba(203,168,255,0.28))" />
        </linearGradient>
      </defs>
      <path d="M0,320 C175,415 340,464 538,423 C745,380 861,290 1047,262 C1111,252 1165,255 1200,262 L1200,540 L0,540 Z" fill="url(#global-liquid-bottom)" />
    </svg>

    <svg class="liquid-bg__contour" viewBox="0 0 1200 420" role="presentation">
      <path d="M-20 266 C174 168, 336 178, 503 254 C664 327, 839 338, 1036 266 C1089 247, 1140 224, 1220 176" />
      <path d="M-30 317 C182 246, 377 252, 531 298 C698 347, 881 333, 1050 273 C1129 243, 1198 199, 1230 176" />
    </svg>
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";

const BG_SEED_KEY = "hf:global:bg-seed";
const liquidTheme = ref({});

function mulberry32(seed) {
  let t = seed >>> 0;
  return () => {
    t += 0x6d2b79f5;
    let n = Math.imul(t ^ (t >>> 15), 1 | t);
    n ^= n + Math.imul(n ^ (n >>> 7), 61 | n);
    return ((n ^ (n >>> 14)) >>> 0) / 4294967296;
  };
}

function randRange(rand, min, max) {
  return min + (max - min) * rand();
}

function hsla(h, s, l, a) {
  return `hsla(${Math.round(h)} ${Math.round(s)}% ${Math.round(l)}% / ${a.toFixed(2)})`;
}

function hueShift(h, delta) {
  return (h + delta + 360) % 360;
}

function applyLiquidThemeFromSeed() {
  const seed = Math.floor(Math.random() * 2147483647) + 1;
  localStorage.setItem(BG_SEED_KEY, String(seed));
  const rand = mulberry32(seed);

  const paletteFamilies = [
    { hMin: 194, hMax: 212, d2: [12, 26], d3: [36, 58] },
    { hMin: 164, hMax: 186, d2: [24, 42], d3: [58, 86] },
    { hMin: 260, hMax: 286, d2: [14, 34], d3: [-22, 10] },
    { hMin: 16, hMax: 34, d2: [18, 36], d3: [198, 230] },
    { hMin: 314, hMax: 336, d2: [22, 44], d3: [58, 84] },
    { hMin: 146, hMax: 166, d2: [26, 48], d3: [72, 102] },
    { hMin: 42, hMax: 58, d2: [138, 166], d3: [198, 234] },
    { hMin: 202, hMax: 224, d2: [118, 146], d3: [166, 208] },
  ];
  const palette = paletteFamilies[Math.floor(rand() * paletteFamilies.length)];

  const h1 = randRange(rand, palette.hMin, palette.hMax);
  const h2 = hueShift(h1, randRange(rand, palette.d2[0], palette.d2[1]));
  const h3 = hueShift(h1, randRange(rand, palette.d3[0], palette.d3[1]));
  const satBoost = randRange(rand, -4, 6);
  const lightBoost = randRange(rand, -3, 5);

  liquidTheme.value = {
    "--hf-liquid-mesh-a": hsla(h1, 86 + satBoost, 73 + lightBoost, 0.52),
    "--hf-liquid-mesh-b": hsla(h2, 82 + satBoost, 76 + lightBoost, 0.48),
    "--hf-liquid-mesh-c": hsla(h3, 74 + satBoost, 80 + lightBoost, 0.39),
    "--hf-liquid-mesh-d": hsla(hueShift(h2, 12), 68 + satBoost, 74 + lightBoost, 0.34),
    "--hf-liquid-top-a": hsla(h1, 66 + satBoost, 96, 0.82),
    "--hf-liquid-top-b": hsla(h2, 64 + satBoost, 92, 0.18),
    "--hf-liquid-accent-a": hsla(hueShift(h1, -6), 78 + satBoost, 62 + lightBoost, 0.25),
    "--hf-liquid-accent-b": hsla(hueShift(h3, 8), 66 + satBoost, 70 + lightBoost, 0.2),
    "--hf-liquid-accent-c": hsla(h2, 76 + satBoost, 76 + lightBoost, 0.19),
    "--hf-liquid-bottom-a": hsla(h1, 68 + satBoost, 74 + lightBoost, 0.34),
    "--hf-liquid-bottom-b": hsla(h3, 64 + satBoost, 76 + lightBoost, 0.28),
    "--hf-liquid-contour": hsla(h2, 70 + satBoost, 96, 0.55),
  };
}

onMounted(applyLiquidThemeFromSeed);
</script>

<style scoped>
.liquid-bg {
  position: fixed;
  inset: -8% -14%;
  z-index: 0;
  pointer-events: none;
  overflow: hidden;
}
.liquid-bg__mesh {
  position: absolute;
  inset: -22% -18%;
  filter: saturate(115%);
}
.liquid-bg__mesh--base {
  background:
    radial-gradient(circle at 12% 22%, var(--hf-liquid-mesh-a, rgba(127, 164, 255, 0.58)), transparent 38%),
    radial-gradient(circle at 82% 11%, var(--hf-liquid-mesh-b, rgba(117, 227, 255, 0.52)), transparent 36%),
    radial-gradient(circle at 28% 86%, var(--hf-liquid-mesh-c, rgba(170, 247, 224, 0.44)), transparent 44%),
    radial-gradient(circle at 86% 78%, var(--hf-liquid-mesh-d, rgba(219, 163, 255, 0.42)), transparent 42%),
    linear-gradient(135deg, rgba(246, 250, 255, 0.8) 0%, rgba(236, 244, 255, 0.52) 100%);
  animation: liquid-mesh-shift 20s ease-in-out infinite;
}
.liquid-bg__mesh--accent {
  background:
    radial-gradient(circle at 55% 34%, var(--hf-liquid-accent-a, rgba(85, 151, 255, 0.32)), transparent 45%),
    radial-gradient(circle at 42% 63%, var(--hf-liquid-accent-b, rgba(124, 122, 255, 0.24)), transparent 40%),
    radial-gradient(circle at 75% 58%, var(--hf-liquid-accent-c, rgba(255, 188, 240, 0.22)), transparent 46%);
  mix-blend-mode: soft-light;
  animation: liquid-mesh-shift 27s ease-in-out infinite reverse;
}
.liquid-bg__mesh--ambient {
  background:
    radial-gradient(circle at 0% 0%, rgba(255, 255, 255, 0.75), transparent 34%),
    radial-gradient(circle at 100% 0%, rgba(255, 255, 255, 0.35), transparent 28%),
    radial-gradient(circle at 50% 100%, rgba(255, 255, 255, 0.28), transparent 35%);
  opacity: 0.78;
}
.liquid-bg__vector {
  position: absolute;
  width: 178%;
  left: -39%;
  opacity: 0.95;
  mask-image: linear-gradient(to right, transparent 0%, #000 22%, #000 78%, transparent 100%);
  -webkit-mask-image: linear-gradient(to right, transparent 0%, #000 22%, #000 78%, transparent 100%);
}
.liquid-bg__vector--top {
  top: -18%;
  height: 86%;
  animation: liquid-vector-top 18s ease-in-out infinite;
}
.liquid-bg__vector--bottom {
  bottom: -20%;
  height: 84%;
  animation: liquid-vector-bottom 24s ease-in-out infinite;
}
.liquid-bg__contour {
  position: absolute;
  inset: 3% -24% auto;
  width: 152%;
  height: 72%;
  opacity: 0.28;
  mask-image: linear-gradient(to right, transparent 0%, #000 22%, #000 78%, transparent 100%);
  -webkit-mask-image: linear-gradient(to right, transparent 0%, #000 22%, #000 78%, transparent 100%);
}
.liquid-bg__contour path {
  fill: none;
  stroke: var(--hf-liquid-contour, rgba(255, 255, 255, 0.62));
  stroke-width: 2;
  stroke-linecap: round;
}
@keyframes liquid-mesh-shift {
  0%,
  100% {
    transform: translate3d(0, 0, 0) scale(1);
  }
  50% {
    transform: translate3d(1.7%, -1.2%, 0) scale(1.04);
  }
}
@keyframes liquid-vector-top {
  0%,
  100% {
    transform: translate3d(0, 0, 0);
  }
  50% {
    transform: translate3d(-2%, 1.5%, 0);
  }
}
@keyframes liquid-vector-bottom {
  0%,
  100% {
    transform: translate3d(0, 0, 0);
  }
  50% {
    transform: translate3d(2.5%, -1%, 0);
  }
}
@media (max-width: 959px) {
  .liquid-bg {
    inset: -10% -24%;
  }
  .liquid-bg__mesh {
    inset: -26% -22%;
  }
  .liquid-bg__vector--top {
    opacity: 0.78;
    height: 72%;
  }
  .liquid-bg__vector--bottom {
    opacity: 0.72;
    height: 68%;
  }
  .liquid-bg__contour {
    opacity: 0.22;
    width: 170%;
    inset: 6% -30% auto;
  }
}
@media (min-width: 1920px) {
  .liquid-bg {
    inset: -14% -24%;
  }
  .liquid-bg__mesh {
    inset: -28% -26%;
  }
  .liquid-bg__vector {
    width: 220%;
    left: -56%;
  }
  .liquid-bg__vector--top {
    height: 94%;
  }
  .liquid-bg__vector--bottom {
    height: 92%;
  }
  .liquid-bg__contour {
    width: 190%;
    inset: 2% -42% auto;
  }
}
@media (prefers-reduced-motion: reduce) {
  .liquid-bg__mesh,
  .liquid-bg__vector {
    animation: none;
  }
}
</style>
