import Link from "next/link";
import { auth } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { FavoriteButton } from "@/components/favorite-button";
import { toggleFavorite } from "@/lib/actions";

export default async function TitlePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const session = await auth();
  const item = await prisma.content.findUniqueOrThrow({ where: { slug } });
  const fav = session?.user?.id
    ? await prisma.favorite.findUnique({ where: { userId_contentId: { userId: session.user.id, contentId: item.id } } })
    : null;

  async function handleToggle(contentId: string) {
    "use server";
    if (!session?.user?.id) return;
    await toggleFavorite(contentId, session.user.id);
  }

  return (
    <div className="space-y-6">
      <div className="relative overflow-hidden rounded-2xl border border-white/15">
        <img src={item.bannerUrl} alt={item.title} className="h-[46vh] w-full object-cover" />
        <div className="absolute inset-0 bg-gradient-to-r from-black/80 via-black/35 to-black/20" />
        <div className="absolute bottom-0 p-8">
          <h1 className="text-4xl font-bold">{item.title}</h1>
          <p className="mt-3 max-w-2xl text-zinc-200">{item.synopsis}</p>
          <div className="mt-4 flex flex-wrap gap-3 text-sm text-zinc-300">
            <span>{item.year}</span><span>•</span><span>{item.durationMin} min</span><span>•</span><span>{item.maturity}</span><span>•</span><span>⭐ {item.rating}</span>
          </div>
          <div className="mt-6 flex gap-3">
            <Link href={`/watch/${item.id}`} className="rounded-lg bg-gradient-to-r from-accent to-accent2 px-6 py-3 font-semibold">Watch Now</Link>
            <FavoriteButton contentId={item.id} isFavorite={Boolean(fav)} action={handleToggle} />
          </div>
        </div>
      </div>
      <div className="grid gap-4 rounded-2xl border border-white/10 bg-surface p-6 text-sm text-muted md:grid-cols-2">
        <p><span className="text-white">Genres:</span> {item.genres}</p>
        <p><span className="text-white">Cast:</span> {item.cast}</p>
      </div>
    </div>
  );
}
