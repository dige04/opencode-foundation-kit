# Tilth Integration

## Purpose

This document explains how `Tilth` fits into the native OpenCode foundation
stack as the code-perception layer.

Tilth complements the existing stack:
- `OpenCode` stays the runtime and coding-agent environment
- `Hive` stays the orchestration layer
- `Beads` stays the engineering execution memory layer
- `Beads Village` stays the coordination layer
- `Tilth` improves code reading, definition lookup, callers/callees tracing, and
  large-file navigation

## What Tilth Adds

Based on the upstream `jahala/tilth` project, the most useful additions are:

- adaptive file reading for small vs large files
- definition-first search using tree-sitter
- callee expansion and callers search for impact analysis
- session dedup for repeated symbol reads in MCP mode
- optional hash-anchored edit mode with `--edit`

## Role In The Stack

Tilth is the native code-perception layer in this starter. Use it for:
- structural file reading
- definition-first search
- callee and callers tracing
- impact analysis before edits or review
- hash-anchored edit flows when appropriate

Do not treat Tilth as:
- persistent memory
- orchestration
- the durable documentation system

## Install

Preferred local install:

```bash
cargo install tilth
```

Alternative ad hoc usage:

```bash
npx tilth
```

## OpenCode Integration Paths

The root `opencode.json` already expects Tilth natively through:

```json
"tilth": {
  "command": "tilth",
  "args": ["--mcp", "--edit"]
}
```

Reference configs live in:
- `examples/opencode/opencode.foundation.jsonc`
- `examples/opencode/opencode.team-stack.jsonc`

## Guardrails

- do not present Tilth as a substitute for Hive, Beads, or Beads Village
- do not use Tilth as memory or orchestration
- do not assume every builder has Rust installed; document `npm` fallback when
  needed

## References

- `https://github.com/jahala/tilth`
- `docs/opencode-standard.md`
- `docs/beads-standard.md`
- `docs/beads-village-integration.md`
- `docs/agent-hive-standard.md`
