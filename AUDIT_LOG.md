# Manuscript and release audit log

Rounds 1--5 primarily audit the focused LaTeX manuscript
`paper/compact-trace-rigidity.tex`, its longer companion, and the Lean
development under `formal/`. Round 6 records integration and review of
Bogachev's source and the resulting three-manuscript public pre-release.
Round 7 reconciles the source subsequently submitted to arXiv.  Rounds 8 and
9 record authorship-status normalization and the independent-review repairs;
Round 10 records the documentation, Lean-scope, and deployment audit.
An audit entry is closed only after its repair is present in the current
files and the relevant build or calculation has been rerun.

## Round 1: mathematical audit

Status: complete. Two independent passes found no fatal gap in the critical
implication. All publication-level repairs listed below were inserted into
the pre-language draft, which was rebuilt without undefined
references or citations before Round 2 began.

### Dependency reduction

- Confirmed that the Kummer, higher-rank, energy, arbitrary-ideal, and
  pointwise-radical sections of the long memorandum are not dependencies.
- Replaced the general finitely-generated-field divisor theory by the
  number-field quadratic étale divisor lemma proved in
  NUMBER_FIELD_DIVISOR_PROOF.md.
- Isolated every external theorem in CRITICAL_PATH_AUDIT.md.

### Closed mathematical issues

- **Field dependence of the local expansion.** The focused manuscript now
  defines \(\mathcal J_k\) for every containing number field, proves
  \(\mathcal J_L=[L:k]\mathcal J_k\), and proves the uniform comparison with
  Weil height.
- **Full trace-field degree.** The manuscript now uses
  \[
    k_y=\mathbf Q(\operatorname {tr}_y\gamma^2:\gamma\in\Pi)
       =\mathbf Q(\operatorname {tr}_yh:h\in\Pi^{(2)})
  \]
  and finitely many squared-trace generators. Thus
  \([k_y:\mathbf Q]\le[\mathbf Q(y):\mathbf Q]\).
- **From bounded-power expansion to counting in metric balls.** Salehi Golsefidy's theorem applies to
  fixed bounded prime exponents because the connected Zariski closure is
  perfect. Strong approximation is stated separately. Brooks--Burger
  transfer and Gorodnik--Nevo counting give the trace-class estimate only in
  the explicit range
  \[
    3\log N\mathfrak c<\delta_D R-o(R).
  \]
  The proof now chooses \(R=Cm\), after \(D\) and the ideal-height constant,
  with \(C>3A/\delta_D\).
- **Local square density.** The \(O_N(p^{-2})\) probability is derived by
  Hensel lifting and the direct \(O(q^4)\) trace-fiber count in
  \(\operatorname {SL}_2(\mathcal O/\mathfrak p^2)\).
- **Varying quadratic norm equation.** The proof works in the quadratic
  étale algebra, including the split case. It obtains subexponentially many
  ideal patterns and a uniform polynomial count of bounded-height units by
  Northcott separation in bounded degree.
- **Recurrence algebra.** The signs in the positive and negative trace
  identities, Cassini's identity, and the coefficient \(2N-4\) have been
  checked independently.
- **Pruning the trace graph and counting length-two paths.** The conversion
  from group-element congruence counts to unweighted trace occupancy and the
  exponents in the lower and upper bounds have been checked.
- **Limit order.** The order \(m\to\infty\), then
  \(\theta\to0\), then \(\epsilon\to0\), then \(N\to\infty\) gives exactly
  \(\mathcal J\le\ell/2\); the numerical implication is also proved in Lean.
- **Takeuchi application.** The correct primary-source route is to apply
  Takeuchi's derived-group criterion to \(\Gamma^{(2)}\), then use finite
  index. Vanishing local contributions separately yield finite-place
  integrality, total reality, and the interval \([-2,2]\).

### Items still open in Round 1

- None. The height-retention argument for the varying elements \(a_m\), every
  degenerate case in the two-trace fiber lemma, and the explicit quadratic elimination
  were checked line by line.
- The primary-source audit verified that bounded-power superapproximation
  covers both rational prime squares and all fixed bounded-exponent moduli.
- The Gorodnik--Nevo translated-coset estimate was checked to have no hidden
  congruence-index factor.  The manuscript now displays the complete chain
  from quotient expansion through Brooks--Burger transfer and the uniform
  mean-ergodic estimate to the coset count.
- Algebraic realization of an algebraic irreducible character, the smooth
  integral model, open adelic closure, projective Roth target at infinity,
  fixed word-length constant in the two-trace fiber theorem, the diagonal
  zero-product branch, and the precise Takeuchi corollary are all written
  explicitly.

## Round 2: language and structure audit

Status: complete. This began only after Round 1 was closed.

The pass removed internal labels and shorthand, defined the number-theoretic,
metric, projective-local, random-walk, and congruence notation before use,
and expanded the compressed character-descent, algebraic-realization,
restriction-of-scalars, Roth, height, finite-ring, and diagonal-fiber
arguments. It also checked that theorem statements carry their field and
metric subscripts and that the proof overview agrees with the actual
dependency order. The resulting academic draft was then passed to the final
mathematical and reference audits.

## Round 3: second mathematical audit

Status: complete; final verdict clean.

An adversarial rereading after the language edits rechecked every point at
which two major arguments are combined:
the algebraic representative and quaternion model, full
restriction-of-scalars closure, strong approximation and bounded-power
expansion, the fixed-prime localization order, Roth's coefficient, the
moving sieve, all branches of the two-trace fiber theorem, the
length-two-path congruence exponents, the order of limits, and the
Takeuchi and Thurston deductions.

Three mathematical/citation defects found in this final pass were repaired:

- the algebraic-realization equations now retain the factor \(q\) after the
  real normalization \(q\mapsto\operatorname{sgn}(q)\);
- the local proof explicitly requires \(0<\epsilon<2N-4\) before multiplying
  by the moving lower bound;
- the manuscript now distinguishes accurately between Takeuchi's Theorems
  1 and 2.

The basepoint error, diagonal divisor/unit count, and finite-place
integrality inference were also expanded. A surgical recheck of all six
passages returned a clean verdict.  At that stage the forced LaTeX build
produced 26 pages, had no undefined citation or cross-reference, and reported
one 1.24-point overfull box together with nonblocking underfull bibliography
lines.  A later typesetting pass rephrased that line and eliminated
the overfull box; underfull bibliography lines remain nonblocking.

## Lean verification

Status: complete within the boundary stated below.

The project gives kernel-checked proofs of:

- the scalar Chebyshev recurrence, Cassini, and Bezout identities;
- the quadratic identity for the two trace functions and its Fricke
  factorization;
- the finite-fiber count for length-two paths and the degree Cauchy
  inequality;
- the exact coefficient squeeze and the manuscript's parameter order;
- a finite example satisfying all the ordered local and arithmetic
  assumptions, together with another example showing that critical trace
  growth alone does not imply arithmeticity.

It separately proves the final implications from named assumptions for the
analytic, geometric, specialization, and arithmetic results used by the
manuscript. The algebraic calculations are checked independently; Lean does
not derive those assumptions from the cited literature, and the
Cayley--Hamilton realization of the scalar recurrence as matrix traces is
not formalized. This exact scope is stated in
formal/MANUSCRIPT_MAP.md.

The formal-project `lake build` and a direct compilation of
`TraceSparsity/Main.lean` both succeed.  The 1,488 lines in eleven project
Lean source files contain no `sorry`, `admit`, project-defined `axiom`,
`unsafe`, `opaque`, `partial`, or `extern` declaration.  Printed axiom
dependencies contain only `propext`, `Quot.sound`, and, where finite
choices are made, `Classical.choice`.

## Round 4: re-audit of references and Lean assumptions

Status: complete on 23 September 2026; independent post-repair audit passed.

- The Takeuchi corollary now assumes finite covolume, and its application
  proves first that the subgroup generated by squares has finite index and is
  cocompact.  The prior formulation by “first kind” was too weak.
- Exact citations and hypothesis translations were added for Roth, Northcott,
  strong approximation, bounded-power superapproximation, Brooks--Burger
  transfer, Gorodnik--Nevo counting, Lang--Weil, Takeuchi, Borel density,
  Borel--Harish-Chandra, Skolem--Noether, Rosenlicht--Samuel, and the orbit and
  prime-geodesic counts used in the companion.
- The Lang--Weil DOI and the Pierce section pointer were corrected.  Every
  cited key resolves, and source existence and stated role were rechecked.
- The Lean assumptions now make algebraicity, eligibility, finite covolume,
  finite index, and the exact range `0 < epsilon < 2N - 4` explicit.  The
  ordered statement has the same coefficient and quantifier order as the
  focused TeX proof.
- `formal/MANUSCRIPT_MAP.md` classifies every final-path field as an elementary
  manuscript fact, a theorem proved in the manuscript but assumed in Lean,
  or a result imported from the literature. It expressly excludes the
  companion and Bogachev manuscripts from the scope of the Lean development.
- Fresh forced builds produce the 26-page focused manuscript and the 130-page
  companion.  Their final logs contain no undefined citations or references.

## Round 5: pre-release reproducibility and build audit

Status: complete on 23 September 2026; independent workflow recheck passed.

- Starting with `formal/.lake/` absent, Lake fetched the revisions pinned in
  `lake-manifest.json` and completed all 3,018 build jobs.  Direct compilation
  of `TraceSparsity/Main.lean` then printed exactly the expected 18 declaration
  reports with no warning or failure.
- The axiom-output checker accepts only `propext`, `Quot.sound`, and
  `Classical.choice`.  The separate comment-aware source scanner covers all
  ten project Lean files and rejects decorated or unused declarations of
  `axiom` and `opaque`, as well as every listed proof placeholder or unsafe
  declaration keyword.
- Both TeX sources rebuild byte for byte to the release artifacts under a
  different absolute path and with newly assigned source modification times.
  The artifact hashes and page counts agree with `RELEASE_MANIFEST.md`.
- The final root command `make verify` passed after all automation repairs. It
  checked Lean compilation and dependencies, the Lean source tree, forced TeX
  builds and final logs, all 22 relative Markdown links, isolated PDF
  reproducibility, and the release manifest.

## Round 6: Bogachev source and three-manuscript integration

Status: complete on 24 September 2026, including the public push and an
independent fresh-clone verification.

- The authorized `main.tex` and `biblio.bib` supplied by Bogachev were imported
  as `paper/positive-trace-gap.tex` and the basis of the shared bibliography.
  The source builds to a 20-page manuscript before repository proofreading,
  whereas the old root PDF was a 19-page earlier snapshot with materially less
  literature discussion.  The source-built manuscript, not that obsolete PDF,
  is the release artifact.
- A line-by-line mathematical pass repaired a false explanatory inequality in
  the proof of the trace-gap lower bound: the field-norm estimate holds for
  every nonzero trace difference, and taking the infimum yields the asserted
  gap.  The theorem and its constants were unchanged.
- The citation audit corrected Geninska--Leuzinger's pointer from Conjecture
  1.2(ii) to 1.4(ii), restored the cocompactness hypothesis in the BBKS
  comparison, corrected the 1971 Vinberg metadata, and sharpened the
  classification reference for arithmetic lattices in
  \(\operatorname{SL}_d(\mathbb R)\) to Morris's restriction-of-scalars and
  inner/outer-form results.  The principal theorem pointers used in the
  square-root, commensurator, order, spectral, and Fricke arguments were all
  checked against their sources.
- Short inserted explanations now justify projective distinctness in the convergent
  commensurator sequence, integral closure in the order argument, the use of
  Zariski density to obtain linear bases, the finite-index conclusion for a
  discrete overgroup of a lattice, irreducibility in the two-open-set step,
  tail-density diagonalization, uniform-discreteness stabilization, and the
  mod-two homology-cover identification.
- All three TeX sources now use the sole database `paper/biblio.bib`.  Its 76
  canonical entries cover exactly the 76 cited keys, with no duplicate or
  case-colliding keys.  The genuine BCDP title collision is represented by
  separate geometry and multiplicity records, and DOI/arXiv links remain
  printable under `siam.bst`.
- The final source scan also removed conversational remnants from the dated
  research note and corrected every missing backslash on a mathematical
  spacing command; PDF text and final logs were checked again afterward.
- Starting with `formal/.lake/` absent, Lake fetched the pinned dependencies
  and completed all 3,018 jobs.  The direct entry-point and axiom checks then
  passed, with only `propext`, `Quot.sound`, and `Classical.choice` reported.
- The exact release candidate passed the root command `make verify`. Its three
  PDFs contain 26, 130, and 21 pages and rebuild byte for byte to the hashes in
  `RELEASE_MANIFEST.md`; all 76 cited keys and all 27 local Markdown links
  resolve.
- The pushed commit was cloned into a new temporary directory.  From that
  clone, all three manuscripts and final logs, isolated PDF reproducibility,
  bibliography coverage, Markdown links, the release manifest, and the Lean
  source scan passed again.

## Round 7: arXiv-source reconciliation

Status: complete on 24 September 2026.

- The submitted source `main (1).tex` (SHA-256
  `c321412d4967fe58e40ac584a90a300f4a3a9aa4e2054021e6e01f0012bd6ff3`)
  was compared both with Bogachev's previously supplied `main.tex` and with
  the audited repository source.  Its author delta consists of six small
  hunks; replacing the repository file wholesale would have restored older
  defects, so the merge was performed semantically.
- The corrected pointwise trace-gap estimate was already present in fuller
  form.  The revised length-accumulation argument contributed its sharper
  treatment of opposite-sign traces and the explicit observation that
  $q_j-p_j$ is bounded; the repository's diagonal choice and eventual-
  constancy details were retained.  The two deliberate ancillary deletions
  in the submitted source were also applied.
- The submitted source still points to Geninska--Leuzinger Conjecture 1.2(ii)
  instead of the published Conjecture 1.4(ii), omits the uniform-lattice
  hypothesis from BBKS Theorem 1.2, and contains the sentence fragment
  `Let us its full signed trace set`.  The corrected repository formulations
  were preserved.  The two citations to Hao are accurate statements of the
  respective Theorem A results; no Hao or Ho proposition is cited.
- The new citation key `BK` is absent from both supplied bibliographies, and
  an isolated build of the exact submitted files confirms that it is their
  sole unresolved citation.  Because the focused manuscript is an
  unattributed working paper, the repository resolves the new reference
  without an author field under the canonical key
  `TraceSparsityManuscript`; the arXiv source should use that neutral
  bibliographic record.
- All three manuscripts rebuild with clean final LaTeX and BibTeX logs.  The
  shared database again has exactly 76 entries covering exactly 76 cited keys.
  Isolated builds reproduce all three artifacts byte for byte; the resulting
  page counts are 26, 130, and 20, and their hashes agree with
  `RELEASE_MANIFEST.md`.

## Round 8: authorship-status normalization

Status: complete on 24 September 2026.

- *Proof of the Positive Trace Gap Conjecture* retains Nikolay Bogachev as its
  named author in the TeX title block, PDF metadata, README, and release
  manifest.
- The focused and companion texts are unattributed working papers.  Their TeX
  author fields and PDF author metadata are empty; their title pages identify
  only their working-paper status.  The shared bibliography likewise cites
  the focused text without an author field.
- Forced builds leave all three final LaTeX and BibTeX logs clean.  Visual
  inspection of both unattributed title pages confirms that no author or
  project name is displayed as authorship.

## Round 9: independent-review repairs and post-edit audits

Status: complete on 25 September 2026.

- The focused theorem now assumes only that the upper polynomial exponent of
  the signed trace-counting function is at most one.  The proof propagates the
  resulting \(e^{R/2+o(R)}\) trace support throughout the graph argument.
  The general exponent calculation is displayed explicitly:
  \[
    \log N\mathfrak c_m
    \le (2\sigma-2)R+\frac{\sigma(2N-1)}2D_m+o(m),
  \]
  so the cancellation at \(\sigma=1\) and the limitation of this method
  beyond that exponent are both visible.
- The transcendental-character conclusion now uses the local inequality on
  \(\gamma^2\) and Thurston's marked asymmetric length-spectrum metric.  The
  specialization is kept in the same Fuchsian component, and the direction
  \(\ell_y(\gamma)\le\ell_x(\gamma)\) is stated before separation is applied.
  Northcott remains only in the bounded-degree divisor and unit counts.
- Selberg's lemma and commensurability extend the torsion-free theorem to all
  cocompact Fuchsian lattices.  The manuscripts and formal documentation
  explicitly distinguish this orbifold extension from the torsion-free
  theorem represented by the Lean data.
- The number-field divisor argument now treats the nonsplit quadratic field
  and the split algebra \(L\times L\) separately, records the exact weighted
  logarithmic identity, and verifies the bounded heights of both split
  factors.  A fresh mathematical audit also checked the retained trace graph,
  representative choices, congruence count, recurrence shifts, and the
  coefficient \((2N-1)/2\).
- The uses of external analytic and arithmetic results were expanded and then
  independently rechecked.  In particular, the manuscript now passes from
  Weisfeiler's adjoint-trace-ring model to the chosen
  restriction-of-scalars model by localization and Weil restriction; records
  the normal-cover hypothesis in Brooks--Burger; derives the uniform
  \(L^{p_D+}\) bound before invoking Gorodnik--Nevo Theorem 4.5; and states
  the translated-coset and good-prime trace identifications.  The
  Bombieri--Gubler, Weisfeiler, Salehi Golsefidy, Brooks--Burger,
  Gorodnik--Nevo, Lang, Cowling--Haagerup--Howe, Takeuchi, Thurston, and
  uses of Selberg's lemma were checked against the cited sources.
- The trace-graph proof now defines its retained vertex set and one group
  representative for each retained edge; all recurrence traces use that
  representative.  The manuscript also distinguishes the abstract surface
  group, the \(x\)-projective metric representation, and the \(y\)-linear
  congruence representation, including the pulled-back quotient map.
  Takeuchi is applied to the full inverse image, with sign stability of the
  trace field, integrality, and conjugate bounds made explicit.
- The Lean project separates CriticalTraceGrowth from LinearTraceGrowth,
  exposes the conditional status of the final theorems in their names, and
  contains a concrete kernel-checked Chinese-remainder proof of the
  length-two-path inequality. A cache-free build completed all 3,018
  jobs; the source scan found no placeholder or project axiom, and the
  printed dependencies were only propext, Quot.sound, and Classical.choice.
- A final language and structure audit of the three manuscripts found no
  remaining substantive ambiguity or cross-document inconsistency.  The
  focused manuscript thanks Igor Rivin for helpful comments and a careful
  critical reading.  No authorship or licensing field was changed.
- The final root command `make verify` passed. It rebuilt and reproduced all
  three PDFs byte for byte, confirmed the 30/130/20 page counts and recorded
  hashes, covered all 80 cited keys with 80 bibliography entries, resolved
  all 27 local links, and repeated the Lean source, build, entry-point, and
  axiom checks.  The cache-free run also exposed and repaired a stale list of
  expected declarations in the axiom-checking script; the repaired checker
  now follows the public declarations printed by `TraceSparsity/Main.lean`.

## Round 10: documentation, Lean-scope, and deployment audit

Status: complete on 25 September 2026.

- A strict Sphinx site now gives a concrete mathematical guide to the focused
  proof, the algebraic-group and division-map material in the companion, the
  uses of cited sources, and reproducibility.  An independent mathematical audit
  corrected an overgeneralized Jordan-projection statement, supplied the
  exact hypotheses for the root section and length-two-path congruence count,
  separated cameral and
  Kummer choices, and corrected the direction of the Roth coordinate change.
  A subsequent pass found no remaining high- or medium-severity mismatch with
  either manuscript.
- The formal documentation now distinguishes direct translations,
  normalized equivalences, one-way consequences of cited results, and
  statements proved in the manuscript but supplied to Lean as assumptions.
  The consistency check constructs finite data satisfying all the ordered
  local and arithmetic assumptions and applies the public ordered theorem to
  those data. A second finite example shows that critical growth need not
  imply arithmeticity when the external assumptions are removed.
- A fresh-clone build with no `formal/.lake/` cache fetched the pinned Lean and
  Mathlib revisions and completed all 3,019 jobs.  Direct compilation of the
  public entry point and the automated axiom audit then passed; the only
  printed dependencies were `propext`, `Quot.sound`, and
  `Classical.choice`. The complete root verification command also passed.
- The current major versions of the GitHub Actions dependencies were checked
  before deployment.  The Documentation workflow built the Sphinx site with
  warnings treated as errors and deployed it to
  <https://sashakolpakov.github.io/arithmetic-trace-rigidity/>.  The workflow
  succeeded, HTTPS is enforced, and the landing page and substantive
  mathematical pages returned status 200.  The public `main` branch contains
  one squashed commit.
- No TeX manuscript content changed in this round.  Reproducibility checks
  retained the 30/130/20 page counts and the three PDF hashes recorded in
  `RELEASE_MANIFEST.md`.

## Round 11: language, exposition, and notation audit

Status: complete on 26 September 2026.

- The detailed language audit concentrated on the two unattributed working
  papers. Bogachev's manuscript retained its authorial voice and received no
  general stylistic rewrite; only the independently justified corrections
  already recorded above remain in that source.
- In the focused manuscript, compressed names for proof stages were replaced
  by statements of the actual estimates being used. Definitions and
  quantifiers that the earlier prose had obscured are now explicit. These
  include the affine rational character variety and its rational Zariski
  closure, the two maximal compact groups used in the restriction-of-scalars
  argument, the range of Roth's conclusion, the finite quotient rings in the
  congruence count, the same-component condition on algebraic
  specializations, and the finite-place part of the local expansion sum.
- The trace graph is now asserted only to have the lower bound proved in the
  preceding argument, namely \(\#\mathcal G_m\geq e^{R-o(m)}\). An independent
  line-by-line check confirmed that every later use requires only this lower
  bound. The full focused proof was then re-audited, with no mathematical
  defect found.
- In the companion, informal handles such as “subpower,” “persistent-locus
  result,” and “algebraic exceptional point” were replaced by the relevant
  estimates or geometric conditions. The rational closure \(Z_x\) is now
  named when it is defined, and every subexponential fiber claim used in the
  overview states its scale.
- The companion now cites Baker's theorem on logarithms and states the exact
  lower bound needed for a fixed algebraic point on the unit circle. It also
  proves the nonarchimedean valuation estimate used for the recurrence,
  including the residue-characteristic-two case after passage to a sufficiently
  deep logarithm neighborhood. A separate mathematical audit checked these
  two passages, the root-of-unity cases, and the final use of Takeuchi's
  criterion, and found them correct.
- Explanatory comments in the Lean sources and the accompanying tables were
  rewritten in ordinary mathematical language. No Lean declaration or proof
  term changed: a comment-stripped comparison with the preceding sources was
  identical. The 3,012-job build, direct entry-point compilation, axiom check,
  and source scan all passed; the only reported dependencies are
  `propext`, `Quot.sound`, and `Classical.choice`.
- Repository documentation was revised to use the same literal terminology as
  the manuscripts. The strict Sphinx build completed with warnings treated as
  errors. The final root `make verify` command passed, including isolated PDF
  reproduction, bibliography and link checks, the strict documentation build,
  the manifest check, and all Lean checks.
- The resulting PDFs have 31, 131, and 21 pages. All 81 cited keys are supplied
  by the sole 81-entry bibliography, and the artifact hashes are recorded in
  `RELEASE_MANIFEST.md`.
