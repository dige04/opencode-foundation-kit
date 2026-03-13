# Integration Model

## Tool Roles

- NotebookLM: retrieval only
- Linear: planning and task status
- Figma: approved design intent
- Beads: engineering execution graph and dependency tracking
- Hive: optional workflow collaboration layer
- Git hosting platform: code review and release governance
- `docs/`: durable documentation source of truth

## OpenCode Boundary

Use OpenCode as:
- implementation support
- a place for optional advanced config examples
- a tool that follows the repository source-of-truth order

Do not use OpenCode as:
- durable documentation
- a replacement for Hive approval and tracking
- a replacement for Beads execution state when the team uses Beads-first flow
- a replacement for NotebookLM, Linear, or Figma
