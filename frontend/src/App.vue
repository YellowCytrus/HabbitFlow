<template>
  <v-app class="hf-app">
    <SeededLiquidBackground v-if="route.meta.liquidBackground !== false" />
    <AppHeader v-if="showChrome" />
    <v-main class="hf-main">
      <div class="hf-main__inner">
        <router-view v-slot="{ Component, route: r }">
          <transition :name="r.name === 'habits' ? 'route-fade-fixed-safe' : 'route-fade'" mode="out-in">
            <component :is="Component" :key="r.name ?? r.path" />
          </transition>
        </router-view>
      </div>
    </v-main>
    <AppFooter v-if="showChrome" />
  </v-app>
</template>

<script setup>
import { computed, onUnmounted, watch } from "vue";
import { storeToRefs } from "pinia";
import { useRoute } from "vue-router";
import AppHeader from "./components/AppHeader.vue";
import AppFooter from "./components/AppFooter.vue";
import SeededLiquidBackground from "./components/SeededLiquidBackground.vue";
import { useAuthStore } from "./stores/auth";
import { useHabitReminders } from "./composables/useHabitReminders";

const route = useRoute();
const showChrome = computed(() => route.meta.chrome !== false);

const auth = useAuthStore();
const { accessToken } = storeToRefs(auth);
const { start: startReminders, stop: stopReminders } = useHabitReminders();

watch(
  accessToken,
  (t) => {
    if (t) startReminders();
    else stopReminders();
  },
  { immediate: true },
);

onUnmounted(stopReminders);
</script>

<style scoped>
.hf-main {
  background: transparent !important;
  min-height: 100vh;
  position: relative;
}
.hf-main__inner {
  max-width: 1120px;
  margin: 0 auto;
  padding: 16px 20px 48px;
  width: 100%;
  box-sizing: border-box;
}
@media (min-width: 960px) {
  .hf-main__inner {
    padding: 24px 32px 56px;
  }
}
</style>
