#!/usr/bin/env bash

set -euo pipefail

if command -v bd >/dev/null 2>&1; then
  echo "Beads CLI already installed: $(command -v bd)"
  exit 0
fi

if command -v curl >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash
elif command -v npm >/dev/null 2>&1; then
  npm install -g @beads/bd
else
  echo "Could not install Beads automatically. Use one of:"
  echo "  npm install -g @beads/bd"
  echo "  go install github.com/steveyegge/beads/cmd/bd@latest"
  exit 1
fi

echo "Choose your Beads mode inside the repo:"
echo "  bd init"
echo "  bd init --stealth"
echo "  bd init --contributor"
