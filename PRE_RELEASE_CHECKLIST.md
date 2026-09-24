# Arithmetic Trace Rigidity: pre-release plan

Public repository name: **Arithmetic Trace Rigidity**<br>
Repository slug: `arithmetic-trace-rigidity`

This checklist records tests performed on the files intended for publication.
An item is complete only after its stated test has been run on those files.

Status markers:

- `[x]` verified in the current release candidate;
- `[ ]` still to be done.

## Execution order

The completed sequence was: merge the common bibliography; audit and build all
three manuscripts; run all verification checks; remove regenerated
caches and LaTeX intermediates; commit and push the exact verified tree; then
repeat the source, link, manifest, and build checks from a fresh clone; and
deploy the strict documentation build through GitHub Pages.  This checklist
records the initial public pre-release, not a later archival tag.

## Phase 1: freeze and organize the manuscript sources

- [x] Keep all three manuscripts under `paper/` with stable, descriptive
  filenames and adjacent source-built PDFs.
- [x] Integrate Nikolay Bogachev's supplied TeX source as
  `paper/positive-trace-gap.tex`, preserving its byline and manuscript voice
  while making the audited mathematical, citation, and typographic repairs.
- [x] Reconcile the later arXiv-submitted `main (1).tex` by a three-way
  semantic merge, incorporating the author's substantive revisions and
  deletions without restoring defects already repaired in the repository.
- [x] Record that the authorized source is a substantive 20-page successor to
  the obsolete 19-page root PDF, rather than silently treating the two as the
  same artifact.
- [x] Give the third source a Makefile target and include its PDF in the
  isolated reproducibility and manifest checks.
- [x] Make `paper/biblio.bib` the sole bibliography for all three manuscripts;
  use canonical keys, remove inline bibliographies, and require a clean
  bibliography validator and clean BibTeX logs.
- [x] Record the final page counts and hashes for all three source-built PDFs
  in `RELEASE_MANIFEST.md` after the last mathematical edit.

Acceptance test: every PDF has a documented one-command build from checked-in
source, and all citations resolve from the one common bibliography.

## Phase 2: mathematics and references

- [x] Re-audit the independent-review repairs: the strengthened upper trace-growth
  exponent, Thurston specialization rigidity, the Selberg orbifold extension,
  the split and nonsplit quadratic divisor count, and the exact sharpness
  calculation must each survive an independent post-edit pass.
- [x] Re-audit the precise uses of Bombieri--Gubler,
  Weisfeiler, Salehi Golsefidy, Brooks--Burger, Gorodnik--Nevo, and the
  bounded-exponent trace-fiber product; every model identification and
  uniformity statement must match the cited theorem.
- [x] Correct the compact manuscript's Takeuchi statement to require finite
  covolume and establish that the square subgroup is cocompact before applying
  it.
- [x] Finish the post-repair source audit of the compact manuscript: Roth,
  strong approximation, bounded-power superapproximation, Brooks--Burger
  transfer, Gorodnik--Nevo counting, Lang--Weil, Northcott, and Takeuchi must
  be cited with hypotheses matching the form used.
- [x] Finish the companion-manuscript citation repair: all essential
  external inputs must have exact sources or an explicit in-text derivation.
- [x] Re-run the citation-key, theorem-pointer, DOI, arXiv-version, and
  bibliography-metadata audit on all three TeX sources.
- [x] Audit Bogachev's manuscript statement by statement; repair the reversed
  trace-gap inequality sentence, the Geninska--Leuzinger theorem pointer, the
  omitted cocompactness hypothesis in the BBKS comparison, and the Vinberg
  bibliography metadata, while adding the short explanations identified by
  the audit.
- [x] Replace broad novelty language by conservative status language wherever
  priority has not been independently established.
- [x] Verify that `STATUS.md`, `AUDIT_LOG.md`, the README, and all three manuscripts
  give the same status for every principal theorem.

Acceptance test: no nonexistent source, unresolved citation, unsupported
scope extension, or stronger-than-source hypothesis remains; every main
claim has one consistent status throughout the repository.

## Phase 3: agreement between Lean and the manuscript

- [x] Compile and inspect the revised Lean statements, with
  `CriticalTraceGrowth` separate from `LinearTraceGrowth`, the neutral
  `specializationRigidity` as the specialization hypothesis, explicit
  `_from_inputs` theorem names, and the concrete Chinese-remainder proof for
  length-two paths.
- [x] Compile the Lean project after restricting the pre-limit epsilon
  hypothesis to the manuscript's range `0 < epsilon < 2N - 4`.
- [x] Delete the complete `formal/.lake/` directory and reconstruct the
  project from `lean-toolchain` and `lake-manifest.json`.  The final
  cache-free build, run from a fresh clone, fetched the pinned revisions and
  completed all 3,019 jobs before the direct entry-point and axiom checks were
  run.
- [x] Make algebraicity explicit in the distinguished-place lower bound.
- [x] Make finite covolume and finite index explicit in the Lean assumptions
  representing Takeuchi's criterion and ascent of arithmeticity.
- [x] Restrict the central local-height identity to eligible algebraic
  specializations.
- [x] Complete a field-by-field correspondence table for every explicit Lean
  input.  Each row must state its intended manuscript interpretation and
  classify the relation as a direct translation, a normalized equivalence,
  a one-way consequence, or a statement proved at an explicitly cited place
  in the manuscript. Such derived statements must not be described as
  verbatim theorems from the literature.
- [x] Confirm that the quantifier order, dependencies of constants, signs,
  coefficients, and conclusions in that table match both the TeX theorem and
  the Lean declaration.
- [x] Update `formal/MANUSCRIPT_MAP.md` and `formal/README.md` to record the
  comparison and to distinguish normalized equivalences, one-way consequences
  of cited results, and statements proved in the manuscript but assumed by
  Lean.
- [x] Compile a finite example satisfying the abstract, local, and arithmetic
  assumptions simultaneously. Also compile an example in which critical
  growth holds but arithmeticity fails after the external assumptions are
  removed.
- [x] Run the full formal release commands:

  ```sh
  make formal check-lean-source
  ```

The `formal` target runs `lake build` and then compiles
`TraceSparsity/Main.lean` through `scripts/check_lean_axioms.py`.

Acceptance test: both Lean compilations exit successfully; the comment-aware
source scan finds no forbidden declaration or placeholder; the automated
axiom-output check accepts only `propext`, `Quot.sound`, and
`Classical.choice`; every theorem on the final path has a relation-coded
TeX-to-Lean interpretation entry, and the finite consistency example compiles.

## Phase 4: reproducible document builds

- [x] Give the two unattributed manuscripts a separate language and exposition
  audit: replace unexplained short handles by the mathematical assertions they
  denote, expand compressed proof transitions, and re-audit every passage in
  which the rewrite exposed or changed a quantifier, hypothesis, or inequality.
  Preserve Bogachev's manuscript voice apart from independently justified
  corrections.
- [x] Rebuild all three manuscripts after the independent-review repairs; refresh
  the focused PDF page count and digest, and repeat visual inspection of every
  edited proof passage and the acknowledgement to Igor Rivin.
- [x] Run clean forced builds of all three TeX manuscripts.  This is the
  `papers-force` part of the root verification target:

  ```sh
  make verify
  ```

- [x] Check all three logs for undefined citations/references, duplicate labels,
  missing glyphs, and serious overfull boxes.
- [x] Visually inspect the title page, contents, theorem numbering,
  bibliography, displayed diagrams, and final page of each PDF.
- [x] Rebuild all three PDFs in isolated paths, confirm byte-for-byte
  reproducibility, and record their final page counts and SHA-256 checksums in
  `RELEASE_MANIFEST.md`.

Acceptance test: all three forced builds have succeeded in two independent passes;
no undefined reference or citation remains; visual inspection finds no
release-blocking defect.  A fixed build epoch and timezone make the PDFs
byte-for-byte reproducible, and isolated builds under different absolute paths
and fresh source-file modification times match the candidate hashes recorded
in the release manifest.

## Phase 5: public-repository hygiene

- [x] Replace the working-directory title in `README.md` by **Arithmetic Trace
  Rigidity** and make the focused manuscript the unambiguous entry point.
- [x] Shorten the README's theorem catalogue to independently checked headline
  results; move the detailed ledger to `STATUS.md`.
- [x] Add a `.gitignore` covering Lean and LaTeX intermediates while retaining
  the three intended release PDFs.
- [x] Add `.gitattributes` so text files use LF line endings and PDF/image
  artifacts are never subjected to text conversion.
- [x] Remove the generated `formal/.lake/` cache from the release tree; Lake
  reconstructs it from the pinned toolchain and manifest.
- [x] Remove generated `.aux`, `.bbl`, `.blg`, `.fdb_latexmk`, `.fls`, `.log`, `.out`, and
  `.toc` files from the release tree after the final build.
- [x] Scan publishable text for absolute local paths, API keys, credentials,
  personal notes, temporary filenames, machine-generated chatter, and private
  correspondence.
- [x] Check every relative Markdown link from the repository root after the
  final documentation edits.
- [x] Retain the provenance ledger and README statement distinguishing
  Bogachev's manuscript, the two repository manuscripts, and the Lean
  development without making an attribution claim beyond the available
  permissions.
- [x] Retain the historical research note as an explicitly dated exploratory
  record, remove draft-message language, and direct readers to the later
  manuscripts for current claims.
- [x] Add a strict Sphinx documentation build containing a concrete
  mathematical guide, a precise account of what Lean proves, a table relating
  cited results to the statements used, a consistency check for the Lean
  assumptions, and reproducibility instructions.
- [x] Include the Sphinx build in `make verify` and exclude only its generated
  output from the release tree.

Acceptance test: a fresh clone contains no private data or build debris,
explains ownership and rebuildability accurately, and has no broken internal
link.

## Phase 6: release candidate and publication

- [x] Finalize the release-candidate manifest containing filenames, page counts,
  checksums, Lean version, and build commands.
- [x] Perform one final mathematical audit of the repaired Bogachev passages
  and confirm that later edits do not invalidate the earlier compact-manuscript
  audit or Lean correspondence.
- [x] Create the empty public repository as `arithmetic-trace-rigidity`.
- [x] Commit and push the exact verified source tree as the sole commit on the
  public `main` branch.
- [x] Clone the pushed commit into a fresh temporary directory and repeat the
  bibliography, manuscript, link, manifest, cache-free Lean build, direct
  entry-point, axiom, and Lean source checks there.
- [x] Deploy the strict Sphinx artifact through GitHub Actions at
  <https://sashakolpakov.github.io/arithmetic-trace-rigidity/>, verify the
  successful workflow run, and retrieve the public site over HTTPS.

Acceptance test: the fresh-clone build passes, the release manifest matches
the artifacts byte-for-byte, and no checklist item is silently waived.
