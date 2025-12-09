# Learning Style Plugin

Interactive learning mode that engages you in active coding through meaningful contributions at decision points.

**Note:** This is a customized version that uses a command (`/learning-mode`) instead of auto-activating. You control when learning mode is active.

## What it does

When you invoke `/learning-mode`, Claude adopts an interactive teaching approach that:

1. **Learning Mode:** Requests meaningful code contributions (5-10 lines) at decision points where your input truly matters
2. **Explanatory Mode:** Provides educational insights about implementation choices and codebase patterns

Instead of implementing everything automatically, Claude will:

1. Identify opportunities where you can write meaningful code
2. Focus on business logic and design choices where your input shapes the solution
3. Prepare the context and location for your contribution
4. Explain trade-offs and guide your implementation
5. Provide educational insights before and after writing code

## How it works

When you run `/learning-mode`, Claude injects learning instructions into that session only. This context instructs Claude to adopt an interactive teaching approach where you actively participate in writing key parts of the code.

## When Claude requests contributions

Claude will ask you to write code for:
- Business logic with multiple valid approaches
- Error handling strategies
- Algorithm implementation choices
- Data structure decisions
- User experience decisions
- Design patterns and architecture choices

## When Claude won't request contributions

Claude will implement directly:
- Boilerplate or repetitive code
- Obvious implementations with no meaningful choices
- Configuration or setup code
- Simple CRUD operations

## Example interaction

**Claude:** I've set up the authentication middleware. The session timeout behavior is a security vs. UX trade-off - should sessions auto-extend on activity, or have a hard timeout?

In `auth/middleware.ts`, implement the `handleSessionTimeout()` function to define the timeout behavior.

Consider: auto-extending improves UX but may leave sessions open longer; hard timeouts are more secure but might frustrate active users.

**You:** [Write 5-10 lines implementing your preferred approach]

## Educational insights

In addition to interactive learning, Claude will provide educational insights about implementation choices using this format:

```
`★ Insight ─────────────────────────────────────`
[2-3 key educational points about the codebase or implementation]
`─────────────────────────────────────────────────`
```

These insights focus on:
- Specific implementation choices for your codebase
- Patterns and conventions in your code
- Trade-offs and design decisions
- Codebase-specific details rather than general programming concepts

## Usage

Use the command `/learning-mode` to activate learning mode for the current session:

```bash
/learning-mode
```

This injects learning mode instructions for that session only. It does NOT activate automatically - you control when to use it.

**Example:**
```bash
# Start working on a feature
# Then activate learning mode when you want interactive feedback:
/learning-mode

# Claude will now request your input at decision points
```

## Customizations

This is a customized version of the learning style plugin:

- **Command-based activation**: Use `/learning-mode` to enable it for a session
- **No auto-activation**: It doesn't activate automatically on every session (avoiding token waste)
- **Full control**: You decide when learning mode is helpful
- **Session-scoped**: Effects only apply to the session where you run the command

## Managing changes

- To disable: Simply don't run `/learning-mode`
- To remove: Uninstall the plugin from Claude Code
- To customize: Edit the `/learning-mode` command or the SKILL.md file

## Philosophy

Learning by doing is more effective than passive observation. This plugin transforms your interaction with Claude from "watch and learn" to "build and understand," ensuring you develop practical skills through hands-on coding of meaningful logic.
