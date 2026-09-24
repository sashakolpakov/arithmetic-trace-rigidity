#!/usr/bin/env python3
"""Reject forbidden declarations and proof placeholders in project Lean code."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FORMAL = ROOT / "formal"
FORBIDDEN = re.compile(
    r"\b(?:axiom|opaque|sorry|admit|unsafe|partial|extern)\b"
)


def remove_comments_and_strings(source: str) -> str:
    """Replace Lean comments and strings by spaces while preserving newlines."""

    output: list[str] = []
    index = 0
    block_depth = 0
    in_string = False
    escaped = False

    while index < len(source):
        if block_depth:
            if source.startswith("/-", index):
                block_depth += 1
                output.extend((" ", " "))
                index += 2
            elif source.startswith("-/", index):
                block_depth -= 1
                output.extend((" ", " "))
                index += 2
            else:
                character = source[index]
                output.append("\n" if character == "\n" else " ")
                index += 1
            continue

        if in_string:
            character = source[index]
            output.append("\n" if character == "\n" else " ")
            index += 1
            if escaped:
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == '"':
                in_string = False
            continue

        if source.startswith("--", index):
            newline = source.find("\n", index + 2)
            if newline < 0:
                output.extend(" " * (len(source) - index))
                break
            output.extend(" " * (newline - index))
            output.append("\n")
            index = newline + 1
        elif source.startswith("/-", index):
            block_depth = 1
            output.extend((" ", " "))
            index += 2
        elif source[index] == '"':
            in_string = True
            output.append(" ")
            index += 1
        else:
            output.append(source[index])
            index += 1

    if block_depth:
        raise ValueError("unterminated block comment")
    if in_string:
        raise ValueError("unterminated string literal")
    return "".join(output)


def main() -> int:
    failures: list[str] = []
    sources = sorted(
        path for path in FORMAL.rglob("*.lean") if ".lake" not in path.parts
    )
    if not sources:
        print("No project Lean sources found.", file=sys.stderr)
        return 1

    for path in sources:
        try:
            code = remove_comments_and_strings(path.read_text(encoding="utf-8"))
        except (OSError, UnicodeError, ValueError) as error:
            failures.append(f"{path.relative_to(ROOT)}: cannot scan: {error}")
            continue
        for match in FORBIDDEN.finditer(code):
            line = code.count("\n", 0, match.start()) + 1
            failures.append(
                f"{path.relative_to(ROOT)}:{line}: forbidden Lean keyword "
                f"{match.group(0)!r}"
            )

    if failures:
        print("\n".join(failures), file=sys.stderr)
        return 1
    print(f"Lean source scan: clean ({len(sources)} files)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
