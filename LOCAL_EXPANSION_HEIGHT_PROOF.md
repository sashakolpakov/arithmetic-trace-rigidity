# The local-expansion functional and its normalizations

This note fixes the field dependence and local normalizations needed in the
focused manuscript.

Let \(K\) be a number field, let \(t\in K\), and normalize every absolute
value to extend the standard absolute value on the corresponding completion
of \(\mathbf Q\). Put \(n_v=[K_v:\mathbf Q_v]\). For each place \(v\), choose
one root \(z_v\) in an algebraic closure of \(K_v\) of

\[
 z+z^{-1}=t^2-2
\]

and define

\[
 \chi_v(t)=\frac12\log\max\{|z_v|_v,|z_v|_v^{-1}\},
 \qquad
 \mathcal J_K(t)=\sum_{v\in M_K}n_v\chi_v(t).
\tag{1}
\]

## Elementary properties

1. The two roots are reciprocal, so \(\chi_v(t)\) is independent of the
   choice of root.
2. Every summand is nonnegative, and \(\mathcal J_K(-t)=\mathcal J_K(t)\).
3. If \(L/K\) is a finite extension containing \(t\), then

   \[
   \mathcal J_L(t)=[L:K]\mathcal J_K(t).
   \tag{2}
   \]

   Indeed, \(\chi_w(t)=\chi_v(t)\) for \(w\mid v\), and the sum of the local
   degrees above \(v\) is
   \([L:K][K_v:\mathbf Q_v]\).

## Comparison with Weil height

With the absolute logarithmic height normalized by

\[
 [K:\mathbf Q]h(t)=
 \sum_v n_v\log^+|t|_v,
\]

one has

\[
 \left|\mathcal J_K(t)-[K:\mathbf Q]h(t)\right|
 \le [K:\mathbf Q]\log2.
\tag{3}
\]

At a nonarchimedean place the two local quantities are equal. If
\(|t|_v\le1\), then \(t^2-2\) is integral and the reciprocal roots are both
units, so \(\chi_v(t)=0\). If \(|t|_v>1\), the Newton polygon gives root
magnitudes \(|t|_v^2\) and \(|t|_v^{-2}\), hence
\(\chi_v(t)=\log|t|_v\).

At an archimedean place choose \(\lambda\) with
\(\lambda+\lambda^{-1}=t\). Then one may take \(z=\lambda^2\), and

\[
 \chi_v(t)=\log\max\{|\lambda|,|\lambda|^{-1}\}.
\]

Writing \(r=\max\{|\lambda|,|\lambda|^{-1}\}\ge1\), the inequalities

\[
 |t|\le r+r^{-1}\le2r,\qquad
 r\le1+|t|\le2\max\{1,|t|\}
\]

show that

\[
 |\chi_v(t)-\log^+|t|_v|\le\log2.
\]

Summing over the archimedean local degrees proves (3).

## Geometric and arithmetic meanings of vanishing

If \(t\) is the trace of a hyperbolic element at the distinguished real
place and

\[
 |t|=2\cosh\frac{\ell}{2},
\]

then \(\lambda=e^{\ell/2}\) may be chosen above, and

\[
 \chi_{v_0}(t)=\frac{\ell}{2}.
\tag{4}
\]

At a finite place,

\[
 \chi_v(t)=0\quad\Longleftrightarrow\quad |t|_v\le1,
\tag{5}
\]

so vanishing at every finite place is exactly algebraic integrality of
\(t\).

At an archimedean place, \(\chi_v(t)=0\) means that \(z\) lies on the unit
circle. Consequently

\[
 t^2-2=z+\bar z\in[-2,2],
\]

so \(t^2\in[0,4]\), \(t\) is real, and \(|t|\le2\). Thus equality between
the total local expansion and the distinguished contribution forces all
nondistinguished conjugates into the interval required by Takeuchi's
criterion.

These observations also explain why the containing field must always be
shown in the notation: (2), not literal equality, is the base-change rule.
