# Code Standards

## Documentation Standard

- keep documentation concise and reviewable
- update the authoritative file instead of duplicating rules
- promote stable knowledge into `docs/`

## Repository Structure Standard

- `docs/` for durable standards and operating rules
- `docs/opencode-agents/` for OpenCode role contracts
- `examples/opencode/` for optional config examples
- `.hive/` for optional feature scaffolding and templates
- `pods/` for pod-local memory and task handoff files

## Coding-Agent Standard

- OpenCode supports implementation but does not become the system of record
- keep root OpenCode configuration minimal by default
- standardize behavior through repository docs and agent specs, not personal
  hook assumptions
- keep Beads task execution distinct from durable documentation and planning
