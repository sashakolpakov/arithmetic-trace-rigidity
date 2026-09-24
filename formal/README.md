# Lean verification for the focused manuscript

This project checks selected algebraic calculations and the internal logical
structure of the focused manuscript.  The final Lean deductions assume
explicit statements that the manuscript proves using external analytic,
geometric, and arithmetic theorems.  Those external theories and the
manuscript's proofs from them are not formalized in Lean.
It does not formalize `paper/trace-gap-companion.tex` or
`paper/positive-trace-gap.tex`.
It formalizes a conditional implication for the torsion-free compact-surface
case. The manuscript's final Selberg finite-index passage from surfaces to
compact orbifolds is not separately formalized.

See `MANUSCRIPT_MAP.md` for the mathematical meaning of each declaration, the
direction in which each cited result is used, and the precise scope of the
formalization.

The verification has four parts:

1. `ContractAudit.lean` gives a finite example in which all abstract types and
   hypotheses can be supplied simultaneously.  It also gives a second example
   in which critical growth holds but arithmeticity does not.
2. `MANUSCRIPT_MAP.md` identifies the mathematical object represented by each
   abstract type and proposition.
3. The same file distinguishes restatements equivalent up to normalization
   from consequences that use a stronger theorem from the literature.
4. The remaining Lean files prove the calculations and deductions described
   below.

The files have the following roles:

- `Chebyshev.lean` proves the scalar recurrence, Cassini identity, positive
  and negative scalar projections, and invariant quadratic form. The
  Cayley--Hamilton realization as matrix traces is not formalized.
- `Asymptotics.lean` proves that the manuscript's fixed-`N` inequalities,
  with `N ≥ 3` and `0 < ε < 2N - 4`, imply the coefficient `1/2`. It
  also formalizes the exact order: fix `N`, then `ε`, then `θ`, choose
  auxiliary data, let `m` tend to infinity (including the normalized
  `O(1)` and `o(m)` errors), and only then send
  `θ`, `ε`, and `N` to their limits.
- `MovingFiberIdentity.lean` proves the quadratic elimination, the full
  determinant-one Fricke commutator identity, and factorization used in the
  uniform two-trace fiber theorem.
- `CongruenceWedge.lean` proves the concrete Bezout/Chinese-remainder
  restriction for `(u,v,u') ↦ (Qu-Pv,Qv-Pu')`, proves that the image of a
  length-two path and its middle coordinate determine the path, derives the
  fiber bound from
  the maximum population of one residue class modulo `PQ`, and combines it
  with Cauchy--Schwarz in the exact denominator-free form
  `|E|² ≤ |V| M |X₋| |X₊|`.  The surrounding construction of the
  trace graph and its arithmetic residue-class estimates is not formalized.
- `ExternalInputs.lean` declares structures whose fields state the assumptions
  used later: existence of the moving configurations; either the ordered
  pre-limit estimate or separate post-limit lower and upper mass estimates;
  and the specialization and arithmeticity statements that use Thurston
  rigidity, the local-height decomposition, and Takeuchi's criterion.  These
  fields are hypotheses supplied to Lean theorems, not global axioms.  Lean
  does not check their proofs in the manuscript.  The
  weaker critical trace-growth condition used in the strengthened theorem is
  distinct from literal linear growth, and the implication from linear growth
  to critical growth is a separate assumption.  The distinguished lower bound
  requires algebraicity; the central local-height identity applies only to
  eligible algebraic specializations; and the uses of Takeuchi's criterion and
  finite-index ascent include the finite-covolume and finite-index hypotheses.
- `LocalExpansion.lean` proves the persistent local-expansion theorem from the
  stated assumptions.
- `Arithmeticity.lean` proves the following explicitly named conditional
  implications: `compact_critical_growth_from_inputs`,
  `compact_schmutz_from_inputs`, and `compact_sarnak_from_inputs`, together
  with `*_from_ordered_inputs` versions that retain all pre-limit parameters
  and their order.  The older short names are aliases retained for existing
  Lean code.  None is a theorem about a constructed hyperbolic surface.
- `ContractAudit.lean` shows that all assumptions in the ordered formulation
  can hold simultaneously and proves the counterexample described above.
  Its finite example is not a geometric realization.
- `Main.lean` prints the axiom dependencies of the public results.

Build with:

```sh
lake build
```

The expected `#print axioms` output contains only Lean's standard logical
principles used by Mathlib (notably quotient and choice); it must contain no
project-specific axiom and the source tree must contain no `sorry`.

The recurrence, quadratic-fiber, and length-two-path files give independent
formal proofs of delicate calculations.  The final conditional implications
do not invoke these declarations; instead, their analytic and arithmetic
statements are supplied as hypotheses through the assumption structures.  In
particular, the formal CRT calculation has not been connected to a Lean
construction of the manuscript's trace graph.  `MANUSCRIPT_MAP.md` states the
scope of every declaration.
