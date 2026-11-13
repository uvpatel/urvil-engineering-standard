---
name: ai-feature-engineering
description: Design and implement AI features including LLM workflows, structured outputs, tool calling, RAG pipelines, and evaluation boundaries. Use when building chat interfaces, AI agents, embeddings retrieval, or prompt engineering.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# AI Feature Engineering

## Core Architecture Principles

1. **Server-Side AI SDK:** Keep AI provider SDKs and API keys strictly on the server. Never expose tokens in client bundles.
2. **Provider Isolation:** Isolate provider-specific integrations behind typed service interfaces to make swapping models seamless.
3. **Structured Outputs with Zod:** Always validate model output against strict Zod schemas before consuming it in application logic.
4. **Untrusted Model Output:** Treat all AI-generated content as untrusted input. Sanitize before rendering or executing database queries.
5. **Streaming for UX:** Use streaming responses (`streamText`, `useChat`) only when it visibly enhances user responsiveness.

## Tool Calling & Agent Boundaries

- **Least Privilege:** Give agent tools narrow, strictly validated Zod parameter schemas.
- **Human Confirmation:** Any destructive or consequential action (deleting resources, financial transactions, external emails) requires explicit user confirmation.
- **Enforce Permissions:** Verify that the calling user possesses the required session authorization before executing any tool logic.

## RAG Guardrails

- **Authorization in Retrieval:** Always enforce tenant and user access controls during vector retrieval.
- **Groundedness & Citations:** Do not claim citations support output unless the retrieved chunk verifiably does.

## Reference Patterns

For detailed structured output examples, safe tool-calling patterns, and RAG retrieval rules, consult [AI Feature Engineering Patterns](references/ai-patterns.md).
