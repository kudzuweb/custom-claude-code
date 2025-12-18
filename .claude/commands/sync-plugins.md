---
name: sync-plugins
description: Mirror plugin changes from ~/.claude/plugins/ back to this repo
---

Synchronize plugin changes from the active Claude Code installation back to this repository.

This command copies all changes from `~/.claude/plugins/` to the `plugins/` directory, keeping the repo in sync with your local Claude Code installation.

```bash
bash ./.claude/scripts/sync-plugins-pull.sh
```

After running, review the changes with `git status` and commit as needed.
