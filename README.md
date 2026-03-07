# Cinora — Premium Streaming Demo

Cinora is a full-stack streaming platform demo built with Next.js, Prisma, NextAuth, and Tailwind CSS.

## Features
- Cinematic landing + premium browse experience
- Auth (register/login) with credentials
- Multi-profile model per account
- Continue watching with saved playback position
- My List / favorites
- Search, title details, watch page
- Mock admin analytics dashboard
- Responsive dark luxury design system

## Quick start
1. Install dependencies
2. Set environment variables from `.env.example`
3. Run Prisma migration + seed
4. Start dev server

```bash
npm install
cp .env.example .env
npx prisma migrate dev --name init
npm run seed
npm run dev
```

Demo login:
- `demo@cinora.app`
- `demo1234`
