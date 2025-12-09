# Claude Code Plugin Development

## Workflow

This repo is the source of truth for Claude Code plugins. The workflow:

1. **Plan & decide** what plugin changes to make (examine files in this repo)
2. **Apply changes** to `~/.claude/plugins/` (the active Claude Code installation)
3. **Sync back** automatically to mirror changes back to this repo
4. **Commit** changes to version control

## Key Directories

- `plugins/` (this repo) - Source of truth, version controlled
- `~/.claude/plugins/` - Active installation, synced from this repo
- `.claude-codebase.md` - Internal reference (in .gitignore)

## Sync Command

After making changes to `~/.claude/plugins/`, run:

```bash
/sync-plugins
```

This mirrors all changes from `~/.claude/plugins/` back to `plugins/` in this repo.

## Plugin Structure Reference

See `.claude-codebase.md` for full plugin architecture and conventions.

---

## Global Instructions

See `/Users/mauriaparker/.claude/CLAUDE.md` for global development guidelines.

### Key Global Rules (copied for emphasis)
- **Never guess how things work** - always check documentation first
- When asked about frameworks, languages, APIs, tools, or any technical implementation, look up the current documentation rather than relying on potentially outdated training data
