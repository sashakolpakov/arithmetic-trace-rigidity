# Arithmetic Trace Rigidity

This repository contains three manuscripts on trace sparsity, arithmeticity,
and division in semisimple groups.  The focused manuscript presents a
proof that a cocompact Fuchsian lattice is arithmetic whenever the upper
polynomial growth exponent of its signed trace set is at most one.  This
replaces linear growth by a weaker critical bound and therefore implies both
the linear-growth and, by an elementary covering argument, bounded-clustering
conclusions.  The theorem is stated for all compact lattices,
including orbifold groups.

Nikolay Bogachev is the author of *Proof of the Positive Trace Gap
Conjecture*.  The focused and companion manuscripts are unattributed working
papers and do not assert individual or collective authorship.

This is a **pre-release research repository**, not a substitute for expert
review.  The TeX sources build, the principal references have been
audited, and the Lean project checks the internal implication structure
described below.  The compact theorem would settle the compact cases of the
Schmutz linear-growth and Sarnak bounded-clustering conjectures.  It therefore
requires independent expert verification before it is cited as settled
literature.

The mathematical guide is published at
<https://sashakolpakov.github.io/arithmetic-trace-rigidity/>.  It introduces
the trace-growth hypotheses, the local expansion functional, the recurrence
and trace-graph estimates, the deduction of arithmeticity, and the part of
the argument checked in Lean.  It links each discussion to the complete
manuscripts.

## Entry points

| Item | Contents |
|---|---|
| [`paper/compact-trace-rigidity.pdf`](paper/compact-trace-rigidity.pdf) ([TeX](paper/compact-trace-rigidity.tex)) | Unattributed working paper, *Trace Sparsity and Arithmeticity for Compact Hyperbolic Surfaces*.  This is the focused proof and the recommended starting point. |
| [`paper/trace-gap-companion.pdf`](paper/trace-gap-companion.pdf) ([TeX](paper/trace-gap-companion.tex)) | Unattributed working paper, *Kummer Division, Polynomial Secants, and Trace Rigidity*. This develops the wider algebraic-group theory, auxiliary theorems, countermodels, and approaches not used in the focused proof. |
| [`paper/positive-trace-gap.pdf`](paper/positive-trace-gap.pdf) ([TeX](paper/positive-trace-gap.tex)) | Nikolay Bogachev, *Proof of the Positive Trace Gap Conjecture*.  This proves the positive-gap characterization and supplies the square-root/commensurator starting point for the companion manuscript and the broader project. |
| [`formal/`](formal/) | Lean proofs of selected algebraic and combinatorial calculations and of the abstract implication structure of the focused manuscript. |

All three manuscripts use the single audited BibTeX database
[`paper/biblio.bib`](paper/biblio.bib).

The focused manuscript can be read independently of the companion and states
every external theorem used in its proof.  The companion is useful for the Hilbert--90 interpretation of
the projective square-root map, Kummer division, inner/outer form detection,
higher-rank extensions, and the record of approaches that do not prove the compact
theorem.

## What the Lean files check

The Lean project checks selected calculations and the deduction of the final
theorems from explicitly stated mathematical hypotheses.  In particular, it
checks:

- the Chebyshev recurrence, Cassini identity, and scalar trace projections;
- the quadratic identity for the pair
  \((\operatorname{tr}g,\operatorname{tr}(a_mg))\) and its Fricke
  factorization;
- the finite-fiber Chinese-remainder count for length-two paths in the trace
  graph;
- the exact order of the `m`, `theta`, `epsilon`, and `N` limits and the
  resulting coefficient `1/2`; and
- the implication from explicitly stated critical-growth, local-expansion,
  Thurston-rigidity, Takeuchi, finite-covolume, and finite-index inputs to the
  compact Schmutz and Sarnak conclusions.

The accompanying tables record four distinct checks: the formal hypotheses
are logically consistent; each hypothesis has the stated meaning in the
manuscript; each cited theorem is used in a form that follows from its source;
and Lean verifies the deduction once those hypotheses are supplied.  The
project does not attempt to formalize Roth's theorem, superapproximation,
hyperbolic geometry, Thurston's theorem, Northcott's theorem, or Takeuchi's
criterion from first principles.  It treats the torsion-free surface case;
the final use of Selberg's lemma to pass to orbifolds remains in the
manuscript.  A table matching Lean declarations with the manuscript is in
[`formal/MANUSCRIPT_MAP.md`](formal/MANUSCRIPT_MAP.md); see also the shorter
[`formal/README.md`](formal/README.md) and the published
[verification guide](https://sashakolpakov.github.io/arithmetic-trace-rigidity/formal_contract.html).

## Research and audit records

- [`STATUS.md`](STATUS.md) records the proof status of each theorem and its
  relation to existing literature.
- [`AUDIT_LOG.md`](AUDIT_LOG.md) records the proof, reference, language, and
  release audits, together with the scope of the Lean verification.
- [`PROVENANCE_INFLUENCE_LEDGER.md`](PROVENANCE_INFLUENCE_LEDGER.md) separates
  ideas present in Bogachev's manuscript from ideas introduced during the
  subsequent development and assesses their strategic influence.
- [`FUTURE_GOALS.md`](FUTURE_GOALS.md) ranks nearby Sarnak-related problems by
  mathematical significance and estimated tractability.
- [`PRE_RELEASE_CHECKLIST.md`](PRE_RELEASE_CHECKLIST.md) is the operative
  release plan.  Unchecked or blocked items are not silently waived.
- [`RELEASE_MANIFEST.md`](RELEASE_MANIFEST.md) records the current candidate's
  artifact hashes, toolchain, and verification result.

The remaining proof notes give details for individual steps in the longer
argument and record the checks made during its preparation.  Each manuscript
is authoritative for its own statements; `STATUS.md` records the status of
the additional results and alternative approaches.

## Rebuilding

The document build requires a current TeX Live installation with `latexmk`.
The full verification command uses `rg`, Python 3.12 or later, and Ghostscript
(for PDF page-count verification); the standalone repository scripts
remain compatible with Python 3.10 or later.  The formal build uses the Lean
toolchain pinned by `formal/lean-toolchain`; Lake fetches the exact dependencies
recorded in `formal/lake-manifest.json`. The verification command also checks
that every declaration printed by `formal/TraceSparsity/Main.lean` depends
only on the documented standard Mathlib principles. The documentation build
uses the pinned Sphinx and Furo versions in `docs/requirements.txt`.

Run all local verification checks from the repository root with:

```sh
make verify
```

To build all three manuscripts without running Lean:

```sh
make papers
```

To build the documentation alone:

```sh
python3 -m pip install -r docs/requirements.txt
make check-docs
```

To build them separately:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error \
  -outdir=paper paper/compact-trace-rigidity.tex

latexmk -pdf -interaction=nonstopmode -halt-on-error \
  -outdir=paper paper/trace-gap-companion.tex

latexmk -pdf -interaction=nonstopmode -halt-on-error \
  -outdir=paper paper/positive-trace-gap.tex
```

BibTeX resolves every citation in these commands from
`paper/biblio.bib`; no manuscript carries a private inline bibliography.

For the formal project:

```sh
cd formal
lake build
lake env lean TraceSparsity/Main.lean
```

The checked-in PDFs are release artifacts; LaTeX intermediates and
`formal/.lake/` are ignored.  `make clean` removes LaTeX intermediates but
retains the PDFs.  The root `.latexmkrc` fixes the build epoch and timezone;
`make verify` rebuilds each paper in an isolated temporary path and requires
its SHA-256 digest to match the checked-in PDF byte for byte.

## Source and release status

All three TeX sources, the shared bibliography, the generated PDFs, and the
formal project are present in the repository.  This is a public pre-release
rather than a tagged archival release; no repository-wide license is
asserted.
