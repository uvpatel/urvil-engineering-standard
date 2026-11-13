#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

required=(
  "CLAUDE.md"
  "AGENTS.md"
  "README.md"
  "standards/architecture.md"
  "standards/nextjs.md"
  "skills/project-discovery/SKILL.md"
  "skills/implementation-planning/SKILL.md"
  "templates/implementation-plan.md"
)

for path in "${required[@]}"; do
  if [ ! -s "$path" ]; then
    echo "ERROR: Missing or empty required file: $path" >&2
    exit 1
  fi
done

skill_count=0
while IFS= read -r skill_file; do
  skill_count=$((skill_count + 1))
  if ! grep -q '^---$' "$skill_file"; then
    echo "ERROR: Missing YAML frontmatter delimiters: $skill_file" >&2
    exit 1
  fi
  if ! grep -q '^name:' "$skill_file"; then
    echo "ERROR: Missing skill name: $skill_file" >&2
    exit 1
  fi
  if ! grep -q '^description:' "$skill_file"; then
    echo "ERROR: Missing skill description: $skill_file" >&2
    exit 1
  fi
done < <(find skills -name SKILL.md -type f | sort)

if [ "$skill_count" -eq 0 ]; then
  echo "ERROR: No skills found." >&2
  exit 1
fi

echo "Validation passed."
echo "Required files: ${#required[@]}"
echo "Skills checked: $skill_count"
