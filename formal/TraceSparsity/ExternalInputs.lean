import TraceSparsity.Asymptotics

/-!
# Explicit assumptions from non-formalized mathematics

No declaration in this file is an axiom.  Each structure collects hypotheses
passed explicitly to the later theorems, making clear which mathematical
statements are assumed rather than proved in Lean.

`MovingSelection.select` assumes the existence of the moving configuration
when the character is eligible, the group element is noncentral, `N ≥ 3`,
and critical trace growth holds.  In the manuscript this existence follows
from prime-square mixing, finite-field avoidance, and moving-element
selection.  `LowerMassEstimate` states the resulting Roth reduced-divisor
lower bound, while `UpperMassEstimate` states the geometric and congruence
upper bound for the same mass.

`ArithmeticInputs` records specialization rigidity, the local-height
decomposition, the deduction of integrality, total reality, and bounded
conjugates, Takeuchi's criterion, and the elementary implications from
bounded clustering to linear growth and from linear growth to the critical
trace-counting hypothesis.
-/

namespace TraceSparsity

open CompactTraceDatum

/-- Configurations produced by the moving bounded-exponent construction. -/
structure MovingSelection (D : CompactTraceDatum) where
  Configuration : D.Character → D.Element → ℕ → Type
  select : ∀ (y : D.Character) (b : D.Element) (N : ℕ),
    D.Eligible y → ¬ D.IsCentral b → 3 ≤ N → D.CriticalTraceGrowth →
      Nonempty (Configuration y b N)

/-- Roth's reduced-divisor estimate, after normalization by the moving
parameter and after the auxiliary errors except `η` have been removed. -/
structure LowerMassEstimate (D : CompactTraceDatum)
    (S : MovingSelection D) where
  mass : ∀ {y b N}, S.Configuration y b N → ℝ
  lower : ∀ {y b N} (c : S.Configuration y b N),
    D.Eligible y → ¬ D.IsCentral b → 3 ≤ N →
      ∀ η : ℝ, 0 < η →
        ((2 : ℝ) * N - 4) * D.localHeight y b ≤ mass c + η

/-- The moving congruence-wedge estimate, including the geometric trace
support upper bound. -/
structure UpperMassEstimate (D : CompactTraceDatum)
    (S : MovingSelection D) (R : LowerMassEstimate D S) where
  upper : ∀ {y b N} (c : S.Configuration y b N),
    D.Eligible y → ¬ D.IsCentral b → 3 ≤ N →
      ∀ η : ℝ, 0 < η →
        R.mass c ≤ (((2 : ℝ) * N - 1) / 2) * D.length b + η

/-- The central case and the three structures of hypotheses needed for the
persistent local-expansion theorem. -/
structure LocalExpansionInputs (D : CompactTraceDatum) where
  selection : MovingSelection D
  lowerEstimate : LowerMassEstimate D selection
  upperEstimate : UpperMassEstimate D selection lowerEstimate
  centralLocalHeight : ∀ y b, D.Eligible y → D.IsCentral b →
    D.localHeight y b = 0
  centralLength : ∀ b, D.IsCentral b → D.length b = 0

/-- Pre-limit assumptions with the same quantifier order as the proof of the
local-expansion theorem.  Unlike `LocalExpansionInputs`, this structure has
not already removed the moving-parameter, `θ`, or `ε` errors. -/
structure OrderedLocalExpansionInputs (D : CompactTraceDatum) where
  /-- Coefficients of the `O(θ)` errors; they may depend on the point and
  group element, but not on `N`, `ε`, `θ`, or the moving parameter. -/
  leftThetaCoefficient : D.Character → D.Element → ℝ
  rightThetaCoefficient : D.Character → D.Element → ℝ
  movingEstimate : ∀ (y : D.Character) (b : D.Element),
    D.Eligible y → ¬ D.IsCentral b → D.CriticalTraceGrowth →
    ∀ (N : ℕ), 3 ≤ N →
    ∀ ε : ℝ, 0 < ε → ε < (2 : ℝ) * N - 4 →
    ∃ θ₀ : ℝ, 0 < θ₀ ∧
    ∀ θ : ℝ, 0 < θ → θ < θ₀ →
      Nonempty (MovingLimitWitness
        ((2 : ℝ) * N - 4 - ε)
        (((2 : ℝ) * N - 1) / 2)
        (D.localHeight y b) (D.length b)
        (leftThetaCoefficient y b * θ)
        (rightThetaCoefficient y b * θ))
  centralLocalHeight : ∀ y b, D.Eligible y → D.IsCentral b →
    D.localHeight y b = 0
  centralLength : ∀ b, D.IsCentral b → D.length b = 0

/-- The global arithmetic hypotheses.  Their correspondence with the
manuscript is recorded separately. -/
structure ArithmeticInputs (D : CompactTraceDatum) where
  /-- The original character lies in its rational closure. -/
  distinguishedPersistent : D.IsPersistent D.distinguished
  /-- Specialization plus marked length-spectrum rigidity: local expansion
  at every algebraic persistent Fuchsian specialization forces the
  distinguished character to be algebraic.  The focused manuscript proves
  this implication using Thurston's asymmetric length-spectrum theorem rather
  than a final Northcott argument. -/
  specializationRigidity :
    D.PersistentLocalExpansion → D.IsAlgebraic D.distinguished
  /-- The distinguished real place contributes one half of translation
  length to the local height sum once the distinguished character has been
  shown to be algebraic, so that the number-field local height is defined. -/
  distinguishedLower : D.IsAlgebraic D.distinguished → ∀ b,
    D.IsNonidentity b →
    D.length b / 2 ≤ D.localHeight D.distinguished b
  /-- Equality in the nonnegative local-height decomposition forces
  integrality, total reality of the trace field, and bounded
  nondistinguished conjugates. -/
  equalityConsequences :
    D.IsAlgebraic D.distinguished →
    (∀ b, D.IsNonidentity b →
      D.localHeight D.distinguished b = D.length b / 2) →
    D.IntegralTraces ∧ D.TotallyRealTraceField ∧
      D.BoundedNondistinguishedConjugates
  /-- The square subgroup is a lattice, because it has finite index in the
  original cocompact surface lattice. -/
  squareSubgroupFiniteCovolume : D.SquareSubgroupFiniteCovolume
  /-- Takeuchi's finite-covolume criterion in precisely the direction used. -/
  takeuchi :
    D.SquareSubgroupFiniteCovolume →
    D.IsAlgebraic D.distinguished →
    D.IntegralTraces →
    D.TotallyRealTraceField →
    D.BoundedNondistinguishedConjugates →
    D.SquareSubgroupArithmetic
  /-- The subgroup generated by squares has finite index in the original
  surface lattice. -/
  squareSubgroupFiniteIndex : D.SquareSubgroupFiniteIndex
  /-- Arithmeticity ascends from that finite-index subgroup to the original
  lattice. -/
  finiteIndexAscent : D.SquareSubgroupFiniteIndex →
    D.SquareSubgroupArithmetic → D.Arithmetic
  /-- Literal linear trace growth implies the critical exponent-at-most-one
  hypothesis used by the strengthened local theorem. -/
  linearToCritical : D.LinearTraceGrowth → D.CriticalTraceGrowth
  /-- The elementary counting reduction from bounded clustering to linear
  signed-trace growth. -/
  clusteringToLinear : D.BoundedClustering → D.LinearTraceGrowth

end TraceSparsity
