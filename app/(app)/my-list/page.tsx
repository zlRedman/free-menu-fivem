import { auth } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { ContentCard } from "@/components/content-card";

export default async function MyListPage() {
  const session = await auth();
  const list = await prisma.favorite.findMany({ where: { userId: session?.user.id }, include: { content: true } });

  return (
    <div className="space-y-4">
      <h1 className="text-3xl font-bold">My List</h1>
      {!list.length ? (
        <div className="glass rounded-xl p-8 text-muted">Your list is empty. Add a few titles to build your next binge.</div>
      ) : (
        <div className="grid grid-cols-2 gap-4 md:grid-cols-4 lg:grid-cols-6">
          {list.map((entry) => <ContentCard key={entry.id} item={entry.content} />)}
        </div>
      )}
    </div>
  );
}
