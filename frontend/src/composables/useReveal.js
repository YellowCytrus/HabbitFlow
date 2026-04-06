import { nextTick, onMounted, onUnmounted } from "vue";

/**
 * Observe elements with [data-reveal] under rootRef and toggle .is-visible when in view.
 * @param {import('vue').Ref<HTMLElement | null>} rootRef
 */
export function useReveal(rootRef) {
  let observer = null;

  onMounted(async () => {
    await nextTick();
    const root = rootRef.value;
    if (!root) return;
    if (typeof IntersectionObserver === "undefined") {
      root.querySelectorAll("[data-reveal]").forEach((el) => el.classList.add("is-visible"));
      return;
    }
    observer = new IntersectionObserver(
      (entries) => {
        for (const e of entries) {
          if (e.isIntersecting) {
            e.target.classList.add("is-visible");
            observer?.unobserve(e.target);
          }
        }
      },
      { root: null, rootMargin: "0px 0px -8% 0px", threshold: 0.08 },
    );
    root.querySelectorAll("[data-reveal]").forEach((el) => observer.observe(el));
  });

  onUnmounted(() => {
    observer?.disconnect();
    observer = null;
  });
}
