# Integration Model

## Tool Roles

- NotebookLM: retrieval only
- Linear: planning and task status
- Figma: approved design intent
- Beads: essential engineering execution graph and dependency tracking
- Beads Village: coordination layer that wraps Beads with file locking and
  messaging
- Hive: orchestration and plan-first collaboration layer
- Tilth: code-perception layer for structural read, symbol lookup, and
  callers/callees tracing
- OpenCode: runtime host for the plugin and MCP server stack
- Git hosting platform: code review and release governance
- `docs/`: durable documentation source of truth

## OpenCode Boundary

Use OpenCode as:
- implementation support
- the native host for the configured stack
- a tool that follows the repository source-of-truth order

Do not use OpenCode as:
- durable documentation
- a replacement for Hive approval and tracking
- a replacement for Beads execution state when the team uses Beads-first flow
- a replacement for NotebookLM, Linear, or Figma

Do not use Beads Village as:
- a replacement for Beads core graph memory
- a replacement for Hive orchestration
- a durable documentation store

Do not use Tilth as:
- persistent memory
- orchestration
- a replacement for project docs
