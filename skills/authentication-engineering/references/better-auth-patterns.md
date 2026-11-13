# Better Auth Engineering Patterns

## 1. Preserve Better Auth
- Better Auth is the project's standard authentication framework.
- **Never replace Better Auth** with Clerk, NextAuth/Auth.js, Supabase Auth, or custom token solutions unless explicitly instructed and approved by the developer.

---

## 2. Server-Side Session Verification

UI route guards and client redirects are insufficient for security. Always enforce authentication and authorization server-side in Server Components, Server Actions, and Route Handlers:

### In Server Components
```tsx
import { auth } from "@/lib/auth";
import { headers } from "next/headers";
import { redirect } from "next/navigation";

export default async function DashboardPage() {
  const session = await auth.api.getSession({
    headers: await headers(),
  });

  if (!session?.user) {
    redirect("/login?callbackUrl=/dashboard");
  }

  return (
    <div>
      <h1>Welcome back, {session.user.name}</h1>
    </div>
  );
}
```

### In Server Actions
```tsx
"use server";

import { auth } from "@/lib/auth";
import { headers } from "next/headers";

export async function performSensitiveAction() {
  const session = await auth.api.getSession({
    headers: await headers(),
  });

  if (!session?.user) {
    throw new Error("Unauthorized");
  }

  // Enforce role-based access control (RBAC)
  if (session.user.role !== "admin") {
    throw new Error("Forbidden: Admin privileges required.");
  }

  // Perform action...
}
```

---

## 3. Better Auth Configuration Structure
Keep configuration in a central, server-only file:

```typescript
// lib/auth.ts
import { betterAuth } from "better-auth";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { db } from "@/db";

export const auth = betterAuth({
  database: drizzleAdapter(db, {
    provider: "pg",
  }),
  emailAndPassword: {
    enabled: true,
  },
  session: {
    expiresIn: 60 * 60 * 24 * 7, // 7 days
    updateAge: 60 * 60 * 24,      // 1 day
  },
});
```

---

## 4. Client-Side Authentication Patterns
Use the typed Better Auth client for interactive UI components:

```tsx
"use client";

import { authClient } from "@/lib/auth-client";
import { Button } from "@/components/ui/button";

export function UserNav() {
  const { data: session, isPending } = authClient.useSession();

  if (isPending) {
    return <div className="h-8 w-20 animate-pulse bg-muted rounded" />;
  }

  if (!session) {
    return <Button variant="outline" onClick={() => authClient.signIn()}>Sign In</Button>;
  }

  return (
    <div className="flex items-center gap-3">
      <span className="text-sm font-medium">{session.user.name}</span>
      <Button
        variant="ghost"
        size="sm"
        onClick={() => authClient.signOut({ fetchOptions: { onSuccess: () => window.location.href = "/" } })}
      >
        Sign Out
      </Button>
    </div>
  );
}
```

---

## 5. Security & Session Hygiene Checklist
- [ ] Environment variables for secrets (`BETTER_AUTH_SECRET`, OAuth client secrets) must never be prefixed with `NEXT_PUBLIC_`.
- [ ] Cookies must use `HttpOnly`, `Secure` in production, and `SameSite=Lax`.
- [ ] Handle callback redirects safely by validating origin domains against whitelist.
- [ ] Implement rate limiting on login and password reset routes.
