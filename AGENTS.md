# AGENTS.md

## Purpose

Repository-wide instructions for coding agents working in this OpenCode
foundation starter.

## Read Order

1. `docs/opencode-standard.md`
2. `docs/beads-standard.md`
3. `docs/beads-village-integration.md`
4. `docs/tilth-integration.md`
5. `docs/agent-hive-standard.md`
6. `docs/integration-model.md`
7. `docs/code-standards.md`
8. `docs/codebase-summary.md`
9. relevant pod files under `pods/`

## Primary Model

- OpenCode is the runtime and native host for the configured stack
- `beads` owns engineering task graph execution and persistent execution memory
- `beads-village` wraps Beads with file locking and agent messaging
- `.hive/` is the plan-first orchestration scaffold used by Agent Hive
- `tilth` is the code-perception layer for structural reading and navigation
- OpenCode is the primary coding agent environment
- `docs/` is the durable documentation source of truth

## Defaults

- use the root `opencode.json` as the native full-stack config for this starter
- use `docs/beads-standard.md` for engineering task execution
- use `docs/beads-village-integration.md` for locking and messaging rules
- use `docs/agent-hive-standard.md` for planning, approval, and execution flow
- use `docs/tilth-integration.md` for code navigation and impact analysis rules
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
- claimable Beads task or epic
- approved `.hive/` plan for ambiguous, cross-pod, or high-risk work

If these are missing, surface the gap instead of guessing.

## Beads Rules

- use `bd ready` to find unblocked engineering work
- use `bd update <id> --claim` before taking a task
- use `bd dep add` when execution order matters
- keep business priority outside Beads
- do not use Beads to replace durable docs or product acceptance

## Beads Village Rules

- use `reserve` before editing files when multiple agents may touch the same area
- use `release` or `done` to free reservations promptly
- use `msg` or `inbox` for cross-agent coordination, not as durable documentation
- treat Beads Village as a coordination layer on top of Beads, not a replacement

## Memory Order

1. planning context
2. design context
3. `docs/`
4. relevant pod files
5. Beads task graph
6. Beads Village reservations and messages
7. `.hive/` feature context
8. NotebookLM-retrieved materials

## Handoff Expectations

- state exactly what changed
- state what you verified
- state what could not be verified because automation is missing
