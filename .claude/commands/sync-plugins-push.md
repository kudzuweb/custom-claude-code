---
name: sync-plugins-push
description: Push plugin changes from this repo to ~/.claude/plugins/
---

Push plugin changes from this repository to the active Claude Code installation.

This command copies all changes from the `plugins/` directory to `~/.claude/plugins/`, updating your local Claude Code installation with changes from this repo.

```bash
bash ./.claude/scripts/sync-plugins-push.sh
```

Use this after pulling changes from the repo to update your local installation.
