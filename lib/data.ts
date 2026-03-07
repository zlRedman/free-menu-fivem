import { prisma } from "@/lib/prisma";

export async function getHomeFeed(userId?: string) {
  const all = await prisma.content.findMany({ orderBy: { rating: "desc" } });
  const featured = all.filter((item) => item.featured).slice(0, 2);
  const trending = all.slice(0, 6);
  const newReleases = [...all].sort((a, b) => b.year - a.year).slice(0, 6);
  const topRated = all.slice(0, 6);
  const becauseYouWatched = all.slice(2, 8);

  const continueWatching = userId
    ? await prisma.watchProgress.findMany({
        where: { userId },
        include: { content: true },
        orderBy: { updatedAt: "desc" },
        take: 6,
      })
    : [];

  const recommended = all.filter((item) => item.genres.includes("Sci-Fi") || item.rating >= 8).slice(0, 6);

  return { featured, trending, newReleases, topRated, becauseYouWatched, recommended, continueWatching };
}
