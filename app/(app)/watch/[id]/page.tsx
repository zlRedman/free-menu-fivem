import { auth } from "@/lib/auth";
import { prisma } from "@/lib/prisma";
import { updateProgress } from "@/lib/actions";
import { WatchClient } from "./watch-client";

export default async function WatchPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const session = await auth();
  const item = await prisma.content.findUniqueOrThrow({ where: { id } });

  const progress = await prisma.watchProgress.findUnique({
    where: { userId_contentId: { userId: session!.user.id, contentId: item.id } },
  });

  async function saveProgress(sec: number, pct: number) {
    "use server";
    await updateProgress(item.id, sec, pct, session!.user.id);
  }

  return (
    <div className="space-y-4">
      <h1 className="text-2xl font-bold">Now Playing: {item.title}</h1>
      <WatchClient src={item.videoUrl} startAt={progress?.positionSec ?? 0} save={saveProgress} />
      <p className="text-sm text-muted">Playback is auto-saved every few seconds for seamless resume.</p>
    </div>
  );
}
