# Beads Standard

This document standardizes how `beads` should be used with this starter.

## Role of Beads

Beads is the default operational backbone for engineering execution in this
starter.

Use Beads for:
- engineering subtasks
- blockers
- dependency edges
- discovered work
- agent claiming and completion
- external task sync when enabled
- daemon-backed automation and hooks when enabled

Do not use Beads as the source of truth for:
- product priority
- feature acceptance
- design approval
- release state

## Recommended Commands

- `bd ready`
- `bd create "Title" -p 1`
- `bd update <id> --claim`
- `bd dep add <child> <parent>`
- `bd show <id>`

## Recommended Workflow

1. Start from Linear, Figma, NotebookLM, and repo docs.
2. Create, sync, or link Beads tasks for engineering execution.
3. Claim work before editing.
4. Add dependency edges instead of keeping blockers only in prose.
5. Use optional `.hive/` files only when the feature needs extra planning or
   handoff structure.
6. Promote completed engineering outcomes back into docs, pod files, and review
   artifacts.

## Modes

Choose one based on your context:

- `bd init`
- `bd init --stealth`
- `bd init --contributor`

Use `--stealth` when you want local-only Beads state.
Use tracked mode when the team wants shared task graph state in git.

## Guardrails

- Keep Linear as the source of truth for project status.
- Keep Beads as the source of truth for engineering execution state.
- Keep `.hive/` optional and lightweight if used at all.
- Do not create duplicate business tasks in both Linear and Beads without a
  link.
