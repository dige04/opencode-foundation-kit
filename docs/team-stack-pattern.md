# AI Team Stack Pattern

## Purpose

This document captures the recommended team-stack pattern behind this starter.

## Role Map

- `OpenCode` - runtime and coding-agent environment
- `Tilth` - code-perception layer
- `Agent Hive` - orchestration and plan-first feature scaffolding
- `Beads` - essential engineering execution memory and dependency-aware task graph
- `Beads Village` - coordination layer for locking, messaging, and workspace status
- `NotebookLM` - retrieval for product and technical context
- `Linear` - planning and issue state
- `Figma` - approved design intent

## Working Model

```text
Linear / Figma / NotebookLM
            |
            v
      Hive + Beads runtime
            |
            v
   OpenCode agents + Tilth MCP
            |
            v
 docs/ + pods/ + .hive/
```

## Example Config Profiles

- `opencode.json` - canonical native project config
- `examples/opencode/opencode.foundation.jsonc` - native stack plus explicit
  agent shaping
- `examples/opencode/opencode.team-stack.jsonc` - full reference config with
  native Linear, NotebookLM, Tilth, and Beads Village MCP wiring

## Client Modes

- `OpenCode` mode: full native stack with Agent Hive plugin automation
- `Claude Code` mode: same MCP core stack with Claude subagents and repo
  conventions in `AGENTS.md`
- mixed-team mode: share the same Beads, Village, docs, and pod state across
  both clients

## Team Flow

1. Product or BA clarifies work in the planning system.
2. Leads or architects review context and use Hive to shape and approve
   execution.
3. Builders claim engineering work in Beads as the execution layer.
4. Builders reserve files and exchange updates through Beads Village.
5. OpenCode agents use Tilth, repo docs, and external retrieval to navigate and
   implement safely.
6. Stable outcomes are promoted into `docs/` or pod files.

## Why This Pattern Works

- `Tilth` reduces token waste during code navigation.
- `Hive` structures multi-step work and handoff.
- `Beads` preserves engineering execution context between sessions.
- `Beads Village` prevents file conflicts and gives agents a communication layer.
- `OpenCode` provides the runtime and agent surface.

## Guardrails

- do not collapse all concerns into one tool
- keep durable knowledge in repo docs or pod files
- keep planning authority outside engineering execution memory
- keep the core OpenCode + Hive + Beads + Beads Village + Tilth stack intact
- keep the full team-stack example aligned with the root project config
- do not claim that every client gets the same Hive automation surface
