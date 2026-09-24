import TraceSparsity.LocalExpansion

/-!
# From local expansion to the compact Schmutz and Sarnak conclusions

Every theorem below whose conclusion is `D.Arithmetic` assumes
`ArithmeticInputs D` explicitly.  Thus none asserts that a trace-growth
condition by itself implies arithmeticity.
-/

namespace TraceSparsity

open CompactTraceDatum

/-- Under `ArithmeticInputs D`, persistent local expansion supplies the
remaining premise for the specialization, equality, Takeuchi, and
finite-index deductions of arithmeticity. -/
theorem arithmetic_of_persistent_local_expansion
    (D : CompactTraceDatum)
    (arith : ArithmeticInputs D)
    (hLocal : D.PersistentLocalExpansion) :
    D.Arithmetic := by
  have hxAlg : D.IsAlgebraic D.distinguished :=
    arith.specializationRigidity hLocal
  have hxEligible : D.Eligible D.distinguished :=
    ⟨hxAlg, arith.distinguishedPersistent⟩
  have hUpper : D.LocalExpansionAt D.distinguished :=
    hLocal D.distinguished hxEligible
  have hEquality : ∀ b, D.IsNonidentity b →
      D.localHeight D.distinguished b = D.length b / 2 := by
    intro b hb
    exact le_antisymm (hUpper b) (arith.distinguishedLower hxAlg b hb)
  obtain ⟨hIntegral, hTotallyReal, hBounded⟩ :=
    arith.equalityConsequences hxAlg hEquality
  have hSquareArithmetic :=
    arith.takeuchi arith.squareSubgroupFiniteCovolume hxAlg
      hIntegral hTotallyReal hBounded
  exact arith.finiteIndexAscent arith.squareSubgroupFiniteIndex
    hSquareArithmetic

/-- Critical trace growth, the post-limit local-expansion assumptions, and
`ArithmeticInputs D` together imply arithmeticity. -/
theorem arithmetic_of_critical_trace_growth
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D)
    (hGrowth : D.CriticalTraceGrowth) :
    D.Arithmetic := by
  exact arithmetic_of_persistent_local_expansion D arith
    (persistent_local_expansion D localInput hGrowth)

/-- Critical trace growth, the ordered pre-limit assumptions, and
`ArithmeticInputs D` together imply arithmeticity.  This formulation keeps
the order of limits displayed in the manuscript. -/
theorem arithmetic_of_critical_trace_growth_ordered
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D)
    (hGrowth : D.CriticalTraceGrowth) :
    D.Arithmetic := by
  exact arithmetic_of_persistent_local_expansion D arith
    (persistent_local_expansion_ordered D localInput hGrowth)

/-- Under the post-limit local-expansion assumptions and `ArithmeticInputs D`,
literal linear signed-trace growth implies arithmeticity through the
assumed linear-to-critical implication. -/
theorem schmutz_from_local_expansion
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D)
    (hGrowth : D.LinearTraceGrowth) :
    D.Arithmetic := by
  exact arithmetic_of_critical_trace_growth D localInput arith
    (arith.linearToCritical hGrowth)

/-- Under the ordered pre-limit assumptions and `ArithmeticInputs D`, literal
linear signed-trace growth implies arithmeticity through the assumed
linear-to-critical implication. -/
theorem schmutz_from_ordered_local_expansion
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D)
    (hGrowth : D.LinearTraceGrowth) :
    D.Arithmetic := by
  exact arithmetic_of_critical_trace_growth_ordered D localInput arith
    (arith.linearToCritical hGrowth)

/-- Conditional implication from critical trace growth to arithmeticity,
assuming both the post-limit estimates and every field of
`ArithmeticInputs D`. -/
theorem compact_critical_growth_from_inputs
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.CriticalTraceGrowth → D.Arithmetic := by
  exact arithmetic_of_critical_trace_growth D localInput arith

/-- Conditional implication from critical trace growth to arithmeticity,
assuming both the ordered pre-limit estimates and every field of
`ArithmeticInputs D`. -/
theorem compact_critical_growth_from_ordered_inputs
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.CriticalTraceGrowth → D.Arithmetic := by
  exact arithmetic_of_critical_trace_growth_ordered D localInput arith

/-- Conditional implication for the compact Schmutz conclusion after the
limiting argument.  Every analytic, geometric, and arithmetic hypothesis in
`LocalExpansionInputs` and `ArithmeticInputs` is an explicit premise; this
declaration does not prove those hypotheses for a surface group. -/
theorem compact_schmutz_from_inputs
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.LinearTraceGrowth → D.Arithmetic := by
  intro h
  exact schmutz_from_local_expansion D localInput arith h

/-- Conditional implication for the compact Sarnak conclusion.  In addition
to the post-limit and arithmetic assumptions, it uses the stated
clustering-to-linear and linear-to-critical implications before applying
`compact_schmutz_from_inputs`. -/
theorem compact_sarnak_from_inputs
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.BoundedClustering → D.Arithmetic := by
  intro hCluster
  exact compact_schmutz_from_inputs D localInput arith
    (arith.clusteringToLinear hCluster)

/-- Conditional compact Schmutz implication with the full ordered pre-limit
assumptions and `ArithmeticInputs D`.  This formulation retains the order of
limits displayed in the manuscript. -/
theorem compact_schmutz_from_ordered_inputs
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.LinearTraceGrowth → D.Arithmetic := by
  intro h
  exact schmutz_from_ordered_local_expansion D localInput arith h

/-- Conditional compact Sarnak implication with the full ordered pre-limit
assumptions and `ArithmeticInputs D`. -/
theorem compact_sarnak_from_ordered_inputs
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.BoundedClustering → D.Arithmetic := by
  intro hCluster
  exact compact_schmutz_from_ordered_inputs D localInput arith
    (arith.clusteringToLinear hCluster)

/-- Backward-compatible short name for
`compact_schmutz_from_inputs`.  The longer name is preferred because it
makes the theorem's conditional status explicit. -/
theorem compact_schmutz
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.LinearTraceGrowth → D.Arithmetic :=
  compact_schmutz_from_inputs D localInput arith

/-- Backward-compatible short name for
`compact_sarnak_from_inputs`. -/
theorem compact_sarnak
    (D : CompactTraceDatum)
    (localInput : LocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.BoundedClustering → D.Arithmetic :=
  compact_sarnak_from_inputs D localInput arith

/-- Backward-compatible short name for
`compact_schmutz_from_ordered_inputs`. -/
theorem compact_schmutz_ordered
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.LinearTraceGrowth → D.Arithmetic :=
  compact_schmutz_from_ordered_inputs D localInput arith

/-- Backward-compatible short name for
`compact_sarnak_from_ordered_inputs`. -/
theorem compact_sarnak_ordered
    (D : CompactTraceDatum)
    (localInput : OrderedLocalExpansionInputs D)
    (arith : ArithmeticInputs D) :
    D.BoundedClustering → D.Arithmetic :=
  compact_sarnak_from_ordered_inputs D localInput arith

end TraceSparsity
