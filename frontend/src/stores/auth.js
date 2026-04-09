import { defineStore } from "pinia";
import { ref } from "vue";
import { setAuthHeader, clearAuthHeader } from "../api/client";

const ACCESS = "habitflow_access";
const REFRESH = "habitflow_refresh";

export const useAuthStore = defineStore("auth", () => {
  const accessToken = ref("");
  const refreshToken = ref("");
  const userName = ref("");
  const userAvatarUrl = ref("");

  function hydrate() {
    accessToken.value = localStorage.getItem(ACCESS) || "";
    refreshToken.value = localStorage.getItem(REFRESH) || "";
    setAuthHeader(accessToken.value || null);
  }

  function setTokens(access, refresh) {
    accessToken.value = access;
    refreshToken.value = refresh || refreshToken.value;
    localStorage.setItem(ACCESS, access);
    if (refresh) localStorage.setItem(REFRESH, refresh);
    setAuthHeader(access);
  }

  function logout() {
    accessToken.value = "";
    refreshToken.value = "";
    userName.value = "";
    userAvatarUrl.value = "";
    localStorage.removeItem(ACCESS);
    localStorage.removeItem(REFRESH);
    clearAuthHeader();
  }

  function setUserProfile(user) {
    userName.value = user?.name || "";
    userAvatarUrl.value = user?.avatar_url || "";
  }

  return { accessToken, refreshToken, userName, userAvatarUrl, hydrate, setTokens, setUserProfile, logout };
});
