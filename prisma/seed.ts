import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

const titles = [
  {
    slug: "midnight-circuit",
    title: "Midnight Circuit",
    synopsis: "A fallen race engineer hacks illegal AI prototypes to save her city from a silent blackout regime.",
    bannerUrl: "https://images.unsplash.com/photo-1489515217757-5fd1be406fef?auto=format&fit=crop&w=1600&q=80",
    posterUrl: "https://images.unsplash.com/photo-1519608487953-e999c86e7455?auto=format&fit=crop&w=800&q=80",
    trailerUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    year: 2025,
    rating: 8.8,
    durationMin: 126,
    genres: "Sci-Fi, Thriller",
    cast: "Nora Vale, Zayn Cruz, Ilya Moon",
    maturity: "16+",
    featured: true,
  },
  {
    slug: "glass-harbor",
    title: "Glass Harbor",
    synopsis: "In a floating city, a rescue diver uncovers a conspiracy buried beneath mirrored water tunnels.",
    bannerUrl: "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?auto=format&fit=crop&w=1600&q=80",
    posterUrl: "https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=800&q=80",
    trailerUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    year: 2024,
    rating: 8.1,
    durationMin: 114,
    genres: "Drama, Mystery",
    cast: "Mara Lin, Theo Hart, Sia Quill",
    maturity: "13+",
    featured: true,
  },
  {
    slug: "ember-protocol",
    title: "Ember Protocol",
    synopsis: "A cyber-forensics duo races to decode an arson pattern before an entire smart district ignites.",
    bannerUrl: "https://images.unsplash.com/photo-1514565131-fce0801e5785?auto=format&fit=crop&w=1600&q=80",
    posterUrl: "https://images.unsplash.com/photo-1482192505345-5655af888cc4?auto=format&fit=crop&w=800&q=80",
    trailerUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    year: 2023,
    rating: 7.9,
    durationMin: 109,
    genres: "Crime, Action",
    cast: "Kira Haze, Devon Pike, Lumi Reed",
    maturity: "16+",
    featured: false,
  },
  {
    slug: "north-of-echo",
    title: "North of Echo",
    synopsis: "A grief-struck composer follows impossible radio signals to a town where memory can be edited.",
    bannerUrl: "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1600&q=80",
    posterUrl: "https://images.unsplash.com/photo-1469474968028-56623f02e42e?auto=format&fit=crop&w=800&q=80",
    trailerUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    year: 2022,
    rating: 9,
    durationMin: 141,
    genres: "Drama, Sci-Fi",
    cast: "Ari Sol, Juno Park, Ellis Gray",
    maturity: "13+",
    featured: false,
  },
  {
    slug: "pulse-zero",
    title: "Pulse Zero",
    synopsis: "When satellites fail worldwide, an astronaut and a hacker coordinate a one-shot reboot mission.",
    bannerUrl: "https://images.unsplash.com/photo-1446776877081-d282a0f896e2?auto=format&fit=crop&w=1600&q=80",
    posterUrl: "https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?auto=format&fit=crop&w=800&q=80",
    trailerUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
    videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
    year: 2025,
    rating: 8.4,
    durationMin: 121,
    genres: "Adventure, Thriller",
    cast: "Luca Wynn, Tali Ro, Ben Armitage",
    maturity: "13+",
    featured: true,
  },
  {
    slug: "velvet-shadow",
    title: "Velvet Shadow",
    synopsis: "A reclusive illusionist is pulled into a high-stakes heist staged as a live theatre spectacle.",
    bannerUrl: "https://images.unsplash.com/photo-1513185041617-8ab03f83d6c5?auto=format&fit=crop&w=1600&q=80",
    posterUrl: "https://images.unsplash.com/photo-1478720568477-152d9b164e26?auto=format&fit=crop&w=800&q=80",
    trailerUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    videoUrl: "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    year: 2021,
    rating: 7.7,
    durationMin: 102,
    genres: "Mystery, Crime",
    cast: "Noah Caine, Mirel Dusk, Asa Bloom",
    maturity: "16+",
    featured: false,
  }
];

async function main() {
  await prisma.favorite.deleteMany();
  await prisma.watchProgress.deleteMany();
  await prisma.profile.deleteMany();
  await prisma.content.deleteMany();
  await prisma.user.deleteMany();

  await prisma.content.createMany({ data: titles });

  const demoPass = await bcrypt.hash("demo1234", 10);
  const user = await prisma.user.create({
    data: {
      email: "demo@cinora.app",
      name: "Demo User",
      passwordHash: demoPass,
      image: "https://api.dicebear.com/9.x/bottts/svg?seed=Cinora",
      profiles: {
        create: [
          { name: "You", avatar: "https://api.dicebear.com/9.x/notionists/svg?seed=You" },
          { name: "Kids", avatar: "https://api.dicebear.com/9.x/notionists/svg?seed=Kids" }
        ]
      }
    }
  });

  const content = await prisma.content.findMany();
  await prisma.favorite.create({ data: { userId: user.id, contentId: content[0].id } });
  await prisma.favorite.create({ data: { userId: user.id, contentId: content[2].id } });

  await prisma.watchProgress.create({
    data: {
      userId: user.id,
      contentId: content[1].id,
      positionSec: 1860,
      completedPct: 28,
    }
  });
}

main().finally(async () => prisma.$disconnect());
