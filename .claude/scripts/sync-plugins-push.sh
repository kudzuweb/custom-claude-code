#!/bin/bash
# Sync plugins from this repo's plugins/ directory to ~/.claude/plugins/

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
REPO_PLUGINS="$REPO_ROOT/plugins"
PLUGIN_ARCHIVE="$REPO_ROOT/.plugin-sync-archive"
LOCAL_PLUGINS="$HOME/.claude/plugins"

if [ ! -d "$REPO_PLUGINS" ]; then
  echo "Error: $REPO_PLUGINS does not exist"
  exit 1
fi

if [ ! -d "$LOCAL_PLUGINS" ]; then
  echo "Error: $LOCAL_PLUGINS does not exist"
  exit 1
fi

echo "Syncing plugins from $REPO_PLUGINS to $LOCAL_PLUGINS..."

# Copy plugin directories only (not the sync metadata files)
rsync -av \
  --exclude='.DS_Store' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='installed_plugins*.json' \
  "$REPO_PLUGINS/" "$LOCAL_PLUGINS/"

echo "✓ Plugins pushed successfully"
echo ""
echo "Your ~/.claude/plugins/ is now up to date with this repo."
