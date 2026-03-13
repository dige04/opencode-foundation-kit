# Beads Village Integration

## Purpose

This document explains how `Beads Village` fits into the native OpenCode
foundation stack.

## What It Is

Beads Village is an MCP coordination layer that wraps Beads core with:
- file locking via `reserve` and `release`
- agent messaging via `msg` and `inbox`
- status and dashboard tools for multi-agent visibility

It does not replace Beads. Underneath, the execution graph still lives in Beads
core.

## Role In The Stack

- `Beads` owns the task graph, dependencies, IDs, and compaction
- `Beads Village` owns coordination: locking, messaging, and multi-agent
  visibility
- `Hive` owns orchestration, plan approval, batching, and worktree flow
- `OpenCode` hosts the MCP server and plugin runtime

## Native OpenCode Configuration

The root `opencode.json` includes Beads Village natively:

```json
"beads-village": {
  "command": "npx",
  "args": ["beads-village"]
}
```

## Shared State

When this layer is active, the shared repository state can include:
- `.beads/`
- `.beads-village/`
- `.mail/`
- `.reservations/`
- `.hive/`

These do not all serve the same purpose:
- Beads graph state remains the execution-memory layer
- Beads Village adds coordination state on top of it
- `.hive/` remains the planning and audit layer

## Core Workflow

1. Hive plans and approves work.
2. Builders claim tasks in Beads.
3. Builders reserve files through Beads Village before editing.
4. Builders use Tilth for navigation and structural code reading.
5. Builders release reservations and broadcast updates through Beads Village.
6. Beads closes tasks and compacts execution history over time.

## Guardrails

- do not treat Beads Village as a replacement for Beads core
- do not keep durable decisions only in Beads Village messages
- do not use Beads Village as the orchestration layer; that remains Hive
- do not edit the root config to remove Beads Village unless you are changing
  the starter's operating model intentionally

## References

- `https://github.com/LNS2905/mcp-beads-village`
- `docs/beads-standard.md`
- `docs/opencode-standard.md`
- `docs/team-stack-pattern.md`
