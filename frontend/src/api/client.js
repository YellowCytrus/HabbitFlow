import axios from "axios";

const baseURL = import.meta.env.VITE_API_URL || "";

export const api = axios.create({
  baseURL,
  headers: { "Content-Type": "application/json" },
});

export function setAuthHeader(token) {
  if (token) api.defaults.headers.common.Authorization = `Bearer ${token}`;
  else delete api.defaults.headers.common.Authorization;
}

export function clearAuthHeader() {
  delete api.defaults.headers.common.Authorization;
}

api.interceptors.response.use(
  (r) => r,
  async (err) => {
    const original = err.config;
    if (err.response?.status === 401 && !original._retry) {
      original._retry = true;
      const { useAuthStore } = await import("../stores/auth.js");
      const auth = useAuthStore();
      const rt = auth.refreshToken;
      if (!rt) throw err;
      try {
        const root = (baseURL || "").replace(/\/$/, "");
        const refreshUrl = `${root}/api/v1/auth/refresh`;
        const { data } = await axios.post(refreshUrl, { refresh_token: rt });
        auth.setTokens(data.access_token, null);
        original.headers.Authorization = `Bearer ${data.access_token}`;
        return api(original);
      } catch {
        auth.logout();
        throw err;
      }
    }
    throw err;
  },
);
