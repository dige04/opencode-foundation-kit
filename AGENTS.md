# AGENTS.md

## Purpose

Repository-wide instructions for coding agents working in this OpenCode
foundation starter.

## Read Order

1. `docs/opencode-standard.md`
2. `docs/beads-standard.md`
3. `docs/agent-hive-standard.md`
4. `docs/integration-model.md`
5. `docs/code-standards.md`
6. `docs/codebase-summary.md`
7. relevant pod files under `pods/`

## Primary Model

- `beads` owns engineering task graph execution and is the default operational
  backbone
- `.hive/` is an optional feature-planning scaffold for teams that want
  explicit plan/report files
- OpenCode is the primary coding agent environment
- `docs/` is the durable documentation source of truth

## Defaults

- keep the root `opencode.json` minimal
- keep advanced OpenCode setup optional
- use `docs/beads-standard.md` for engineering task execution
- use `docs/agent-hive-standard.md` only when optional `.hive/` planning is
  enabled
- use NotebookLM for retrieval, not durable memory
- promote stable knowledge into `docs/` or pod files

## Pod Model

Use 2 default pods unless the project chooses another structure:
- `candidate-experience`
- `content-cms-strapi`

## Required Inputs Before Coding

Before implementation starts, the task should have:
- pod ownership
- objective
- acceptance criteria
- dependencies
- non-goals
- linked planning/design context when available
- claimable Beads task or epic when the team uses Beads
- optional approved `.hive/` plan for ambiguous, cross-pod, or high-risk work

If these are missing, surface the gap instead of guessing.

## Beads Rules

- use `bd ready` to find unblocked engineering work
- use `bd update <id> --claim` before taking a task
- use `bd dep add` when execution order matters
- keep business priority outside Beads
- do not use Beads to replace durable docs or product acceptance

## Memory Order

1. planning context
2. design context
3. `docs/`
4. relevant pod files
5. Beads task graph
6. optional `.hive/` feature context
7. NotebookLM-retrieved materials

## Handoff Expectations

- state exactly what changed
- state what you verified
- state what could not be verified because automation is missing
