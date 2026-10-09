# Pre-release candidate manifest

Candidate name: **Arithmetic Trace Rigidity**<br>
Repository slug: `arithmetic-trace-rigidity`<br>
Repository URL: <https://github.com/sashakolpakov/arithmetic-trace-rigidity><br>
Documentation URL: <https://sashakolpakov.github.io/arithmetic-trace-rigidity/><br>
Verification date: 9 October 2026 (Europe/Zurich)

This manifest describes the audited revision of the public pre-release
candidate. It records the artifacts in this source tree; no archival tag
is claimed.

## Manuscript artifacts

| Artifact | Pages | SHA-256 | Provenance |
|---|---:|---|---|
| `paper/compact-trace-rigidity.pdf` | 31 | `71113fe50c2b040eaf08f4aabc43ff90af821e04916bd1d14f6e095eacb5af00` | Reproducibly built from the adjacent TeX source; unattributed working paper |
| `paper/trace-gap-companion.pdf` | 131 | `204a1b2ad3af50789fd7658f45bc5d2f24be123d0acb0c5f686d750df3ca95b1` | Reproducibly built from the adjacent TeX source; unattributed working paper |
| `paper/positive-trace-gap.pdf` | 21 | `45a89b15d64f7cbe0b0818eb61453745d8aafd5b0973f0706ccc2b4036b3c9e0` | Reproducibly built from Nikolay Bogachev's adjacent TeX source |

The repository fixes `SOURCE_DATE_EPOCH=1790035200`, `FORCE_SOURCE_DATE=1`,
and `TZ=UTC` through `.latexmkrc` and the root Makefile.  Isolated clean builds
of all three TeX sources, under different temporary absolute paths, reproduce the
checked-in PDFs byte for byte with the recorded TeX toolchain.  The root
verification target checks these hashes by rebuilding in a temporary tree.
All three sources resolve citations through the sole 81-entry database
`paper/biblio.bib`.

## Toolchain

- Lean 4.32.2, commit `f3b06c705e6c85f5314019d5d3baab0fec5b580c`
- Lake 5.0.0 (`f3b06c7`)
- Latexmk 4.87
- pdfTeX 3.141592653-2.6-1.40.29 (TeX Live 2026/Homebrew)
- Ghostscript 10.07.0 (PDF page-count verification only)
- Python 3.12 or later for the complete verification command; the standalone repository scripts
  support Python 3.10 or later
- ripgrep for the repository verification scripts
- Sphinx 9.1.0 and Furo 2025.12.19 for the mathematical documentation
- 12 project Lean source files, excluding dependencies and generated files

The repository pins its Lean toolchain in `formal/lean-toolchain` and its Lake
dependency revisions in `formal/lake-manifest.json`.

## Verification result

The command

```sh
make verify
```

completed successfully on this audit revision. It performed forced builds of
all three TeX manuscripts, validation of the common bibliography, isolated
byte-for-byte PDF rebuilds, `lake build`, direct compilation of
`TraceSparsity/Main.lean`, an automated check of its printed axiom
dependencies, a comment-aware scan for forbidden Lean placeholders or project
declarations, final-log citation/reference checks, validation of relative
Markdown links, a strict warning-free Sphinx build, and
artifact-set/hash/page-count checks.

The initial candidate was also tested in a fresh clone on 25 September 2026
with `formal/.lake/` absent; that historical result is recorded in Round 10
of `AUDIT_LOG.md`. The current audit rebuilt the pinned local dependency
checkout and the revised project sources; the final incremental build
completed successfully with 3,013 jobs.
The PDF isolation test copies the TeX sources without preserving modification
times, so it checks both absolute-path and fresh-checkout timestamp
independence.

Observed formal dependencies were only the documented standard Mathlib
principles `propext`, `Quot.sound`, and `Classical.choice`.  The source scan
found no project declaration of `axiom`, `opaque`, `sorry`, `admit`, `unsafe`,
`partial`, or `extern` in any of the twelve project Lean files.  A compiled
finite example satisfies all the ordered local and arithmetic assumptions
with noncentral local height one and length two. It applies both public
formulations through the proved conversion. A second example verifies that
critical growth alone does not imply arithmeticity. The worked coefficient
audit adds 25 declarations comparing the numerical English-to-Lean
translation through satisfying families and proved counterexamples to
altered statements. All are included in the axiom audit. Final TeX logs had no
undefined citation, undefined reference, duplicate-label, hyperref-bookmark, missing-glyph, or overfull-box
warning; remaining underfull bibliography boxes are nonblocking.

Visual inspection during the 8 October manuscript audit covered the three
title pages, the focused
trace-length identity, spectral absorption and moving-element passages, the
companion's connected-centralizer construction, root-section restriction,
height normalization and irreducibility example, and the projective-sequence
argument in Bogachev's manuscript. The 9 October worked translation audit
changed the formal material and documentation; all three PDF hashes stayed
the same and were reverified.

The initial public release and documentation deployment were verified on
25 September 2026, as recorded in Round 10 of `AUDIT_LOG.md`. These local
build results do not verify a later documentation deployment.
