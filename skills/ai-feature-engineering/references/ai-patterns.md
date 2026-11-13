# AI Feature Engineering Patterns

## 1. Architecture & Provider Isolation
- Keep provider SDKs and API keys strictly on the server. Never expose OpenAI, Anthropic, or Gemini tokens to the browser.
- Separate prompt templates, system instructions, and schemas into dedicated modules (`prompts/`, `schemas/ai.schema.ts`), never hardcoded inside UI components.
- Wrap model interactions in a typed service layer so swapping models or adding fallbacks does not impact route handlers or UI.

---

## 2. Structured Outputs with Zod
Never rely on unvalidated raw JSON strings. Always validate structured responses against a Zod schema before returning them to callers:

```typescript
// services/ai-summarizer.service.ts
import { z } from "zod";
import { generateObject } from "ai";
import { openai } from "@ai-sdk/openai";

export const SummaryResultSchema = z.object({
  title: z.string().describe("Concise 5-word headline"),
  keyTakeaways: z.array(z.string()).min(1).max(5),
  sentiment: z.enum(["positive", "neutral", "negative"]),
  confidenceScore: z.number().min(0).max(1),
});

export type SummaryResult = z.infer<typeof SummaryResultSchema>;

export async function generateDocumentSummary(content: string): Promise<SummaryResult> {
  const result = await generateObject({
    model: openai("gpt-4o-mini"),
    schema: SummaryResultSchema,
    prompt: `Analyze and summarize the following text:\n\n${content}`,
  });

  return result.object;
}
```

---

## 3. Safe Tool Calling & Agents
- **Narrow Schemas & Least Privilege:** Define exact parameter types and bounds in the tool definition.
- **Human-in-the-Loop Confirmation:** Destructive operations (deleting data, sending emails, processing payments) must require explicit user approval before execution.
- **Authorization Enforcement:** The agent cannot execute tools with permissions exceeding the authenticated user's session role.

```typescript
import { z } from "zod";
import { tool } from "ai";

export const refundTool = tool({
  description: "Initiate a customer invoice refund. Requires manager privileges.",
  parameters: z.object({
    invoiceId: z.string().uuid(),
    reason: z.string().min(5),
  }),
  execute: async ({ invoiceId, reason }, { messages }) => {
    // 1. Enforce user authorization inside the tool execution
    // 2. Perform refund
    return { status: "refund_initiated", invoiceId };
  },
});
```

---

## 4. RAG (Retrieval-Augmented Generation) Rules
- **Access Control:** Enforce tenant and user authorization during chunk retrieval. A user must never retrieve chunks belonging to another tenant.
- **Citation Verification:** If the model cites a document or chunk ID, ensure the retrieved chunk genuinely contains the asserted fact.
- **Chunk Metadata:** Store source document ID, chunk index, page number, and tenant ID alongside embedding vectors.

---

## 5. Security & Prompt Injection Defense
- Treat model outputs as untrusted data: sanitize before rendering HTML or executing SQL/eval.
- Sanitize user inputs in prompt construction; use role separation (`system` vs `user` messages).
- Implement rate limiting and cost budgets on all AI endpoints.
