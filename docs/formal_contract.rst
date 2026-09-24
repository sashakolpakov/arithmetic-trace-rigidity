What the Lean development proves
================================

The Lean development verifies selected calculations and the deduction of the
main theorem from a list of mathematical hypotheses.  The focused manuscript
proves those hypotheses using geometry, analysis, and arithmetic.  Lean does
not reconstruct those subjects from foundational definitions.

How the formal proof relates to the manuscript
----------------------------------------------

Four separate checks connect the Lean theorem with the mathematical proof.

1. **Consistency of the hypotheses.**  A finite example shows that all the
   assumption structures can be filled at once.  A second example satisfies
   the formal critical-growth predicate but is declared nonarithmetic.  Thus
   arithmeticity does not follow from that predicate alone.  Neither example
   is meant to represent a hyperbolic surface.
2. **Agreement with the manuscript.**  A declaration-by-declaration table
   identifies the mathematical assertion represented by every Lean field.
   The version closest to the manuscript retains the order of the
   quantifiers and all four limits.
3. **Agreement with the cited sources.**  The source table records whether a
   theorem is used exactly after a change of notation or whether the
   manuscript derives the needed special case.  In the latter situation only
   the implication from the cited theorem to the statement used is claimed.
4. **The Lean deduction.**  Lean proves the selected identities and derives
   arithmeticity from the stated assumptions.  No project axiom or proof
   placeholder is used in place of a mathematical hypothesis.

What the kernel checks directly
-------------------------------

Lean proves the following calculations rather than accepting them as input:

* the Chebyshev recurrence, Cassini identity, and the positive and negative
  trace projections;
* the quadratic identity for the pair of traces
  :math:`(\operatorname{tr}g,\operatorname{tr}(a_mg))` and its Fricke
  factorization;
* the concrete Chinese-remainder restriction and the resulting count of
  length-two paths in the trace graph;
* removal of the normalized :math:`O(1)` and :math:`o(m)` terms;
* the order of :math:`m`, :math:`\theta`, :math:`\varepsilon`, and :math:`N`
  limits and the resulting coefficient :math:`1/2`;
* the deduction from local equality through Takeuchi's criterion and passage
  to a finite-index overgroup, once the corresponding mathematical
  hypotheses are supplied.

Mathematical hypotheses represented in Lean
--------------------------------------------

The formulation closest to the manuscript uses ``OrderedLocalExpansionInputs`` and
``ArithmeticInputs``.  Important fields include:

.. list-table::
   :header-rows: 1
   :widths: 34 66

   * - Lean field
     - Mathematical statement represented by the field
   * - ``movingEstimate``
     - Combined pre-limit Roth/trace-graph inequality, with the same
       coefficients, quantifiers, and error terms
   * - ``specializationRigidity``
     - Algebraic specialization plus the deduction
       :math:`\ell_y\le\ell_x`, followed by Thurston separation
   * - ``distinguishedLower``
     - The distinguished real place contributes at least
       :math:`\ell_x(b)/2`
   * - ``equalityConsequences``
     - Equality of the nonnegative local sum yields integrality, total
       reality, and bounded nondistinguished conjugates
   * - ``takeuchi``
     - The finite-covolume direction of Takeuchi's arithmeticity criterion
   * - ``finiteIndexAscent``
     - Arithmeticity ascends from the square subgroup by commensurability
   * - ``linearToCritical`` and ``clusteringToLinear``
     - The two elementary reductions among the three trace hypotheses

The full interpretation table, including the cited results behind assumptions
that summarize several manuscript steps, is maintained in
`formal/MANUSCRIPT_MAP.md
<https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/formal/MANUSCRIPT_MAP.md>`_.

Checks performed by the build
-----------------------------

The verification command compiles all project declarations, rejects
``axiom``, ``sorry``, ``admit``, and related proof placeholders in project
source, and
checks the dependencies printed by ``#print axioms``.  The accepted
dependencies are the standard Mathlib principles ``propext``,
``Quot.sound``, and ``Classical.choice``.  These mechanical checks supplement
the mathematical comparison with the manuscript; they do not replace it.

Scope
-----

The finite example proves that the signatures are consistent and that
the theorem is not a consequence of ``CriticalTraceGrowth`` in isolation.
It does not realize the signatures using an actual Fuchsian group.  That
interpretation is supplied by the focused manuscript: its lemmas and cited
theorems establish the assumptions for the surface under study.  Formalizing
all of those background theories was not the objective of this Lean project.
