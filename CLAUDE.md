# CLAUDE.md

This repository is a reusable Foundation Kit starter.

Read first:
1. `docs/opencode-standard.md`
2. `docs/beads-standard.md`
3. `docs/beads-village-integration.md`
4. `docs/tilth-integration.md`
5. `docs/agent-hive-standard.md`
6. `docs/integration-model.md`
7. `docs/code-standards.md`

Key rule: OpenCode supports implementation, but it does not become the system
of record.

This starter uses a native OpenCode stack:
- `opencode-hive` plugin for orchestration
- `beads-village`, `tilth`, `linear`, and `notebooklm` as MCP servers
- `beads` as core execution memory
- `.hive/` for plan-first orchestration and handoff
