# Tooling Setup

## Purpose

This document gives builders a practical setup path for the OpenCode foundation
starter.

The native stack in this starter is:
- OpenCode
- Beads
- Beads Village
- Tilth
- Linear MCP
- NotebookLM MCP

Run the built-in preflight any time you want to validate local setup:

```bash
bash scripts/check-native-stack.sh
```

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

## Beads Village

Beads Village is part of the native OpenCode coordination layer in this starter.

No separate global install is required if you use `npx`, but verify the MCP
server resolves on your machine:

```bash
npx beads-village --help
```

The root `opencode.json` already expects:

```json
"beads-village": {
  "type": "local",
  "command": ["npx", "beads-village"]
}
```

## Tilth

Tilth is the native code-perception layer for OpenCode in this starter.

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

The root `opencode.json` already expects:

```json
"tilth": {
  "type": "local",
  "command": ["tilth", "--mcp", "--edit"]
}
```

## Linear MCP

This starter expects Linear as a native MCP-backed planning integration.

The root `opencode.json` already includes:

```json
"linear": {
  "type": "local",
  "command": ["npx", "-y", "mcp-remote", "https://mcp.linear.app/mcp"]
}
```

Complete any auth flow required by the remote MCP tool in your local OpenCode
environment.

## NotebookLM MCP

This starter expects NotebookLM as the native retrieval MCP integration.

The root `opencode.json` already includes:

```json
"notebooklm": {
  "type": "local",
  "command": ["npx", "-y", "notebooklm-mcp@latest"]
}
```

Treat NotebookLM as retrieval only, even though it is configured natively.

## Optional Tools

- additional tooling beyond the native stack, such as Context7 or fetch helpers

See also:

- `examples/opencode/opencode.team-stack.jsonc`

## First Read After Setup

1. `docs/opencode-standard.md`
2. `docs/beads-standard.md`
3. `docs/beads-village-integration.md`
4. `docs/tilth-integration.md`
5. `docs/agent-hive-standard.md`
6. `docs/integration-model.md`
7. `docs/code-standards.md`

Core expectation:
- install OpenCode
- install Beads
- verify `npx beads-village --help`
- install Tilth
- complete any local auth required for Linear and NotebookLM MCP usage
