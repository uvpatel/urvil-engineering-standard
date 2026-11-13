# Next.js 16+ App Router & React 19 Engineering Patterns

## 1. Server Components First
- Treat React Server Components (RSC) as the default for all layouts, pages, and data-fetching components.
- Push `"use client"` to the leaf components that genuinely require browser APIs, event listeners, or client-side interactive state.
- Keep data fetching on the server. Never pass sensitive database clients, secret keys, or unneeded internal data across the RSC boundary.

```tsx
// Server Component (Default)
import { Suspense } from "react";
import { UserProfile } from "./user-profile";
import { ProfileSkeleton } from "./profile-skeleton";
import { getUserData } from "@/services/user.service";

interface PageProps {
  params: Promise<{ id: string }>;
}

export default async function Page({ params }: PageProps) {
  // In Next.js 16+, params and searchParams are asynchronous Promises
  const { id } = await params;

  return (
    <main className="container mx-auto px-4 py-8">
      <Suspense fallback={<ProfileSkeleton />}>
        <UserProfileWrapper userId={id} />
      </Suspense>
    </main>
  );
}

async function UserProfileWrapper({ userId }: { userId: string }) {
  const user = await getUserData(userId);
  return <UserProfile user={user} />;
}
```

## 2. Server Actions & Mutations
- Use Server Actions for form submissions, state mutations, and lightweight data updates.
- Always validate input arguments on the server using Zod.
- Always perform session and authorization checks on the server.
- Return structured, typed result objects rather than throwing unhandled exceptions.

```tsx
// app/actions/update-profile.ts
"use server";

import { z } from "zod";
import { auth } from "@/lib/auth";
import { headers } from "next/headers";
import { updateUserProfile } from "@/services/user.service";
import { revalidatePath } from "next/cache";

const UpdateProfileSchema = z.object({
  name: z.string().trim().min(2).max(100),
  bio: z.string().trim().max(500).optional(),
});

export type ActionState = {
  success: boolean;
  error?: string;
  data?: unknown;
};

export async function updateProfileAction(
  prevState: ActionState,
  formData: FormData
): Promise<ActionState> {
  const session = await auth.api.getSession({
    headers: await headers(),
  });

  if (!session?.user) {
    return { success: false, error: "Unauthorized access." };
  }

  const rawData = {
    name: formData.get("name"),
    bio: formData.get("bio"),
  };

  const parsed = UpdateProfileSchema.safeParse(rawData);
  if (!parsed.success) {
    return {
      success: false,
      error: parsed.error.issues[0]?.message ?? "Invalid form input.",
    };
  }

  try {
    await updateUserProfile(session.user.id, parsed.data);
    revalidatePath("/profile");
    return { success: true };
  } catch (err) {
    return { success: false, error: "Failed to update profile. Please try again." };
  }
}
```

## 3. Thin Route Handlers (`app/api/**/route.ts`)
Keep Route Handlers thin: parse incoming requests, validate input, authenticate/authorize, delegate to service functions, and map responses to proper HTTP status codes.

```tsx
// app/api/webhooks/stripe/route.ts
import { NextRequest, NextResponse } from "next/server";
import { verifyWebhookSignature } from "@/lib/stripe";
import { handleSubscriptionEvent } from "@/services/subscription.service";

export async function POST(req: NextRequest) {
  const signature = req.headers.get("stripe-signature");
  if (!signature) {
    return NextResponse.json({ error: "Missing signature" }, { status: 400 });
  }

  try {
    const rawBody = await req.text();
    const event = await verifyWebhookSignature(rawBody, signature);
    await handleSubscriptionEvent(event);
    return NextResponse.json({ received: true }, { status: 200 });
  } catch (err) {
    return NextResponse.json({ error: "Webhook processing failed" }, { status: 400 });
  }
}
```

## 4. UI States & Next.js Conventions
- Use `loading.tsx` for route-level Suspense boundaries.
- Use `error.tsx` (which must be a client component) for route-level recovery boundaries.
- Use `not-found.tsx` for missing resource presentation with `notFound()` invocation.
- Avoid request waterfalls: use `Promise.all()` to parallelize independent server-side fetches.
