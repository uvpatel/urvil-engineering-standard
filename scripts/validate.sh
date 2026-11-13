#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "=== Running Engineering Standards & Skills Validation ==="

# 1. Required repository distribution files
required_root_files=(
  "CLAUDE.md"
  "AGENTS.md"
  "README.md"
  "LICENSE"
  "CONTRIBUTING.md"
  "CHANGELOG.md"
  "package.json"
)

for path in "${required_root_files[@]}"; do
  if [ ! -s "$path" ]; then
    echo "ERROR: Missing or empty required file: $path" >&2
    exit 1
  fi
done
echo "✓ Root repository distribution files verified (${#required_root_files[@]} files)"

# 2. Standards & Templates
standard_count=$(find standards -maxdepth 1 -name "*.md" -type f | wc -l | tr -d ' ')
template_count=$(find templates -maxdepth 1 -name "*.md" -type f | wc -l | tr -d ' ')

if [ "$standard_count" -lt 11 ]; then
  echo "ERROR: Expected at least 11 standards, found $standard_count" >&2
  exit 1
fi

if [ "$template_count" -lt 4 ]; then
  echo "ERROR: Expected at least 4 templates, found $template_count" >&2
  exit 1
fi
echo "✓ Standards ($standard_count) and templates ($template_count) verified"

# 3. Agent Skills validation
skill_count=0
for skill_dir in skills/*; do
  [ -d "$skill_dir" ] || continue
  skill_count=$((skill_count + 1))
  skill_name="$(basename "$skill_dir")"
  skill_file="$skill_dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    echo "ERROR: Missing SKILL.md in $skill_dir" >&2
    exit 1
  fi

  # Frontmatter check
  if ! head -n 1 "$skill_file" | grep -q '^---$'; then
    echo "ERROR: SKILL.md in $skill_dir does not start with YAML frontmatter '---'" >&2
    exit 1
  fi

  # Verify name field matches directory name
  frontmatter_name=$(sed -n '/^---$/,/^---$/p' "$skill_file" | grep '^name:' | head -n 1 | awk '{print $2}' | tr -d '"' | tr -d "'")
  if [ "$frontmatter_name" != "$skill_name" ]; then
    echo "ERROR: Skill name '$frontmatter_name' does not match directory name '$skill_name' in $skill_file" >&2
    exit 1
  fi

  # Verify description field exists and has activation condition
  if ! sed -n '/^---$/,/^---$/p' "$skill_file" | grep -q '^description:'; then
    echo "ERROR: Missing description in frontmatter of $skill_file" >&2
    exit 1
  fi

  if ! sed -n '/^---$/,/^---$/p' "$skill_file" | grep -qi 'Use when'; then
    echo "ERROR: Description in $skill_file must contain an explicit 'Use when' activation condition" >&2
    exit 1
  fi

  # Verify license field in frontmatter
  if ! sed -n '/^---$/,/^---$/p' "$skill_file" | grep -q '^license:'; then
    echo "ERROR: Missing license in frontmatter of $skill_file" >&2
    exit 1
  fi

  # Verify all relative markdown file links resolve
  while IFS= read -r link; do
    # Extract relative path from [text](path)
    target_path=$(echo "$link" | sed -E 's/.*\]\(([^)#]+).*/\1/')
    # Skip web URLs or anchor-only links
    if [[ "$target_path" =~ ^https?:// ]] || [[ "$target_path" =~ ^# ]]; then
      continue
    fi
    full_target="$skill_dir/$target_path"
    if [ ! -f "$full_target" ]; then
      echo "ERROR: Broken relative link '$target_path' in $skill_file (looked for $full_target)" >&2
      exit 1
    fi
  done < <(grep -oE '\[[^]]+\]\([^)]+\)' "$skill_file" || true)

done

if [ "$skill_count" -ne 11 ]; then
  echo "ERROR: Expected 11 skills, found $skill_count" >&2
  exit 1
fi
echo "✓ All $skill_count skills passed strict Agent Skills specification checks"

echo ""
echo "=== All validation checks passed successfully! ==="
