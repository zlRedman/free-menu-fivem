import type { Config } from "tailwindcss";

export default {
  content: ["./app/**/*.{ts,tsx}", "./components/**/*.{ts,tsx}"],
  theme: {
    extend: {
      colors: {
        bg: "#07080d",
        surface: "#121420",
        accent: "#6e5bff",
        accent2: "#00d1ff",
        text: "#f7f8fd",
        muted: "#9096ae",
      },
      backgroundImage: {
        "brand-glow": "radial-gradient(circle at top right, rgba(110,91,255,0.35), transparent 55%), radial-gradient(circle at top left, rgba(0,209,255,0.25), transparent 45%)",
      },
      boxShadow: {
        card: "0 8px 40px rgba(0,0,0,0.35)",
      },
    },
  },
  plugins: [],
} satisfies Config;
