#!/usr/bin/env bash

set -euo pipefail

if command -v tilth >/dev/null 2>&1; then
  echo "Tilth already installed: $(command -v tilth)"
  echo "Tilth is ready for the native OpenCode stack."
  echo "The project root opencode.json already expects: tilth --mcp --edit"
  exit 0
fi

if command -v cargo >/dev/null 2>&1; then
  cargo install tilth
elif command -v npm >/dev/null 2>&1; then
  npm install -g tilth
else
  echo "Could not install Tilth automatically. Use one of:"
  echo "  cargo install tilth"
  echo "  npm install -g tilth"
  echo "  npx tilth"
  exit 1
fi

echo "Tilth installed. The project root opencode.json already expects:"
echo "  tilth --mcp --edit"
