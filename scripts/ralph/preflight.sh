#!/usr/bin/env bash
# preflight.sh — Validates prd.json, reads branchName, creates/switches to the branch
# Usage: ./preflight.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PRD_FILE="$SCRIPT_DIR/prd.json"

echo "🔍 Running preflight checks..."

# Check prd.json exists
if [ ! -f "$PRD_FILE" ]; then
  echo "❌ Error: prd.json not found at $PRD_FILE"
  exit 1
fi

# Validate prd.json is valid JSON
if ! jq . "$PRD_FILE" > /dev/null 2>&1; then
  echo "❌ Error: prd.json is not valid JSON"
  exit 1
fi

# Read branchName
BRANCH_NAME=$(jq -r '.branchName' "$PRD_FILE")
if [ -z "$BRANCH_NAME" ] || [ "$BRANCH_NAME" = "null" ]; then
  echo "❌ Error: branchName is missing or null in prd.json"
  exit 1
fi

echo "📌 Branch: $BRANCH_NAME"

# Create or switch to branch
if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
  echo "🔀 Switching to existing branch: $BRANCH_NAME"
  git checkout "$BRANCH_NAME"
else
  echo "🌿 Creating new branch: $BRANCH_NAME"
  git checkout -b "$BRANCH_NAME"
fi

echo "✅ Preflight complete. On branch: $BRANCH_NAME"
