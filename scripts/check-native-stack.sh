#!/usr/bin/env bash

set -u

red='\033[31m'
green='\033[32m'
yellow='\033[33m'
blue='\033[34m'
reset='\033[0m'

failures=0
warnings=0

header() {
  printf "\n${blue}%s${reset}\n" "$1"
}

ok() {
  printf "  ${green}OK${reset}  %s\n" "$1"
}

warn() {
  warnings=$((warnings + 1))
  printf "  ${yellow}WARN${reset} %s\n" "$1"
}

bad() {
  failures=$((failures + 1))
  printf "  ${red}FAIL${reset} %s\n" "$1"
}

check_cmd() {
  local cmd="$1"
  local desc="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    ok "$desc ($cmd found)"
  else
    bad "$desc ($cmd missing)"
  fi
}

check_run() {
  local description="$1"
  shift
  if "$@" >/dev/null 2>&1; then
    ok "$description"
  else
    bad "$description"
  fi
}

check_file() {
  local path="$1"
  if [ -f "$path" ]; then
    ok "Found $path"
  else
    bad "Missing $path"
  fi
}

check_dir() {
  local path="$1"
  if [ -d "$path" ]; then
    ok "Found $path/"
  else
    bad "Missing $path/"
  fi
}

header "Native Stack Files"
check_file "opencode.json"
check_dir "docs"
check_dir ".hive"
check_dir "pods"
check_file "docs/beads-standard.md"
check_file "docs/beads-village-integration.md"
check_file "docs/tilth-integration.md"

header "Core Commands"
check_cmd "opencode" "OpenCode runtime"
check_cmd "bd" "Beads CLI"
check_cmd "npx" "Node package runner for Beads Village and MCP remotes"
check_cmd "tilth" "Tilth CLI"

header "Runtime Checks"
if command -v npx >/dev/null 2>&1; then
  check_run "Beads Village resolves via npx" npx beads-village --help
else
  bad "Beads Village resolves via npx"
fi

if command -v tilth >/dev/null 2>&1; then
  check_run "Tilth responds to --help" tilth --help
else
  bad "Tilth responds to --help"
fi

if command -v bd >/dev/null 2>&1; then
  check_run "Beads CLI responds to --help" bd --help
else
  bad "Beads CLI responds to --help"
fi

header "Auth Reminders"
warn "Confirm Linear MCP auth in your local OpenCode environment"
warn "Confirm NotebookLM MCP auth in your local OpenCode environment"

header "Summary"
if [ "$failures" -eq 0 ]; then
  printf "${green}Native stack preflight passed${reset}"
else
  printf "${red}Native stack preflight failed${reset}"
fi

printf " - %s failure(s), %s warning(s)\n" "$failures" "$warnings"

if [ "$failures" -ne 0 ]; then
  exit 1
fi
