# OpenCode Foundation Kit

This repository is a reusable starter for teams that want OpenCode configured
with a documented operating model instead of ad hoc local setup.

It is designed around:
- `Hive` for plan-first orchestration
- `Beads` as an optional execution graph/runtime layer
- `NotebookLM` as retrieval only
- `docs/` and pod files as durable project memory

## Quickstart

```bash
opencode
```

Read these first:
1. `docs/opencode-standard.md`
2. `docs/agent-hive-standard.md`
3. `docs/integration-model.md`
4. `docs/code-standards.md`
5. `docs/opencode-agents/README.md`

Use:
- `opencode.json` as the active minimal root config
- `examples/opencode/opencode.foundation.jsonc` as the optional richer profile

## Repository Layout

- `docs/` - durable standards and operating guidance
- `docs/opencode-agents/` - standardized OpenCode agent specs
- `examples/opencode/` - optional advanced config examples
- `.hive/` - optional Hive planning templates and workflow scaffolding
- `pods/` - pod-local context, decisions, and task memory

## Working Model

```text
Linear / Figma / NotebookLM
            |
            v
      Hive + Beads runtime
            |
            v
       OpenCode agents
            |
            v
 docs/ + pods/ + .hive/
```
