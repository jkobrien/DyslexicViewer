#!/usr/bin/env bash
# ralph.sh — Launch Ralph agent with optional iteration count
# Usage: ./ralph.sh [iterations]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ITERATIONS="${1:-1}"

echo "🚀 Launching Ralph agent (iterations: $ITERATIONS)..."
echo "📄 Using PRD: $SCRIPT_DIR/prd.json"

if [ ! -f "$SCRIPT_DIR/prd.json" ]; then
  echo "❌ Error: prd.json not found at $SCRIPT_DIR/prd.json"
  echo "   Run preflight.sh first or copy your PRD to prd.json"
  exit 1
fi

# Run preflight checks
"$SCRIPT_DIR/preflight.sh"

echo ""
echo "✅ Preflight passed. Starting Ralph with $ITERATIONS iteration(s)."
echo "📝 Feedback will be logged to: $SCRIPT_DIR/agents/output/feedback.md"
