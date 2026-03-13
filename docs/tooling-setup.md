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

Beads is part of the core starter workflow. Install the `bd` CLI:

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

## Tilth

Tilth is an optional code-perception layer for OpenCode and other coding-agent
hosts.

Preferred local install:

```bash
cargo install tilth
```

Alternative installation paths:

```bash
npm install -g tilth
```

```bash
npx tilth
```

Verify:

```bash
tilth --help
```

Wire Tilth into OpenCode user config:

```bash
tilth install opencode
```

Optional edit mode:

```bash
tilth install opencode --edit
```

## Optional Tools

- Linear MCP via the official remote server when the team wants issue access in
  agent workflows
- NotebookLM or NotebookLM MCP for retrieval
- Hive plugin support through `opencode-hive`
- Tilth for structural code reading and search

See also:

- `examples/opencode/opencode.team-stack.jsonc`

## First Read After Setup

1. `docs/opencode-standard.md`
2. `docs/beads-standard.md`
3. `docs/tilth-integration.md`
4. `docs/agent-hive-standard.md`
5. `docs/integration-model.md`
6. `docs/code-standards.md`

Core expectation:
- install OpenCode
- install Beads
- add Tilth only if you want the optional code-perception layer
