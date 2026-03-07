"use server";

import bcrypt from "bcryptjs";
import { prisma } from "@/lib/prisma";
import { signIn } from "@/lib/auth";
import { redirect } from "next/navigation";

export async function registerUser(formData: FormData) {
  const name = String(formData.get("name") || "");
  const email = String(formData.get("email") || "").toLowerCase();
  const password = String(formData.get("password") || "");

  if (!name || !email || password.length < 6) {
    return { error: "Please provide valid details. Password must be at least 6 characters." };
  }

  const exists = await prisma.user.findUnique({ where: { email } });
  if (exists) return { error: "Email already in use." };

  const hash = await bcrypt.hash(password, 10);
  await prisma.user.create({
    data: {
      name,
      email,
      passwordHash: hash,
      image: `https://api.dicebear.com/9.x/bottts/svg?seed=${encodeURIComponent(name)}`,
      profiles: {
        create: [{ name: "Main", avatar: `https://api.dicebear.com/9.x/notionists/svg?seed=${encodeURIComponent(name)}` }],
      },
    },
  });

  await signIn("credentials", { email, password, redirectTo: "/browse" });
  redirect("/browse");
}

export async function updateProgress(contentId: string, positionSec: number, completedPct: number, userId: string) {
  await prisma.watchProgress.upsert({
    where: { userId_contentId: { userId, contentId } },
    create: { userId, contentId, positionSec, completedPct },
    update: { positionSec, completedPct },
  });
}

export async function toggleFavorite(contentId: string, userId: string) {
  const existing = await prisma.favorite.findUnique({ where: { userId_contentId: { userId, contentId } } });
  if (existing) {
    await prisma.favorite.delete({ where: { id: existing.id } });
    return false;
  }
  await prisma.favorite.create({ data: { userId, contentId } });
  return true;
}
