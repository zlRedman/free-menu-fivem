"use client";

import { useTransition } from "react";
import { Heart } from "lucide-react";
import { useRouter } from "next/navigation";

export function FavoriteButton({ contentId, isFavorite, action }: { contentId: string; isFavorite: boolean; action: (id: string) => Promise<void> }) {
  const [pending, startTransition] = useTransition();
  const router = useRouter();

  return (
    <button
      onClick={() =>
        startTransition(async () => {
          await action(contentId);
          router.refresh();
        })
      }
      disabled={pending}
      className={`flex items-center gap-2 rounded-lg border px-4 py-2 text-sm ${isFavorite ? "border-accent bg-accent/20" : "border-white/20"}`}
    >
      <Heart className="h-4 w-4" fill={isFavorite ? "currentColor" : "none"} />
      {isFavorite ? "In My List" : "Add to List"}
    </button>
  );
}
