# TypeScript Standards

- Enable and preserve `strict` mode where project constraints allow.
- Avoid `any`; use `unknown` at untrusted boundaries and narrow it.
- Avoid `as` assertions when a type guard, schema, or better API can establish the type.
- Model domain states with discriminated unions rather than loosely related booleans.
- Prefer `type` for unions/compositions and `interface` where extension/contract semantics are useful; be consistent.
- Export types only when they are part of a real module contract.
- Infer types from Zod schemas when that prevents schema/type drift.
- Avoid duplicating types that can be inferred from a canonical schema or generated API type.
- Type async return values when it improves public API clarity; avoid redundant annotations everywhere.
- Handle nullable and optional values explicitly.
- Use exhaustive checks for important discriminated unions.
- Do not use non-null assertions to bypass uncertainty.
