# OpenCode Standard

## Purpose

This document standardizes how OpenCode should be configured and used in this
starter repository.

## Standard Statement

- keep the root `opencode.json` minimal by default
- keep richer setup in optional example configs
- use OpenCode in a way that preserves the Hive lifecycle
- use Beads as the essential engineering execution layer in this starter
- add Tilth only as an optional code-perception layer
- treat NotebookLM as retrieval only
- promote durable guidance into `docs/` or pod files

## Source-of-Truth Order

1. `docs/`
2. root governance files such as `AGENTS.md`, `CLAUDE.md`, `opencode.json`
3. relevant pod files under `pods/`
4. Linear for planning and task status
5. Figma for approved design context
6. NotebookLM for BRD, tech docs, and meeting notes retrieval

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

## Memory Split

- retrieval memory: `NotebookLM`
- workflow memory: `Hive` and Beads task state
- durable project memory: `docs/` and `pods/`
- code perception: optional `Tilth`

## Related Standards

- `docs/beads-standard.md`
- `docs/tilth-integration.md`
- `docs/agent-hive-standard.md`
- `docs/integration-model.md`
- `docs/code-standards.md`

## Builder Setup Pattern

1. install and launch OpenCode
2. keep the root `opencode.json` active and minimal
3. adapt from `examples/opencode/opencode.foundation.jsonc` only if richer
   setup is needed
4. load the agent specs in `docs/opencode-agents/` as role contracts
5. initialize Beads as part of normal starter setup
6. add Tilth only if the team wants stronger code navigation and search
