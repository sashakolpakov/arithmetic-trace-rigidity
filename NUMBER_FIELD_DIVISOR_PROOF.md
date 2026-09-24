# Uniform quadratic-norm divisor lemma over a number field

This note supplies the arithmetic estimate needed to bound the fibers of
\(H\mapsto(\operatorname{tr}H,\operatorname{tr}(A_mH))\). It is limited to the algebraic
specializations used in the focused proof.

## Statement

Fix a number field \(K\), a finite set \(S\) of places containing the
archimedean places, and \(C>0\). Write \(\mathcal O_{K,S}\) for the ring of
\(S\)-integers and \(h\) for the absolute logarithmic Weil height. Then

\[
 \sup_{\substack{d,N\in\mathcal O_{K,S},\ dN\ne0\\
                  h(d),h(N)\le Cm}}
 \#\left\{(y,v)\in\mathcal O_{K,S}^2:
   \begin{array}{c}
     y^2-dv^2=N,\\[-2mm]
     h(y),h(v)\le Cm
   \end{array}\right\}
   =\exp(o_{K,S,C}(m)).
\]

The little-oh is uniform in \(d\) and \(N\). The same conclusion holds if
the four height bounds use different fixed constants.

## Proof

Assume first that \(d\) is not a square in \(K\), and let

\[
 E_d=K[T]/(T^2-d).
\]

Then \(E_d\) is a quadratic field. Let \(\mathcal O_{d,S}\) be the integral closure of
\(\mathcal O_{K,S}\) in \(E_d\). The element \(T\) is integral over
\(\mathcal O_{K,S}\), so every solution gives

\[
 \alpha=y+vT\in\mathcal O_{d,S},\qquad
 \alpha\bar\alpha=N.
\]

The map \((y,v)\mapsto y+vT\) is injective since \(1\) and \(T\) form a
\(K\)-basis of this field.

### 1. There are subexponentially many principal-ideal patterns

For every prime \(\mathfrak P\) of \(\mathcal O_{d,S}\), both \(\alpha\) and
\(\bar\alpha\) are integral at \(\mathfrak P\). Hence

\[
 0\le v_{\mathfrak P}(\alpha)
    \le v_{\mathfrak P}(N).
\]

If \(\mathfrak p\) is the prime of \(K\) below \(\mathfrak P\), then
\(v_{\mathfrak P}(N)=e(\mathfrak P/\mathfrak p)v_{\mathfrak p}(N)\), with
\(e(\mathfrak P/\mathfrak p)\le2\), and at most two primes
\(\mathfrak P\) lie above \(\mathfrak p\). Consequently the number of
possible prime-to-\(S\) divisors \((\alpha)\) is at most

\[
 \prod_{\mathfrak p\notin S,\ v_{\mathfrak p}(N)>0}
       \bigl(2v_{\mathfrak p}(N)+1\bigr)^2.
\tag{1}
\]

The logarithmic norm of the prime-to-\(S\) numerator ideal of \(N\) is
\(O_{K,S,C}(m)\). One way to see this without a convention-dependent
height calculation is to use \(h(N^{-1})=h(N)\): the positive valuations
of \(N\) are the finite-place denominator contributions to the height of
\(N^{-1}\).

For completeness, the product in (1) is \(\exp(o(m))\) uniformly. Fix \(T_0>1\). Only
finitely many primes of \(K\) have norm at most \(T_0\), and their
contribution to the logarithm of (1) is \(O_{K,T_0}(\log m)\). For the
remaining primes, use
\(\log(2e+1)\le e\log3\) and

\[
 \sum_{N\mathfrak p>T_0}v_{\mathfrak p}(N)
 \le {1\over\log T_0}
     \sum_{\mathfrak p}v_{\mathfrak p}(N)\log N\mathfrak p
 =O(m/\log T_0).
\]

First let \(m\to\infty\), and then \(T_0\to\infty\). This proves that the
number of possible principal-ideal patterns is \(\exp(o(m))\), uniformly in
the varying quadratic algebra.

### 2. Each pattern has only polynomially many generators of the required height

If two solutions \(\alpha,\alpha'\) have the same prime-to-\(S\) principal
ideal, then

\[
 u=\alpha/\alpha'\in\mathcal O_{d,S}^{\times}.
\]

The elementary height inequalities and
\(h(T)=\tfrac12h(d)+O_K(1)\) give

\[
 h_{E_d}(\alpha),h_{E_d}(\alpha')=O_{K,C}(m),
 \qquad h_{E_d}(u)=O_{K,C}(m).
\tag{2}
\]

It remains to make the usual unit count uniform as \(d\) varies. The degree
of \(E_d\) is at most \(2[K:\mathbf Q]\), and the number of archimedean
places and of places above \(S\) is bounded only in terms of \(K,S\). For a
unit \(u\), define
\[
 \ell_{E_d}(u)=\bigl(n_w\log|u|_w\bigr)_{w\mid S},
\]
where \(n_w\) is the usual local-degree weight. The product formula and the
fact that an \(S\)-unit has absolute value one away from the places above
\(S\) give the exact identity
\[
 \|\ell_{E_d}(u)\|_1=2[E_d:\mathbf Q]h(u).
\tag{3}
\]
The logarithmic embedding modulo roots of unity has rank bounded by a
constant \(r_{K,S}\). Kronecker's theorem identifies the height-zero numbers
with roots of unity. There is a uniform positive lower bound for the height
of a non-torsion algebraic number of degree at most \(2[K:\mathbf Q]\):
otherwise Northcott's theorem would give infinitely many distinct
bounded-degree numbers of height at most one. The number of roots of unity
of bounded degree is also uniformly bounded. By (3), distinct logarithmic
unit vectors modulo torsion are separated by a fixed positive distance,
independently of \(d\).
Packing separated points into the \(O(m)\)-ball in a real vector space of
dimension at most \(r_{K,S}\) gives

\[
 \#\{u\in\mathcal O_{d,S}^{\times}:h(u)\le C'm\}
   =O_{K,S,C'}(m^{r_{K,S}}).
\tag{4}
\]

Equations (2) and (4) show that each ideal pattern contributes only
polynomially many solutions. Multiplication by the \(\exp(o(m))\) patterns
from Step 1 proves the nonsplit case.

### 3. The split algebra

Suppose that \(d=a^2\) in \(K\). Since \(d\) is an \(S\)-integer, so is
\(a\), and \(h(a)=h(d)/2\). Every solution determines
\[
 \alpha_+=y+av,\qquad \alpha_-=y-av,\qquad
 \alpha_+\alpha_-=N.
\]
Both factors are nonzero \(S\)-integers of height \(O(m)\). The ideal of
\(\alpha_+\) divides the ideal of \(N\), so the small-prime/large-prime
argument from Step 1 gives \(\exp(o(m))\) possible ideal patterns. For a
fixed pattern, two generators differ by an \(S\)-unit of height \(O(m)\).
The logarithmic-vector argument in the fixed field \(K\) gives only
\(m^{O_{K,S,C}(1)}\) such generators. Finally, \(\alpha_+\) determines
\(\alpha_-=N/\alpha_+\), and the pair determines
\[
 y=(\alpha_++\alpha_-)/2,\qquad
 v=(\alpha_+-\alpha_-)/(2a).
\]
Thus solutions inject into the counted choices of \(\alpha_+\), proving the
same subexponential bound in the split case and completing the lemma.

## Application to the fibers of two traces

At one algebraic Fuchsian specialization, pass once to a fixed splitting
field \(K\) for the invariant quaternion algebra and enlarge \(S\) so that
the chosen group generators and their inverses are \(S\)-integral. Word
length \(O(m)\) gives height \(O(m)\) for every matrix entry. Cocompactness
makes a displacement bound \(d_x(o,Ho)\le Cm\) imply word length \(O_C(m)\).

If the fiber with prescribed values \(\xi=\operatorname{tr}H\) and
\(\zeta=\operatorname{tr}(A_mH)\) is nonempty, one member of it shows
\(h(\xi),h(\zeta)=O_C(m)\). Therefore every coefficient and every candidate
coordinate in the eliminated equation

\[
 V^2-\Delta_{A_m}Y^2=N(A_m,\xi,\zeta)
\]

is \(S\)-integral of height \(O_C(m)\). When the right side is nonzero, the
lemma gives \(\exp(o_C(m))\) possibilities. The zero right side must be
handled separately by the Fricke identity: it gives
\(\operatorname{tr}[A_m,H]=2\), hence commutation in a faithful cocompact
Fuchsian group, followed by the cyclic-centralizer argument.

## Audit notes

* The split algebra is treated separately so that field heights, prime ideals,
  and unit lattices are never applied formally to \(K\times K\).
* The uniform unit estimate uses a fixed bound on algebraic degree and a
  fixed base set \(S\); it does not assume a regulator bound for the varying
  quadratic fields.
* The nonempty-fiber observation is needed because \(\xi,\zeta\) are stated
  as arbitrary field elements, although only values represented by a matrix
  need to be counted.
