#!/usr/bin/env python3

import json
import os
import socket
import sys
import urllib.error
import urllib.request


CODEX_DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1531126252834918601/QVA5RKDOyuJgXLGcm9xHbfJxN6VGBvjlJvmdWmRmBeAzUxEwXyDPZ7HY3LEuI1nM7UmO"


def truncate(text: str, length: int = 1500) -> str:
    text = text.strip()
    if len(text) <= length:
        return text
    return text[: length - 3] + "..."


def send_discord(webhook_url: str, message: str) -> None:
    payload = json.dumps(
        {
            "username": "Codex",
            "content": message,
            "allowed_mentions": {"parse": []},
        }
    ).encode("utf-8")

    request = urllib.request.Request(
        webhook_url,
        data=payload,
        headers={
            "Content-Type": "application/json",
            "User-Agent": "codex-discord-notifier/1.0",
        },
        method="POST",
    )

    with urllib.request.urlopen(request, timeout=10) as response:
        response.read()


def main() -> int:
    # webhook_url = os.environ.get("CODEX_DISCORD_WEBHOOK")
    webhook_url = CODEX_DISCORD_WEBHOOK
    if not webhook_url:
        print("{}")
        return 0

    try:
        event = json.load(sys.stdin)
    except json.JSONDecodeError:
        event = {}

    event_name = event.get("hook_event_name", "unknown")
    cwd = event.get("cwd", "")
    project = os.path.basename(cwd) if cwd else "unknown"
    hostname = socket.gethostname()

    if event_name == "PermissionRequest":
        tool_name = event.get("tool_name", "unknown")
        tool_input = event.get("tool_input") or {}
        description = tool_input.get("description")

        if not description:
            description = tool_input.get("command", "詳細なし")

        message = (
            "⚠️ **Codexが承認を待っています**\n"
            f"**ホスト:** `{hostname}`\n"
            f"**プロジェクト:** `{project}`\n"
            f"**ツール:** `{tool_name}`\n"
            f"**内容:**\n```text\n{truncate(str(description), 1000)}\n```"
        )

    elif event_name == "Stop":
        last_message = event.get("last_assistant_message") or "メッセージなし"

        # Stopは「完了」と「ユーザーへの質問」の両方で発生し得ます。
        message = (
            "✅ **Codexのターンが終了しました**\n"
            f"**ホスト:** `{hostname}`\n"
            f"**プロジェクト:** `{project}`\n"
            f"**最後のメッセージ:**\n"
            f"```text\n{truncate(last_message)}\n```"
        )

    else:
        print("{}")
        return 0

    try:
        send_discord(webhook_url, message)
    except (urllib.error.URLError, TimeoutError, OSError) as exc:
        # フックの失敗でCodex本体を止めない
        print(f"Discord notification failed: {exc}", file=sys.stderr)

    # Stopフックは標準出力に有効なJSONを要求する
    print("{}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
