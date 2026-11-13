#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-$PWD}"
SKILLS_SOURCE="$SOURCE_DIR/skills"
SKILLS_TARGET="$TARGET_DIR/.claude/skills"

mkdir -p "$SKILLS_TARGET"

for skill_dir in "$SKILLS_SOURCE"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  destination="$SKILLS_TARGET/$skill_name"

  if [ -e "$destination" ]; then
    echo "Skipping existing skill: $destination"
    echo "Merge manually to avoid overwriting project customizations."
  else
    cp -R "$skill_dir" "$destination"
    echo "Installed: $skill_name"
  fi
done

for instruction in CLAUDE.md AGENTS.md; do
  if [ -e "$TARGET_DIR/$instruction" ]; then
    echo "Existing $instruction found; merge manually."
  else
    cp "$SOURCE_DIR/$instruction" "$TARGET_DIR/$instruction"
    echo "Copied: $instruction"
  fi
done

echo "Done. Review project instructions and skill descriptions before use."
