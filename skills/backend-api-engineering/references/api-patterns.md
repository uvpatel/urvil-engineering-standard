# Backend & API Engineering Patterns

## 1. Layered Architecture

Always maintain clean separation between the HTTP transport layer, business services, and data persistence:

```text
Request / Action
      ↓
[1. Transport Layer]     → Parse HTTP headers, body, params (Route Handler / Server Action)
      ↓
[2. Validation Boundary] → Zod schema validation (safeParse)
      ↓
[3. Auth & Authorization]→ Server-side Better Auth session check + resource ownership verification
      ↓
[4. Domain Service]      → Business orchestration & logic execution
      ↓
[5. Persistence Layer]   → Drizzle ORM / Mongoose ODM query with explicit projections
      ↓
Response (Typed DTO)     → Structured JSON response with proper HTTP status code
```

## 2. Zod Boundary Validation
Validate all external and untrusted inputs at the perimeter:

```typescript
// schemas/project.schema.ts
import { z } from "zod";

export const CreateProjectSchema = z.object({
  name: z.string().trim().min(3).max(80),
  description: z.string().trim().max(300).optional(),
  tags: z.array(z.string().trim().toLowerCase()).max(10).default([]),
});

export type CreateProjectInput = z.infer<typeof CreateProjectSchema>;
```

## 3. Server-Side Authorization & Anti-IDOR
Never trust client-supplied tenant or user IDs. Always extract the authenticated user identity directly from the verified session:

```typescript
// Route Handler example
import { NextRequest, NextResponse } from "next/server";
import { auth } from "@/lib/auth";
import { headers } from "next/headers";
import { CreateProjectSchema } from "@/schemas/project.schema";
import { createProjectForUser } from "@/services/project.service";

export async function POST(req: NextRequest) {
  // 1. Session verification
  const session = await auth.api.getSession({
    headers: await headers(),
  });

  if (!session?.user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  // 2. Input validation
  const body = await req.json().catch(() => null);
  const result = CreateProjectSchema.safeParse(body);
  if (!result.success) {
    return NextResponse.json(
      { error: "Validation failed", issues: result.error.flatten().fieldErrors },
      { status: 422 }
    );
  }

  // 3. Domain execution with verified session user ID
  try {
    const project = await createProjectForUser(session.user.id, result.data);
    return NextResponse.json(project, { status: 201 });
  } catch (error) {
    console.error("[API Error] Failed to create project:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  }
}
```

## 4. Uniform Error Responses
Standardize error response payloads across all endpoints:

```typescript
export interface ApiErrorResponse {
  error: string;
  code?: string;
  issues?: Record<string, string[]>;
}
```

- `400 Bad Request`: Malformed JSON or invalid syntax.
- `401 Unauthorized`: Missing or invalid session authentication.
- `403 Forbidden`: Authenticated user lacks permission to access the resource.
- `404 Not Found`: Target entity does not exist or user cannot view it.
- `409 Conflict`: Unique constraint violation or concurrent write race.
- `422 Unprocessable Entity`: Zod validation failures on specific fields.
- `429 Too Many Requests`: Rate limit exceeded.
- `500 Internal Server Error`: Unhandled failure (log detailed stack trace server-side; return sanitized message to client).

## 5. Webhook Security & Idempotency
- Verify cryptographic signatures before reading payload data.
- Check idempotency keys in Redis or database to prevent duplicate execution.
- Acknowledge webhooks quickly (`200 OK`) and perform heavy work asynchronously.
