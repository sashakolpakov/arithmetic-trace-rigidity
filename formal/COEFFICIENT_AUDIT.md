# Worked audit: the local-expansion estimate and its sharp coefficient

Audit date: 9 October 2026.

This audit compares one English argument with its Lean signatures, constructs
satisfying examples, and proves counterexamples to incorrect changes in its
hypotheses or conclusion. External mathematical results are accepted as inputs.
The question is whether their stated consequences have been represented
faithfully and whether the formal deductions use those consequences correctly.

The checked examples are in
[CoefficientAudit.lean](TraceSparsity/CoefficientAudit.lean). They use actual real
numbers and inequalities, not freely assigned truth values for arithmeticity.
They test the numerical estimate; they do not claim to construct surface groups.
The examples supplement the statement comparison and the general proofs.

## English statement and Lean signature

The source is the proof of Theorem `thm:local-expansion`, in Section
`sec:proof-local` of
[the focused manuscript](../paper/compact-trace-rigidity.tex).
Fix the original and specialized characters and the element under study, and set

\[
J=\mathcal J_{k_y}(\operatorname{Tr}_y b),\qquad L=\ell_x(b).
\]

The manuscript first obtains an eventual estimate of the form

\[
(2N-4-\varepsilon)\bigl(mJ-O(\theta m)-O(1)\bigr)
\le \frac{2N-1}{2}\bigl(mL+O(\theta m)+O(1)\bigr)+o(m).
\]

It fixes `N`, then `ε`, then sufficiently small positive `θ` and the auxiliary
data. It sends `m` to infinity before changing `θ`, then sends `θ` and `ε` to
zero, and finally lets `N` tend to infinity. Equations `eq:moving-J` and `eq:moving-displacement` specify their error
coefficients as depending only on the fixed characters and element, not on
`N`, `ε`, `θ`, or `m`. The auxiliary sieve and spectral choices may depend
on `N`, `ε`, and `θ`.

After the first three limits, the numerical assertion is:

> For fixed real numbers J and L, if
> (2N − 4)J ≤ ((2N − 1)/2)L for every integer N ≥ 3,
> then J ≤ L/2.

This is a restatement of the limiting step, not a separate quoted theorem.
Its production Lean signature in [Asymptotics.lean](TraceSparsity/Asymptotics.lean)
is:

```lean
def CoefficientBound (N : ℕ) (J L : ℝ) : Prop :=
  ((2 : ℝ) * N - 4) * J ≤ (((2 : ℝ) * N - 1) / 2) * L

theorem half_bound_of_all_coefficients {J L : ℝ}
    (h : ∀ N : ℕ, 3 ≤ N → CoefficientBound N J L) :
    J ≤ L / 2
```

The production theorem retaining all four limits is:

```lean
theorem half_bound_from_full_manuscript_estimate
    {J L A B : ℝ}
    (h : ∀ (N : ℕ), 3 ≤ N →
      ∀ ε : ℝ, 0 < ε → ε < (2 : ℝ) * N - 4 →
      ∃ θ₀ : ℝ, 0 < θ₀ ∧
      ∀ θ : ℝ, 0 < θ → θ < θ₀ →
        Nonempty (MovingLimitWitness
          ((2 : ℝ) * N - 4 - ε)
          (((2 : ℝ) * N - 1) / 2)
          J L (A * θ) (B * θ))) :
    J ≤ L / 2
```

`MovingLimitWitness` stores two fixed real constants and a sequence `remainder`
tending to zero. It requires the normalized estimate for all sufficiently large
natural indices `m`, with the constant errors divided by `m+1`. The shift
avoids division by zero and reindexes the positive integers used in the paper.
The structure `OrderedLocalExpansionInputs.movingEstimate` supplies this
hypothesis after the character and group-element conditions are fixed.

| English feature | Lean representation | Translation check |
|---|---|---|
| J and L stay fixed through every limit | Parameters outside `h` | They cannot vary with N, ε, θ, or m. |
| Integer N ≥ 3 | `N : ℕ`, `3 ≤ N` | The natural and integer domains agree in this range. |
| Every sufficiently small positive ε | `∀ ε`, `0 < ε`, `ε < 2*N-4` | An existential error tolerance would be too weak. |
| Every sufficiently small positive θ | `∃ θ₀ > 0`, then `∀ θ`, `0 < θ < θ₀` | The radius may depend on earlier parameters. One chosen θ would be too weak. |
| Uniform θ-error coefficients | `A B : ℝ` outside `h` | They cannot depend on N, ε, θ, or m. In the application they may depend on the fixed character and element. |
| Auxiliary data chosen after N, ε, θ | `Nonempty (MovingLimitWitness ...)` inside those binders | The constants and remainder may vary between successive constructions. |
| O(1) constants do not vary with m | Real fields of the chosen witness | Their normalized contributions tend to zero. |
| Normalized o(m) error tends to zero | `remainder_tendsto_zero` | This is a hypothesis, not an informal interpretation of an arbitrary sequence. |
| Estimate holds eventually in m | `∀ᶠ m in Filter.atTop` | It need not hold at every small index, but one successful index is insufficient. |
| Nonnegative height and length in the application | Not needed in the numerical implication | Lean proves the implication for all real J and L. A converse below requires L ≥ 0. |
| Conclusion is non-strict with coefficient 1/2 | `J ≤ L / 2` | Both the inequality sign and the coefficient are sharp. |

The comparison found no mismatch in this numerical translation. The following
checks test the interpretation and the possible mistakes listed in the table.

## Positive examples and complete numerical classification

| Data or family | Verified behavior | Lean declaration |
|---|---|---|
| J = 0, L = 0 | All allowed indices pass; the conclusion holds at equality. | `zero_boundary` |
| J = s, L = 2s, for every s ≥ 0 | All indices pass; the production theorem yields the sharp equality case. | `sharp_positive_family` |
| J = s, L = 2s + d, with s ≥ 0 and d > 0 | All indices pass and J < L/2; for example J = 1, L = 3. | `strict_positive_family` |
| J = −3, L = −2 | All indices pass and the implication holds, confirming that the numerical theorem permits more than the geometric domain. | `negative_length_example` |
| The sharp family before any limits | Supplies witnesses for every N, ε, θ in the production signature and applies the full ordered theorem. | `sharp_ordered_estimate`, `sharp_ordered_family_applies` |
| A moving witness with constant errors 2 and 3 and remainder 1/(m+1) | Nonzero normalized errors vanish and the production moving-limit theorem applies. | `positive_moving_witness`, `positive_moving_witness_applies` |

There is also a complete classification, proved in Lean:

\[
L\ge0\quad\Longrightarrow\quad
\Bigl(\bigl[\forall N\ge3,\ (2N-4)J\le ((2N-1)/2)L\bigr]
\quad\Longleftrightarrow\quad J\le L/2\Bigr).
\]

This is `all_coefficients_iff_half`. Thus the positive tests cover an entire
region of real inputs, not just a finite grid. `every_violation_has_a_failing_index`
proves that every input with J > L/2 fails at some allowed index.

For arbitrary signed real inputs, `all_coefficients_iff` gives the exact
classification: the hypotheses are equivalent to J ≤ L/2 together with the
index-three inequality. In particular, omitting L ≥ 0 from the simpler
converse is false: J = −1, L = −2 obey J = L/2 but fail the index-three test.
That failure is `negative_length_converse_fails`; it does not invalidate the
original one-way theorem.

## Negative examples: changing one feature at a time

A negative example below satisfies the indicated weakened hypotheses and
violates the proposed conclusion. It is not a counterexample to the original
proved theorem.

| Incorrect change | Counterexample | Lean declaration |
|---|---|---|
| Check only N = 3 | J = 2, L = 2: 4 ≤ 5 passes, but J ≤ L/2 is false. N = 4 already fails: 8 > 7. | `single_index_is_insufficient` |
| Check any finite prefix 3 ≤ N ≤ M | For every M ≥ 3, J = M+1 and L = 2M pass that entire prefix but violate J ≤ L/2. The index 2M+2 fails. | `finite_prefix_is_insufficient` |
| Let J and L change with N | J_N = N+1, L_N = 2N pass the index-N estimate for every N ≥ 3, but J_N ≤ L_N/2 always fails. | `varying_data_is_insufficient` |
| Replace every positive additive error by one error chosen for each N | J = 2, L = 2 and η = 2N satisfy every weakened estimate while 2 ≤ 1 is false. | `existential_error_is_insufficient` |
| Remove ε using only one positive ε | At N = 3, J = 4, L = 2, ε = 1, the estimate 4 ≤ 5 holds, but the error-free estimate 8 ≤ 5 fails. | `one_epsilon_is_insufficient` |
| Use one θ instead of a family approaching zero | J = 1, L = 0, A = 1, B = 0, θ = 1 make the left factor J−Aθ vanish at every index. The conclusion 1 ≤ 0 is false. | `one_theta_is_insufficient` |
| Let A be chosen after θ | With J = 1, L = 0, B = 0 and A = 1/θ, every positive θ passes the weakened estimate. Again 1 ≤ 0 is false. | `theta_dependent_constant_is_insufficient` |
| Discard a remainder without assuming it tends to zero | 1 ≤ 0+1 holds at every m; the constant sequence 1 does not tend to zero, and 1 ≤ 0 fails. | `nonvanishing_remainder_is_insufficient` |
| Choose the O(1) constant separately for every m | C_m = m+1 makes 1−C_m/(m+1) ≤ 0 true for all m, but its normalized error is always 1 and the conclusion 1 ≤ 0 is false. | `moving_dependent_constant_is_insufficient` |
| Require the moving estimate at just one m | 1−2/(m+1) ≤ 0 holds at m = 0 but does not hold eventually and cannot imply 1 ≤ 0. | `one_moving_index_is_insufficient` |
| Replace ≤ in the conclusion by < | J = 1, L = 2 satisfy all hypotheses but attain equality. | `strict_conclusion_is_false` |
| Replace 1/2 by any smaller c | The same J = 1, L = 2 refute J ≤ cL for every c < 1/2. | `smaller_constant_is_false` |

The finite-prefix family is an adversarial test of the proposed testing
method itself. Even checking a million indices is not enough: take
M = 1,000,000, J = 1,000,001 and L = 2,000,000. For N ≤ M the inequality
reduces to 2N−4 ≤ 3M, so every tested index passes. Nevertheless J = L/2+1.
At N = 2M+2 the difference between the left and right sides is M > 0.
Lean proves this family for every M, without enumeration or floating-point
rounding.

Not every hypothesis needs a counterexample to every weakening.
`unbounded_indices_suffice` proves that an unbounded set of successful indices
is enough; requiring every integer N ≥ 3 is stronger than necessary. The
necessary feature exposed by the negative tests is access to arbitrarily
large indices with the same J and L. An audit should record such a valid
generalization rather than invent a counterexample.

## Reproducible verification and coverage

The 25 declarations in `CoefficientAudit.lean` are imported by the public
entry point, and each has a checked `#print axioms` entry. The audited production
theorem `half_bound_of_all_coefficients` is printed explicitly as well.

Run from the repository root:

```sh
make formal check-lean-source check-links check-docs
```

The full release verification remains `make verify`. All examples and
counterexamples are proved propositions; this audit does not treat failure of
a tactic or a commented-out proof as evidence that a mathematical statement
is false. Only the documented standard logical principles are accepted by
the axiom checker.

This completes one worked audit, covering the accepted local-expansion
estimate and its numerical limit deduction. It does not claim that every
English statement in the repository has already received these tests.
For each further statement, the corresponding record should contain its exact
English source, expanded Lean signature and definitions, a hypothesis and
quantifier comparison, satisfying witnesses, counterexamples to relevant
weakenings or incorrect conclusions, and the checked dependencies on accepted
external inputs. A universally valid identity has no genuine negative instance;
its negative tests must target altered signs, indices, domains, or hypotheses.
