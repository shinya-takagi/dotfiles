# Installation notes

## Codex

Codex supports agent skills as a folder containing `SKILL.md`.

Personal install:

```bash
mkdir -p ~/.agents/skills
cp -r obsidian-ai-log-skill ~/.agents/skills/obsidian-ai-log
```

Repository install:

```bash
mkdir -p .agents/skills
cp -r obsidian-ai-log-skill .agents/skills/obsidian-ai-log
```

Optional Vault configuration:

```bash
export OBSIDIAN_VAULT_PATH="$HOME/path/to/YourVault"
export OBSIDIAN_AI_LOG_FOLDER="40_AI_Logs"
```

Or create `.obsidian-ai-log/config.json` in the repository:

```json
{
  "vault_path": "/absolute/path/to/YourVault",
  "folder": "40_AI_Logs"
}
```

## Claude Code

Claude Code skills also use a directory with `SKILL.md` frontmatter.

Install the folder in your custom skills/plugin location, or keep it in the repository and ask Claude Code to use the `obsidian-ai-log` skill.

Example request:

```text
Use the obsidian-ai-log skill to summarize this session and save it to my Obsidian Vault.
```

## Recommended prompt

```text
この会話をObsidianのAIログとして保存してください。要点、決定事項、試したこと、失敗したこと、未解決点、次にやること、関連ノートを残してください。
```
