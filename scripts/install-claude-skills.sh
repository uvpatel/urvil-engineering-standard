#!/usr/bin/env bash
# Offline/direct installer for Claude Code (.claude/skills)
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${1:-$PWD}"
SKILLS_SOURCE="$SOURCE_DIR/skills"
SKILLS_TARGET="$TARGET_DIR/.claude/skills"

echo "=== Installing Urvil's Engineering Skills (Direct Copy) ==="
echo "Target directory: $TARGET_DIR"

mkdir -p "$SKILLS_TARGET"

# Copy each self-contained skill folder (SKILL.md + references)
for skill_dir in "$SKILLS_SOURCE"/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  destination="$SKILLS_TARGET/$skill_name"

  if [ -e "$destination" ]; then
    echo "• Skipping existing skill: $destination (merge manually if customized)"
  else
    cp -R "$skill_dir" "$destination"
    echo "✓ Installed skill: $skill_name"
  fi
done

# Copy project instruction files if not already present
for instruction in CLAUDE.md AGENTS.md; do
  if [ -e "$TARGET_DIR/$instruction" ]; then
    echo "• Existing $instruction found in target; merge manually."
  else
    cp "$SOURCE_DIR/$instruction" "$TARGET_DIR/$instruction"
    echo "✓ Installed instruction: $instruction"
  fi
done

echo ""
echo "Installation complete."
echo "Tip: For modern multi-agent setups, use the Skills CLI instead:"
echo "  bunx skills add uvpatel/engineering-standards"
