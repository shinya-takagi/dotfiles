## Worktree creation policy

When using the Superpowers `using-git-worktrees` skill:

- If `git worktree add` fails because the Codex sandbox blocks writes to `.git`,
  do not immediately fall back to working in the current directory.
- First, request the necessary additional permission from the user and retry
  the same `git worktree add` command with elevated permission.
- Only fall back to the current directory if:
  1. the user denies the permission request, or
  2. the command still fails after permission is granted.
- Do not use `danger-full-access` automatically.
