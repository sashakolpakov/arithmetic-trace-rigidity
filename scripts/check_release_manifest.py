#!/usr/bin/env python3
"""Verify artifact hashes and page counts recorded in RELEASE_MANIFEST.md."""

from __future__ import annotations

import hashlib
import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "RELEASE_MANIFEST.md"
EXPECTED_ARTIFACTS = {
    "paper/compact-trace-rigidity.pdf",
    "paper/trace-gap-companion.pdf",
    "paper/positive-trace-gap.pdf",
}
ROW = re.compile(
    r"^\| `(?P<path>[^`]+\.pdf)` \| (?P<pages>\d+) \| "
    r"`(?P<digest>[0-9a-f]{64})` \|"
)


def digest(path: Path) -> str:
    value = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            value.update(block)
    return value.hexdigest()


def page_count(path: Path) -> int:
    escaped = str(path).replace("\\", "\\\\").replace("(", "\\(").replace(")", "\\)")
    program = f"({escaped}) (r) file runpdfbegin pdfpagecount = quit"
    result = subprocess.run(
        [
            "gs",
            "-q",
            "-dSAFER",
            "-dNODISPLAY",
            f"--permit-file-read={path}",
            "-c",
            program,
        ],
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(result.stderr.strip() or "Ghostscript page-count failure")
    return int(result.stdout.strip())


def main() -> int:
    rows: dict[str, tuple[int, str]] = {}
    for line in MANIFEST.read_text(encoding="utf-8").splitlines():
        match = ROW.match(line)
        if match:
            rows[match.group("path")] = (
                int(match.group("pages")),
                match.group("digest"),
            )

    failures: list[str] = []
    if set(rows) != EXPECTED_ARTIFACTS:
        failures.append(
            "manifest artifact set differs from expected set: "
            f"found {sorted(rows)}, expected {sorted(EXPECTED_ARTIFACTS)}"
        )

    actual_pdfs = {
        path.relative_to(ROOT).as_posix()
        for path in ROOT.rglob("*.pdf")
        if ".lake" not in path.parts
    }
    unexpected_pdfs = sorted(actual_pdfs - EXPECTED_ARTIFACTS)
    if unexpected_pdfs:
        failures.append(f"unexpected PDF artifacts: {unexpected_pdfs}")

    for relative in sorted(EXPECTED_ARTIFACTS & set(rows)):
        expected_pages, expected_digest = rows[relative]
        artifact = ROOT / relative
        if not artifact.is_file():
            failures.append(f"missing artifact: {relative}")
            continue

        actual_digest = digest(artifact)
        if actual_digest != expected_digest:
            failures.append(
                f"{relative}: SHA-256 mismatch\n"
                f"  manifest: {expected_digest}\n"
                f"  actual:   {actual_digest}"
            )
        try:
            actual_pages = page_count(artifact)
        except (RuntimeError, ValueError) as error:
            failures.append(f"{relative}: cannot count pages: {error}")
        else:
            if actual_pages != expected_pages:
                failures.append(
                    f"{relative}: page-count mismatch "
                    f"(manifest {expected_pages}, actual {actual_pages})"
                )

    if failures:
        print("\n".join(failures), file=sys.stderr)
        return 1
    print("Release manifest check: PDF set, hashes, and page counts match")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
