#!/bin/bash
# Sync plugins from ~/.claude/plugins/ to this repo's plugins/ directory

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
REPO_PLUGINS="$REPO_ROOT/plugins"
PLUGIN_ARCHIVE="$REPO_ROOT/.plugin-sync-archive"
LOCAL_PLUGINS="$HOME/.claude/plugins"

if [ ! -d "$LOCAL_PLUGINS" ]; then
  echo "Error: $LOCAL_PLUGINS does not exist"
  exit 1
fi

if [ ! -d "$REPO_PLUGINS" ]; then
  echo "Error: $REPO_PLUGINS does not exist"
  exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p "$PLUGIN_ARCHIVE"

echo "Syncing plugins from $LOCAL_PLUGINS to $REPO_PLUGINS..."

# Copy plugin directories only (not the sync metadata files)
rsync -av \
  --exclude='.DS_Store' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='installed_plugins*.json' \
  "$LOCAL_PLUGINS/" "$REPO_PLUGINS/"

# Copy installed_plugins files to archive
if [ -f "$LOCAL_PLUGINS/installed_plugins.json" ]; then
  cp "$LOCAL_PLUGINS/installed_plugins.json" "$PLUGIN_ARCHIVE/"
fi
if [ -f "$LOCAL_PLUGINS/installed_plugins_v2.json" ]; then
  cp "$LOCAL_PLUGINS/installed_plugins_v2.json" "$PLUGIN_ARCHIVE/"
fi

echo "✓ Plugins synced successfully"
echo ""
echo "Next steps:"
echo "  git status        # Review changes"
echo "  git add .         # Stage changes"
echo "  git commit -m \"...\"  # Commit with a message"
