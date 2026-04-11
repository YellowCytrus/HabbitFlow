import "vuetify/styles";
import "@mdi/font/css/materialdesignicons.css";
import { createVuetify } from "vuetify";

/** Apple-inspired palette from design preview (liquid glass works best on light neutrals + blue accent) */
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
    thresholds: {
      xs: 0,
      sm: 480,
      md: 768,
      lg: 1024,
      xl: 1280,
      xxl: 1920,
    },
  },
  theme: {
    defaultTheme: "habitflow",
    themes: {
      habitflow: appleLiquid,
    },
  },
  defaults: {
    global: {
      ripple: true,
    },
    VBtn: {
      variant: "flat",
      rounded: "xl",
    },
    VCard: {
      rounded: "lg",
      elevation: 0,
    },
    VTextField: {
      variant: "outlined",
      density: "comfortable",
      color: "primary",
    },
  },
});
