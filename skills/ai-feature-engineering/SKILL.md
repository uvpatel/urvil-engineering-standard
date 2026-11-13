---
name: ai-feature-engineering
description: Design and implement AI features such as LLM chat, structured outputs, tool calling, RAG, streaming, and evaluations with explicit reliability and security boundaries.
---

# AI Feature Engineering

## Requirements first

Define the user outcome, model/provider constraints, latency/cost budget, privacy requirements, failure behavior, and measurable acceptance criteria. Obtain approval for architecture and provider choices.

## Architecture

- Isolate provider-specific code behind a small, typed adapter when multiple providers or swapping is a real requirement.
- Avoid overengineering a one-provider integration.
- Keep prompts/versioned instructions separate from UI components.
- Validate structured model output with schemas.
- Treat model output as untrusted input.
- Stream only when it improves the user experience.
- Keep provider keys and privileged tools server-side.

## RAG

- Define ingestion, parsing, chunking, metadata, embeddings, retrieval, reranking, and citation strategy.
- Preserve document/source identifiers and access permissions through retrieval.
- Enforce authorization before returning retrieved content.
- Evaluate retrieval and answer quality with representative datasets.
- Do not claim citations support content unless the cited source actually does.

## Tool calling and agents

- Give tools narrow schemas and least privilege.
- Validate every tool argument.
- Require user confirmation for consequential external actions.
- Add timeouts, limits, auditability, and idempotency where relevant.
- Do not let model-generated instructions bypass application authorization.

## Evaluation

Track correctness, groundedness, retrieval quality, latency, token usage/cost, and failure rates as appropriate. Include adversarial and malformed-input tests.
