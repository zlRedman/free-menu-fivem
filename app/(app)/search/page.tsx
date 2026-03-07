import { prisma } from "@/lib/prisma";
import { ContentCard } from "@/components/content-card";

export default async function SearchPage({ searchParams }: { searchParams: Promise<{ q?: string }> }) {
  const q = (await searchParams).q || "";
  const data = await prisma.content.findMany({
    where: q
      ? {
          OR: [
            { title: { contains: q } },
            { genres: { contains: q } },
            { cast: { contains: q } },
          ],
        }
      : undefined,
    take: 18,
  });

  return (
    <div className="space-y-6">
      <form className="glass rounded-2xl p-4">
        <input name="q" defaultValue={q} placeholder="Search titles, cast, genres..." className="w-full bg-transparent px-2 py-2 text-lg outline-none" />
      </form>
      <div className="grid grid-cols-2 gap-4 md:grid-cols-4 lg:grid-cols-6">
        {data.map((item) => <ContentCard key={item.id} item={item} />)}
      </div>
    </div>
  );
}
