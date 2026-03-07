export { auth as middleware } from "@/lib/auth";

export const config = {
  matcher: ["/browse/:path*", "/watch/:path*", "/my-list", "/profile", "/admin", "/search", "/title/:path*"],
};
