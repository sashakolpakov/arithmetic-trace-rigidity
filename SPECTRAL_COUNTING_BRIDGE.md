# From bounded-power expansion to trace counting in metric balls

This note derives the metric-ball trace count used when the recurrence index
is fixed and the group element varies. The derivation spells out what would otherwise be hidden by the
phrase “property \(\tau\) together with uniform lattice counting.”

## Proposition needed by the manuscript

Let \(\Pi^{(2)}\) be the finite-index square subgroup of a closed surface
group. Fix a projective Fuchsian representation
\(\bar\rho_x:\Pi^{(2)}\to\operatorname{PSL}_2(\mathbf R)\), which defines
the metric below, and an algebraic lift
\(\rho_y:\Pi^{(2)}\to\operatorname{SL}_2(\mathbf R)\), which defines traces
and congruences. Put \(\Delta=\rho_y(\Pi^{(2)})\) and identify it with the
abstract group through the faithful map \(\rho_y\), which is an isomorphism
from \(\Pi^{(2)}\) onto \(\Delta\). This identification is used for
congruences; all radii are measured separately through \(\bar\rho_x\). The
group \(\bar\rho_x(\Pi^{(2)})\) is a cocompact lattice and defines the metric
covers below. The linear group \(\Delta\) is a finitely generated Zariski-dense
subgroup of

\[
 \mathbf G(\mathbf Q)
 =\left(\operatorname {Res}_{k/\mathbf Q}
          \operatorname {SL}_1(B)\right)(\mathbf Q),
\]

where \(k\) is the full invariant trace field.  Remove a finite, rationally
saturated set of primes, meaning that whenever one prime of \(k\) above a
rational prime \(p\) is removed, every prime above \(p\) is removed.  After
this deletion the group scheme, trace map, and chosen generators all have
good integral models.

Fix \(D\ge1\).  For every prime-to-\(S\) ideal \(\mathfrak c\) whose prime
exponents are at most \(D\), let \(Q_{\mathfrak c}\) be the image of
\(\Delta\) modulo \(\mathfrak c\).  Then there are
\(\delta_D,c_D>0\) such that, uniformly in a residue value \(t\),

\[
 \#\{g\in\Pi^{(2)}:d_x(o,\bar\rho_x(g)o)\le R,\
       \operatorname {tr}(\rho_y(g))\equiv t\pmod{\mathfrak c}\}
 \le {e^{R+o(R)}\over N\mathfrak c}
\]

whenever

\[
 \log N\mathfrak c\le c_D R.
\tag{1}
\]

For that argument it is enough to know
\(\log N\mathfrak c_m\le A_Dm+O(1)\), and then choose \(R=Cm\), after
\(D,A_D\), with \(C\) sufficiently large.

## Derivation

### 1. Expansion

Salehi Golsefidy, *Super-approximation, II: the \(p\)-adic case and the case
of bounded powers of square-free integers*, JEMS 21 (2019), Theorem 1,
states that for a fixed exponent bound the relevant Cayley graphs form an
expander family precisely when the identity component of the
\(\mathbf Q\)-Zariski closure is perfect.  The group \(\mathbf G\) above is
connected semisimple, hence perfect.  If \(M\) is the square-free product of
the rational primes below \(\mathfrak c\), then
\(M^D\mathcal O_{k,S}\subseteq\mathfrak c\).  Reduction modulo
\(\mathfrak c\) is therefore a quotient of reduction modulo the integer
\(M^D\), and an expander spectral gap passes to quotients.

The theorem permits a gap depending on the fixed number \(D\).  No
uniformity as \(D\to\infty\) is used.

### 2. Size of the congruence image and of a trace fiber

To identify the coefficient ring, put
\[
 A_{\mathrm{ad}}
 =\mathbf Z[\operatorname {tr}(\operatorname {Ad}h):h\in\Delta].
\]
The identity
\[
 \operatorname {tr}(\operatorname {Ad}h)
 =(\operatorname {tr}h)^2-1
 =\operatorname {tr}(h^2)+1
\]
and invariance of the invariant trace field under finite-index passage show
that \(\operatorname {Frac}(A_{\mathrm{ad}})=k\). Weisfeiler's strong
approximation theorem first gives a model over a localization of this trace
ring. After rational saturation and deletion of the conductor primes, that
localization is \(\mathcal O_{k,S}\). Taking Weil restriction then gives a
\(\mathbf Z[1/q_0]\)-model with generic fiber
\(\operatorname {Res}_{k/\mathbf Q}\operatorname {SL}_1(B)\); after one
further localization it agrees with the fixed congruence model. Thus strong
approximation gives a uniformly bounded-index image in the good local
groups. Since \(\operatorname {SL}_1(B)\) has dimension three over \(k\),

\[
  \#Q_{\mathfrak c}=(N\mathfrak c)^{3+o(1)}.
\tag{2}
\]

The local trace estimate can be proved directly.  At a good prime, write
\(q_{\mathfrak p}=N\mathfrak p\) and put
\(A=\mathcal O_k/\mathfrak p^e\).  For every
\(t\in A\),

\[
 \#\{x\in\operatorname {SL}_2(A):\operatorname {tr}x=t\}
 \le (e+1)q_{\mathfrak p}^{2e}.
\tag{3}
\]

Indeed, after choosing the upper-left entry \(u\), the determinant equation
is \(bc=u(t-u)-1\).  Splitting \(b\) according to its valuation gives at
most \((e+1)q_{\mathfrak p}^e\) pairs \((b,c)\).  Since

\[
 \#\operatorname {SL}_2(A)
 =q_{\mathfrak p}^{3e}(1-q_{\mathfrak p}^{-2}),
\]

the Chinese remainder theorem, the fixed bound \(e\le D\), and bounded
index give

\[
 { \max_t\#\{\xi\in Q_{\mathfrak c}:\operatorname {tr}\xi=t\}
    \over \#Q_{\mathfrak c}}
 \le {(N\mathfrak c)^{o(1)}\over N\mathfrak c}.
\tag{4}
\]

The \(o(1)\) only records the product of fixed local constants over the
distinct prime factors.

### 3. Transfer and lattice counting

The congruence kernels are normal, so their quotient Cayley graphs are the
graphs of regular covers. The Brooks--Burger comparison transfers the
uniform Cayley-graph gap to a uniform positive lower bound for the first
Laplace eigenvalue of these compact covers. The complementary-series
classification for \(\operatorname{PSL}_2(\mathbf R)\) turns that lower
bound into a uniform \(L^{p_D+\varepsilon}\) bound, for every
\(\varepsilon>0\), for the mean-zero representations.
Gorodnik--Nevo, *Counting lattice points*, Theorem 4.5 supplies the stable
mean-ergodic estimate; Theorem 1.9, Corollaries 1.11 and 1.13, and Remark
1.12 then give constants \(\delta_D>0\) and the translated-coset estimate

\[
 \#\{g\in\Pi^{(2)}:d_x(o,\bar\rho_x(g)o)\le R,\
       \pi_{\mathfrak c}(\rho_y(g))=\xi\}
 = {e^{R+O(1)}\over\#Q_{\mathfrak c}}
   +O_D(e^{(1-\delta_D)R}),
\tag{5}
\]

uniformly in \(\mathfrak c\) and \(\xi\in Q_{\mathfrak c}\).  Here curvature is normalized to
\(-1\), so the ball volume and lattice count have exponent one.

Sum (5) over the trace fiber bounded in (3)--(4).  The main terms give

\[
 {e^{R+o(R)}\over N\mathfrak c}.
\]

The total error is at most

\[
 (N\mathfrak c)^{2+o(1)}e^{(1-\delta_D)R}.
\tag{6}
\]

To make (6) no larger than the main term it is enough that

\[
 3\log N\mathfrak c<\delta_D R-o(R).
\tag{7}
\]

Thus (1) holds for every sufficiently small
\(c_D<\delta_D/3\).  In the manuscript,
\(\log N\mathfrak c_m\le A_Dm+O(1)\); choosing
\(R=Cm\) with \(C>3A_D/\delta_D\) proves the required estimate.

## Dependence of constants and hypotheses

* An unrestricted assertion \(\log N\mathfrak c=O(R)\) is false as a
  uniform range: the implied constant must be smaller than the spectral
  exponent.
* The radius constant \(C\) is chosen after the exponent bound \(D\), because
  the gap \(\delta_D\) may depend on \(D\).
* Perfect connected Zariski closure supplies expansion, but strong
  approximation is separately needed for (2) and the trace-fiber density.
* Rational saturation and deletion of ramified primes are what permit the
  reduction to \(M^D\) and the split local calculation (3).
* Expansion for a fixed generating set is enough; changing between two fixed
  generating sets changes the numerical gap but not the expander property.
