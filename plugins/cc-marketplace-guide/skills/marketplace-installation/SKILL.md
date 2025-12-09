---
name: Plugin Marketplace Installation
description: Use this skill when the user asks how to install plugins, add marketplaces, register local plugins, or troubleshoot plugin installation issues in Claude Code
---

# Plugin Installation in Claude Code

## Key Concept: Plugins Require Marketplace Installation

**Critical**: Claude Code plugins do NOT auto-discover from directories. They MUST be installed via a marketplace system.

Simply placing files in `~/.claude/plugins/` does nothing. You must:
1. Register a marketplace (if using local plugins)
2. Install plugins from that marketplace

## Local Plugin Marketplace Setup

### Step 1: Create Marketplace Manifest

Create `.claude-plugin/marketplace.json` in your plugins directory:

```
~/.claude/plugins/
├── .claude-plugin/
│   └── marketplace.json    # Marketplace manifest
├── my-plugin-1/            # Plugin directory
│   └── .claude-plugin/
│       └── plugin.json
├── my-plugin-2/            # Another plugin
│   └── .claude-plugin/
│       └── plugin.json
└── ...
```

**marketplace.json format**:
```json
{
  "name": "local-plugins",
  "owner": {
    "name": "Your Name"
  },
  "plugins": [
    {
      "name": "my-plugin-1",
      "source": "./my-plugin-1",
      "description": "What this plugin does"
    },
    {
      "name": "my-plugin-2",
      "source": "./my-plugin-2",
      "description": "What this plugin does"
    }
  ]
}
```

**Critical path rules**:
- Source paths MUST start with `./`
- Paths are relative to the marketplace ROOT directory (where you run the add command)
- Do NOT use `../` - it's not allowed
- Do NOT use `~` or absolute paths in source field

### Step 2: Register the Marketplace

Run this command in Claude Code (use FULL path, not `~`):

```
/plugin marketplace add /Users/YOUR_USERNAME/.claude/plugins
```

**Common errors**:
- Using `~` instead of full path: Interpreted as git URL
- Using `../` in source paths: Invalid schema error
- Missing `.claude-plugin/marketplace.json`: Not recognized as marketplace

### Step 3: Install Plugins

After registering the marketplace, install each plugin:

```
/plugin install plugin-name@marketplace-name
```

For example, with marketplace named "local-plugins":
```
/plugin install my-plugin-1@local-plugins
/plugin install my-plugin-2@local-plugins
```

### Step 4: Enable the Plugin

**Important**: Installing via command line may NOT auto-enable the plugin. Check `~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "my-plugin@local-plugins": true  // Must be true!
  }
}
```

If your plugin is `false` or missing, either:
- Use the `/plugin` menu UI to enable it
- Manually edit settings.json to set it to `true`

### Step 5: Restart Claude Code

Plugins load on startup. Restart Claude Code to activate newly installed plugins.

## Verifying Installation

Check installed plugins:
```
/plugin list
```

Check available commands from plugins:
```
/help
```

## Adding New Plugins to Existing Marketplace

1. Create the new plugin directory with `.claude-plugin/plugin.json`
2. Add an entry to `marketplace.json`
3. Run `/plugin install new-plugin@marketplace-name`
4. Restart Claude Code

## Troubleshooting

### "Invalid schema: plugins.X.source must start with ./"
- Change source paths from `../plugin-name` to `./plugin-name`
- Ensure marketplace.json is in `.claude-plugin/` directory

### "Could not find marketplace"
- Use full absolute path: `/Users/username/...`
- Don't use `~` - it's interpreted as a git URL

### Plugins not appearing in /help
- Ensure you ran `/plugin install plugin-name@marketplace-name`
- **Check if plugin is enabled** in `~/.claude/settings.json` - command-line installs may set plugins to `false`
- Restart Claude Code after installation
- Check `/plugin list` to verify installation status

### Commands from old version still showing
- Check for duplicate command files in project's `.claude/commands/`
- Project-level commands override plugin commands
- Delete conflicting files from `.claude/commands/`

## Plugin Directory Requirements

Each plugin needs at minimum:
```
plugin-name/
└── .claude-plugin/
    └── plugin.json    # Required: {"name": "plugin-name"}
```

The plugin.json MUST contain at least a `name` field.

## Quick Reference

| Task | Command |
|------|---------|
| Add marketplace | `/plugin marketplace add /full/path/to/dir` |
| Install plugin | `/plugin install name@marketplace` |
| List plugins | `/plugin list` |
| Remove plugin | `/plugin uninstall name` |
