```
 ╔═══════════════════════════════════════════════════════════════╗
 ║                                                               ║
 ║   ███████╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗                ║
 ║   ██╔════╝██╔═══██╗██║   ██║████╗  ██║██╔══██╗               ║
 ║   █████╗  ██║   ██║██║   ██║██╔██╗ ██║██║  ██║               ║
 ║   ██╔══╝  ██║   ██║██║   ██║██║╚██╗██║██║  ██║               ║
 ║   ██║     ╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝               ║
 ║   ╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝               ║
 ║              A T I O N   K I T                                ║
 ║                                                               ║
 ║   One stack. Five layers. Zero overlap.                       ║
 ║                                                               ║
 ╚═══════════════════════════════════════════════════════════════╝
```

A public starter for teams that want a shared AI development stack —
OpenCode-native runtime wiring with docs and processes that work from
Claude Code as well.

> *"Don't make one tool carry too many responsibilities."*

---

## What's in the Box

```
┌────────────────────┬──────────────────────────────────────────────┐
│ Layer              │ What it does                                 │
├────────────────────┼──────────────────────────────────────────────┤
│ OpenCode           │ Runtime, providers, plugin host, MCP host    │
│ Agent Hive         │ Plan → approve → execute orchestration       │
│ Beads              │ Task graph, dependency memory, compaction    │
│ Beads Village      │ File locking + agent messaging on top of     │
│                    │ Beads (never replaces it)                    │
│ Tilth              │ AST-aware search, definition tracing,        │
│                    │ callers/callees, impact analysis             │
│ Linear             │ Planning and issue state                     │
│ NotebookLM         │ Retrieval for BRD, architecture, decisions   │
│ Figma              │ Approved design intent                       │
└────────────────────┴──────────────────────────────────────────────┘
```

---

## Architecture

```
┌──────────────────────────────────────────────────────────────────────┐
│                           OpenCode Runtime                           │
│  ┌────────────────────────────────────────────────────────────────┐  │
│  │  opencode.json  ─── canonical config for the whole stack      │  │
│  └────────────┬───────────────────────────┬──────────────────────┘  │
│               │                           │                          │
│       ┌───────▼───────┐          ┌────────▼──────────┐              │
│       │  Plugin        │          │  MCP Servers       │              │
│       │  opencode-hive │          │  ┌───────────────┐ │              │
│       │                │          │  │ beads-village  │ │              │
│       │  • plan        │          │  │ tilth          │ │              │
│       │  • approve     │ ◄─────► │  │ linear         │ │              │
│       │  • batch       │          │  │ notebooklm     │ │              │
│       │  • worktrees   │          │  └───────────────┘ │              │
│       └───────┬───────┘          └───────────────────┘              │
│               │                                                      │
│       ┌───────▼────────────────────────────────────┐                │
│       │              Execution Layer                │                │
│       │                                             │                │
│       │  Beads (core)     Beads Village (wrapper)   │                │
│       │  ┌─────────────┐  ┌──────────────────────┐ │                │
│       │  │ task graph   │  │ reserve / release    │ │                │
│       │  │ dependencies │  │ msg / inbox          │ │                │
│       │  │ claim/close  │  │ status dashboard     │ │                │
│       │  │ compaction   │  │                      │ │                │
│       │  └─────────────┘  └──────────────────────┘ │                │
│       │                                             │                │
│       │  Tilth (perception)                         │                │
│       │  ┌──────────────────────────────────────┐  │                │
│       │  │ tree-sitter AST · definition search  │  │                │
│       │  │ callers · callees · edit anchors     │  │                │
│       │  └──────────────────────────────────────┘  │                │
│       └─────────────────────────────────────────────┘                │
└──────────────────────────────────────────────────────────────────────┘
```

Each SVG variant lives in `docs/diagrams/`:
- [Full-stack architecture](docs/diagrams/full-stack-native.svg)
- [Team workflow](docs/diagrams/team-workflow-stack.svg)

---

## Why These Layers Exist

Each layer solves a different failure mode. Remove one and something
breaks. Double one up and responsibilities blur.

```
┌─────────────────┬────────────────────────────────────────────────┐
│ Without…        │ You lose…                                      │
├─────────────────┼────────────────────────────────────────────────┤
│ Hive            │ Structure. Every session is ad-hoc prompting.  │
│ Beads           │ Memory. Plans exist but execution is ephemeral.│
│ Village         │ Safety. Two agents edit the same file blindly. │
│ Tilth           │ Precision. Agents waste loops navigating code. │
└─────────────────┴────────────────────────────────────────────────┘
```

---

## Quickstart

### 1. Install OpenCode

```bash
curl -fsSL https://opencode.ai/install | bash
```

### 2. Install Beads

```bash
curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash
```

Or use the helper in this repo:

```bash
bash scripts/setup-beads.sh
```

### 3. Install Tilth

```bash
bash scripts/setup-tilth.sh
```

### 4. Verify

```bash
bash scripts/check-native-stack.sh
```

Quick manual checks:

```bash
npx beads-village --help
tilth --help
```

### 5. Launch

```bash
opencode
```

### 6. Authenticate external MCP integrations

- `Linear` — authenticate in your local OpenCode environment
- `NotebookLM` — authenticate in your local OpenCode environment

---

## Doctor

When things feel wrong, validate the stack:

```bash
# CLIs resolve?
opencode --help && bd --help && tilth --help && npx beads-village --help

# MCP servers registered?
opencode mcp list
```

Expected servers: `beads-village`, `tilth`, `linear`, `notebooklm`.

Run the full preflight:

```bash
bash scripts/check-native-stack.sh
```

Only auth reminders for `Linear` and `NotebookLM` should remain.

---

## Team Workflow

```
  BA / PM                Lead               Builders             Review
  ───────                ────               ────────             ──────
     │                     │                    │                    │
     │  requirements       │                    │                    │
     │  (Linear / plan)    │                    │                    │
     │────────────────────►│                    │                    │
     │                     │                    │                    │
     │                     │  Hive plan +       │                    │
     │                     │  approve           │                    │
     │                     │───────────────────►│                    │
     │                     │                    │                    │
     │                     │                    │ claim (Beads)      │
     │                     │                    │ reserve (Village)  │
     │                     │                    │ read (Tilth)       │
     │                     │                    │ build              │
     │                     │                    │ release (Village)  │
     │                     │                    │ close (Beads)      │
     │                     │                    │                    │
     │                     │                    │───────────────────►│
     │                     │                    │                review
     │                     │                    │              sync + compact
     │                     │                    │          promote to docs/pods
```

1. **BA/PM** creates requirements in Linear or the team planning system
2. **Lead** reviews context, Hive creates the approved execution plan
3. **Builders** claim work in Beads; Hive batches + isolates via worktrees;
   Tilth handles code perception; Village prevents file conflicts
4. **Review** feeds outcomes back into docs, pods, and delivery systems
5. **Compact** — Beads keeps execution memory; durable outcomes go to
   `docs/` and `pods/`

---

## Repository Layout

```
.
├── opencode.json                          # ← canonical stack config
├── docs/
│   ├── opencode-standard.md
│   ├── beads-standard.md
│   ├── beads-village-integration.md
│   ├── tilth-integration.md
│   ├── agent-hive-standard.md
│   ├── team-stack-pattern.md
│   ├── integration-model.md
│   ├── code-standards.md
│   ├── codebase-summary.md
│   ├── diagrams/
│   │   ├── full-stack-native.svg
│   │   └── team-workflow-stack.svg
│   └── opencode-agents/
│       ├── planner.md
│       ├── researcher.md
│       ├── reviewer.md
│       ├── integration.md
│       └── docs-manager.md
├── examples/opencode/
│   ├── opencode.foundation.jsonc          # native stack + agent shaping
│   └── opencode.team-stack.jsonc          # full team model (commented)
├── .hive/
│   └── templates/
│       ├── plan.md
│       ├── task-spec.md
│       └── task-report.md
├── pods/
│   ├── candidate-experience/tasks/_template.md
│   └── content-cms-strapi/tasks/_template.md
└── scripts/
    ├── setup-beads.sh
    ├── setup-tilth.sh
    └── check-native-stack.sh
```

---

## Standards & Templates

```
┌──────────────────┬──────────────────────────────────────────────┐
│ Type             │ Path                                         │
├──────────────────┼──────────────────────────────────────────────┤
│ Standards        │ docs/opencode-standard.md                    │
│                  │ docs/beads-standard.md                       │
│                  │ docs/beads-village-integration.md             │
│                  │ docs/tilth-integration.md                    │
│                  │ docs/agent-hive-standard.md                  │
│                  │ docs/team-stack-pattern.md                   │
│                  │ docs/integration-model.md                    │
│                  │ docs/code-standards.md                       │
│                  │ docs/codebase-summary.md                     │
├──────────────────┼──────────────────────────────────────────────┤
│ Hive Templates   │ .hive/templates/plan.md                      │
│                  │ .hive/templates/task-spec.md                 │
│                  │ .hive/templates/task-report.md               │
├──────────────────┼──────────────────────────────────────────────┤
│ Pod Templates    │ pods/candidate-experience/tasks/_template.md │
│                  │ pods/content-cms-strapi/tasks/_template.md   │
├──────────────────┼──────────────────────────────────────────────┤
│ Reference Configs│ opencode.json                                │
│                  │ examples/opencode/opencode.foundation.jsonc  │
│                  │ examples/opencode/opencode.team-stack.jsonc  │
└──────────────────┴──────────────────────────────────────────────┘
```

---

## Core Principles

- `opencode.json` is the single source of truth for runtime wiring
- Beads Village wraps Beads — it does **not** replace it
- Tilth is perception, not memory, not orchestration
- Durable knowledge goes in `docs/` and `pods/`, not messages or reservations
- Each layer owns **one** thing: runtime, orchestration, memory, coordination,
  or perception

## Team Non-Negotiables

- claim in `Beads` before implementation
- reserve shared files in `Beads Village` before editing
- release reservations or `done` when finishing work
- require Hive approval for non-trivial work
- never treat messages or reservations as durable memory
- keep MCP auth local and uncommitted

For the full team operating rules, use `docs/team-guardrails.md`.

---

## After Clone

1. Keep or rename the default pods in `pods/`
2. Initialize and adopt Beads as the execution layer
3. Confirm `beads-village` and `tilth` resolve on your machine
4. Authenticate `Linear` and `NotebookLM` MCP integrations locally
5. Use the root `opencode.json` as the native project config
6. Replace starter wording in docs with your project-specific sources of truth
