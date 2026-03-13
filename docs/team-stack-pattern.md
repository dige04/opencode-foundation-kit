# AI Team Stack Pattern

## Purpose

This document captures the recommended team-stack pattern behind this starter.

## Role Map

- `OpenCode` - runtime and coding-agent environment
- `Tilth` - optional code-perception layer
- `Agent Hive` - orchestration and plan-first feature scaffolding
- `Beads` - essential engineering execution memory and dependency-aware task graph
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

- `examples/opencode/opencode.foundation.jsonc` - richer baseline profile
- `examples/opencode/opencode.tilth.jsonc` - optional Tilth-enabled profile
- `examples/opencode/opencode.team-stack.jsonc` - full placeholder example with
  Linear and NotebookLM MCP slots

## Team Flow

1. Product or BA clarifies work in the planning system.
2. Leads or architects review context and use Hive to shape and approve
   execution.
3. Builders claim engineering work in Beads as the execution layer.
4. OpenCode agents use Tilth, repo docs, and external retrieval to navigate and
   implement safely.
5. Stable outcomes are promoted into `docs/` or pod files.

## Why This Pattern Works

- `Tilth` reduces token waste during code navigation.
- `Hive` structures multi-step work and handoff.
- `Beads` preserves engineering execution context between sessions.
- `OpenCode` provides the runtime and agent surface.

## Guardrails

- do not collapse all concerns into one tool
- keep durable knowledge in repo docs or pod files
- keep planning authority outside engineering execution memory
- keep Tilth optional, but keep the core OpenCode + Hive + Beads stack intact
- keep the full team-stack example as a starting point, not a required default
