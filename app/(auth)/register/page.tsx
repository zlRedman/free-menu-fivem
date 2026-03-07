import Link from "next/link";
import { registerUser } from "@/lib/actions";

export default function RegisterPage() {
  return (
    <main className="mx-auto flex min-h-screen max-w-md items-center px-6">
      <form action={registerUser} className="glass w-full space-y-5 rounded-2xl p-8">
        <h1 className="text-3xl font-bold">Create your Cinora account</h1>
        <input name="name" placeholder="Full name" className="w-full rounded-lg border border-white/15 bg-white/5 px-4 py-3" />
        <input name="email" type="email" placeholder="Email" className="w-full rounded-lg border border-white/15 bg-white/5 px-4 py-3" />
        <input name="password" type="password" placeholder="Password" className="w-full rounded-lg border border-white/15 bg-white/5 px-4 py-3" />
        <button className="w-full rounded-lg bg-gradient-to-r from-accent to-accent2 px-4 py-3 font-semibold">Create account</button>
        <p className="text-sm text-muted">Already registered? <Link href="/login" className="text-accent2">Sign in</Link></p>
      </form>
    </main>
  );
}
