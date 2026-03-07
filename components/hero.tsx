import Link from "next/link";

export function Hero({ item }: { item: any }) {
  return (
    <section className="relative overflow-hidden rounded-2xl border border-white/15 shadow-card">
      <img src={item.bannerUrl} alt={item.title} className="h-[62vh] w-full object-cover" />
      <div className="absolute inset-0 bg-gradient-to-r from-black/85 via-black/45 to-transparent" />
      <div className="absolute inset-0 flex items-end p-8 md:p-12">
        <div className="max-w-2xl space-y-5">
          <p className="inline-flex rounded-full border border-accent/60 bg-accent/20 px-3 py-1 text-xs font-semibold uppercase tracking-[0.2em]">Cinora Original</p>
          <h1 className="text-4xl font-bold leading-tight md:text-6xl">{item.title}</h1>
          <p className="max-w-xl text-base text-zinc-200 md:text-lg">{item.synopsis}</p>
          <div className="flex gap-3">
            <Link href={`/watch/${item.id}`} className="rounded-lg bg-gradient-to-r from-accent to-accent2 px-6 py-3 font-semibold text-white">Watch now</Link>
            <Link href={`/title/${item.slug}`} className="rounded-lg border border-white/30 bg-black/30 px-6 py-3 font-semibold">Details</Link>
          </div>
        </div>
      </div>
    </section>
  );
}
