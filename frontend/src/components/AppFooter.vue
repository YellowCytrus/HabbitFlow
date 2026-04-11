<template>
  <footer class="hf-footer py-6 text-center text-body-2 text-medium-emphasis">
    <v-divider class="mb-4" />
    <v-container class="pa-4 hf-footer__inner" fluid>
      HabitFlow — трекер привычек с заботой о вас
    </v-container>
  </footer>
</template>

<style scoped>
@media (min-width: 1280px) {
  .hf-footer__inner {
    max-width: var(--hf-content-max);
    margin-left: auto;
    margin-right: auto;
  }
}
</style>
