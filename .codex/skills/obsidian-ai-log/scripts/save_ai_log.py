#!/usr/bin/env python3
"""Save an AI conversation summary as an Obsidian Markdown note.

Usage:
  python scripts/save_ai_log.py --vault "$OBSIDIAN_VAULT_PATH" --title "Topic" < note.md

The note content is read from stdin. The script creates the destination folder,
sanctifies the filename, avoids overwriting existing notes, and prints the saved path.
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import re
import sys
from pathlib import Path

INVALID_FILENAME_CHARS = r'[\\/:*?"<>|]'


def sanitize_filename(text: str, max_len: int = 80) -> str:
    text = re.sub(INVALID_FILENAME_CHARS, "_", text.strip())
    text = re.sub(r"\s+", "_", text)
    text = text.strip("._ ")
    if not text:
        text = "AI会話ログ"
    return text[:max_len].rstrip("._ ")


def unique_path(path: Path) -> Path:
    if not path.exists():
        return path
    stem = path.stem
    suffix = path.suffix
    parent = path.parent
    for i in range(2, 1000):
        candidate = parent / f"{stem}-{i:02d}{suffix}"
        if not candidate.exists():
            return candidate
    raise RuntimeError(f"Could not find an unused filename for {path}")


def load_local_config() -> dict:
    config_path = Path.cwd() / ".obsidian-ai-log" / "config.json"
    if not config_path.exists():
        return {}
    try:
        return json.loads(config_path.read_text(encoding="utf-8"))
    except Exception as exc:  # noqa: BLE001
        print(f"Warning: failed to read {config_path}: {exc}", file=sys.stderr)
        return {}


def main() -> int:
    config = load_local_config()

    parser = argparse.ArgumentParser(description="Save an Obsidian AI log note from stdin.")
    parser.add_argument("--vault", default=os.environ.get("OBSIDIAN_VAULT_PATH") or config.get("vault_path"), help="Path to Obsidian Vault")
    parser.add_argument("--folder", default=os.environ.get("OBSIDIAN_AI_LOG_FOLDER") or config.get("folder") or "40_AI_Logs", help="Destination folder inside Vault")
    parser.add_argument("--title", required=True, help="Short topic/title for the note")
    parser.add_argument("--date", default=dt.date.today().isoformat(), help="Date prefix, YYYY-MM-DD")
    parser.add_argument("--source", default="Unknown", help="AI tool/source name, for logging only")
    args = parser.parse_args()

    if not args.vault:
        print("Error: Vault path is missing. Set OBSIDIAN_VAULT_PATH or pass --vault.", file=sys.stderr)
        return 2

    vault = Path(args.vault).expanduser().resolve()
    if not vault.exists():
        print(f"Error: Vault path does not exist: {vault}", file=sys.stderr)
        return 2
    if not vault.is_dir():
        print(f"Error: Vault path is not a directory: {vault}", file=sys.stderr)
        return 2

    content = sys.stdin.read().strip()
    if not content:
        print("Error: No Markdown content was provided on stdin.", file=sys.stderr)
        return 2

    folder = Path(args.folder.strip("/"))
    dest_dir = vault / folder
    dest_dir.mkdir(parents=True, exist_ok=True)

    safe_title = sanitize_filename(args.title)
    filename = f"{args.date}_{safe_title}.md"
    dest = unique_path(dest_dir / filename)
    dest.write_text(content + "\n", encoding="utf-8")

    print(str(dest))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
