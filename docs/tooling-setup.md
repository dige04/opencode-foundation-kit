# Tooling Setup

## Purpose

This document gives builders a practical setup path for the OpenCode foundation
starter.

## OpenCode

Install OpenCode using the official installer:

```bash
curl -fsSL https://opencode.ai/install | bash
```

Verify:

```bash
opencode --help
```

## Beads

If you want the Beads-first workflow, install the `bd` CLI. One common path is:

```bash
curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash
```

Alternative installation paths that some teams use:

```bash
npm install -g @beads/bd
```

```bash
go install github.com/steveyegge/beads/cmd/bd@latest
```

Verify:

```bash
bd ready
```

Then choose a repo mode:

```bash
bd init
```

```bash
bd init --stealth
```

```bash
bd init --contributor
```

## Optional Tools

- NotebookLM or NotebookLM MCP for retrieval
- Hive plugin support through `opencode-hive`

## First Read After Setup

1. `docs/opencode-standard.md`
2. `docs/beads-standard.md`
3. `docs/agent-hive-standard.md`
4. `docs/integration-model.md`
5. `docs/code-standards.md`
