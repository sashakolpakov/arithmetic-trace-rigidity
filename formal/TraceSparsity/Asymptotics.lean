import TraceSparsity.Basic
import Mathlib.Tactic

/-!
# The numerical limit in the local-expansion argument

The hard geometric and arithmetic work gives, for every fixed recurrence
index `N`, an estimate with an arbitrarily small additive error.  This file
removes that error and then lets `N` tend to infinity.  In particular, the
constant `1/2` in the theorem is proved here rather than placed in an
assumption.
-/

namespace TraceSparsity

/-- A closed inequality follows from inequalities with every positive
additive error. -/
theorem le_of_forall_pos_le_add {a b : ℝ}
    (h : ∀ η : ℝ, 0 < η → a ≤ b + η) : a ≤ b := by
  by_contra hab
  have hba : b < a := lt_of_not_ge hab
  have hpos : 0 < (a - b) / 2 := by linarith
  have hsmall := h ((a - b) / 2) hpos
  linarith

/-- The coefficient inequality obtained after sending the auxiliary error
parameters to zero. -/
def CoefficientBound (N : ℕ) (J L : ℝ) : Prop :=
  ((2 : ℝ) * N - 4) * J ≤ (((2 : ℝ) * N - 1) / 2) * L

/-- Arbitrarily small errors imply the exact fixed-`N` coefficient bound. -/
theorem coefficientBound_of_arbitrary_error {N : ℕ} {J L : ℝ}
    (h : ∀ η : ℝ, 0 < η →
      ((2 : ℝ) * N - 4) * J ≤
        (((2 : ℝ) * N - 1) / 2) * L + η) :
    CoefficientBound N J L := by
  exact le_of_forall_pos_le_add h

/-- If the fixed-index coefficient estimate holds for every `N ≥ 3`, then
the limiting coefficient is `1/2`.

Algebraically, failure of the conclusion would make `2J-L` positive, while
the estimate says
`N(2J-L) ≤ 4J-L/2` for every large natural number `N`.
-/
theorem half_bound_of_all_coefficients {J L : ℝ}
    (h : ∀ N : ℕ, 3 ≤ N → CoefficientBound N J L) :
    J ≤ L / 2 := by
  by_contra hJL
  have hdelta : 0 < 2 * J - L := by linarith
  obtain ⟨N, hN⟩ := exists_nat_gt
    (max (3 : ℝ) ((4 * J - L / 2) / (2 * J - L)))
  have hNreal3 : (3 : ℝ) < N :=
    lt_of_le_of_lt (le_max_left _ _) hN
  have hN3 : 3 ≤ N := by exact_mod_cast (le_of_lt hNreal3)
  have hratio : (4 * J - L / 2) / (2 * J - L) < (N : ℝ) :=
    lt_of_le_of_lt (le_max_right _ _) hN
  have hstrict : 4 * J - L / 2 < (N : ℝ) * (2 * J - L) :=
    (div_lt_iff₀ hdelta).mp hratio
  have hbound := h N hN3
  dsimp [CoefficientBound] at hbound
  have hreverse : (N : ℝ) * (2 * J - L) ≤ 4 * J - L / 2 := by
    linarith
  linarith

/-- The exact numerical form used in the local-expansion deduction. -/
theorem half_bound_of_arbitrary_errors {J L : ℝ}
    (h : ∀ N : ℕ, 3 ≤ N → ∀ η : ℝ, 0 < η →
      ((2 : ℝ) * N - 4) * J ≤
        (((2 : ℝ) * N - 1) / 2) * L + η) :
    J ≤ L / 2 := by
  apply half_bound_of_all_coefficients
  intro N hN
  exact coefficientBound_of_arbitrary_error (h N hN)

/-- The parameter order appearing in the manuscript, made literal.

The quantities `J`, `L`, `A`, and `B` are fixed before `N`, `ε`, and `θ` are
chosen; in particular, `A` and `B` cannot depend on any of those three
parameters.  After `N` and `ε` have been fixed, `θ` is chosen, and the
sieve and expansion data may then be chosen as a function of `N`, `ε`, and
`θ`.  The limit in the moving parameter has already produced the displayed
inequality.  The proof sends `θ` to zero, then `ε` to zero, and only
afterwards lets `N` tend to infinity.  The auxiliary type can contain the
finite set of places, the exponent cutoff, the walk-length constant, and all
other choices made at that stage.
-/
theorem half_bound_from_manuscript_order
    {J L A B : ℝ}
    {Auxiliary : ℕ → ℝ → ℝ → Type}
    (h : ∀ (N : ℕ), 3 ≤ N →
      ∀ ε : ℝ, 0 < ε → ε < (2 : ℝ) * N - 4 →
      ∃ θ₀ : ℝ, 0 < θ₀ ∧
        ∀ θ : ℝ, 0 < θ → θ < θ₀ →
        ∃ _aux : Auxiliary N ε θ,
          ((2 : ℝ) * N - 4 - ε) * (J - A * θ) ≤
            (((2 : ℝ) * N - 1) / 2) * (L + B * θ)) :
    J ≤ L / 2 := by
  apply half_bound_of_all_coefficients
  intro N hN
  have hAfterEpsilon : ∀ ε : ℝ, 0 < ε →
      ε < (2 : ℝ) * N - 4 →
      ((2 : ℝ) * N - 4 - ε) * J ≤
        (((2 : ℝ) * N - 1) / 2) * L := by
    intro ε hε hεlt
    obtain ⟨θ₀, hθ₀, hsmall⟩ := h N hN ε hε hεlt
    let θseq : ℕ → ℝ := fun n => 1 / ((n : ℝ) + 1)
    have hθzero : Filter.Tendsto θseq Filter.atTop (nhds 0) := by
      simpa [θseq] using
        (tendsto_one_div_add_atTop_nhds_zero_nat :
          Filter.Tendsto (fun n : ℕ => (1 : ℝ) / (n + 1)) Filter.atTop (nhds 0))
    have hleft : Filter.Tendsto
        (fun n => ((2 : ℝ) * N - 4 - ε) * (J - A * θseq n))
        Filter.atTop
        (nhds (((2 : ℝ) * N - 4 - ε) * J)) := by
      simpa using
        ((tendsto_const_nhds.sub (hθzero.const_mul A)).const_mul
          ((2 : ℝ) * N - 4 - ε))
    have hright : Filter.Tendsto
        (fun n => (((2 : ℝ) * N - 1) / 2) * (L + B * θseq n))
        Filter.atTop
        (nhds ((((2 : ℝ) * N - 1) / 2) * L)) := by
      simpa using
        ((tendsto_const_nhds.add (hθzero.const_mul B)).const_mul
          (((2 : ℝ) * N - 1) / 2))
    apply le_of_tendsto_of_tendsto hleft hright
    have heventuallySmall : ∀ᶠ n in Filter.atTop, θseq n < θ₀ :=
      (tendsto_order.1 hθzero).2 θ₀ hθ₀
    filter_upwards [heventuallySmall] with n hn
    have hθpos : 0 < θseq n := by
      dsimp [θseq]
      positivity
    obtain ⟨_aux, hestimate⟩ := hsmall (θseq n) hθpos hn
    exact hestimate
  let εseq : ℕ → ℝ := fun n => 1 / ((n : ℝ) + 1)
  have hεzero : Filter.Tendsto εseq Filter.atTop (nhds 0) := by
    simpa [εseq] using
      (tendsto_one_div_add_atTop_nhds_zero_nat :
        Filter.Tendsto (fun n : ℕ => (1 : ℝ) / (n + 1)) Filter.atTop (nhds 0))
  have hleft : Filter.Tendsto
      (fun n => ((2 : ℝ) * N - 4 - εseq n) * J)
      Filter.atTop
      (nhds (((2 : ℝ) * N - 4) * J)) := by
    simpa using
      ((tendsto_const_nhds.sub hεzero).mul_const J)
  have hright : Filter.Tendsto
      (fun _n : ℕ => (((2 : ℝ) * N - 1) / 2) * L)
      Filter.atTop
      (nhds ((((2 : ℝ) * N - 1) / 2) * L)) := tendsto_const_nhds
  apply le_of_tendsto_of_tendsto' hleft hright
  intro n
  apply hAfterEpsilon (εseq n)
  · dsimp [εseq]
    positivity
  · have hNreal : (3 : ℝ) ≤ N := by exact_mod_cast hN
    have hSeqLeOne : εseq n ≤ 1 := by
      dsimp [εseq]
      have hden : (0 : ℝ) < (n : ℝ) + 1 := by positivity
      apply (div_le_one hden).2
      norm_num
    linarith

/-- A normalized version of the estimate before the moving parameter tends
to infinity.  The terms `leftConstant/(m+1)` and
`rightConstant/(m+1)` are the normalized `O(1)` terms; `remainder` is the
normalized `o(m)` term. -/
structure MovingLimitWitness
    (coefficientLeft coefficientRight J L leftTheta rightTheta : ℝ) where
  leftConstant : ℝ
  rightConstant : ℝ
  remainder : ℕ → ℝ
  remainder_tendsto_zero :
    Filter.Tendsto remainder Filter.atTop (nhds 0)
  normalized_estimate : ∀ᶠ m : ℕ in Filter.atTop,
    coefficientLeft *
        (J - leftTheta - leftConstant / ((m : ℝ) + 1)) ≤
      coefficientRight *
          (L + rightTheta + rightConstant / ((m : ℝ) + 1)) +
        remainder m

/-- Sending the moving parameter to infinity removes the normalized
`O(1)` and `o(m)` errors. -/
theorem moving_parameter_limit
    {coefficientLeft coefficientRight J L leftTheta rightTheta : ℝ}
    (w : MovingLimitWitness coefficientLeft coefficientRight
      J L leftTheta rightTheta) :
    coefficientLeft * (J - leftTheta) ≤
      coefficientRight * (L + rightTheta) := by
  let invScale : ℕ → ℝ := fun m => 1 / ((m : ℝ) + 1)
  have hinv : Filter.Tendsto invScale Filter.atTop (nhds 0) := by
    simpa [invScale] using
      (tendsto_one_div_add_atTop_nhds_zero_nat :
        Filter.Tendsto (fun m : ℕ => (1 : ℝ) / (m + 1))
          Filter.atTop (nhds 0))
  have hleft : Filter.Tendsto
      (fun m => coefficientLeft *
        (J - leftTheta - w.leftConstant * invScale m))
      Filter.atTop
      (nhds (coefficientLeft * (J - leftTheta))) := by
    simpa using
      ((tendsto_const_nhds.sub (hinv.const_mul w.leftConstant)).const_mul
        coefficientLeft)
  have hright : Filter.Tendsto
      (fun m => coefficientRight *
          (L + rightTheta + w.rightConstant * invScale m) + w.remainder m)
      Filter.atTop
      (nhds (coefficientRight * (L + rightTheta))) := by
    simpa using
      (((tendsto_const_nhds.add (hinv.const_mul w.rightConstant)).const_mul
        coefficientRight).add w.remainder_tendsto_zero)
  apply le_of_tendsto_of_tendsto hleft hright
  filter_upwards [w.normalized_estimate] with m hm
  simpa [invScale, div_eq_mul_inv] using hm

/-- The complete limit argument with its quantifiers displayed.  The
constants `A` and `B` are fixed before `N`, `ε`, and `θ`.  A
`MovingLimitWitness` is chosen only after those three parameters have been
fixed.  Lean first takes the `m` limit for that witness, then the `θ` and
`ε` limits, and finally the `N` limit. -/
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
    J ≤ L / 2 := by
  apply half_bound_from_manuscript_order
    (Auxiliary := fun N ε θ =>
      MovingLimitWitness
        ((2 : ℝ) * N - 4 - ε)
        (((2 : ℝ) * N - 1) / 2)
        J L (A * θ) (B * θ))
  intro N hN ε hε hεlt
  obtain ⟨θ₀, hθ₀, hwitness⟩ := h N hN ε hε hεlt
  refine ⟨θ₀, hθ₀, ?_⟩
  intro θ hθ hθlt
  obtain ⟨w⟩ := hwitness θ hθ hθlt
  exact ⟨w, moving_parameter_limit w⟩

end TraceSparsity
