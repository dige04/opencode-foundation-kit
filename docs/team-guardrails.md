# Team Guardrails

## Purpose

These guardrails keep the Foundation Kit usable across a real dev team instead
of drifting into personal setup or inconsistent agent behavior.

## Non-Negotiables

- claim work in Beads before starting implementation
- reserve shared files through Beads Village before editing them
- release reservations or close work promptly when the task is done
- do not start non-trivial execution before Hive approval
- do not keep durable decisions in Beads Village messages or reservations
- do not commit MCP auth, tokens, or cache files

## Source Of Truth

- `Linear` owns planning and issue state
- `Figma` owns approved design intent
- `Beads` owns engineering execution memory
- `Hive` owns orchestration, approval, and handoff
- `docs/` and `pods/` own durable team knowledge
- `NotebookLM` is retrieval only

Do not treat chat history as authoritative memory.

## Shared Work Rules

### Before coding

- confirm pod ownership, objective, acceptance criteria, dependencies, and
  non-goals
- confirm a claimable Beads task or epic exists
- confirm a Hive-approved plan exists for ambiguous, cross-pod, or high-risk
  work

### During coding

- run `bd update <id> --claim` before work
- use `reserve` before editing shared files
- use `msg` and `inbox` only for coordination, not durable documentation
- use `Tilth` for code perception, not memory or orchestration

### After coding

- use `release` or `done` to free reservations
- promote durable outcomes into `docs/` or `pods/`
- state exactly what was verified and what was not

## Auth And Secrets

- keep `Linear` and `NotebookLM` auth local to each builder machine
- never commit tokens, auth caches, or credentials
- if an MCP server requires auth, document the local setup step in docs instead
  of storing secrets in the repo

## Degraded Mode

If part of the native stack is unavailable:

- if `Linear` MCP is down, continue with repo docs + Beads + Hive
- if `NotebookLM` MCP is down, continue with repo docs and note missing
  retrieval support
- if `Beads Village` is down, do not do parallel shared-file editing in the same
  workspace
- if `Tilth` is down, continue with repo tools but expect slower code navigation

## Change Control

- changes to `opencode.json` require review
- changes to `docs/opencode-standard.md`, `docs/beads-standard.md`,
  `docs/beads-village-integration.md`, and `docs/team-guardrails.md` require
  review
- do not silently change the stack model in examples without updating the root
  config and docs together

## Version Discipline

Document the versions the team validated when possible:

- `opencode`
- `bd`
- `tilth`
- `beads-village`

Use the doctor commands in `README.md` before broad rollout after stack changes.
