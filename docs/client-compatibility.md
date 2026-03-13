# Client Compatibility

## Purpose

This document explains how the Foundation Kit works across different coding
clients.

## Short Answer

- `Beads` works anywhere the `bd` CLI can run.
- `Beads Village`, `Tilth`, `Linear`, and `NotebookLM` work anywhere the client
  supports MCP.
- `Agent Hive` is not an MCP server. It is OpenCode-native and also has a
  GitHub Copilot/VS Code path, but it does not run directly inside Claude Code
  as a plugin.

That means the core stack is client-agnostic, while full Hive automation is not.

## Compatibility Matrix

| Layer | OpenCode | Claude Code | Notes |
| --- | --- | --- | --- |
| `Beads` core | Yes | Yes | CLI-based execution memory |
| `Beads Village` | Yes | Yes | MCP server |
| `Tilth` | Yes | Yes | MCP/code-perception layer |
| `Linear` MCP | Yes | Yes | MCP host support required |
| `NotebookLM` MCP | Yes | Yes | MCP host support required |
| `Agent Hive` plugin | Yes | No | OpenCode plugin, not MCP |
| Hive workflow model | Yes | Yes, by convention | Claude Code uses docs/subagents instead of plugin automation |

## Setup A: OpenCode

Use this when the builder wants the full native stack.

- `opencode-hive` plugin provides direct Hive orchestration
- `Beads Village`, `Tilth`, `Linear`, and `NotebookLM` run through MCP
- best fit when the team wants batch orchestration, worktree automation, and
  Hive-specific execution flow inside the client

## Setup B: Claude Code

Use this when the builder prefers Claude Code but still wants the same shared
memory and coordination layers.

- `Beads`, `Beads Village`, `Tilth`, `Linear`, and `NotebookLM` still work
- the repo's `AGENTS.md` and `CLAUDE.md` provide the workflow rules
- Claude Code subagents and `.claude/skills/` can encode the orchestration style
- Hive remains the conceptual orchestration model, but not a native plugin in
  this client

## Recommended Team Pattern

The team does not need to lock onto one client.

- OpenCode users get full native Hive plugin support
- Claude Code users keep the same Beads, Village, Tilth, Linear, and NotebookLM
  layers
- everyone still shares the same Git-backed state and durable docs

Shared state can include:
- `.beads/`
- `.beads-village/`
- `.mail/`
- `.reservations/`
- `.hive/`
- `docs/`
- `pods/`

## Claude Code Notes

Suggested Claude Code integration pattern:

1. use the same repository docs and guardrails
2. add MCP servers for `beads-village`, `tilth`, `linear`, and `notebooklm`
3. use Claude Code subagents for focused execution scopes
4. encode the workflow in `AGENTS.md` and optional `.claude/skills/`

This does not reproduce every Hive automation feature, but it preserves the same
stack boundaries and shared state model.

## Guardrails

- do not describe Agent Hive as universally MCP-compatible
- do not assume Claude Code can load `opencode-hive`
- do not fork the stack model per client; keep the memory and coordination
  layers shared
- document any client-specific setup as host-specific, not architecture-changing

## Verification Status

- OpenCode runtime integration has been tested in this repo
- Claude Code setup guidance is documented here, but not executed from this repo
  environment
