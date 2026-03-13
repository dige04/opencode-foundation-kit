# OpenCode Standard

## Purpose

This document standardizes how OpenCode should be configured and used in this
starter repository.

## Standard Statement

- use the root `opencode.json` as the canonical native stack config
- run Agent Hive through the `opencode-hive` plugin
- run `beads-village`, `tilth`, `linear`, and `notebooklm` as native OpenCode
  MCP servers
- use Beads as the essential engineering execution layer in this starter
- use Beads Village as the coordination layer on top of Beads core
- use Tilth as the code-perception layer for structural navigation and edits
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
NotebookLM MCP   Linear MCP   Tilth MCP   Beads Village MCP
          \          |           |              /
           \         |           |             /
            \        |           |            /
             OpenCode runtime + opencode-hive
                       |
                Hive + Beads core
                       |
             docs/ + pods/ + .hive/
```

## Memory Split

- retrieval memory: `NotebookLM`
- workflow memory: `Hive`, Beads task state, and Beads Village coordination
- durable project memory: `docs/` and `pods/`
- code perception: `Tilth`

## Related Standards

- `docs/beads-standard.md`
- `docs/beads-village-integration.md`
- `docs/tilth-integration.md`
- `docs/agent-hive-standard.md`
- `docs/integration-model.md`
- `docs/code-standards.md`

## Builder Setup Pattern

1. install and launch OpenCode
2. install Beads and Tilth locally
3. keep the root `opencode.json` active as the native project config
4. authenticate external services used by the MCP servers when needed
5. initialize Beads as part of normal starter setup
6. load the agent specs in `docs/opencode-agents/` as role contracts
