<template>
  <v-app-bar flat color="transparent" class="app-bar hf-app-bar" elevation="0">
    <v-container class="d-flex align-center py-0 px-4 px-sm-6" fluid>
      <RouterLink to="/habits" class="text-decoration-none text-primary font-weight-bold mr-4 d-none d-sm-inline">
        [HabitFlow]
      </RouterLink>

      <div class="d-flex align-center justify-center flex-grow-1 ga-1 ga-sm-2 flex-wrap">
        <v-btn variant="text" :to="{ name: 'habits' }" class="text-none" size="small" color="primary">
          Главная
        </v-btn>
        <v-btn variant="text" :to="{ name: 'calendar' }" class="text-none" size="small">Календарь</v-btn>
        <v-btn variant="text" :to="{ name: 'habits-new' }" class="text-none" size="small" prepend-icon="mdi-plus">
          Привычка
        </v-btn>
        <v-btn variant="text" :to="{ name: 'profile' }" class="text-none" size="small">Профиль</v-btn>
        <v-btn variant="text" :to="{ name: 'notifications-test' }" class="text-none" size="small">Тест уведомлений</v-btn>
      </div>

      <div class="d-flex align-center ga-2 flex-shrink-0">
        <v-avatar size="32" color="primary" variant="tonal">
          <v-img v-if="avatarUrl" :src="avatarUrl" cover />
          <span v-else class="text-caption font-weight-medium">{{ nameInitial }}</span>
        </v-avatar>
        <span v-if="displayName" class="text-body-2 text-medium-emphasis d-none d-md-inline">{{ displayName }}</span>
        <v-btn variant="outlined" size="small" class="text-none" @click="onLogout">Выйти</v-btn>
      </div>
    </v-container>
  </v-app-bar>
</template>

<script setup>
import { computed, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useAuthStore } from "../stores/auth";
import { api } from "../api/client";

const router = useRouter();
const auth = useAuthStore();
const displayName = computed(() => auth.userName || "");
const avatarUrl = computed(() => auth.userAvatarUrl || "");
const nameInitial = computed(() => (displayName.value || "U").trim().charAt(0).toUpperCase());

onMounted(async () => {
  if (!auth.accessToken) return;
  try {
    const { data } = await api.get("/api/v1/profile");
    auth.setUserProfile(data.user);
  } catch {
    auth.setUserProfile(null);
  }
});

async function onLogout() {
  try {
    await api.post("/api/v1/auth/logout");
  } catch {
    /* ignore */
  }
  auth.logout();
  router.push({ name: "landing" });
}
</script>

<style scoped>
@media (min-width: 960px) {
  .app-bar :deep(.v-container) {
    max-width: 1120px;
  }
}
</style>
