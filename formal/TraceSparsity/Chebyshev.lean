import Mathlib.Tactic

/-!
# The trace recurrence

For a commutative ring and a parameter `x`, `q x n` is the normalized
Chebyshev recurrence

`q₀ = 0`, `q₁ = 1`, `qₙ₊₂ = x qₙ₊₁ - qₙ`.

These identities are the algebraic core of the two trace coordinates used
in the manuscript.
-/

namespace TraceSparsity

section Chebyshev

variable {R : Type*} [CommRing R]

/-- Normalized Chebyshev recurrence of the second kind. -/
def q (x : R) : ℕ → R
  | 0 => 0
  | 1 => 1
  | n + 2 => x * q x (n + 1) - q x n

@[simp] theorem q_zero (x : R) : q x 0 = 0 := rfl
@[simp] theorem q_one (x : R) : q x 1 = 1 := rfl
theorem q_succ_succ (x : R) (n : ℕ) :
    q x (n + 2) = x * q x (n + 1) - q x n := rfl

/-- Cassini's identity for consecutive recurrence polynomials. -/
theorem q_cassini (x : R) (n : ℕ) :
    q x (n + 1) ^ 2 - q x n * q x (n + 2) = 1 := by
  induction n with
  | zero => simp [q]
  | succ n ih =>
      rw [q_succ_succ x (n + 1), q_succ_succ x n]
      calc
        (x * q x (n + 1) - q x n) ^ 2 -
              q x (n + 1) *
                (x * (x * q x (n + 1) - q x n) - q x (n + 1)) =
            q x (n + 1) ^ 2 - q x n *
              (x * q x (n + 1) - q x n) := by ring
        _ = 1 := ih

/-- A pair of consecutive `q` values generates the unit ideal, expressed
without invoking ideal theory. -/
theorem q_consecutive_bezout (x : R) (n : ℕ) :
    q x (n + 1) * q x (n + 1) +
        q x n * (-q x (n + 2)) = 1 := by
  calc
    q x (n + 1) * q x (n + 1) + q x n * (-q x (n + 2)) =
        q x (n + 1) ^ 2 - q x n * q x (n + 2) := by ring
    _ = 1 := q_cassini x n

/-- A general sequence with the same second-order trace recurrence. -/
def traceRec (x a b : R) : ℕ → R
  | 0 => a
  | 1 => b
  | n + 2 => x * traceRec x a b (n + 1) - traceRec x a b n

@[simp] theorem traceRec_zero (x a b : R) : traceRec x a b 0 = a := rfl
@[simp] theorem traceRec_one (x a b : R) : traceRec x a b 1 = b := rfl
theorem traceRec_succ_succ (x a b : R) (n : ℕ) :
    traceRec x a b (n + 2) =
      x * traceRec x a b (n + 1) - traceRec x a b n := rfl

/-- Closed form for the general trace recurrence.  This is the identity
`Tr(AⁿH)=qₙ(Tr A)Tr(AH)-qₙ₋₁(Tr A)Tr(H)` in abstract form. -/
theorem traceRec_succ_eq (x a b : R) (n : ℕ) :
    traceRec x a b (n + 1) = q x (n + 1) * b - q x n * a := by
  induction n using Nat.twoStepInduction with
  | zero => simp [traceRec, q]
  | one =>
      simp [traceRec, q]
  | more n ih0 ih1 =>
      rw [show n + 2 + 1 = (n + 1) + 2 by omega]
      rw [traceRec_succ_succ, ih1, ih0]
      rw [show n + 2 = n + 1 + 1 by omega]
      rw [q_succ_succ x (n + 1), q_succ_succ x n]
      ring

/-- The quadratic discriminant associated with a recurrence is invariant
under one recurrence step. -/
theorem traceRec_discriminant_invariant (x a b : R) (n : ℕ) :
    traceRec x a b (n + 1) ^ 2 -
          x * traceRec x a b n * traceRec x a b (n + 1) +
          traceRec x a b n ^ 2 =
      b ^ 2 - x * a * b + a ^ 2 := by
  induction n with
  | zero => simp [traceRec]
  | succ n ih =>
      rw [traceRec_succ_succ]
      calc
        (x * traceRec x a b (n + 1) - traceRec x a b n) ^ 2 -
              x * traceRec x a b (n + 1) *
                (x * traceRec x a b (n + 1) - traceRec x a b n) +
              traceRec x a b (n + 1) ^ 2 =
            traceRec x a b (n + 1) ^ 2 -
              x * traceRec x a b n * traceRec x a b (n + 1) +
              traceRec x a b n ^ 2 := by ring
        _ = _ := ih

/-- The recurrence read in the negative-power direction.  If `a = Tr(H)`
and `b = Tr(AH)`, this is `Tr(A⁻ⁿH)`. -/
def negativeTraceRec (x a b : R) (n : ℕ) : R :=
  q x (n + 1) * a - q x n * b

@[simp] theorem negativeTraceRec_zero (x a b : R) :
    negativeTraceRec x a b 0 = a := by simp [negativeTraceRec]

@[simp] theorem negativeTraceRec_one (x a b : R) :
    negativeTraceRec x a b 1 = x * a - b := by simp [negativeTraceRec, q]

theorem negativeTraceRec_succ_succ (x a b : R) (n : ℕ) :
    negativeTraceRec x a b (n + 2) =
      x * negativeTraceRec x a b (n + 1) -
        negativeTraceRec x a b n := by
  simp only [negativeTraceRec]
  rw [show n + 2 + 1 = (n + 1) + 2 by omega]
  rw [q_succ_succ x (n + 1)]
  rw [show n + 2 = n + 1 + 1 by omega]
  rw [q_succ_succ x n]
  ring

/-- The two linear projections used in the trace graph.  The first is the
positive trace recurrence, and the second is the negative trace recurrence. -/
theorem two_trace_projections (x a b : R) (n : ℕ) :
    q x (n + 1) * b - q x n * a = traceRec x a b (n + 1) ∧
    q x (n + 1) * a - q x n * b = negativeTraceRec x a b n := by
  constructor
  · exact (traceRec_succ_eq x a b n).symm
  · rfl

end Chebyshev

end TraceSparsity
