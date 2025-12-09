---
allowed-tools: Bash(git checkout --branch:*), Bash(git push:*), Bash(git log:*), Bash(gh pr create:*)
description: Create a PR from committed changes with review before pushing
---

## Context

- Current branch: !`git branch --show-current`
- Recent commits on this branch: !`git log origin/main..HEAD --oneline` (or similar to show what's in this branch)

## Your task

Assumes changes are already committed locally. Do:

1. Check if on main branch - if so, create a new feature branch first
2. Create PR title and description based on the branch's commits:
   - Title: Clear summary of the changes
   - Description:
     - Summary (1-3 bullet points of what changed)
     - Test plan (checklist of what to test)
3. **OUTPUT the PR title and full description, ask for confirmation**: "Ready to push and create this PR? (yes/no/edit)"
4. **WAIT for user response** - Do not push yet
5. Only after user confirms, run: `git push origin [branch]`
6. Then run: `gh pr create --title "..." --body "..."`
7. Return the PR URL

Important: This assumes changes are already committed. Only push and create PR after user approves.
