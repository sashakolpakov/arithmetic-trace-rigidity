# Pre-release candidate manifest

Candidate name: **Arithmetic Trace Rigidity**<br>
Repository slug: `arithmetic-trace-rigidity`<br>
Repository URL: <https://github.com/sashakolpakov/arithmetic-trace-rigidity><br>
Documentation URL: <https://sashakolpakov.github.io/arithmetic-trace-rigidity/><br>
Verification date: 26 September 2026 (Europe/Zurich)

This manifest describes the commit containing it.  It records the initial
public pre-release candidate; no archival tag is claimed.

## Manuscript artifacts

| Artifact | Pages | SHA-256 | Provenance |
|---|---:|---|---|
| `paper/compact-trace-rigidity.pdf` | 31 | `87df80c44830ad487399a74be6ef7e2fba2f194d0d8d9446e07cd266141f0524` | Reproducibly built from the adjacent TeX source; unattributed working paper |
| `paper/trace-gap-companion.pdf` | 131 | `9b021ad08d25fb2644fdba6489238ab0843eb7d4fe01fd222ace7a1c4f42b16d` | Reproducibly built from the adjacent TeX source; unattributed working paper |
| `paper/positive-trace-gap.pdf` | 21 | `d213521cf39a90918c97db9c6e3cb4aad2a7579506ad1adc780db60db78d74c3` | Reproducibly built from Nikolay Bogachev's adjacent TeX source |

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
- 11 project Lean source files, excluding dependencies and generated files

The repository pins its Lean toolchain in `formal/lean-toolchain` and its Lake
dependency revisions in `formal/lake-manifest.json`.

## Verification result

The command

```sh
make verify
```

completed successfully on this candidate. It performed forced builds of
all three TeX manuscripts, validation of the common bibliography, isolated
byte-for-byte PDF rebuilds, `lake build`, direct compilation of
`TraceSparsity/Main.lean`, an automated check of its printed axiom
dependencies, a comment-aware scan for forbidden Lean placeholders or project
declarations, final-log citation/reference checks, validation of relative
Markdown links, a strict warning-free Sphinx build, and
artifact-set/hash/page-count checks.

The Lean build was also tested in a fresh clone with `formal/.lake/` absent.
Lake fetched the exact manifest revisions and completed all 3,019 clean-build
jobs; the subsequent direct entry-point compilation and axiom audit passed.
The PDF isolation test copies the TeX sources without preserving modification
times, so it checks both absolute-path and fresh-checkout timestamp
independence.

Observed formal dependencies were only the documented standard Mathlib
principles `propext`, `Quot.sound`, and `Classical.choice`.  The source scan
found no project declaration of `axiom`, `opaque`, `sorry`, `admit`, `unsafe`,
`partial`, or `extern` in any of the eleven project Lean files.  A compiled
finite example satisfies all the ordered local and arithmetic assumptions,
and a second example verifies that critical growth alone does not imply
arithmeticity. Final TeX logs had no undefined citation, undefined
reference, duplicate-label, hyperref-bookmark, missing-glyph, or overfull-box
warning; remaining underfull bibliography boxes are nonblocking.

Visual inspection covered all three title pages and final bibliography pages,
the focused main and local theorems, the corrected finite-covolume Takeuchi
statement, the reduced-divisor passage, the logical dependency summary, and
the repaired trace-gap and order arguments in Bogachev's manuscript.

The public `main` branch contains one squashed commit.  Its Documentation
workflow deployed the strict Sphinx build to
<https://sashakolpakov.github.io/arithmetic-trace-rigidity/>; the workflow
completed successfully and post-deployment HTTPS requests to the landing page
and substantive mathematical pages returned status 200.
