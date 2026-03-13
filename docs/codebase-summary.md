# Codebase Summary

## Purpose

This repository is a reusable foundation for OpenCode-centered project setup.

## Current Shape

- `docs/` holds the operating model and standards for the native OpenCode stack
- `docs/beads-standard.md` defines Beads core memory and execution rules
- `docs/beads-village-integration.md` defines the coordination layer on top of
  Beads core
- `docs/tilth-integration.md` defines the code-perception layer
- `docs/team-stack-pattern.md` summarizes the combined OpenCode + Hive + Beads +
  Beads Village + Tilth model
- `docs/opencode-agents/` holds OpenCode role specs
- `examples/opencode/` holds commented reference configs that mirror the native
  stack
- `.hive/` holds planning templates and task handoff scaffolding
- `pods/` holds pod-local memory for the default `candidate-experience` and
  `content-cms-strapi` pods
- `scripts/` holds setup helpers such as Beads and Tilth bootstrap
- `opencode.json` is the canonical native OpenCode config for this starter
