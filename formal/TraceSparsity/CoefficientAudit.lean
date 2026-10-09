import TraceSparsity.Asymptotics

/-!
# Examples and counterexamples for the local-expansion limit

The English passage is the proof of the local expansion theorem in the
focused manuscript. This audit accepts the pre-limit estimate as input.
It tests its numerical interpretation, the order and scope of the
quantifiers, and the sharp conclusion. Negative examples refute altered
statements; none is a counterexample satisfying the original hypotheses.
-/

namespace TraceSparsity.CoefficientAudit

/-- Exact classification of the fixed-index hypotheses over all real data.
The index-three condition matters when the length is negative. -/
theorem all_coefficients_iff {J L : ℝ} :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N J L) ↔
      J ≤ L / 2 ∧ CoefficientBound 3 J L := by
  constructor
  · intro h
    exact ⟨half_bound_of_all_coefficients h, h 3 le_rfl⟩
  · rintro ⟨hhalf, hthree⟩ N hN
    have hNreal : (3 : ℝ) ≤ N := by exact_mod_cast hN
    have hprod : 0 ≤ ((N : ℝ) - 3) * (L - 2 * J) :=
      mul_nonneg (by linarith) (by linarith)
    norm_num [CoefficientBound] at hthree ⊢
    nlinarith

/-- On the geometric domain, the hypotheses describe exactly the half-bound.
This classifies infinitely many satisfying and failing numerical inputs. -/
theorem all_coefficients_iff_half {J L : ℝ} (hL : 0 ≤ L) :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N J L) ↔ J ≤ L / 2 := by
  constructor
  · exact half_bound_of_all_coefficients
  · intro h
    apply all_coefficients_iff.mpr
    refine ⟨h, ?_⟩
    norm_num [CoefficientBound]
    linarith

/-- Every nonnegative scale supplies a sharp satisfying example. The
conclusion is obtained by applying the production theorem. -/
theorem sharp_positive_family (s : ℝ) (hs : 0 ≤ s) :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N s (2 * s)) ∧
      s ≤ (2 * s) / 2 ∧ s = (2 * s) / 2 := by
  have h : ∀ N : ℕ, 3 ≤ N → CoefficientBound N s (2 * s) :=
    (all_coefficients_iff_half (by linarith : 0 ≤ 2 * s)).mpr (by linarith)
  exact ⟨h, half_bound_of_all_coefficients h, by ring⟩

/-- Positive slack gives satisfying examples strictly inside the conclusion. -/
theorem strict_positive_family (s d : ℝ) (hs : 0 ≤ s) (hd : 0 < d) :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N s (2 * s + d)) ∧
      s < (2 * s + d) / 2 := by
  constructor
  · exact (all_coefficients_iff_half (by linarith)).mpr (by linarith)
  · linarith

/-- The central zero case is included and does not require positive length. -/
theorem zero_boundary :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N 0 0) ∧
      (0 : ℝ) ≤ 0 / 2 := by
  simpa using (sharp_positive_family 0 le_rfl)

/-- The production implication legitimately allows some negative lengths.
These are numerical data, not surface realizations. -/
theorem negative_length_example :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N (-3) (-2)) ∧
      (-3 : ℝ) ≤ -2 / 2 := by
  have h : ∀ N : ℕ, 3 ≤ N → CoefficientBound N (-3) (-2) :=
    all_coefficients_iff.mpr (by norm_num [CoefficientBound])
  exact ⟨h, half_bound_of_all_coefficients h⟩

/-- Nonnegative length is needed for the converse classification, although
it is not an extra assumption of the production implication. -/
theorem negative_length_converse_fails :
    (-1 : ℝ) ≤ -2 / 2 ∧ ¬ CoefficientBound 3 (-1) (-2) := by
  norm_num [CoefficientBound]

/-- One recurrence index can pass while the conclusion and the next index fail. -/
theorem single_index_is_insufficient :
    CoefficientBound 3 2 2 ∧ ¬ ((2 : ℝ) ≤ 2 / 2) ∧
      ¬ CoefficientBound 4 2 2 := by
  norm_num [CoefficientBound]

/-- No finite initial range can replace the unbounded-index hypothesis.
This is one counterexample for every proposed finite cutoff. -/
theorem finite_prefix_is_insufficient (M : ℕ) (hM : 3 ≤ M) :
    (∀ N : ℕ, 3 ≤ N → N ≤ M →
      CoefficientBound N ((M : ℝ) + 1) (2 * M)) ∧
    ¬ ((M : ℝ) + 1 ≤ (2 * M) / 2) ∧
    ¬ CoefficientBound (2 * M + 2) ((M : ℝ) + 1) (2 * M) := by
  have hMreal : (3 : ℝ) ≤ M := by exact_mod_cast hM
  refine ⟨?_, by linarith, ?_⟩
  · intro N hN hNM
    have hNMreal : (N : ℝ) ≤ M := by exact_mod_cast hNM
    dsimp [CoefficientBound]
    nlinarith
  · norm_num [CoefficientBound]
    nlinarith

/-- A strict inequality is a false strengthening at the sharp boundary. -/
theorem strict_conclusion_is_false :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N 1 2) ∧
      ¬ ((1 : ℝ) < 2 / 2) := by
  exact ⟨by simpa using (sharp_positive_family 1 (by norm_num)).1, by norm_num⟩

/-- Every coefficient smaller than one half fails on the same positive input. -/
theorem smaller_constant_is_false (c : ℝ) (hc : c < 1 / 2) :
    (∀ N : ℕ, 3 ≤ N → CoefficientBound N 1 2) ∧
      ¬ ((1 : ℝ) ≤ c * 2) := by
  exact ⟨by simpa using (sharp_positive_family 1 (by norm_num)).1, by linarith⟩

/-- Every input violating the conclusion is rejected at some allowed index. -/
theorem every_violation_has_a_failing_index {J L : ℝ} (hbad : L / 2 < J) :
    ∃ N : ℕ, 3 ≤ N ∧ ¬ CoefficientBound N J L := by
  by_contra h
  push Not at h
  have hhalf := half_bound_of_all_coefficients h
  linarith

/-- Correct estimates for data changing with the index do not imply the
pointwise half-bound. The production theorem fixes J and L first. -/
theorem varying_data_is_insufficient :
    ∀ N : ℕ, 3 ≤ N →
      CoefficientBound N ((N : ℝ) + 1) (2 * N) ∧
      ¬ ((N : ℝ) + 1 ≤ (2 * N) / 2) := by
  intro N hN
  have h := finite_prefix_is_insufficient N hN
  exact ⟨h.1 N hN le_rfl, h.2.1⟩

/-- Choosing one error after each index is weaker than controlling every
positive error. The existential error can hide a false conclusion. -/
theorem existential_error_is_insufficient :
    (∀ N : ℕ, 3 ≤ N → ∃ η : ℝ, 0 < η ∧
      ((2 : ℝ) * N - 4) * 2 ≤ (((2 : ℝ) * N - 1) / 2) * 2 + η) ∧
      ¬ ((2 : ℝ) ≤ 2 / 2) := by
  refine ⟨?_, by norm_num⟩
  intro N hN
  have hNreal : (3 : ℝ) ≤ N := by exact_mod_cast hN
  exact ⟨2 * N, by linarith, by linarith⟩

/-- Removing one positive error at a fixed index is also invalid. -/
theorem one_epsilon_is_insufficient :
    (0 : ℝ) < 1 ∧ 1 < 2 * 3 - 4 ∧
      (2 * 3 - 4 - (1 : ℝ)) * 4 ≤ ((2 * 3 - 1) / 2) * 2 ∧
      ¬ CoefficientBound 3 4 2 := by
  norm_num [CoefficientBound]

/-- A theta-error coefficient chosen after theta can cancel the entire
quantity being bounded. This refutes that change in quantifier order. -/
theorem theta_dependent_constant_is_insufficient :
    (∀ N : ℕ, 3 ≤ N → ∀ ε : ℝ, 0 < ε → ε < (2 : ℝ) * N - 4 →
      ∀ θ : ℝ, 0 < θ → ∃ A : ℝ, 0 ≤ A ∧
        ((2 : ℝ) * N - 4 - ε) * (1 - A * θ) ≤
          (((2 : ℝ) * N - 1) / 2) * 0) ∧
      ¬ ((1 : ℝ) ≤ 0 / 2) := by
  refine ⟨?_, by norm_num⟩
  intro N hN ε hε hεlt θ hθ
  refine ⟨1 / θ, by positivity, ?_⟩
  rw [div_mul_cancel₀ 1 (ne_of_gt hθ)]
  norm_num

/-- A fixed positive theta does not justify sending theta to zero. -/
theorem one_theta_is_insufficient :
    (∀ N : ℕ, 3 ≤ N → ∀ ε : ℝ, 0 < ε → ε < (2 : ℝ) * N - 4 →
      ((2 : ℝ) * N - 4 - ε) * (1 - 1 * 1) ≤
        (((2 : ℝ) * N - 1) / 2) * 0) ∧
      ¬ ((1 : ℝ) ≤ 0 / 2) := by
  constructor
  · intros
    simp
  · norm_num

/-- A witness with nonzero constant errors and a nonzero vanishing remainder. -/
noncomputable def positive_moving_witness : MovingLimitWitness 1 1 1 1 0 0 where
  leftConstant := 2
  rightConstant := 3
  remainder := fun m => 1 / ((m : ℝ) + 1)
  remainder_tendsto_zero := tendsto_one_div_add_atTop_nhds_zero_nat
  normalized_estimate := Filter.Eventually.of_forall (fun m => by
    have htwo : 0 ≤ (2 : ℝ) / ((m : ℝ) + 1) := by positivity
    have hthree : 0 ≤ (3 : ℝ) / ((m : ℝ) + 1) := by positivity
    have hone : 0 ≤ (1 : ℝ) / ((m : ℝ) + 1) := by positivity
    linarith)

/-- The production moving-limit theorem accepts the nontrivial witness. -/
theorem positive_moving_witness_applies : (1 : ℝ) ≤ 1 := by
  calc
    (1 : ℝ) = 1 * (1 - 0) := by ring
    _ ≤ 1 * (1 + 0) := moving_parameter_limit positive_moving_witness
    _ = 1 := by ring

/-- Sharp examples supply the complete ordered pre-limit input, rather
than only its fixed-index consequence. -/
theorem sharp_ordered_estimate (s : ℝ) (hs : 0 ≤ s) :
    ∀ N : ℕ, 3 ≤ N → ∀ ε : ℝ, 0 < ε → ε < (2 : ℝ) * N - 4 →
      ∃ θ₀ : ℝ, 0 < θ₀ ∧ ∀ θ : ℝ, 0 < θ → θ < θ₀ →
        Nonempty (MovingLimitWitness
          ((2 : ℝ) * N - 4 - ε) (((2 : ℝ) * N - 1) / 2)
          s (2 * s) (0 * θ) (0 * θ)) := by
  intro N hN ε hε hεlt
  refine ⟨1, by norm_num, ?_⟩
  intro θ hθ hθlt
  refine ⟨{
    leftConstant := 0
    rightConstant := 0
    remainder := fun _ => 0
    remainder_tendsto_zero := tendsto_const_nhds
    normalized_estimate := ?_
  }⟩
  apply Filter.Eventually.of_forall
  intro m
  have hbase := (sharp_positive_family s hs).1 N hN
  have herror : 0 ≤ ε * s := mul_nonneg hε.le hs
  dsimp [CoefficientBound] at hbase
  simp only [zero_mul, zero_div, sub_zero, add_zero]
  nlinarith

/-- The full production theorem accepts every member of the sharp family. -/
theorem sharp_ordered_family_applies (s : ℝ) (hs : 0 ≤ s) :
    s ≤ (2 * s) / 2 := by
  exact half_bound_from_full_manuscript_estimate
    (A := 0) (B := 0) (sharp_ordered_estimate s hs)

/-- The audit also identifies a dispensable restriction: an unbounded
set of successful indices suffices; every integer index is not necessary. -/
theorem unbounded_indices_suffice {J L : ℝ}
    (h : ∀ M : ℕ, ∃ N : ℕ, M ≤ N ∧ CoefficientBound N J L) :
    J ≤ L / 2 := by
  by_contra hbad
  have hdelta : 0 < 2 * J - L := by linarith
  obtain ⟨M, hM⟩ := exists_nat_gt ((4 * J - L / 2) / (2 * J - L))
  obtain ⟨N, hMN, hbound⟩ := h M
  have hMNreal : (M : ℝ) ≤ N := by exact_mod_cast hMN
  have hratio : (4 * J - L / 2) / (2 * J - L) < (N : ℝ) :=
    lt_of_lt_of_le hM hMNreal
  have hstrict := (div_lt_iff₀ hdelta).mp hratio
  dsimp [CoefficientBound] at hbound
  nlinarith

/-- An eventual estimate with a constant nonzero remainder does not permit
discarding that remainder. Its required convergence is explicitly false. -/
theorem nonvanishing_remainder_is_insufficient :
    (∀ᶠ _m : ℕ in Filter.atTop, (1 : ℝ) ≤ 0 + 1) ∧
      ¬ Filter.Tendsto (fun _m : ℕ => (1 : ℝ)) Filter.atTop (nhds 0) ∧
      ¬ ((1 : ℝ) ≤ 0) := by
  refine ⟨Filter.Eventually.of_forall (by intro m; norm_num), ?_, by norm_num⟩
  intro h
  have hne : (1 : ℝ) = 0 := tendsto_nhds_unique tendsto_const_nhds h
  norm_num at hne

/-- Holding at one moving index cannot replace holding eventually. -/
theorem one_moving_index_is_insufficient :
    (1 : ℝ) - 2 / ((0 : ℝ) + 1) ≤ 0 ∧
      ¬ (∀ᶠ m : ℕ in Filter.atTop, (1 : ℝ) - 2 / ((m : ℝ) + 1) ≤ 0) ∧
      ¬ ((1 : ℝ) ≤ 0) := by
  refine ⟨by norm_num, ?_, by norm_num⟩
  intro h
  have hlimit := moving_parameter_limit
    (show MovingLimitWitness 1 1 1 0 0 0 from {
      leftConstant := 2
      rightConstant := 0
      remainder := fun _ => 0
      remainder_tendsto_zero := tendsto_const_nhds
      normalized_estimate := by simpa using h
    })
  norm_num at hlimit

/-- A constant error chosen separately at each moving index is not O(1).
Dividing that chosen quantity by the index need not remove it. -/
theorem moving_dependent_constant_is_insufficient :
    (∀ m : ℕ, ∃ C : ℝ, 0 ≤ C ∧
      (1 : ℝ) - C / ((m : ℝ) + 1) ≤ 0) ∧
      ¬ ((1 : ℝ) ≤ 0) := by
  refine ⟨?_, by norm_num⟩
  intro m
  have hden : (m : ℝ) + 1 ≠ 0 := by positivity
  exact ⟨(m : ℝ) + 1, by positivity, by simp [hden]⟩

end TraceSparsity.CoefficientAudit
