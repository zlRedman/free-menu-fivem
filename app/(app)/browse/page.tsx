import { auth } from "@/lib/auth";
import { getHomeFeed } from "@/lib/data";
import { Hero } from "@/components/hero";
import { Row } from "@/components/row";

export default async function BrowsePage() {
  const session = await auth();
  const feed = await getHomeFeed(session?.user?.id);

  return (
    <div className="space-y-8">
      <Hero item={feed.featured[0]} />
      <Row title="Trending Now" items={feed.trending} />
      <Row title="Continue Watching" items={feed.continueWatching.map((p) => p.content)} />
      <Row title="New Releases" items={feed.newReleases} />
      <Row title="Recommended For You" items={feed.recommended} />
      <Row title="Because You Watched Midnight Circuit" items={feed.becauseYouWatched} />
      <Row title="Top Rated" items={feed.topRated} />
    </div>
  );
}
