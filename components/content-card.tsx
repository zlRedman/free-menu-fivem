import Link from "next/link";

type Props = {
  item: {
    id: string;
    slug: string;
    title: string;
    posterUrl: string;
    year: number;
    rating: number;
  };
};

export function ContentCard({ item }: Props) {
  return (
    <Link href={`/title/${item.slug}`} className="card-hover group min-w-[210px] max-w-[210px]">
      <div className="overflow-hidden rounded-xl border border-white/10 bg-surface">
        <img src={item.posterUrl} alt={item.title} className="h-72 w-full object-cover transition duration-300 group-hover:scale-105" />
      </div>
      <div className="mt-3 space-y-1">
        <p className="font-medium">{item.title}</p>
        <p className="text-sm text-muted">{item.year} • ⭐ {item.rating}</p>
      </div>
    </Link>
  );
}
