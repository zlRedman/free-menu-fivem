import Link from "next/link";
import { Logo } from "@/components/logo";
import { auth, signOut } from "@/lib/auth";

export async function Navbar() {
  const session = await auth();

  return (
    <header className="sticky top-0 z-50 border-b border-white/10 bg-bg/80 backdrop-blur-xl">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
        <div className="flex items-center gap-8">
          <Link href="/browse"><Logo /></Link>
          <nav className="hidden md:flex items-center gap-5 text-sm text-muted">
            <Link href="/browse" className="hover:text-white">Home</Link>
            <Link href="/search" className="hover:text-white">Search</Link>
            <Link href="/my-list" className="hover:text-white">My List</Link>
            <Link href="/admin" className="hover:text-white">Admin</Link>
          </nav>
        </div>
        <div className="flex items-center gap-3">
          <Link href="/profile" className="text-sm text-muted hover:text-white">{session?.user?.name}</Link>
          <form action={async () => { "use server"; await signOut({ redirectTo: "/" }); }}>
            <button className="rounded-full border border-white/20 px-4 py-1.5 text-sm hover:border-accent">Sign out</button>
          </form>
        </div>
      </div>
    </header>
  );
}
