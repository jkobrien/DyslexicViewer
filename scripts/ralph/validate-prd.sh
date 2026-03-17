#!/usr/bin/env bash
# validate-prd.sh — Validates a PRD JSON file for required fields and quality
# Usage: ./validate-prd.sh [prd-file]
# Defaults to prd.json in the same directory if no argument is given

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PRD_FILE="${1:-$SCRIPT_DIR/prd.json}"

echo "🔍 Validating PRD: $PRD_FILE"
echo ""

ERRORS=0
WARNINGS=0

# Check file exists
if [ ! -f "$PRD_FILE" ]; then
  echo "❌ Error: File not found: $PRD_FILE"
  exit 1
fi

# Check valid JSON
if ! jq . "$PRD_FILE" > /dev/null 2>&1; then
  echo "❌ Error: Invalid JSON in $PRD_FILE"
  exit 1
fi

# Required top-level fields
for field in project branchName description prdFile userStories; do
  value=$(jq -r ".$field" "$PRD_FILE")
  if [ -z "$value" ] || [ "$value" = "null" ]; then
    echo "❌ Missing required field: $field"
    ERRORS=$((ERRORS + 1))
  fi
done

# Check userStories is an array
STORY_COUNT=$(jq '.userStories | length' "$PRD_FILE")
if [ "$STORY_COUNT" -eq 0 ]; then
  echo "❌ userStories array is empty"
  ERRORS=$((ERRORS + 1))
fi

# Check each story has acceptanceCriteria
echo "📋 Checking $STORY_COUNT user stories..."
for i in $(seq 0 $((STORY_COUNT - 1))); do
  story_id=$(jq -r ".userStories[$i].id" "$PRD_FILE")
  story_title=$(jq -r ".userStories[$i].title" "$PRD_FILE")
  ac_count=$(jq ".userStories[$i].acceptanceCriteria | length" "$PRD_FILE")

  if [ "$ac_count" -eq 0 ]; then
    echo "❌ Story $story_id ('$story_title') has no acceptanceCriteria"
    ERRORS=$((ERRORS + 1))
  else
    echo "  ✅ $story_id — $ac_count acceptance criteria"
  fi

  # Warn on stories without notes
  notes=$(jq -r ".userStories[$i].notes" "$PRD_FILE")
  if [ -z "$notes" ] || [ "$notes" = "null" ] || [ "$notes" = "" ]; then
    echo "  ⚠️  $story_id has no notes (consider adding context)"
    WARNINGS=$((WARNINGS + 1))
  fi
done

# Warn on large scope (>7 stories)
if [ "$STORY_COUNT" -gt 7 ]; then
  echo ""
  echo "⚠️  Warning: $STORY_COUNT user stories detected. Consider breaking into smaller PRDs (recommended: ≤7)."
  WARNINGS=$((WARNINGS + 1))
fi

# Check completionChecklist
checklist_count=$(jq '.completionChecklist | length' "$PRD_FILE")
if [ "$checklist_count" -eq 0 ]; then
  echo "⚠️  Warning: completionChecklist is empty"
  WARNINGS=$((WARNINGS + 1))
fi

echo ""
if [ "$ERRORS" -gt 0 ]; then
  echo "❌ Validation failed: $ERRORS error(s), $WARNINGS warning(s)"
  exit 1
else
  echo "✅ Validation passed with $WARNINGS warning(s)"
fi
