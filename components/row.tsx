import { ContentCard } from "@/components/content-card";

export function Row({ title, items }: { title: string; items: any[] }) {
  if (!items?.length) {
    return (
      <section className="space-y-3">
        <h3 className="text-xl font-semibold">{title}</h3>
        <div className="glass rounded-xl p-8 text-muted">Nothing here yet. Your taste profile is still warming up.</div>
      </section>
    );
  }

  return (
    <section className="space-y-3">
      <h3 className="text-xl font-semibold">{title}</h3>
      <div className="flex gap-4 overflow-x-auto pb-2">
        {items.map((item) => (
          <ContentCard key={item.id} item={item} />
        ))}
      </div>
    </section>
  );
}
