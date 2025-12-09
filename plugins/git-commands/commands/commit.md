---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(git diff:*), Bash(git log:*), Bash(git branch:*), Bash(git checkout --branch:*), AskUserQuestion
description: Create a local commit with message review
---

## Context

- Current branch: !`git branch --show-current`
- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Recent commits: !`git log --oneline -10`

## Your task

1. **CHECK BRANCH FIRST**: If on main or master branch:
   - STOP and warn: "You're on the main branch. You should not commit directly to main."
   - Ask: "Would you like to create a feature branch first? (yes/no)"
   - If yes, ask for branch name and create it with `git checkout -b [branch-name]`
   - If no, abort the commit operation entirely
   - Do NOT proceed with commit on main/master under any circumstances

2. Review the changes shown above
3. Draft an appropriate commit message based on the changes and your repo's commit style
4. **Output the drafted message and ask for confirmation**: "Review the commit message below. Approve? (yes/no/edit)"
5. Show the full commit message
6. **WAIT for user response** - Do not proceed until they confirm
7. Only after user approves, run: `git add .`
8. Then run: `git commit -m "..."`
9. Show final `git status`

Important: Do NOT push. This is local only. User reviews the message before committing. NEVER commit directly to main/master.
