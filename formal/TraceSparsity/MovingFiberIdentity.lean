import Mathlib.Tactic

/-!
# Polynomial identities in the moving two-trace fiber

This file checks the direct quadratic elimination identity for a moving
two-trace fiber, the determinant-one Fricke identity, and the resulting
factorization by the commutator trace.  The positive and negative recurrence
identities are proved separately in `Chebyshev.lean`.  The statements here
are valid over every commutative ring.
-/

namespace TraceSparsity

section FiberIdentity

variable {R : Type*} [CommRing R]

/-- The Fricke polynomial `tr([A,H])-2` in the three trace coordinates. -/
def frickeDefect (x y z : R) : R :=
  x ^ 2 + y ^ 2 + z ^ 2 - x * y * z - 4

/-- The trace of `A H A⁻¹ H⁻¹`, written in the eight matrix entries,
where the inverse matrices are the adjugates.  The determinant-one
hypotheses occur in `fricke_trace_identity` below. -/
def commutatorTrace (a b c d r s u v : R) : R :=
  let p := a * r + b * u
  let q := a * s + b * v
  let t := c * r + d * u
  let w := c * s + d * v
  (p * d - q * c) * v - (-p * b + q * a) * u -
    (t * d - w * c) * s + (-t * b + w * a) * r

/-- The Fricke trace identity for two determinant-one `2 × 2` matrices,
proved directly as a polynomial identity. -/
theorem fricke_trace_identity
    (a b c d r s u v : R)
    (hdetA : a * d - b * c = 1)
    (hdetH : r * v - s * u = 1) :
    commutatorTrace a b c d r s u v =
      (a + d) ^ 2 + (r + v) ^ 2 +
        (a * r + b * u + c * s + d * v) ^ 2 -
        (a + d) * (r + v) * (a * r + b * u + c * s + d * v) - 2 := by
  dsimp [commutatorTrace]
  linear_combination
    ((r + v) ^ 2 - 2) * hdetA + (a ^ 2 + 2 * b * c + d ^ 2) * hdetH

/-- The right side of the moving-fiber norm equation is four times the
Fricke polynomial.  This identity does not require division by a matrix
entry. -/
theorem moving_fiber_fricke_factorization
    (a b d ξ ζ : R) :
    let Δ := (a + d) ^ 2 - 4
    let w := ζ - d * ξ
    let K := b * (ξ * (a - d) - 2 * w)
    K ^ 2 - Δ * b ^ 2 * (ξ ^ 2 - 4) =
      4 * b ^ 2 * frickeDefect (a + d) ξ ζ := by
  dsimp [frickeDefect]
  ring

/-- Direct elimination of the determinant and second trace equations gives
the quadratic norm equation used to bound a two-trace fiber. -/
theorem moving_fiber_quadratic_identity
    (a b c d r s u ξ ζ : R)
    (hdetA : a * d - b * c = 1)
    (hdetH : r * (ξ - r) - s * u = 1)
    (htrace : a * r + b * u + c * s + d * (ξ - r) = ζ) :
    let Δ := (a + d) ^ 2 - 4
    let w := ζ - d * ξ
    let y₀ := 2 * b * r - (a - d) * s
    let K := b * (ξ * (a - d) - 2 * w)
    (Δ * s + K) ^ 2 - Δ * (y₀ - b * ξ) ^ 2 =
      K ^ 2 - Δ * b ^ 2 * (ξ ^ 2 - 4) := by
  dsimp
  have hcore :
      -a * b * r * s - a * d * s ^ 2 + b ^ 2 * r ^ 2 -
          b ^ 2 * r * ξ + b ^ 2 + b * d * r * s -
          b * d * s * ξ + b * s * ζ + s ^ 2 = 0 := by
    linear_combination (-b * s) * htrace - b ^ 2 * hdetH - s ^ 2 * hdetA
  apply sub_eq_zero.mp
  calc
    (( ((a + d) ^ 2 - 4) * s +
          b * (ξ * (a - d) - 2 * (ζ - d * ξ))) ^ 2 -
        ((a + d) ^ 2 - 4) *
          (2 * b * r - (a - d) * s - b * ξ) ^ 2) -
      ((b * (ξ * (a - d) - 2 * (ζ - d * ξ))) ^ 2 -
        ((a + d) ^ 2 - 4) * b ^ 2 * (ξ ^ 2 - 4)) =
        -4 * ((a + d) ^ 2 - 4) *
          (-a * b * r * s - a * d * s ^ 2 + b ^ 2 * r ^ 2 -
            b ^ 2 * r * ξ + b ^ 2 + b * d * r * s -
            b * d * s * ξ + b * s * ζ + s ^ 2) := by ring
    _ = 0 := by rw [hcore, mul_zero]

/-- The right side of the quadratic norm identity is
`4b²(Tr[A,H]-2)`. -/
theorem moving_fiber_rhs_eq_commutator
    (a b c d r s u ξ ζ : R)
    (hdetA : a * d - b * c = 1)
    (hdetH : r * (ξ - r) - s * u = 1)
    (htrace : a * r + b * u + c * s + d * (ξ - r) = ζ) :
    let Δ := (a + d) ^ 2 - 4
    let w := ζ - d * ξ
    let K := b * (ξ * (a - d) - 2 * w)
    K ^ 2 - Δ * b ^ 2 * (ξ ^ 2 - 4) =
      4 * b ^ 2 *
        (commutatorTrace a b c d r s u (ξ - r) - 2) := by
  dsimp
  rw [moving_fiber_fricke_factorization]
  congr 1
  have hfricke := fricke_trace_identity
    a b c d r s u (ξ - r) hdetA hdetH
  dsimp [frickeDefect]
  rw [htrace] at hfricke
  have hsum : r + (ξ - r) = ξ := by ring
  rw [hsum] at hfricke
  linear_combination -hfricke

end FiberIdentity

end TraceSparsity
