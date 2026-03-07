"use client";

import { useRef } from "react";
import { Player } from "@/components/player";

export function WatchClient({ src, startAt, save }: { src: string; startAt: number; save: (sec: number, pct: number) => Promise<void> }) {
  const lastSaveRef = useRef(0);

  return (
    <Player
      src={src}
      startAt={startAt}
      onProgress={(sec, pct) => {
        if (sec - lastSaveRef.current < 8) return;
        lastSaveRef.current = sec;
        save(sec, pct);
      }}
    />
  );
}
