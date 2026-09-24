#!/usr/bin/env python3
"""Validate the common BibTeX database used by all three manuscripts."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PAPER = ROOT / "paper"
MANUSCRIPTS = (
    PAPER / "compact-trace-rigidity.tex",
    PAPER / "trace-gap-companion.tex",
    PAPER / "positive-trace-gap.tex",
)
BIBLIOGRAPHY = PAPER / "biblio.bib"
ENTRY = re.compile(r"^\s*@[A-Za-z]+\s*\{\s*([^,\s]+)\s*,", re.MULTILINE)
CITATION = re.compile(r"\\(?:cite|nocite)(?:\s*\[[^]]*\])*\s*\{([^}]*)\}")


def main() -> int:
    failures: list[str] = []
    database = BIBLIOGRAPHY.read_text(encoding="utf-8")
    keys = ENTRY.findall(database)
    exact_duplicates = sorted({key for key in keys if keys.count(key) > 1})
    folded: dict[str, list[str]] = {}
    for key in keys:
        folded.setdefault(key.casefold(), []).append(key)
    folded_duplicates = sorted(
        values for values in folded.values() if len(values) > 1
    )
    if exact_duplicates:
        failures.append(f"duplicate BibTeX keys: {exact_duplicates}")
    if folded_duplicates:
        failures.append(f"case-colliding BibTeX keys: {folded_duplicates}")

    available = set(keys)
    cited: set[str] = set()
    for manuscript in MANUSCRIPTS:
        source = manuscript.read_text(encoding="utf-8")
        relative = manuscript.relative_to(ROOT)
        if r"\begin{thebibliography}" in source:
            failures.append(f"{relative}: inline thebibliography remains")
        if r"\bibliography{biblio}" not in source:
            failures.append(f"{relative}: does not select paper/biblio.bib")
        if r"\bibliographystyle{" not in source:
            failures.append(f"{relative}: no BibTeX style declared")
        local: set[str] = set()
        for match in CITATION.finditer(source):
            local.update(item.strip() for item in match.group(1).split(","))
        local.discard("*")
        cited.update(local)
        missing = sorted(local - available)
        if missing:
            failures.append(f"{relative}: missing citation keys {missing}")

    if failures:
        print("\n".join(failures), file=sys.stderr)
        return 1
    print(
        f"Bibliography check: {len(keys)} unique entries cover "
        f"{len(cited)} cited keys in {len(MANUSCRIPTS)} manuscripts"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
