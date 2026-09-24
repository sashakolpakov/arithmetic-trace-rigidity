import TraceSparsity.Arithmeticity
import Mathlib.Tactic

/-!
# Consistency examples for the stated assumptions

The final implication theorems assume the fields of
`OrderedLocalExpansionInputs` and `ArithmeticInputs`.  This file checks two
elementary logical facts about those assumptions.

First, the abstract datum and both structures of assumptions are jointly
satisfiable: a finite example below has inhabited character and element types
and supplies every field of both structures.  Second, `CriticalTraceGrowth`
by itself does not entail `Arithmetic`: a separate counterexample makes the
former true and the latter false.

These are checks of logical consistency only.  The finite example is not a
hyperbolic surface, and its existence does not prove the assumed statements
for any surface.
-/

namespace TraceSparsity
namespace ContractAudit

open CompactTraceDatum

/-- A jointly inhabited instance of the ordered local and arithmetic
assumptions, with the carrier nonemptiness recorded explicitly. -/
structure OrderedContractModel where
  datum : CompactTraceDatum
  characterNonempty : Nonempty datum.Character
  elementNonempty : Nonempty datum.Element
  orderedLocal : OrderedLocalExpansionInputs datum
  arithmetic : ArithmeticInputs datum
  criticalGrowth : datum.CriticalTraceGrowth

/-- A two-element carrier, so that the central and noncentral cases in the
ordered local assumptions are both represented. -/
inductive ToyElement where
  | central
  | noncentral
  deriving DecidableEq

/-- A finite datum satisfying the required numerical relations.  All
numerical quantities vanish, and its two elements distinguish the central
and noncentral cases. -/
def toyDatum : CompactTraceDatum where
  Character := Unit
  Element := ToyElement
  distinguished := ()
  length := fun _ => 0
  localHeight := fun _ _ => 0
  IsAlgebraic := fun _ => True
  IsPersistent := fun _ => True
  IsCentral := fun b => b = ToyElement.central
  IsNonidentity := fun b => b = ToyElement.noncentral
  CriticalTraceGrowth := True
  LinearTraceGrowth := True
  BoundedClustering := True
  IntegralTraces := True
  BoundedNondistinguishedConjugates := True
  TotallyRealTraceField := True
  SquareSubgroupArithmetic := True
  SquareSubgroupFiniteCovolume := True
  SquareSubgroupFiniteIndex := True
  Arithmetic := True

/-- The ordered pre-limit hypotheses can be instantiated in the finite
example.  For the noncentral case, the moving-limit witness has zero constants
and zero remainder, so the normalized inequality is `0 ≤ 0`. -/
def toyOrderedLocal : OrderedLocalExpansionInputs toyDatum where
  leftThetaCoefficient := fun _ _ => 0
  rightThetaCoefficient := fun _ _ => 0
  movingEstimate := by
    intro y b hy hb hGrowth N hN ε hε hεlt
    refine ⟨1, by norm_num, ?_⟩
    intro θ hθ hθlt
    refine ⟨{
      leftConstant := 0
      rightConstant := 0
      remainder := fun _ => 0
      remainder_tendsto_zero := tendsto_const_nhds
      normalized_estimate := ?_
    }⟩
    exact Filter.Eventually.of_forall (fun m => by simp [toyDatum])
  centralLocalHeight := by
    intro y b hy hb
    rfl
  centralLength := by
    intro b hb
    rfl

/-- The global arithmetic hypotheses can be instantiated for `toyDatum`.
Together with `toyOrderedLocal`, this will give simultaneous instances of
the ordered local and arithmetic hypotheses below. -/
theorem toyArithmetic : ArithmeticInputs toyDatum where
  distinguishedPersistent := trivial
  specializationRigidity := by
    intro hLocal
    trivial
  distinguishedLower := by
    intro hxAlg b hb
    change (0 : ℝ) / 2 ≤ 0
    norm_num
  equalityConsequences := by
    intro hxAlg hEquality
    exact ⟨trivial, trivial, trivial⟩
  squareSubgroupFiniteCovolume := trivial
  takeuchi := by
    intro hCovolume hxAlg hIntegral hReal hBounded
    trivial
  squareSubgroupFiniteIndex := trivial
  finiteIndexAscent := by
    intro hIndex hSquareArithmetic
    trivial
  linearToCritical := by
    intro hLinear
    trivial
  clusteringToLinear := by
    intro hClustering
    trivial

/-- The datum and both structures of hypotheses are jointly satisfiable,
with nonempty character and element carriers. -/
theorem ordered_contract_inhabited : Nonempty OrderedContractModel := by
  exact ⟨{
    datum := toyDatum
    characterNonempty := ⟨()⟩
    elementNonempty := ⟨ToyElement.central⟩
    orderedLocal := toyOrderedLocal
    arithmetic := toyArithmetic
    criticalGrowth := trivial
  }⟩

/-- The ordered implication can be applied to the finite example.  This
checks that the simultaneously supplied assumptions have the dependent types
required by the theorem. -/
theorem toy_ordered_certificate_applies : toyDatum.Arithmetic := by
  exact compact_critical_growth_from_ordered_inputs
    toyDatum toyOrderedLocal toyArithmetic trivial

/-- A counterexample to the assertion that critical trace growth alone
implies arithmeticity.  The other global propositions are set to false
because the additional assumptions are not supplied. -/
def growthOnlyDatum : CompactTraceDatum where
  Character := Unit
  Element := Unit
  distinguished := ()
  length := fun _ => 0
  localHeight := fun _ _ => 0
  IsAlgebraic := fun _ => False
  IsPersistent := fun _ => False
  IsCentral := fun _ => False
  IsNonidentity := fun _ => False
  CriticalTraceGrowth := True
  LinearTraceGrowth := False
  BoundedClustering := False
  IntegralTraces := False
  BoundedNondistinguishedConjugates := False
  TotallyRealTraceField := False
  SquareSubgroupArithmetic := False
  SquareSubgroupFiniteCovolume := False
  SquareSubgroupFiniteIndex := False
  Arithmetic := False

/-- The bare growth predicate cannot imply arithmeticity for every abstract
datum.  The local-expansion and arithmetic hypotheses in the implication
theorem are therefore logically substantive rather than redundant. -/
theorem critical_growth_alone_not_sufficient :
    ¬ (∀ D : CompactTraceDatum, D.CriticalTraceGrowth → D.Arithmetic) := by
  intro h
  exact h growthOnlyDatum trivial

end ContractAudit
end TraceSparsity
