---
description: Install and enable a plugin from local marketplace
argument-hint: plugin-name (without @local-plugins)
allowed-tools: Bash, Read, Write, AskUserQuestion
---

## Your task

The user wants to install a local plugin. The plugin name is: $ARGUMENTS

1. First, show them the command they would run:
   ```
   /plugin install $ARGUMENTS@local-plugins
   ```

2. Tell them: "Run the above command, then come back and say 'done' so I can enable it for you."

3. **WAIT for user to confirm they ran it**

4. After they confirm, read `~/.claude/settings.json`

5. Check if `"$ARGUMENTS@local-plugins"` exists in `enabledPlugins`:
   - If it's `false`, ask: "Enable $ARGUMENTS@local-plugins? (yes/no)"
   - If it's `true`, say "Already enabled!"
   - If missing, ask: "Add and enable $ARGUMENTS@local-plugins? (yes/no)"

6. If user says yes, update settings.json to set `"$ARGUMENTS@local-plugins": true`

7. Tell them to restart Claude Code to load the plugin.
