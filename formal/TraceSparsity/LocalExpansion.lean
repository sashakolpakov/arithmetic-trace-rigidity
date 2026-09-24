import TraceSparsity.Asymptotics
import TraceSparsity.ExternalInputs
import Mathlib.Tactic

/-!
# Assembly of the persistent local-expansion theorem
-/

namespace TraceSparsity

open CompactTraceDatum

/-- The lower and upper mass estimates combine to give the coefficient
inequality with every positive error. -/
theorem coefficient_estimate
    (D : CompactTraceDatum) (I : LocalExpansionInputs D)
    (hGrowth : D.CriticalTraceGrowth)
    {y : D.Character} (hy : D.Eligible y)
    {b : D.Element} (hb : ¬ D.IsCentral b)
    (N : ℕ) (hN : 3 ≤ N) (η : ℝ) (hη : 0 < η) :
    ((2 : ℝ) * N - 4) * D.localHeight y b ≤
      (((2 : ℝ) * N - 1) / 2) * D.length b + η := by
  let halfError : ℝ := η / 2
  have hhalf : 0 < halfError := by
    dsimp [halfError]
    linarith
  let c := (I.selection.select y b N hy hb hN hGrowth).some
  have hlo := I.lowerEstimate.lower c hy hb hN halfError hhalf
  have hup := I.upperEstimate.upper c hy hb hN halfError hhalf
  dsimp [halfError] at hlo hup
  linarith

/-- The persistent local-expansion theorem, conditional on the selection and
two mass estimates recorded in `LocalExpansionInputs`, together with its
central-case assumptions. -/
theorem persistent_local_expansion
    (D : CompactTraceDatum) (I : LocalExpansionInputs D)
    (hGrowth : D.CriticalTraceGrowth) :
    D.PersistentLocalExpansion := by
  intro y hy b
  by_cases hb : D.IsCentral b
  · rw [I.centralLocalHeight y b hy hb, I.centralLength b hb]
    norm_num
  · apply half_bound_of_arbitrary_errors
    intro N hN η hη
    exact coefficient_estimate D I hGrowth hy hb N hN η hη

/-- The same persistent local-expansion theorem assembled directly from the
full estimate before any of the four successive limits. -/
theorem persistent_local_expansion_ordered
    (D : CompactTraceDatum) (I : OrderedLocalExpansionInputs D)
    (hGrowth : D.CriticalTraceGrowth) :
    D.PersistentLocalExpansion := by
  intro y hy b
  by_cases hb : D.IsCentral b
  · rw [I.centralLocalHeight y b hy hb, I.centralLength b hb]
    norm_num
  · apply half_bound_from_full_manuscript_estimate
    intro N hN ε hε
    exact I.movingEstimate y b hy hb hGrowth N hN ε hε

end TraceSparsity
