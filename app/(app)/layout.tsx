import { Navbar } from "@/components/navbar";

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="min-h-screen">
      <Navbar />
      <main className="mx-auto max-w-7xl space-y-9 px-6 py-8">{children}</main>
    </div>
  );
}
