#!/usr/bin/env python3
"""Rebuild each manuscript in an isolated path and compare PDF bytes."""

from __future__ import annotations

import hashlib
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PAPERS = (
    "compact-trace-rigidity",
    "trace-gap-companion",
    "positive-trace-gap",
)
BUILD_ENV = {
    "SOURCE_DATE_EPOCH": "1790035200",
    "FORCE_SOURCE_DATE": "1",
    "TZ": "UTC",
}


def digest(path: Path) -> str:
    value = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            value.update(block)
    return value.hexdigest()


def main() -> int:
    env = os.environ.copy()
    env.update(BUILD_ENV)
    failures: list[str] = []

    with tempfile.TemporaryDirectory(prefix="arithmetic-trace-rigidity-") as raw:
        build_root = Path(raw)
        build_paper = build_root / "paper"
        build_paper.mkdir()
        # Do not preserve mtimes: this must model a fresh checkout as well as
        # a different absolute path.
        shutil.copyfile(ROOT / ".latexmkrc", build_root / ".latexmkrc")
        shutil.copyfile(ROOT / "paper" / "biblio.bib", build_paper / "biblio.bib")

        for stem in PAPERS:
            source = ROOT / "paper" / f"{stem}.tex"
            expected_pdf = ROOT / "paper" / f"{stem}.pdf"
            isolated_source = build_paper / source.name
            shutil.copyfile(source, isolated_source)

            command = [
                "latexmk",
                "-silent",
                "-pdf",
                "-gg",
                "-interaction=nonstopmode",
                "-halt-on-error",
                f"-outdir={build_paper.resolve()}",
                str(isolated_source.resolve()),
            ]
            result = subprocess.run(
                command,
                cwd=build_root,
                env=env,
                text=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                check=False,
            )
            if result.returncode != 0:
                failures.append(
                    f"{stem}: isolated latexmk build failed\n{result.stdout}"
                )
                continue

            rebuilt_pdf = build_paper / f"{stem}.pdf"
            expected = digest(expected_pdf)
            rebuilt = digest(rebuilt_pdf)
            if rebuilt != expected:
                failures.append(
                    f"{stem}: SHA-256 mismatch\n"
                    f"  checked in: {expected}\n"
                    f"  rebuilt:    {rebuilt}"
                )
            else:
                print(f"{stem}: reproducible ({expected})")

    if failures:
        print("\n\n".join(failures), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
