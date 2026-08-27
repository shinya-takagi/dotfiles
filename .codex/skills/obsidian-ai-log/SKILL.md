---
name: obsidian-ai-log
description: Summarize the current AI coding/research conversation into a reusable Obsidian Markdown note, preserving key points, decisions, unresolved issues, next actions, commands, code changes, and links/tags, then save it into an Obsidian Vault folder when a path is available.
---

# Obsidian AI Log Skill

Use this skill when the user asks to summarize, archive, record, save, or export the current Claude Code / Codex / ChatGPT conversation, coding session, research discussion, debugging session, or implementation review into an Obsidian Vault.

Typical triggers:

- 「この会話をObsidianにまとめて」
- 「ObsidianのVaultに記録して」
- 「AI会話ログとして保存して」
- 「要点・決定事項・未解決点をまとめて」
- “Summarize this session for Obsidian”
- “Save this coding session as an Obsidian note”

## Goal

Create an Obsidian note that is useful later, not a raw transcript. Preserve reusable knowledge, decisions, failed attempts, implementation details, commands, file paths, unresolved questions, and next actions.

## Output policy

Prefer to actually create a Markdown file in the configured Obsidian Vault folder when file-system access is available.

If a Vault path is not known, produce a complete Markdown note that the user can paste into Obsidian, and tell the user how to configure the path.

Do not store secrets, API keys, passwords, private tokens, or credentials. If a secret appears in the conversation, replace it with `[REDACTED]` and mention that it was redacted.

Do not dump the entire conversation. Summarize and structure it.

## Vault path resolution

Use the first available value:

1. Explicit path provided by the user in the current request.
2. Environment variable `OBSIDIAN_VAULT_PATH`.
3. Repository-local config file `.obsidian-ai-log/config.json` with key `vault_path`.
4. Ask the user for the Vault path only if saving is explicitly required and no path can be found.

Default destination folder inside the Vault:

```text
40_AI_Logs
```

The user may override it with:

- An explicit folder in the request.
- Environment variable `OBSIDIAN_AI_LOG_FOLDER`.
- `.obsidian-ai-log/config.json` key `folder`.

## Filename convention

Use:

```text
YYYY-MM-DD_<short-topic>.md
```

Guidelines:

- Use the local date when available.
- Keep the topic short and search-friendly.
- Prefer Japanese titles when the conversation is mainly Japanese.
- Avoid characters that are problematic in file names: `/`, `:`, `*`, `?`, `"`, `<`, `>`, `|`.
- If a file already exists, append `-02`, `-03`, etc.

Examples:

```text
2026-07-03_AI会話ログのObsidian保存運用.md
2026-07-03_EigenExaメモリ分析.md
2026-07-03_Codex実装ログ.md
```

## Note structure

Use this Markdown structure unless the user requests a different format.

```markdown
---
type: ai-log
date: YYYY-MM-DD
source: Claude Code / Codex / ChatGPT / Unknown
project:
topic:
tags:
  - ai-log
  - obsidian
status: captured
---

# Title

## 背景
Why this conversation happened.

## 相談・作業内容
What the user asked and what work was performed.

## 要点
- Important reusable points.

## 決定事項
- Decisions made during the conversation.

## 実装・設定・コマンド
Include only commands, file paths, settings, snippets, or patches that are useful later.

```bash
# commands here if relevant
```

## 試したこと
- Attempts, experiments, checks, and comparisons.

## 失敗したこと・注意点
- Failed attempts, pitfalls, constraints, and caveats.

## 未解決点
- Open questions or unresolved problems.

## 次にやること
- [ ] Concrete next action

## 関連ノート
- [[Obsidian]]
- [[AI活用]]
```

Omit sections that are completely irrelevant, but keep `背景`, `要点`, `決定事項`, `未解決点`, and `次にやること` whenever possible.

## Summarization rules

1. Extract the practical knowledge from the session.
2. Preserve the reasoning behind decisions, not only the final answer.
3. Record failed attempts because they prevent repeated work.
4. Keep code and commands exact when they are important.
5. Convert vague follow-ups into actionable TODO items.
6. Add Obsidian links with `[[...]]` for major concepts, tools, projects, and research topics.
7. Add tags that help retrieval. Prefer a small number of stable tags.
8. Keep the note concise enough to read later.

## Recommended tags

Choose from these when appropriate, and add more specific tags only when useful:

```yaml
- ai-log
- obsidian
- codex
- claude-code
- research-workflow
- implementation-log
- debugging
- hpc
- fortran
- eigenexa
- openacc
- mpi
- nuclear-fission
```

## Saving with the helper script

This skill includes `scripts/save_ai_log.py`.

When you can run shell commands, save the generated Markdown note by piping it to the script:

```bash
python3 scripts/save_ai_log.py \
  --vault "$OBSIDIAN_VAULT_PATH" \
  --folder "40_AI_Logs" \
  --title "AI会話ログのObsidian保存運用" \
  --source "Claude Code" <<'MARKDOWN'
---
type: ai-log
date: 2026-07-03
source: Claude Code
topic: AI会話ログのObsidian保存運用
tags:
  - ai-log
  - obsidian
---

# AI会話ログのObsidian保存運用

...
MARKDOWN
```

If the script is not available, create the file manually using the same filename convention.

## Final response after saving

After saving, respond briefly with:

- The saved file path.
- A one-sentence summary of what was recorded.
- Any missing configuration or unresolved save issue.

Do not paste the entire note again unless the user asks.

## Final response when not saving

If the Vault path is unavailable and you cannot save the file, provide the complete Markdown note for copying into Obsidian, then show the minimal setup:

```bash
export OBSIDIAN_VAULT_PATH="$HOME/path/to/YourVault"
export OBSIDIAN_AI_LOG_FOLDER="40_AI_Logs"
```
