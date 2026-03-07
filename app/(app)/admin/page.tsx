import { prisma } from "@/lib/prisma";

export default async function AdminPage() {
  const [users, titles, favorites, progress] = await Promise.all([
    prisma.user.count(),
    prisma.content.count(),
    prisma.favorite.count(),
    prisma.watchProgress.count(),
  ]);

  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold">Admin Snapshot</h1>
      <p className="text-muted">Mock dashboard for demo analytics and content ops.</p>
      <div className="grid gap-4 md:grid-cols-4">
        {[
          ["Users", users],
          ["Titles", titles],
          ["Favorites", favorites],
          ["Active Progress", progress],
        ].map(([label, value]) => (
          <div key={label as string} className="rounded-xl border border-white/10 bg-surface p-5">
            <p className="text-sm text-muted">{label as string}</p>
            <p className="mt-2 text-3xl font-bold">{value as number}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
