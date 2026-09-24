# Local square-divisibility density for the Chebyshev trace polynomial

Fix \(N\ge3\) and put

\[
 q_0=0,\qquad q_1=1,\qquad q_{j+1}=Tq_j-q_{j-1},\qquad
 F_N=q_{N-1}q_N.
\]

After deleting finitely many rational primes, including every rational prime
\(p<2N(N-1)\), the reduction of \(F_N\) is square-free. Indeed,
\(q_j(T)=U_{j-1}(T/2)\) has simple roots in characteristic zero, and only
finitely many primes divide its discriminant. Consecutive terms remain
coprime because Cassini's identity gives

\[
 q_N^2-q_{N-1}q_{N+1}=1.
\]

Let \(\mathfrak p\) be a good prime of the coefficient field, with residue
cardinality \(q\), and put
\(A=\mathcal O_k/\mathfrak p^2\). Hensel's lemma shows that

\[
 \#\{t\in A:F_N(t)=0\}=O_N(1).
\tag{1}
\]

For every fixed \(t\in A\),

\[
 \#\{g\in\operatorname {SL}_2(A):\operatorname {tr}g=t\}
 \le3q^4.
\tag{2}
\]

To prove (2), choose the upper-left entry \(u\), leaving
\(bc=u(t-u)-1\). Splitting \(b\) according to its valuation gives at most
\(3q^2\) choices for \((b,c)\), and there are \(q^2\) choices for \(u\).
Since

\[
 \#\operatorname {SL}_2(A)=q^6(1-q^{-2}),
\]

(1)--(2) give

\[
 {\#\{g:F_N(\operatorname {tr}g)=0\pmod{\mathfrak p^2}\}
  \over\#\operatorname {SL}_2(A)}
 =O_N(q^{-2}).
\tag{3}
\]

Now let \(p\) be a good rational prime. There are at most
\([k:\mathbf Q]\) primes \(\mathfrak p\mid p\), and
\(N\mathfrak p\ge p\). Strong approximation gives a uniformly
bounded-index congruence image in the product of the good local groups.
Taking the union in (3) therefore yields

\[
 \Pr_{\mathrm{unif}}\!\left(
   \mathfrak p^2\mid F_N(\operatorname {tr}g)
   \text{ for some }\mathfrak p\mid p\right)
 =O_{N,k}(p^{-2}).
\tag{4}
\]

Finally, superapproximation for reduction modulo \(p^2\) gives pointwise
mixing for a lazy walk of length \(L\), uniformly in its starting point. If the finite quotient
has size at most \(p^{B_0}\), its spectral gap gives an error
\(p^B e^{-\delta L}\) after increasing a fixed \(B\). Thus

\[
 \Pr\!\left(
   \mathfrak p^2\mid F_N(\operatorname {tr}(b^mh))
   \text{ for some }\mathfrak p\mid p\right)
 \le C_Np^{-2}+p^Be^{-\delta L}.
\tag{5}
\]

Left multiplication by \(b^m\) merely changes the starting point of the
walk on the finite quotient; it does not change the uniform density (4).
Equation (5) is the local estimate used to select the short perturbations
\(a_m=b^mh_m\) while keeping every recurrence-ideal valuation bounded.
