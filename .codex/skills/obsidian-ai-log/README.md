# obsidian-ai-log-skill

Claude Code / Codex で使うための、AI会話をObsidian向けMarkdownノートに要約して保存するSkillです。

## 内容

- `SKILL.md`: Skill本体の指示
- `scripts/save_ai_log.py`: Vault内の指定フォルダにMarkdownを保存する補助スクリプト
- `assets/obsidian-ai-log-template.md`: Obsidianノートのテンプレート
- `references/install.md`: インストールと設定メモ

## 最小設定

```bash
export OBSIDIAN_VAULT_PATH="$HOME/path/to/YourVault"
export OBSIDIAN_AI_LOG_FOLDER="40_AI_Logs"
```

## 使い方の例

```text
この会話をObsidianのAIログとして保存してください。要点、決定事項、未解決点、次にやることを残してください。
```

## 方針

会話全文ではなく、あとから再利用できる知識として圧縮します。失敗した試行、判断理由、未解決点、次のアクションを重視します。
