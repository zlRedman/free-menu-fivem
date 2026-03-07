import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Cinora — Stream Beyond Ordinary",
  description: "Premium next-gen streaming demo platform",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
