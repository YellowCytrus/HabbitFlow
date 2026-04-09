import { createRouter, createWebHistory } from "vue-router";
import { useAuthStore } from "../stores/auth";

import LandingPage from "../views/LandingPage.vue";
import AuthPage from "../views/AuthPage.vue";
import HabitsIndex from "../views/HabitsIndex.vue";
import HabitForm from "../views/HabitForm.vue";
import HabitShow from "../views/HabitShow.vue";
import CalendarPage from "../views/CalendarPage.vue";
import ProfilePage from "../views/ProfilePage.vue";
import NotificationTestPage from "../views/NotificationTestPage.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: "/", name: "landing", component: LandingPage, meta: { chrome: false } },
    { path: "/auth", name: "auth", component: AuthPage, meta: { chrome: false } },
    {
      path: "/habits",
      name: "habits",
      component: HabitsIndex,
      meta: { requiresAuth: true },
    },
    {
      path: "/habits/new",
      name: "habits-new",
      component: HabitForm,
      meta: { requiresAuth: true },
    },
    {
      path: "/habits/:id/edit",
      name: "habits-edit",
      component: HabitForm,
      meta: { requiresAuth: true },
    },
    {
      path: "/habits/:id",
      name: "habits-show",
      component: HabitShow,
      meta: { requiresAuth: true },
    },
    {
      path: "/calendar",
      name: "calendar",
      component: CalendarPage,
      meta: { requiresAuth: true },
    },
    {
      path: "/profile",
      name: "profile",
      component: ProfilePage,
      meta: { requiresAuth: true },
    },
    {
      path: "/notifications/test",
      name: "notifications-test",
      component: NotificationTestPage,
      meta: { requiresAuth: true },
    },
  ],
});

router.beforeEach((to) => {
  const auth = useAuthStore();
  if (to.meta.requiresAuth && !auth.accessToken) {
    return { name: "auth", query: { next: to.fullPath } };
  }
  return true;
});

export default router;
