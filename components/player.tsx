"use client";

import { useRef } from "react";

export function Player({ src, startAt = 0, onProgress }: { src: string; startAt?: number; onProgress: (sec: number, pct: number) => void }) {
  const ref = useRef<HTMLVideoElement>(null);

  return (
    <video
      ref={ref}
      src={src}
      controls
      autoPlay
      className="w-full rounded-xl border border-white/20 bg-black"
      onLoadedMetadata={() => {
        if (ref.current && startAt) ref.current.currentTime = startAt;
      }}
      onTimeUpdate={() => {
        if (!ref.current) return;
        const sec = Math.floor(ref.current.currentTime);
        const pct = Math.floor((ref.current.currentTime / ref.current.duration) * 100 || 0);
        onProgress(sec, pct);
      }}
    />
  );
}
