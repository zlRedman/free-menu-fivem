import Link from "next/link";
import { signIn } from "@/lib/auth";

export default function LoginPage() {
  return (
    <main className="mx-auto flex min-h-screen max-w-md items-center px-6">
      <form
        action={async (formData) => {
          "use server";
          await signIn("credentials", {
            email: String(formData.get("email") || ""),
            password: String(formData.get("password") || ""),
            redirectTo: "/browse",
          });
        }}
        className="glass w-full space-y-5 rounded-2xl p-8"
      >
        <h1 className="text-3xl font-bold">Welcome back to Cinora</h1>
        <input name="email" type="email" placeholder="Email" className="w-full rounded-lg border border-white/15 bg-white/5 px-4 py-3" />
        <input name="password" type="password" placeholder="Password" className="w-full rounded-lg border border-white/15 bg-white/5 px-4 py-3" />
        <button className="w-full rounded-lg bg-gradient-to-r from-accent to-accent2 px-4 py-3 font-semibold">Sign in</button>
        <p className="text-sm text-muted">No account? <Link href="/register" className="text-accent2">Create one</Link></p>
        <p className="text-xs text-muted">Demo: demo@cinora.app / demo1234</p>
      </form>
    </main>
  );
}
