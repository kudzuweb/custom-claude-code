# Commit Commands Plugin

Streamline your git workflow with simple commands for committing, pushing, and creating pull requests.

## Overview

The Commit Commands Plugin automates common git operations, reducing context switching and manual command execution. Instead of running multiple git commands, use a single slash command to handle your entire workflow.

## Commands

### `/commit`

Creates a git commit with an automatically generated commit message based on staged and unstaged changes.

**What it does:**
1. Analyzes current git status
2. Reviews both staged and unstaged changes
3. Examines recent commit messages to match your repository's style
4. Drafts an appropriate commit message
5. Stages relevant files
6. Creates the commit

**Usage:**
```bash
/commit
```

**Example workflow:**
```bash
# Make some changes to your code
# Then simply run:
/commit

# Claude will:
# - Review your changes
# - Stage the files
# - Create a commit with an appropriate message
# - Show you the commit status
```

**Features:**
- Automatically drafts commit messages that match your repo's style
- Follows conventional commit practices
- Avoids committing files with secrets (.env, credentials.json)
- Includes Claude Code attribution in commit message

### `/commit`

Creates a local git commit with message review before committing.

**What it does:**
1. Analyzes current git status and changes
2. Examines recent commit messages to match your repository's style
3. Drafts an appropriate commit message
4. **Shows you the drafted message for approval** - Does NOT commit yet
5. Waits for your confirmation (yes/no/edit)
6. Only after you approve, stages files and creates the commit
7. Shows final git status

**Usage:**
```bash
/commit
```

**Example workflow:**
```bash
# Make some changes to your code
# Then run:
/commit

# Claude will:
# - Review your changes
# - Draft a commit message
# - Show it to you: "Review the commit message below. Approve? (yes/no/edit)"
# - Wait for your response
# - Only create the commit after you confirm
# - Show you the commit status
```

**Features:**
- Automatically drafts commit messages that match your repo's style
- Follows conventional commit practices
- **Message review before commit** - You control what gets committed
- Does NOT push - local only
- Avoids committing files with secrets (.env, credentials.json)

### `/pr`

Create a pull request from already-committed changes with review before pushing.

**What it does:**
1. Analyzes commits on your branch
2. Creates a PR title and description based on your commits
3. **Shows you the PR title and full description for approval** - Does NOT push yet
4. Waits for your confirmation (yes/no/edit)
5. Only after you approve, pushes the branch and creates the PR
6. Provides the PR URL

**Usage:**
```bash
/pr
```

**Example workflow:**
```bash
# After running /commit to create your commits locally
# Then run:
/pr

# Claude will:
# - Analyze your branch commits
# - Create a PR title and description
# - Show you: "Ready to push and create this PR? (yes/no/edit)"
# - Wait for your response
# - Only push and create PR after you confirm
# - Give you the PR URL
```

**Features:**
- Creates comprehensive PR descriptions with:
  - Summary of changes (1-3 bullet points)
  - Test plan checklist
- **PR review before pushing** - You control what gets pushed
- Handles branch creation from main automatically
- Uses GitHub CLI (`gh`) for PR creation
- Separate from commit command - maximum control

**Requirements:**
- GitHub CLI (`gh`) must be installed and authenticated
- Repository must have a remote named `origin`

### `/clean_gone`

Cleans up local branches that have been deleted from the remote repository.

**What it does:**
1. Lists all local branches to identify [gone] status
2. Identifies and removes worktrees associated with [gone] branches
3. Deletes all branches marked as [gone]
4. Provides feedback on removed branches

**Usage:**
```bash
/clean_gone
```

**Example workflow:**
```bash
# After PRs are merged and remote branches are deleted
/clean_gone

# Claude will:
# - Find all branches marked as [gone]
# - Remove any associated worktrees
# - Delete the stale local branches
# - Report what was cleaned up
```

**Features:**
- Handles both regular branches and worktree branches
- Safely removes worktrees before deleting branches
- Shows clear feedback about what was removed
- Reports if no cleanup was needed

**When to use:**
- After merging and deleting remote branches
- When your local branch list is cluttered with stale branches
- During regular repository maintenance

## Installation

This plugin is included in the Claude Code repository. The commands are automatically available when using Claude Code.

## Best Practices

### Using `/commit`
- Use to create commits with full control
- Review the drafted message before confirming
- Claude analyzes your repo's style - verify it matches
- Perfect for keeping commits organized during development
- You approve the message before it's committed - no surprises

### Using `/pr`
- Use after you've committed locally (via `/commit`)
- Review the PR title and description before confirming
- Claude analyzes your branch commits for comprehensive descriptions
- Edit the PR description if you want to customize it
- You approve before pushing and creating the PR - maximum control

### Using `/clean_gone`
- Run periodically to keep your branch list clean
- Especially useful after merging multiple PRs
- Safe to run - only removes branches already deleted remotely
- Helps maintain a tidy local repository

## Workflow Integration

### Recommended two-step workflow (with full review control):
```bash
# Step 1: Write code, create local commit with review
# Make some changes
/commit
# Review and approve the commit message
# Commit is now created locally

# Step 2: Create PR from committed changes with review
/pr
# Review and approve the PR title/description
# PR is created and pushed

# Step 3: Cleanup old branches
/clean_gone
```

This workflow ensures:
1. You see the commit message before it's created
2. You see the PR description before it's pushed
3. Full control over what gets committed and pushed

## Requirements

- Git must be installed and configured
- For `/commit-push-pr`: GitHub CLI (`gh`) must be installed and authenticated
- Repository must be a git repository with a remote

## Troubleshooting

### `/commit` creates empty commit

**Issue**: No changes to commit

**Solution**:
- Ensure you have unstaged or staged changes
- Run `git status` to verify changes exist

### `/pr` fails to create PR

**Issue**: `gh pr create` command fails

**Solution**:
- Install GitHub CLI: `brew install gh` (macOS) or see [GitHub CLI installation](https://cli.github.com/)
- Authenticate: `gh auth login`
- Ensure repository has a GitHub remote
- Make sure you've already committed changes locally (use `/commit` first)

### `/clean_gone` doesn't find branches

**Issue**: No branches marked as [gone]

**Solution**:
- Run `git fetch --prune` to update remote tracking
- Branches must be deleted from the remote to show as [gone]

## Tips

- **Combine with other tools**: Use `/commit` during development, then `/commit-push-pr` when ready
- **Let Claude draft messages**: The commit message analysis learns from your repo's style
- **Regular cleanup**: Run `/clean_gone` weekly to maintain a clean branch list
- **Review before pushing**: Always review the commit message and changes before pushing

## Author

Anthropic (support@anthropic.com)

## Version

1.0.0
