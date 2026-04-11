<template>
  <div>
    <v-navigation-drawer
      v-model="drawer"
      temporary
      location="start"
      width="288"
      class="hf-nav-drawer"
    >
      <div class="pa-4 pb-2">
        <RouterLink
          to="/habits"
          class="text-decoration-none text-primary font-weight-bold text-h6"
          @click="drawer = false"
        >
          [HabitFlow]
        </RouterLink>
        <p v-if="displayName" class="text-body-2 text-medium-emphasis mt-2 mb-0 text-truncate">
          {{ displayName }}
        </p>
      </div>
      <v-divider class="mb-2" />
      <v-list nav density="comfortable">
        <v-list-item
          :to="{ name: 'habits' }"
          title="Главная"
          prepend-icon="mdi-home-outline"
          rounded="lg"
          @click="drawer = false"
        />
        <v-list-item
          :to="{ name: 'calendar' }"
          title="Календарь"
          prepend-icon="mdi-calendar-month-outline"
          rounded="lg"
          @click="drawer = false"
        />
        <v-list-item
          :to="{ name: 'habits-new' }"
          title="Новая привычка"
          prepend-icon="mdi-plus-circle-outline"
          rounded="lg"
          @click="drawer = false"
        />
        <v-list-item
          :to="{ name: 'profile' }"
          title="Профиль"
          prepend-icon="mdi-account-outline"
          rounded="lg"
          @click="drawer = false"
        />
        <v-list-item
          :to="{ name: 'notifications-test' }"
          title="Тест уведомлений"
          prepend-icon="mdi-bell-outline"
          rounded="lg"
          @click="drawer = false"
        />
      </v-list>
      <template #append>
        <div class="pa-4 pt-0">
          <v-btn block variant="outlined" class="text-none" @click="onLogoutFromDrawer">Выйти</v-btn>
        </div>
      </template>
    </v-navigation-drawer>

    <v-app-bar flat color="transparent" class="app-bar hf-app-bar" elevation="0">
      <v-container class="d-flex align-center py-0 px-3 px-sm-4 px-md-6" fluid>
        <v-btn
          v-if="mdAndDown"
          icon
          variant="text"
          aria-label="Открыть меню"
          class="flex-shrink-0"
          @click="drawer = true"
        >
          <v-icon icon="mdi-menu" size="large" />
        </v-btn>

        <RouterLink
          to="/habits"
          class="text-decoration-none text-primary font-weight-bold mr-2 mr-lg-4 text-truncate min-w-0"
          :class="mdAndDown ? 'flex-shrink-1' : 'd-none d-sm-inline'"
        >
          [HabitFlow]
        </RouterLink>

        <div
          v-if="lgAndUp"
          class="d-flex align-center justify-center flex-grow-1 ga-1 ga-md-2 flex-wrap"
        >
          <v-btn variant="text" :to="{ name: 'habits' }" class="text-none" size="small" color="primary">
            Главная
          </v-btn>
          <v-btn variant="text" :to="{ name: 'calendar' }" class="text-none" size="small">Календарь</v-btn>
          <v-btn variant="text" :to="{ name: 'habits-new' }" class="text-none" size="small" prepend-icon="mdi-plus">
            Привычка
          </v-btn>
          <v-btn variant="text" :to="{ name: 'profile' }" class="text-none" size="small">Профиль</v-btn>
          <v-btn variant="text" :to="{ name: 'notifications-test' }" class="text-none" size="small">
            Тест уведомлений
          </v-btn>
        </div>
        <div v-else class="flex-grow-1" />

        <div class="d-flex align-center ga-1 ga-sm-2 flex-shrink-0">
          <v-avatar size="32" color="primary" variant="tonal">
            <v-img v-if="avatarUrl" :src="avatarUrl" cover />
            <span v-else class="text-caption font-weight-medium">{{ nameInitial }}</span>
          </v-avatar>
          <span v-if="displayName" class="text-body-2 text-medium-emphasis d-none d-md-inline max-w-32 text-truncate">
            {{ displayName }}
          </span>
          <v-btn variant="outlined" size="small" class="text-none d-none d-sm-flex" @click="onLogout">Выйти</v-btn>
        </div>
      </v-container>
    </v-app-bar>
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useDisplay } from "vuetify";
import { useAuthStore } from "../stores/auth";
import { api } from "../api/client";

const router = useRouter();
const route = useRoute();
const auth = useAuthStore();
const { mdAndDown, lgAndUp } = useDisplay();

const drawer = ref(false);

watch(
  () => route.fullPath,
  () => {
    drawer.value = false;
  },
);

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

async function onLogoutFromDrawer() {
  drawer.value = false;
  await onLogout();
}
</script>

<style scoped>
.max-w-32 {
  max-width: 8rem;
}
@media (min-width: 1280px) {
  .app-bar :deep(.v-container) {
    max-width: 1200px;
  }
}
</style>
