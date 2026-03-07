import { auth } from "@/lib/auth";
import { prisma } from "@/lib/prisma";

export default async function ProfilePage() {
  const session = await auth();
  const user = await prisma.user.findUniqueOrThrow({ where: { id: session!.user.id }, include: { profiles: true } });

  return (
    <div className="space-y-8">
      <div className="glass rounded-2xl p-6">
        <h1 className="text-3xl font-bold">Profile</h1>
        <p className="mt-2 text-muted">{user.name} • {user.email}</p>
      </div>
      <section className="space-y-3">
        <h2 className="text-xl font-semibold">Viewing Profiles</h2>
        <div className="grid gap-3 md:grid-cols-3">
          {user.profiles.map((profile) => (
            <div key={profile.id} className="rounded-xl border border-white/10 bg-surface p-4">
              <img src={profile.avatar} alt={profile.name} className="h-14 w-14 rounded-full border border-white/20" />
              <p className="mt-2 font-medium">{profile.name}</p>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
