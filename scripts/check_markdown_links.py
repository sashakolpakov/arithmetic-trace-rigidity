#!/usr/bin/env python3
"""Fail when a relative Markdown link points to a missing local path."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse


ROOT = Path(__file__).resolve().parents[1]
LINK = re.compile(r"\[[^\]]*\]\(([^)]+)\)")
SKIP_PARTS = {".git", ".lake"}


def markdown_files() -> list[Path]:
    return sorted(
        path
        for path in ROOT.rglob("*.md")
        if not any(part in SKIP_PARTS for part in path.relative_to(ROOT).parts)
    )


def local_target(raw: str) -> str | None:
    target = raw.strip()
    if target.startswith("<") and ">" in target:
        target = target[1 : target.index(">")]
    else:
        target = target.split(maxsplit=1)[0]

    parsed = urlparse(target)
    if parsed.scheme or target.startswith("#"):
        return None
    return unquote(target.split("#", 1)[0]) or None


def main() -> int:
    failures: list[str] = []
    checked = 0
    for document in markdown_files():
        text = document.read_text(encoding="utf-8")
        for match in LINK.finditer(text):
            target = local_target(match.group(1))
            if target is None:
                continue
            checked += 1
            resolved = (document.parent / target).resolve()
            try:
                resolved.relative_to(ROOT)
            except ValueError:
                failures.append(
                    f"{document.relative_to(ROOT)}: link escapes repository: {target}"
                )
                continue
            if not resolved.exists():
                failures.append(
                    f"{document.relative_to(ROOT)}: missing target: {target}"
                )

    if failures:
        print("\n".join(failures), file=sys.stderr)
        return 1
    print(f"Markdown link check: {checked} local links resolve")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
