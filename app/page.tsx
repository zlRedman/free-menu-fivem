import Link from "next/link";
import { Logo } from "@/components/logo";

export default function LandingPage() {
  return (
    <main className="min-h-screen bg-brand-glow">
      <div className="mx-auto flex min-h-screen max-w-6xl flex-col px-6 py-10">
        <header className="flex items-center justify-between">
          <Logo />
          <Link href="/login" className="rounded-full border border-white/20 px-5 py-2 text-sm hover:border-accent">Sign In</Link>
        </header>

        <section className="grid flex-1 place-items-center py-14 md:grid-cols-2 md:gap-12">
          <div className="space-y-6">
            <p className="text-sm uppercase tracking-[0.24em] text-accent2">Stream Beyond Ordinary</p>
            <h1 className="text-5xl font-extrabold leading-tight md:text-7xl">Cinema-grade stories. Personalized to your pulse.</h1>
            <p className="max-w-xl text-lg text-muted">Cinora blends premium design, AI-inspired discovery, and buttery-smooth playback into one addictive entertainment experience.</p>
            <div className="flex gap-3">
              <Link href="/register" className="rounded-lg bg-gradient-to-r from-accent to-accent2 px-6 py-3 font-semibold">Start free demo</Link>
              <Link href="/login" className="rounded-lg border border-white/20 px-6 py-3">I already have an account</Link>
            </div>
          </div>
          <div className="relative h-[500px] w-full">
            <img className="absolute right-0 top-0 h-[500px] w-full rounded-3xl object-cover shadow-card" src="https://images.unsplash.com/photo-1489599856531-7ba0e2f8cb39?auto=format&fit=crop&w=1000&q=80" alt="cinematic"/>
            <div className="glass absolute -bottom-8 left-6 rounded-2xl p-4">
              <p className="text-sm text-muted">Now Trending</p>
              <p className="text-lg font-semibold">Midnight Circuit · 8.8</p>
            </div>
          </div>
        </section>
      </div>
    </main>
  );
}
