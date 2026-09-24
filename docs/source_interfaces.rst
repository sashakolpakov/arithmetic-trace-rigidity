How the cited results are used
==============================

The focused manuscript does not use every cited theorem verbatim.  Sometimes
it changes a normalization; more often it derives the narrower statement it
needs after verifying group-specific hypotheses.  The table records the
logical direction in each case.

``Equivalent after normalization`` means that only notation, absolute-value
normalization, or an affine/projective coordinate has changed.  ``Implies``
means that the cited result is combined with deductions written in the
manuscript; no converse is asserted.

.. list-table::
   :header-rows: 1
   :widths: 23 20 18 39

   * - Source input
     - Manuscript location
     - Logical relation
     - Statement used by the proof
   * - Bombieri--Gubler, Theorem 6.4.1
     - ``input:roth`` and the reduced-divisor lemma
     - Equivalent after normalization, then implies
     - Simultaneous-place Roth is translated from the source's affine-target
       formulation to the displayed projective form; the manuscript then proves the
       :math:`(2d-2-\varepsilon)` reduced-divisor inequality and specializes
       it to :math:`q_{N-1}/q_N`.
   * - Bombieri--Gubler, Theorem 1.6.8; Kronecker's theorem
     - Bounded-degree divisor and unit count
     - Implies
     - Northcott finiteness and height-zero classification give uniform
       separation and the subexponential two-trace-fiber count.
   * - Matthews--Vaserstein--Weisfeiler, Weisfeiler, and Nori
     - ``input:strong-approximation``
     - Implies
     - After verifying the restriction-of-scalars group hypotheses and
       excluding finitely many primes, strong approximation gives the
       bounded-index congruence images used in the sieve.
   * - Salehi Golsefidy, Theorem 1
     - ``input:prime-square-mixing`` and
       ``input:bounded-exponent-counting``
     - Implies
     - The fixed bounded-prime-exponent expansion theorem is transferred to
       the chosen generators and lazy walk; no uniformity as the exponent
       bound tends to infinity is used.
   * - Brooks--Burger transfer and Burger, Théorème B
     - Derivation after ``input:bounded-exponent-counting``
     - Implies
     - Expansion of the quotient graphs gives a uniform spectral gap on the
       corresponding normal surface covers.
   * - Gorodnik--Nevo, Theorems 4.5 and 1.9 and Corollaries 1.11, 1.13
     - Same counting derivation
     - Implies
     - The transferred spectral gap and the displayed integrability bound
       yield a translated-coset count uniform in the coset and congruence
       index in the stated radius range.
   * - Lang--Weil
     - ``input:lang-weil``
     - Implies
     - The manuscript derives the codimension-one avoidance estimate and its
       bounded-index variant at one fixed good prime.
   * - Thurston's minimal-stretch theorem
     - ``cor:specialization-rigidity``
     - Equivalent metric formula, then implies
     - Marked inequalities :math:`\ell_y(\gamma)\le\ell_x(\gamma)` for all
       nontrivial :math:`\gamma` force equality of the two marked Fuchsian
       characters.
   * - Takeuchi, Theorem 2 and Proposition 2; Maclachlan--Reid
     - ``input:takeuchi``
     - Implies
     - The manuscript proves the finite-covolume corollary for the full
       inverse image in :math:`\mathrm{SL}_2`, then applies it to the
       finite-index square subgroup.

Algebraic specialization uses Noether normalization, an unramified real
local branch, and the density of :math:`\mathbb Q^d` in
:math:`\mathbb R^d`.  These ingredients are assembled
in the manuscript's bounded-degree specialization proposition rather than
entered as a separate Lean theorem.  Similarly, Lean assumes the final
statements named ``movingEstimate``, ``specializationRigidity``, and
``equalityConsequences``; the manuscript gives their proofs.

For the complete hypotheses, normalizations, and bibliographic data, consult
the focused manuscript and its common bibliography.  The table matching these
statements with Lean fields is ``formal/MANUSCRIPT_MAP.md``.
