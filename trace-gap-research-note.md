# Square roots, Galois forms, and trace-growth rigidity

> **Editorial status.** This is the exploratory working note.  Its claims have
> been audited, corrected, and distilled in
> [`paper/trace-gap-companion.pdf`](paper/trace-gap-companion.pdf), with a
> theorem-by-theorem ledger in [`STATUS.md`](STATUS.md).  Cite or circulate the
> companion memorandum rather than this file.  In particular, the literature
> table below is a dated 21 September snapshot and predates the compact result
> claimed in [`paper/compact-trace-rigidity.pdf`](paper/compact-trace-rigidity.pdf).

## Purpose and scope of this dated research note

**Date:** 21 September 2026<br>
**Document reviewed:** Nikolay Bogachev, *Proof of the Positive Trace Gap Conjecture* (local 2026 manuscript)<br>
**Scope:** mathematical explanation, literature status, deductions that follow from the manuscript, and a ranked research program toward bounded clustering and trace-growth rigidity.

### Status labels used below

- **Theorem:** a complete argument is given here, using only standard quoted inputs or results in the manuscript.
- **Conditional theorem:** the conclusion is proved from an explicitly stated quantitative hypothesis.
- **Theorem candidate:** the proof is essentially present, but some standard details concerning classification and local surjectivity should be written and independently checked before publication.
- **Conjecture or proposed program:** plausible, but a genuine new ingredient is missing.

## 1. Summary of the mathematical picture

For a regular element of \(\mathrm{SL}_2\), the square-root map is division by two on a quadratic norm-one torus; equivalently, it is an instance of Hilbert 90. Three properties make this construction especially effective in type \(A_1\):

1. the centralizer of a regular element is a one-dimensional torus;
2. Cayley--Hamilton makes \(g+g^{-1}\) a scalar;
3. the projective square root \([I+g]\) is rational and produces a *linear two-trace identity*.

The formula is

\[
R(g)=\frac{I+g}{\sqrt{\det(I+g)}},\qquad
R(g)^2=g,\qquad
\mu\,\operatorname{tr}(\gamma R(g))
=\operatorname{tr}(\gamma g)+\operatorname{tr}(\gamma),
\]

where \(\mu^2=\operatorname{tr}(g)+2\). The last identity allows Shah's double-coset density theorem to be applied to the algebraic operation of division by two.

A generic conjugation-equivariant rational square-root section, even with values in the adjoint group, does **not** exist for higher-rank simple groups. The character-lattice argument in §5.2 shows that, among simple simply connected groups, such a section exists only in type \(A_1\). Consequently, a higher-rank analogue should be formulated using the following objects rather than a single-valued rational copy of \(R(g)\):

- the finite Kummer cover of the regular universal centralizer;
- the action of Weyl and Galois monodromy on its branches after passage to a cameral cover;
- representation-dependent secant maps such as \(g-I\);
- tuples of characters that detect the Galois action on the Dynkin diagram.

An example of this alternative already appears in the manuscript. In \(\mathrm{SL}_d\), the relevant map is not a square root but

\[
S(g)=g-I,\qquad
\operatorname{tr}(\gamma S(g))
=\operatorname{tr}(\gamma g)-\operatorname{tr}(\gamma).
\]

This map retains the linear trace identity needed for double-coset density. In an outer unitary form, if \(g-I\) commensurated the lattice, it would have to be a unitary similitude. This would force

\[
(g-I)^*(g-I)=2I-g-g^{-1}
\]

to be scalar. For generic \(g\), this fails when \(d\ge3\), providing a criterion that excludes outer forms.

Three statements or principles organize the discussion below, subject to the qualifications given in their respective sections:

1. **Difference-set dichotomy.** In the derived case, not only the trace set but its entire difference set is uniformly discrete, with an explicit bound. In the non-derived case the difference set is dense. This is a stronger additive form of the main theorem.
2. **The \(\mathrm{SL}_d(\mathbb C)\) analogue.** For \(d\ge3\), the argument over \(\mathbb R\) appears to extend as follows: non-dense trace differences force a lattice to come from an order in a central simple algebra over an imaginary quadratic field. A proof, still requiring the independent checks recorded in §6.2, is given below.
3. **An adelic separation principle.** Bounds at the non-distinguished Galois embeddings and at finite places yield, through the product formula, a quantitative bound on clustering at the distinguished place. This gives a common formulation for derived arithmetic, semi-arithmetic, and quasi-arithmetic behavior and places the 2026 results on semi-arithmetic length multiplicities in that formulation.

The square-root method alone does **not** prove Sarnak's bounded-clustering conjecture or Schmutz's compact linear-growth conjecture. The Fricke-extension example in the manuscript explains the obstruction: an arithmetic trace set can be a finite union of uniformly discrete subsets associated with different square classes, even though differences between two such subsets are dense. An extension of the method would therefore need an inverse theorem that recovers this finite decomposition, or an appropriate additive-energy statement; another qualitative density argument would not suffice.

## 2. What the manuscript proves and what remains open

Let \(T(\Gamma)\) denote the set of signed traces of lifts of elements of \(\Gamma\). The manuscript proves, for lattices in \(\mathrm{PSL}_2(\mathbb R)\) or \(\mathrm{PSL}_2(\mathbb C)\),

\[
\Gamma\text{ is derived from an admissible quaternion algebra}
\Longleftrightarrow \operatorname{Gap}T(\Gamma)>0
\Longleftrightarrow \overline{T(\Gamma)-T(\Gamma)}\ne\mathbb F.
\]

For \(\Lambda<\mathrm{SL}_d(\mathbb R)\), \(d\ge3\), it proves

\[
\overline{T_\Lambda-T_\Lambda}\ne\mathbb R
\Longleftrightarrow T_\Lambda\subset\mathbb Z
\Longleftrightarrow
\Lambda\text{ has finite index in }\mathcal O^1
\]

for an order \(\mathcal O\) in a degree-\(d\) central simple algebra over \(\mathbb Q\) split over \(\mathbb R\).

The overline is essential: a countable difference set cannot equal \(\mathbb R\) or \(\mathbb C\). The PDF displays the closure bar, but text extraction loses it. At the first occurrence of this condition, it should therefore also be stated in words as “is not dense.”

Here is the present literature status as of 21 September 2026.

| Problem | Current status |
|---|---|
| Positive trace gap \(\Rightarrow\) derived, for Fuchsian or Kleinian groups | Proved in the reviewed manuscript; Hao had already proved the nonuniform cases. |
| Bounded clustering \(\Rightarrow\) arithmetic, nonuniform Fuchsian | Proved by Geninska--Leuzinger. |
| Linear trace growth \(\Rightarrow\) arithmetic, nonuniform Fuchsian | Proved by Hao, in the stronger form \(N(T)=o(T\log\log\log T)\Rightarrow\) arithmetic. |
| Bounded clustering \(\Rightarrow\) arithmetic, cocompact Fuchsian | Open. |
| Linear trace growth \(\Rightarrow\) arithmetic, cocompact Fuchsian | Open. |
| Generic compact surfaces | Hao (July 2026) proves superlinear trace growth outside a countable union of positive-codimension algebraic loci for genus \(g\ge6\). |
| Semi-arithmetic surfaces, arithmetic dimension \(\le2\) with modular embedding | Belolipetsky--Cosac--Dória--Teixeira Paula prove a weak clustering exponent and exponential mean multiplicity. |
| Semi-arithmetic surfaces of higher arithmetic dimension | A new August 2026 preprint of Zuevsky gives a sufficient strong-contraction condition, but explicitly does not verify that condition for a concrete \(r\ge3\) example. For the purposes of this note, the result remains preliminary. |

The recent compact generic result does not settle the problem for an individual surface in its exceptional set. Hao proves that, for \(g\ge6\), outside a countable algebraic exceptional set,

\[
N_d^*(L)\ge \tau(d)e^{\delta(g)L},\qquad \delta(g)>\tfrac12.
\]

Since \(T\asymp e^{L/2}\), this gives more than \(T^{2\delta(g)}\) distinct primitive trace magnitudes up to \(T\), hence superlinear growth. Thus any compact counterexample to Schmutz in genus at least six must belong to the exceptional set, which is defined by countably many algebraic trace-coincidence conditions.

## 3. The algebro-geometric meaning of \(R(g)\)

### 3.1 Hilbert 90 on the centralizer torus

Let \(g\in\mathrm{SL}_2(k)\) be regular semisimple, and let

\[
E=k[g].
\]

This is a quadratic étale algebra. Its canonical involution is characterized by

\[
\bar g=g^{-1}.
\]

The norm-one torus is

\[
T=\ker\bigl(N_{E/k}:\operatorname{Res}_{E/k}\mathbb G_m\to\mathbb G_m\bigr),
\]

and \(g\in T(k)\). Put \(u=1+g\). Then

\[
\bar u=1+g^{-1}=g^{-1}(1+g),\qquad
\frac{u}{\bar u}=g.
\]

This is the Hilbert--90 identity for the quadratic algebra \(E/k\). Moreover,

\[
N_{E/k}(u)=u\bar u=2+g+g^{-1}
=(2+\operatorname{tr}g)I.
\]

After adjoining a square root of this scalar,

\[
r=\frac{u}{\sqrt{N(u)}}
\]

has norm one and

\[
r^2=\frac{u^2}{u\bar u}=\frac{u}{\bar u}=g.
\]

Thus, after a local branch has been chosen, \(R(g)\) is an inverse to multiplication by two on the norm-one torus.

There is an important rationality nuance. The \(\mathrm{SL}_2\)-valued expression needs \(\sqrt{2+\operatorname{tr}g}\), so it is a two-valued algebraic map. But its projective class

\[
g\longmapsto[I+g]\in\mathrm{PGL}_2
\]

is rational, and

\[
[I+g]^2=[g].
\]

The commensurator argument is projective, so rationality of this projective class is sufficient.

### 3.2 Geometric meaning

For a loxodromic element of \(\mathrm{PSL}_2(\mathbb C)\), the two eigenvalues can be written \(e^{\pm\lambda/2}\), where \(\lambda=\ell+i\theta\) is the complex translation length. The chosen root has eigenvalues \(e^{\pm\lambda/4}\). Thus it:

- preserves the same oriented axis;
- translates by \(\ell/2\);
- rotates by \(\theta/2\).

In \(\mathrm{PSL}_2(\mathbb R)\), it is the half-translation along the same geodesic axis; for elliptic elements it halves the rotation angle, and for parabolics it halves the horocyclic parameter.

Thus the formula expresses the geometric operation of halving translation and rotation in terms of traces.

### 3.3 How the trace identity enters the density argument

The equality

\[
\mu\operatorname{tr}(\gamma R(g))
=\operatorname{tr}(\gamma g)+\operatorname{tr}(\gamma)
\]

says that, after multiplication by the fixed scalar \(\mu\), every trace along the relevant double-coset orbit is a sum of two trace values from the original group. If \(R(g)\) is not in the commensurator, Shah's theorem makes the left side dense. A non-density hypothesis on the right side therefore implies that \(R(g)\) belongs to the commensurator.

Most algebraic square roots do not provide a trace identity involving only two original trace values. The proof uses this linear identity, not merely the existence of square roots.

## 4. Inner and outer forms, with the Galois action made explicit

### 4.1 What a form is

Let \(G_0=\mathrm{SL}_d\) over a field \(k\), and let \(G\) be a \(k\)-form of \(G_0\). Choose an isomorphism over an algebraic closure,

\[
\phi:G_{\bar k}\xrightarrow{\sim}(G_0)_{\bar k}.
\]

For \(\sigma\in\operatorname{Gal}(\bar k/k)\), the failure of \(\phi\) to be Galois invariant is measured by

\[
c_\sigma=\phi\,{}^\sigma\!\phi^{-1}
\in\operatorname{Aut}(G_0)(\bar k).
\]

For \(d\ge3\),

\[
\operatorname{Aut}(\mathrm{SL}_d)
=\mathrm{PGL}_d\rtimes\langle\iota\rangle,\qquad
\iota(g)=(g^{-1})^{\mathsf t}.
\]

Projecting \(c_\sigma\) to the second factor gives the Galois action on the Dynkin diagram \(A_{d-1}\).

- The form is **inner** if this diagram action is trivial. The cocycle takes values in \(\mathrm{PGL}_d\), and the form is
  \[
  G=\mathrm{SL}_1(D)
  \]
  for a central simple algebra \(D/k\) of degree \(d\). Its class is a Brauer class.
- The form is **outer** if the diagram action is nontrivial. It determines a quadratic étale extension \(L/k\), a central simple algebra \(E/L\), and an involution \(*\) of the second kind. The form is a special unitary group
  \[
  G=\mathrm{SU}(E,*).
  \]

Representation-theoretically, the nontrivial diagram automorphism exchanges the standard representation of highest weight \(\omega_1\) with its dual of highest weight \(\omega_{d-1}\).  This is the Galois action that distinguishes the two forms.

### 4.2 A concrete comparison

| Feature | Inner form | Outer form |
|---|---|---|
| Galois action on Dynkin diagram | Trivial | Nontrivial |
| Algebraic datum | Central simple algebra \(D/k\) | Quadratic \(L/k\), algebra \(E/L\), unitary involution \(*\) |
| Group | \(\mathrm{SL}_1(D)\) | \(\mathrm{SU}(E,*)\) |
| Standard representation under Galois | Returns to itself up to conjugacy | Is exchanged with the dual |
| Relevant obstruction | Brauer class | Nontrivial diagram class, together with unitary and Brauer data |
| Criterion used in the manuscript | Normalizer lies in scalars times \(D^\times\) | If \(g-I\) commensurates, it must be a unitary similitude |

Two terms must not be conflated:

- **inner/outer** concerns the algebraic \(k\)-form;
- **derived**, as opposed to **arithmetic but not derived**, concerns the position of a lattice inside the integral points of a fixed form.

Type \(A_1\) has no nontrivial Dynkin-diagram automorphism. Consequently all its forms are inner and are described by quaternion algebras. Nevertheless an arithmetic \(A_1\)-lattice need not itself be contained with finite index in the norm-one group of an order. In rank one, the argument using \(R(g)\) distinguishes a derived lattice from a larger arithmetic lattice through the square classes of its lifts; it does not distinguish inner from outer forms.

### 4.3 How \(g-I\) excludes an outer form

Suppose an arithmetic lattice in \(\mathrm{SL}_d(\mathbb R)\) comes from \(\mathrm{SU}(E,*)\). A matrix \(A\) commensurating a Zariski-dense unitary arithmetic subgroup is, up to a scalar, an element \(b\in E^\times\) satisfying

\[
b^*b\in k^\times.
\]

If trace-difference non-density forced \(g-I\) to commensurate, then \(g-I=tb\), and hence

\[
(g-I)^*(g-I)\quad\text{would be scalar}.
\]

But \(g^*=g^{-1}\), so

\[
(g-I)^*(g-I)
=(g^{-1}-I)(g-I)
=2I-g-g^{-1}.
\]

The conditions \(\det(g-I)\ne0\) and “\(g+g^{-1}\) is not scalar” hold on a nonempty Zariski-open subset of \(\mathrm{SL}_d\). By Borel density, the lattice meets this subset. For such an element \(g\), the preceding scalarity conclusion is impossible, contradicting the assumption that the lattice comes from an outer form.

This also explains the special role of \(d=2\): Cayley--Hamilton gives

\[
g+g^{-1}=(\operatorname{tr}g)I,
\]

so the expression is automatically scalar. This is consistent with the existence of the Hilbert--90 square-root construction in type \(A_1\).

### 4.4 A fixed-element criterion

**Theorem (an element excluding commensuration in an outer form).** Let \(\Lambda\) be an outer arithmetic lattice in \(\mathrm{SL}_d(\mathbb R)\), \(d\ge3\), and let \(\Lambda_0<\Lambda\) be a finite-index subgroup lying in its defining rational unitary group (after the standard arithmetic conjugation). If \(g\in\Lambda_0\) satisfies

\[
\det(g-I)\ne0,\qquad g+g^{-1}\text{ is not scalar},
\]

then \(g-I\) does not commensurate \(\Lambda\), and

\[
\{\operatorname{tr}(\gamma g)-\operatorname{tr}(\gamma):\gamma\in\Lambda\}
\]

is dense in \(\mathbb R\).

**Proof.** For \(g\in\Lambda_0\), the identity \(g^*=g^{-1}\) is justified in the defining unitary algebra. If \(g-I\) commensurated, the unitary-similitude calculation above would make \(2I-g-g^{-1}\) scalar. Thus it does not commensurate. The manuscript's double-coset trace corollary applied to \(A=g-I\) gives density. \(\square\)

Thus any element satisfying the two displayed conditions gives a concrete dense set of trace differences of the form \(\operatorname{tr}(\gamma g)-\operatorname{tr}(\gamma)\).

## 5. Can the square-root map be generalized?

### 5.1 The universal root correspondence

Let \(G\) be a connected reductive group and let \(g\) be regular semisimple. Every square root \(r\) of \(g\) commutes with \(g\), since \(rg=r^3=gr\). Hence the roots live in the centralizer torus

\[
J_g=Z_G(g).
\]

Over an algebraic closure, the fiber of roots is a torsor under the finite group \(J_g[2]\). Globally over the regular semisimple locus one gets a finite Kummer cover

\[
\mathcal R_2=\{(g,r):r^2=g\}\longrightarrow G^{\mathrm{rs}}.
\]

A cameral cover records enough eigenvalue data to remove the Weyl-group ambiguity in the choice of a maximal torus. After passage to this cover, the correspondence above is fiberwise division by two on a torus. Its branches are permuted by the Weyl group and by Galois. Thus the finite cover \(\mathcal R_2\), rather than a single rational branch, is the general algebro-geometric object corresponding to \(R(g)\).

Geometrically, a semisimple element acts on its maximal flat by a translation vector, described by its Jordan or Cartan projection, together with a compact holonomy component. Taking a root divides the translation vector and chooses roots of the compact component. The operation is locally analytic, but usually multivalued and not rational globally.

### 5.2 An obstruction to a rational square-root section

**Theorem.** Let \(G_{\mathrm{sc}}\) be a simple simply connected algebraic group over an algebraically closed field of characteristic different from two, and let

\[
\pi:G_{\mathrm{sc}}\to G_{\mathrm{ad}}
\]

be the adjoint quotient. Suppose there is a conjugation-equivariant rational map on a dense open set,

\[
s:G_{\mathrm{sc}}\dashrightarrow G_{\mathrm{ad}},\qquad
s(g)^2=\pi(g).
\]

Then \(G_{\mathrm{sc}}\) has root system \(A_1\). Conversely, for \(A_1\) such a map exists and is \(s(g)=[I+g]\). For a semisimple product, such a section exists exactly when every simple factor is of type \(A_1\).

The companion manuscript proves a stronger formulation without the
conjugation-equivariance hypothesis. The argument below records the earlier
equivariant formulation.

**Proof.** Choose a maximal torus \(T_{\mathrm{sc}}\). For generic \(t\in T_{\mathrm{sc}}\), equivariance under its centralizer forces \(s(t)\in T_{\mathrm{ad}}\). Let

\[
P=X^*(T_{\mathrm{sc}}),\qquad Q=X^*(T_{\mathrm{ad}})
\]

be the weight and root lattices, with \(Q\subset P\). For every \(\alpha\in Q\),

\[
(s^*\alpha)^2=\pi^*\alpha
\]

in the rational function field of \(T_{\mathrm{sc}}\). After choosing a basis of the character lattice, this is a Laurent rational function field and a character is a Laurent monomial. Its valuations along the coordinate divisors are its exponents, so it can be a square only when all those exponents are even. Equivalently, its exponent lies in \(2P\). Hence

\[
Q\subset2P.
\]

If an irreducible Dynkin diagram has rank at least two, some off-diagonal Cartan entry is \(-1\). The corresponding simple root cannot be twice a weight, so \(Q\not\subset2P\). In type \(A_1\), however, the simple root is \(2\omega\), and Cayley--Hamilton gives

\[
(I+g)^2=(2+\operatorname{tr}g)g,
\]

which proves the converse projectively. \(\square\)

This obstruction is distinct from the theory of Cayley groups. A Cayley map is a conjugation-equivariant birational map between a group and its Lie algebra. Lemire--Popov--Reichstein prove, for example, that \(\mathrm{SL}_n\) is Cayley exactly for \(n\le3\). A Cayley map can still be useful, but it does not provide a rational square-root section; the lattice obstruction above already rules that out for \(\mathrm{SL}_3\).

### 5.3 What can replace it in other groups

Four possible replacements are as follows.

1. **Use the multivalued Kummer cover.** Work with the finite correspondence \(r^m=g\), its monodromy, and fields of definition rather than demanding a single rational branch.
2. **Use a secant map in a representation.** Seek a rational expression \(S_\rho(g)\in\mathrm{GL}(V_\rho)\) for which \(\operatorname{tr}(\rho(\gamma)S_\rho(g))\) is a short linear combination of character values. The manuscript's \(g-I\) is the basic example.
3. **Use representations that jointly detect diagram automorphisms.** A diagram automorphism may move a single representation. One can instead take the entire orbit of its highest weight and use the resulting tuple of characters.
4. **Use a Cayley, Jordan, or Clifford transform.** For orthogonal and symplectic groups, the Cayley transform converts the group condition into a skew-adjoint Lie-algebra condition. For spin groups, Clifford norms may distinguish forms, although a general rotor has non-scalar norm data and therefore no \(A_1\)-style two-trace identity.

For the last representation-theoretic strategy, examples to examine include:

- type \(A_{d-1}\): standard and dual representations;
- type \(D_n\): the two half-spin representations;
- type \(D_4\): vector and both half-spin representations, because of triality;
- type \(E_6\): the \(27\)-dimensional representation and its dual.

These examples motivate the following conjecture.

**Schematic conjecture (joint characters detect inner forms).** Let \(G\) be absolutely almost simple and let \(\{V_i\}\) be a set of representations whose highest weights have trivial common stabilizer in \(\operatorname{Out}(G)\). For an arithmetic lattice in a distinguished real factor, sufficiently strong non-density or uniform-discreteness of the joint character-difference set

\[
\bigl\{(\chi_i(\gamma g)-\chi_i(\gamma))_i:\gamma,g\in\Gamma\bigr\}
\]

forces the defining \(k\)-form to be inner.

This is a programmatic criterion, not yet a theorem-level conjecture: a
quantitative meaning of “sufficiently strong” remains to be specified.

The calculation with \(g-I\) in the manuscript proves the type-\(A\) instance for the standard representation.

## 6. Deductions from the reviewed manuscript

### 6.1 Additive dichotomy for trace differences

**Theorem.** Let \(\Gamma<\mathrm{PSL}_2(\mathbb F)\), where \(\mathbb F=\mathbb R\) or \(\mathbb C\), be a lattice, and put \(D=T(\Gamma)-T(\Gamma)\).

- If \(\Gamma\) is not derived from a quaternion algebra, then \(D\) is dense in \(\mathbb F\).
- If \(\Gamma\) is derived from an admissible quaternion algebra over a degree-\(n\) field, then \(D\) is uniformly discrete. More precisely,
  \[
  \operatorname{Gap}(D)\ge
  \begin{cases}
  8^{1-n},&\mathbb F=\mathbb R,\\[2mm]
  8^{1-n/2},&\mathbb F=\mathbb C.
  \end{cases}
  \]

**Proof.** Density in the non-derived case is the main theorem. In the derived case, take distinct

\[
x=t_1-t_2,\qquad y=t_3-t_4
\]

in \(D\). Then

\[
z=x-y=t_1-t_2-t_3+t_4
\]

is a nonzero algebraic integer. At every compact real embedding of the defining field, each conjugate trace has absolute value at most two, hence \(|\sigma(z)|\le8\). In the real case the norm inequality gives

\[
1\le |N_{k/\mathbb Q}(z)|
\le |z|8^{n-1}.
\]

In the complex case there are \(n-2\) real compact embeddings and the distinguished complex place occurs with multiplicity two, so

\[
1\le |z|^2 8^{n-2}.
\]

These are the claimed bounds. \(\square\)

More generally, if \(\Sigma_q\) is any fixed signed \(q\)-fold trace sumset, then

\[
\operatorname{Gap}(\Sigma_q)\ge
\begin{cases}
(4q)^{1-n},&\mathbb F=\mathbb R,\\[1mm]
(4q)^{1-n/2},&\mathbb F=\mathbb C.
\end{cases}
\]

Thus, in the derived case, every signed sumset of a fixed order is uniformly discrete; in the non-derived case, the first difference set is already dense. This resembles one property of a Meyer set, but relative density (a uniform bound on the distance from any ambient point to the set) has not been established. The theorem therefore does not assert that the trace set is a Meyer set.

### 6.2 A complex higher-rank theorem

**Theorem (extension to \(\mathrm{SL}_d(\mathbb C)\)).** Let \(d\ge3\), let \(\Lambda<\mathrm{SL}_d(\mathbb C)\) be a lattice, and put

\[
T_\Lambda=\{\operatorname{tr}g:g\in\Lambda\}.
\]

The following are equivalent:

1. After conjugation, \(\Lambda\) has finite index in \(\mathcal O^1\), where \(\mathcal O\) is an order in a central simple algebra \(D/K\) of degree \(d\), \(K\) is imaginary quadratic, and
   \[
   D\otimes_{K}\mathbb C\simeq M_d(\mathbb C).
   \]
2. \(T_\Lambda\subset\mathcal O_K\) for an imaginary quadratic field \(K\).
3. \(T_\Lambda\) has positive Euclidean gap.
4. \(\overline{T_\Lambda-T_\Lambda}\ne\mathbb C\).

In this case \(\operatorname{Gap}(T_\Lambda)\ge1\).

**Proof.** If (1) holds, reduced traces of elements of the order lie in \(\mathcal O_K\), which gives (2). If (2) holds and \(t_1\ne t_2\), then \(0\ne t_1-t_2\in\mathcal O_K\), so
\[
|t_1-t_2|^2=|N_{K/\mathbb Q}(t_1-t_2)|\ge1.
\]
This proves (3), and a set with positive gap has a non-dense difference set, giving (4).

Assume (4). The manuscript's Corollary 2.2 is already stated for \(\mathbb F=\mathbb C\). Therefore, for every \(g\in\Lambda\) with \(\det(g-I)\ne0\), the matrix \(g-I\) must commensurate \(\Lambda\); otherwise

\[
\{\operatorname{tr}(\gamma(g-I)):\gamma\in\Lambda\}
\subset T_\Lambda-T_\Lambda
\]

would be dense in \(\mathbb C\).

Since the real rank of \(\mathrm{SL}_d(\mathbb C)\) is \(d-1\ge2\), Margulis arithmeticity applies. Its type-\(A\) arithmetic constructions are inner central-simple-algebra forms and outer unitary forms. To exclude the outer form, use Borel density to choose \(g\) for which \(g-I\) is invertible and \(g+g^{-1}\) is nonscalar. If \(g-I\) commensurated the lattice, it would be, up to a complex scalar, an element \(b\) of the unitary algebra with \(b^*b\) central. Hence \((g-I)^*(g-I)=2I-g-g^{-1}\) would be scalar, a contradiction.

Thus the arithmetic class is inner, defined by a central simple algebra \(D/k\). An inner type-\(A_{d-1}\) group at a complex place is \(\mathrm{SL}_d(\mathbb C)\), hence noncompact. At a real place it is either \(\mathrm{SL}_d(\mathbb R)\) or, when \(d\) is even, \(\mathrm{SL}_{d/2}(\mathbb H)\). For \(d\ge3\), both are noncompact. Arithmeticity of a lattice in one simple factor permits only one noncompact archimedean place. Consequently \(k\) has no real places and exactly one complex place, so \(k=K\) is imaginary quadratic.

It remains to place the whole lattice in \(D^1\), rather than merely in its commensurability class. The normalizer calculation used over \(\mathbb R\) depends only on the central-simple-algebra structure and applies over \(\mathbb C\) as well. A commensurating matrix has the form \(sb\), with \(s\in\mathbb C^\times\) and \(b\in D^\times\). Apply this to both \(g\) and \(g-I\):

\[
g=sb,\qquad g-I=tc,\qquad b,c\in D^\times.
\]

If \(g\) is nonscalar, then \(b\) and \(I\) are linearly independent over \(K\). Rewriting the two displayed equations as

\[
c=(s/t)b-(1/t)I
\]

and comparing the coefficients of \(b\) and \(I\) in a \(K\)-basis of \(D\) gives \(s/t,1/t\in K\), hence \(g\in D^1\). Let \(U\) be the nonempty Zariski-open subset on which this argument applies. For an arbitrary \(h\in\Lambda\), Zariski density supplies \(x\in\Lambda\cap U\cap h^{-1}U\). Then \(x,hx\in D^1\), so \(h=(hx)x^{-1}\in D^1\). This two-open-set argument is necessary because the countable subset \(D\subset M_d(\mathbb C)\) is not closed in the complex Zariski topology.

Let \(\mathcal O_0\) be an order whose norm-one group is commensurable with \(\Lambda\). A positive power of every \(g\in\Lambda\) lies in \(\mathcal O_0^1\); hence the eigenvalues of \(g\), and therefore \(\operatorname{Trd}(g)\), are algebraic integers. Since \(g\in D\), this gives \(\operatorname{tr}g\in\mathcal O_K\). Choose \(d^2\) elements of \(\Lambda\) forming a \(K\)-basis of \(D\). Nondegeneracy of the reduced-trace pairing and Cramer's rule put all \(\mathcal O_K\)-coordinates of \(\Lambda\) in one fractional ideal. Thus

\[
\mathcal O=\operatorname{span}_{\mathcal O_K}\Lambda
\]

is an order. Its norm-one group is discrete and contains the lattice \(\Lambda\), so the index is finite. \(\square\)

This extension was not found in the searched literature. It uses standard results on arithmeticity and the classification of forms, but it should receive an independent expert check before any claim of novelty is made.

### 6.3 Roots in the commensurator force rank-one arithmeticity

The hypothesis that roots lie in the commensurator has the following consequence for any rank-one isometry group.

**Theorem.** Let \(\Gamma\) be a finite-volume lattice in a connected simple rank-one isometry group, and fix \(m\ge2\). Suppose that every primitive axial element \(\gamma\in\Gamma\) has an \(m\)-th root in \(\operatorname{Comm}(\Gamma)\). Then \(\Gamma\) is arithmetic.

**Proof.** If \(\Gamma\) were nonarithmetic, the commensurator theorem would make \(\Delta=\operatorname{Comm}(\Gamma)\) a discrete lattice containing \(\Gamma\) with finite index. If \(r^m=\gamma\), then the translation lengths satisfy \(\ell(r)=\ell(\gamma)/m\). A single \(\Delta\)-conjugacy class splits into at most \([\Delta:\Gamma]\) many \(\Gamma\)-conjugacy classes. Therefore the number of primitive \(\Gamma\)-classes of length at most \(mR\) would be bounded by a constant times the number of all \(\Delta\)-classes of length at most \(R\). The prime geodesic theorem gives respective exponential rates \(e^{hmR}\) and \(e^{hR}\), where \(h>0\) is the volume entropy. These rates are incompatible when \(m\ge2\). \(\square\)

For \(\mathrm{PSL}_2\), the trace identity is used to show that square roots lie in the commensurator. For another rank-one group, an analogous argument would need to establish the root hypothesis of this theorem.

### 6.4 An adelic separation lemma

**Theorem.** Let \(k\) be a number field, let \(v_0\) be a distinguished archimedean place, and normalize absolute values so that

\[
\prod_v |z|_v^{n_v}=1\qquad(z\in k^\times),
\]

where \(n_v\) is the usual local degree (in particular, \(n_v=1\) at a real place and \(n_v=2\) at a complex place). Suppose \(S_T\subset k\) is a family with \(|x|_{v_0}\le T\). Assume that, for every distinct \(x,y\in S_T\),

\[
|x-y|_v\le C_vT^{a_v}\qquad(v\ne v_0),
\]

with \(a_v=0\) for all but finitely many places and with \(|x-y|_v\le1\) at all remaining finite places. Put

\[
A=\sum_{v\ne v_0}n_va_v.
\]

Then

\[
|x-y|_{v_0}\ge cT^{-A/n_{v_0}}.
\]

**Proof.** Apply the product formula to \(x-y\):

\[
1=\prod_v|x-y|_v^{n_v}
\le |x-y|_{v_0}^{n_{v_0}}CT^A,
\]

where \(C\) is the fixed product of the finitely many constants \(C_v^{n_v}\). Rearranging proves the assertion. \(\square\)

For a distinguished real place this implies

\[
\#(S_T\cap[N,N+1])=O(T^A),\qquad
\#(S_T\cap[-T,T])=O(T^{1+A}).
\]

For a distinguished complex place, packing in the plane gives \(O(T^A)\) points in a fixed unit disk and \(O(T^{2+A})\) in a disk of radius \(T\).

The hypotheses of the lemma take different forms in the following classes.

| Class | Other archimedean embeddings | Behavior at finite places | Consequence at the distinguished place |
|---|---|---|---|
| Derived arithmetic | The corresponding groups are compact, so conjugate traces are bounded | Integrality bounds all finite-place absolute values | \(A=0\), hence a positive gap |
| Arithmetic, not derived | Traces are bounded separately on finitely many square-class components | Finite-place absolute values are bounded within each component | Each component is uniformly discrete, although differences between components may be dense |
| Proper semi-arithmetic | Some conjugate groups are split, and the corresponding traces grow | Integrality bounds all finite-place absolute values | Separation deteriorates at a polynomial rate |
| Proper quasi-arithmetic | Admissibility makes the other archimedean groups compact | Denominators may grow at finitely many places | Clustering is controlled by the resulting \(p\)-adic growth |
| Generic nonarithmetic | No global field is available to supply the required product formula | No corresponding bounds are available | Near-quadratic trace growth is expected |

This is why **semi-arithmetic** and **quasi-arithmetic** should not be used synonymously.

- Semi-arithmeticity keeps algebraic integrality but permits several unbounded real embeddings; its arithmetic dimension counts them.
- Quasi-arithmeticity keeps an admissible algebraic group, hence compact non-distinguished archimedean geometry, but drops the integral-lattice condition.

They relax different parts of the definition of arithmeticity. In the present trace-growth discussion, gradual deterioration as more Galois conjugates become unbounded is principally a semi-arithmetic phenomenon. Quasi-arithmeticity instead enters through denominator growth at finite places, which can be measured in Bruhat--Tits buildings.

### 6.5 Conditional trace-growth theorem for semi-arithmetic groups

Let \(\Gamma\) be derived from a semi-arithmetic quaternion algebra over a totally real field. Suppose its visible traces of size \(T\) satisfy, at the unbounded nonidentity embeddings,

\[
|\sigma_i(\operatorname{tr}\gamma)|\le C_iT^{\alpha_i},\qquad i=2,\dots,r.
\]

Compact embeddings contribute exponent zero. Put

\[
A=\sum_{i=2}^r\alpha_i.
\]

The adelic lemma gives

\[
\operatorname{Gap}\bigl(T(\Gamma)\cap[-T,T]\bigr)\gg T^{-A},
\]

and hence

\[
\#\{t\in T(\Gamma):|t|\le T\}=O(T^{1+A}).
\]

If \(A<1\), then with \(T\asymp e^{L/2}\), the number of distinct lengths at most \(L\) is at most

\[
e^{(1+A)L/2+O(1)}.
\]

Comparing with the prime geodesic theorem gives exponential mean multiplicity with exponent at least

\[
\frac{1-A}{2}
\]

up to polynomial factors.

This is a conditional theorem rather than a heuristic. Its unproved geometric hypothesis is the asserted bound on each conjugate-trace exponent \(\alpha_i\).

- For arithmetic dimension two, Belolipetsky--Cosac--Dória--Teixeira Paula use a modular embedding and Schwarz--Pick to obtain \(\alpha_2=1-\delta<1\), hence local clustering \(O(T^{1-\delta})\) and total trace growth \(O(T^{2-\delta})\).
- Zuevsky's August 2026 preprint proposes a multidimensional version. Its crude combined exponent is \((r-1)^{3/2}(1-\delta)\), and a refined geometry-of-numbers argument gives the sufficient threshold
  \[
  \delta>1-\frac{1}{\sqrt2(r-1)}.
  \]
  The paper itself stresses that this condition has not yet been verified for a specific \(r\ge3\) example.

The statement obtained from the product formula depends on the individual slopes rather than on a common worst-case slope. A possible refinement is therefore to estimate the sum of the Lyapunov or stretch exponents directly, instead of bounding every factor by the largest one.

## 7. Arithmetic trace sets as finite unions of discrete coset subsets

The Fricke example

\[
T=2\mathbb Z\cup\sqrt2\,\mathbb Z
\]

illustrates a general feature of arithmetic trace sets that are not derived from an order.

Let \(\Gamma\) be an arithmetic Fuchsian group and choose a finite-index derived subgroup \(H\). There are finitely many cosets \(a_iH\). Vinberg's normalizer description writes a lift of each \(a_i\), projectively, as

\[
a_i=s_i b_i,\qquad b_i\in B^\times,\qquad s_i^2\in k^\times.
\]

For \(h\in H\),

\[
\operatorname{tr}(a_ih)=s_i\operatorname{Trd}(b_ih).
\]

After clearing one fixed denominator for each \(i\), the second factor lies in a fractional ideal of \(k\), while all non-distinguished archimedean conjugates remain bounded. Thus the traces contributed by each coset form a uniformly discrete subset. Consequently:

**Proposition.** The trace set of every arithmetic Fuchsian lattice is a finite union of uniformly discrete subsets indexed by the finitely many cosets, or equivalently by the relevant square classes. This implies bounded clustering. The union need not be uniformly discrete, because differences between two distinct subsets can be dense.

The ordinary trace field is correspondingly a finite multiquadratic extension of the invariant trace field: every trace satisfies

\[
(\operatorname{tr}g)^2=\operatorname{tr}(g^2)+2\in k_\Gamma,
\]

and the finitely many cosets supply finitely many square classes.

This separates two different arithmetic questions.

1. The Galois class in \(H^1(k,\operatorname{Out}G)\), determined by the action on the Dynkin diagram, distinguishes inner from outer forms.
2. The square classes arising from central extensions distinguish a lattice derived from an order from a larger arithmetic normalizer.

In type \(A_1\), the first issue does not arise because every form is inner. In higher type \(A\), the argument using \(g-I\) rules out an outer form, and the subsequent order argument proves that the lattice is derived.

## 8. Why the present method stops short of bounded clustering

A positive gap fails as soon as there is a sequence of nonzero trace differences tending to zero. Bounded clustering permits such pairs: it requires only that every unit interval contain a uniformly bounded number of *distinct* trace values.

The double-coset theorem says that when \(A\) fails to commensurate,

\[
\{\operatorname{tr}(\gamma A):\gamma\in\Gamma\}
\]

is dense. With \(A=R(g)\) or \(g-I\), this produces a dense set of linear combinations involving a bounded number of traces. It does not produce many individual trace values in the same unit interval. The Fricke example shows why: two uniformly discrete subsets can have a dense set of differences between them.

Demanding simultaneous density for several \(A_i\) meets a further geometric obstruction. Products in a common double orbit have fixed relative invariants such as \(A_iA_j^{-1}\) up to conjugacy, so the orbit is generally not dense in an unrestricted product. A proof would need either a joining classification for the relevant orbit or an additive-combinatorial theorem that converts density of these combinations into many individual traces in a bounded interval.

The compact case also lacks the unipotent elements used in the nonuniform proofs. Hao's nonuniform theorem uses left and right multiplication by parabolics to construct trace sets of positive density and then exclude denominators. A compact proof would need another source of comparably large, algebraically related families of traces.

## 9. Candidate results and possible methods

### 9.1 Ranked theorem list

1. **Complex higher-rank trace-gap theorem.** The \(\mathrm{SL}_d(\mathbb C)\) theorem in §6.2.<br>
   **Status:** theorem modulo independent checking of standard classification details.<br>
   **Potential significance:** an extension to complex lattices, with the additional conclusion that the defining field is imaginary quadratic.

2. **Additive trace dichotomy.** Difference sets and all fixed signed sumsets are uniformly discrete in the derived case; the first difference set is dense otherwise.<br>
   **Status:** theorem.<br>
   **Potential significance:** this follows directly from the norm argument and strengthens the positive-gap conclusion to every fixed signed sumset.

3. **Quaternionic trace-gap theorem, including rank one.** For \(m\ge2\), a lattice in \(\mathrm{SL}_m(\mathbb H)\), measured using reduced trace, has non-dense trace differences iff it has finite index in the norm-one group of an order in a central simple \(\mathbb Q\)-algebra whose real completion is \(M_m(\mathbb H)\).<br>
   **Status:** theorem; the complete argument is in §7 of the companion memorandum, using Shah's orbit-closure theorem and standard arithmetic-form and commensurator inputs. For \(m=2\), secant accumulation supplies arithmeticity.<br>
   **Publication check:** independent expert verification of the standard global classification inputs is still recommended before claiming priority.

4. **Adelic trace-clustering bound.** The clustering exponent at the distinguished place is at most the sum of the normalized growth exponents at all non-distinguished archimedean and finite places.<br>
   **Status:** conditional theorem in §6.4; the product-formula part is proved.<br>
   **Potential significance:** a common product-formula statement for arithmetic, semi-arithmetic, quasi-arithmetic, and \(S\)-arithmetic groups.

5. **Sum-of-slopes theorem for semi-arithmetic groups.** For a generalized modular embedding, the relevant exponent is the sum of the actual conjugate displacement slopes, and is strictly below one precisely when exponential mean multiplicity follows.<br>
   **Status:** plausible refinement of the 2026 papers.<br>
   **Missing step:** prove a strict bound on the *sum* of slopes, rather than separate worst-case bounds.

6. **Finite-decomposition converse to Sarnak.** If a cocompact Fuchsian trace set has bounded clustering, then it admits a finite decomposition into uniformly discrete algebraic subsets, and the permutation of these subsets factors through the finite Kummer quotient \(\Gamma/\Gamma^{(2)}\), where \(\Gamma^{(2)}\) is the subgroup generated by the squares of elements of \(\Gamma\). This would imply arithmeticity by Takeuchi/Vinberg.<br>
   **Status:** conjectural; this is a structural reformulation of the bounded-clustering problem.

7. **Arithmeticity criterion based on additive energy.** If the trace set of a cocompact Fuchsian lattice has linear growth, the Fricke identities force sufficiently high additive and multiplicative energy that the trace set is contained in finitely many fractional ideals of a number field.<br>
   **Status:** conjectural.<br>
   **Consequence if proved:** Schmutz's compact conjecture, and likely the bounded-clustering conjecture as well.

8. **Joint-character criterion for inner forms.** Sparse joint character sets in a family of representations whose highest weights detect every nontrivial diagram automorphism force an arithmetic form to be inner.<br>
   **Status:** proved for split type \(A\) in the manuscript's standard representation; conjectural for \(D_n\) and \(E_6\).

9. **Quantitative counting outside the commensurator.** If \(A\notin\operatorname{Comm}(\Gamma)\), quantitative mixing of \(\Gamma A\Gamma\), combined with trace-polynomial identities, produces not just density of a trace combination but a lower bound for its local counting function.<br>
   **Status:** conjectural.<br>
   **Consequence if proved:** a connection between the present qualitative density theorem and bounded clustering.

10. **Trace identities that place roots in the commensurator.** For rank-one groups other than \(\mathrm{PSL}_2\), construct a representation-theoretic or Clifford-theoretic identity that forces roots of exponentially many primitive elements into the commensurator under a spectral sparsity hypothesis.<br>
    **Status:** the final arithmeticity implication is proved in §6.3; constructing the identity is open.

### 9.2 Technique list

1. Ratner--Shah double-coset orbit closure and quantitative mixing.
2. Fricke--Klein trace identities and character varieties.
3. Additive combinatorics: Freiman theory, sum-product, approximate rings, and Balog--Szemerédi--Gowers amplification.
4. Product formula, geometry of numbers, and height inequalities.
5. Bruhat--Tits buildings and finite-place displacement/denominator growth.
6. Modular embeddings, Schwarz--Pick contraction, and Lyapunov exponents.
7. Universal centralizers, cameral covers, and Kummer torsors.
8. Galois cohomology of forms, Tits algebras, and minuscule representations.
9. Prime geodesic theorems and thermodynamic formalism.
10. Weak commensurability and generic maximal tori in the sense of Prasad--Rapinchuk.
11. Strong approximation and reduction modulo primes.
12. Algebraic trace-equivalence loci in Teichmüller/character space, as in Hao's 2026 work.

### 9.3 Possible combinations of problems and methods

| Target | Possible methods | Initial question | Main obstruction |
|---|---|---|---|
| Cocompact bounded clustering \(\Rightarrow\) arithmetic | Trace identities + additive energy + quantitative double-coset mixing | Determine whether bounded clustering gives high energy for \(T_T=T\cap[-T,T]\), and whether an approximate-ring theorem then applies | Dense sumsets need not create crowded trace intervals |
| Compact linear growth \(\Rightarrow\) arithmetic | Fricke character algebra + sum-product + Takeuchi criterion | Use \(\operatorname{tr}(AB)+\operatorname{tr}(AB^{-1})=\operatorname{tr}A\operatorname{tr}B\) to force small product sets | Control is along correlated group words, not arbitrary pairs |
| Higher semi-arithmetic dimensions | Modular embeddings + Lyapunov spectrum + product formula | Bound \(\sum_i\ell(\gamma^{\sigma_i})/\ell(\gamma)\) directly | Coordinatewise Schwarz--Pick loses too much in high dimension |
| Quasi-arithmetic clustering | Bruhat--Tits displacement + product formula | Define exponents measuring denominator growth at each finite place and relate them to visible trace height | Denominator height need not be controlled by real length without extra hypotheses |
| Outer forms in \(D_n,E_6\) | Tits algebras + minuscule character tuples + secant maps | Compute the analogue of \((g-I)^*(g-I)\) in representations belonging to an orbit of the outer automorphism group | No universal two-term character identity is known |
| Rank-one groups beyond dimensions 2 and 3 | Clifford algebra + root-commensurator theorem + prime geodesic counts | Identify a large class of simple rotors whose half-rotors have character formulas involving few terms | General holonomy makes the Clifford norm noncentral |
| Effective bounds for gaps and clustering | Quantitative versions of Shah's theorem or mixing, together with height theory | Bound the first close trace pair in terms of covolume and height | Existing orbit-closure input is qualitative |
| Identify exceptional compact surfaces | Hao's algebraic loci + arithmetic geometry | Intersect trace-coincidence loci with low-growth loci and study their special subvarieties | Countably many identities and possible hidden special loci |

## 10. A proposed program toward Sarnak and Schmutz

The preceding results suggest the following sequence of questions. Each stage remains conjectural unless explicitly stated otherwise.

### Stage I: prove an arithmetic finite-decomposition theorem

For \(T_X=T(\Gamma)\cap[-X,X]\), bounded clustering gives \(|T_X|=O(X)\). Trace identities give many relations of the form

\[
z_{AB}+z_{AB^{-1}}=z_Az_B.
\]

For a finite set \(A\), its additive and multiplicative energies count the solutions of

\[
a+b=c+d
\qquad\text{and}\qquad
ab=cd,
\]

respectively, with \(a,b,c,d\in A\). The aim is to show that a linearly growing trace set supporting the Fricke relations has many such solutions. One would then seek an inverse theorem from sum-product theory: a set with enough additive and multiplicative structure should be largely contained in boundedly many affine copies of fractional ideals, viewed as rank-one modules over an order in a number field. A statement compatible as \(X\) grows would produce the finite coset decomposition described in §7.

The desired intermediate statement is:

**Schematic conjectural inverse theorem.** Let \(\Gamma<\mathrm{SL}_2(\mathbb R)\) be Zariski dense. If \(|T_X|=O(X)\), then there are a number field \(k\), finitely many square classes \(s_i^2\in k\), and fractional ideals \(I_i\subset k\) such that, for all sufficiently large \(X\),

\[
T_X\subset\bigcup_{i=1}^m s_iI_i
\]

with every nonidentity archimedean embedding uniformly bounded on the subsets arising from the group trace relations.

The last condition is intentionally schematic: a precise conjecture must
specify both the subsets selected by the trace relations and a uniform bound
for their nonidentity embeddings.

Takeuchi's criterion would then imply arithmeticity.

### Stage II: combine several trace differences

The first secant identity has a higher-order version. For ordered \(g_1,\dots,g_m\),

\[
\operatorname{tr}\!\left(\gamma\prod_{i=1}^m(g_i-I)\right)
=\sum_{S\subseteq\{1,\dots,m\}}
(-1)^{m-|S|}
\operatorname{tr}\!\left(\gamma\prod_{i\in S}^{\longrightarrow}g_i\right).
\]

If the product of the matrices \(g_i-I\) is outside the commensurator, then, as \(\gamma\) varies, the collection of \(2^m\)-term signed combinations on the right is dense. Density alone is insufficient. An application of higher-order additive combinatorics would require many such configurations in which the same lower-order combinations recur when some of the \(g_i\) are omitted. One would then seek to deduce that a bounded interval contains increasingly many individual trace values.

### Stage III: exploit compact symbolic dynamics

Parabolic multiplication produces the large related families of traces used in the noncompact case. In the compact case, a Schottky subgroup and its symbolic coding might provide analogous families. The required family of words would have to satisfy all of the following:

- traces satisfy a controlled recurrence;
- the word count is exponential;
- the number of distinct trace values is small relative to the number of words only if the recurrence coefficients satisfy algebraic relations.

Hao's character-variety method shows that universal trace coincidences in carefully chosen families have bounded fibers away from algebraic exceptional loci. The fixed-surface problem is to determine the algebraic structure of a point in the exceptional locus. This suggests using methods from unlikely intersections, which study subvarieties containing more points subject to independent algebraic constraints than dimension considerations predict.

### Stage IV: identify arithmetic special loci

Hao's exceptional set is a countable union of trace-coincidence subvarieties. A possible arithmetic-geometric strengthening is:

**Conjecture.** Any irreducible positive-dimensional locus in Teichmüller/character space on which trace growth remains linear is a special locus arising from an arithmetic or semi-arithmetic construction.

Even a version restricted to algebraic curves in character space would reduce the exceptional cases left by the generic 2026 theorem to a classification problem for special subvarieties.

## 11. Recommendations for the manuscript

1. Add the Hilbert--90 explanation of \(R(g)\), which identifies the formula with division by two on the norm-one torus.
2. Explicitly say that \([I+g]\), rather than the normalized \(\mathrm{SL}_2\)-valued branch, is the rational projective map.
3. Add the difference-set dichotomy and the fixed \(q\)-fold sumset bounds. They are short corollaries and strengthen the additive conclusion.
4. Consider adding the \(\mathrm{SL}_d(\mathbb C)\) theorem, after the independent checks noted in §6.2. Its proof uses the same principal steps as the real argument and additionally identifies the defining field as imaginary quadratic.
5. Present the outer-form argument as a Galois-descent obstruction: the standard representation is exchanged with its dual, and the Hermitian norm of \(g-I\) fails to be scalar.
6. Separate “inner/outer” from “derived/arithmetic.” This will prevent readers from attributing the rank-one conclusion to an outer-form issue that cannot occur in \(A_1\).
7. Update the literature discussion with:
   - Hao's strengthened nonuniform theorem and July 2026 compact generic theorem;
   - the 2026 published semi-arithmetic multiplicity theorem;
   - the August 2026 higher-arithmetic-dimension preprint, with its stated caveat.
8. Use “semi-arithmetic,” not “quasi-arithmetic,” for the hierarchy based on additional split Galois embeddings. Reserve “quasi-arithmetic” for admissible rational forms without integrality.
9. Mention the rational square-root obstruction, which shows why a single rational map analogous to \(R(g)\) cannot exist in most simple groups.
10. Wherever the condition is typeset as \(\overline{T-T}\ne\mathbb F\), append “that is, \(T-T\) is not dense.” The closure bar may be lost when text is extracted from a PDF.

## 12. Mathematical summary

The conceptual meaning of the map \(R(g)\) is division by two on the quadratic norm-one torus \(k[g]^1\): with \(u=1+g\), Hilbert 90 gives \(u/\bar u=g\), while \(u\bar u=2+\operatorname{tr}g\), so \(u/\sqrt{u\bar u}\) squares to \(g\). Projectively, \([I+g]\) is a rational square-root section. A character-lattice argument shows that this property is restricted to type \(A_1\): a generic equivariant rational square-root section \(G_{sc}\dashrightarrow G_{ad}\) can exist only when every simple factor is \(A_1\).

In higher type \(A\), the map \(g\mapsto g-I\) retains the required linear trace identity. It excludes outer forms because Galois exchanges the standard representation with its dual; in unitary notation, if \(g-I\) commensurated the lattice, it would have scalar norm, but

\[
(g-I)^*(g-I)=2-g-g^{-1}
\]

is nonscalar on a Zariski-open set. Subject to the checks recorded in §6.2, the same argument appears to prove the following statement for lattices in \(\mathrm{SL}_d(\mathbb C)\), \(d\ge3\): non-dense trace differences are equivalent to finite index in the norm-one group of an order in a central simple algebra over an imaginary quadratic field.

The norm argument also gives the following strengthening: for a derived Fuchsian or Kleinian lattice, the whole difference set \(T-T\) is uniformly discrete, with gap at least \(8^{1-n}\) in the real case and \(8^{1-n/2}\) in the complex case; otherwise \(T-T\) is dense.

For bounded clustering, the obstruction is the manuscript's Fricke example. Arithmetic trace sets are finite unions of uniformly discrete subsets associated with square classes, although differences between distinct subsets can be dense. Thus a further theorem would have to recover such a finite decomposition, perhaps through additive energy, rather than rely only on one-variable density. The 2026 semi-arithmetic multiplicity results support an adelic formulation in which each additional split Galois embedding contributes a trace-clustering exponent; for quasi-arithmetic groups, denominator growth at finite places should contribute analogous \(p\)-adic exponents.

## 13. Primary literature and useful entry points

### Trace growth and arithmeticity

- N. Bogachev, *Proof of the Positive Trace Gap Conjecture* ([PDF](paper/positive-trace-gap.pdf); [TeX](paper/positive-trace-gap.tex)).
- P. Sarnak, [*Arithmetic Quantum Chaos*](https://web.math.princeton.edu/sarnak/Arithmetic%20Quantum%20Chaos.pdf), especially the bounded-clustering discussion.
- W. Luo and P. Sarnak, [*Number variance for arithmetic hyperbolic surfaces*](https://doi.org/10.1007/BF02099785).
- P. Schmutz, [*Arithmetic groups and the length spectrum of Riemann surfaces*](https://archive.mpim-bonn.mpg.de/id/eprint/1283/), the source of the linear-growth and positive-gap formulations.
- S. Geninska and E. Leuzinger, [*A geometric characterization of arithmetic Fuchsian groups*](https://arxiv.org/abs/math/0609477).
- Y. Hao, [*Bounded clustering property characterizes arithmetic nonuniform Kleinian groups*](https://arxiv.org/abs/2303.01395).
- Y. Hao, [*On trace sets of hyperbolic surfaces and a conjecture of Sarnak and Schmutz*](https://arxiv.org/abs/2410.05223), published online in *Groups, Geometry, and Dynamics*, DOI [10.4171/GGD/932](https://doi.org/10.4171/GGD/932).
- Y. Hao, [*On the length sets of closed hyperbolic surfaces*](https://arxiv.org/abs/2607.20808), July 2026 preprint.
- K. Takeuchi, [*A characterization of arithmetic Fuchsian groups*](https://doi.org/10.2969/jmsj/02740600).

### Semi-arithmetic and quasi-arithmetic directions

- P. Schmutz Schaller and J. Wolfart, [*Semi-Arithmetic Fuchsian Groups and Modular Embeddings*](https://doi.org/10.1112/S0024610799008315).
- M. Belolipetsky, G. Cosac, C. Dória, and G. Teixeira Paula, [*Geometry and arithmetic of semi-arithmetic Fuchsian groups*](https://arxiv.org/abs/2310.13151).
- M. Belolipetsky, G. Cosac, C. Dória, and G. Teixeira Paula, [*On multiplicities in length spectra of semi-arithmetic hyperbolic surfaces*](https://arxiv.org/abs/2507.00211), published in *Communications in Mathematical Physics*, DOI [10.1007/s00220-026-05581-w](https://doi.org/10.1007/s00220-026-05581-w).
- A. Zuevsky, [*Exponential Growth of Mean Multiplicities in Length Spectra of Semi-Arithmetic Surfaces of Arbitrary Arithmetic Dimension*](https://arxiv.org/abs/2608.17604), August 2026 preprint; higher-dimensional conclusions require the stated strong-contraction hypothesis.
- S. Thomson, [*Quasi-arithmeticity of lattices in \(\mathrm{PO}(n,1)\)*](https://arxiv.org/abs/1412.4961).

### Algebraic groups, dynamics, and related rigidity

- N. Lemire, V. Popov, and Z. Reichstein, [*Cayley groups*](https://arxiv.org/abs/math/0409004).
- N. Shah, [orbit-closure results for actions of subgroups generated by unipotents](https://arxiv.org/abs/math/0002183), the source of the double-coset dichotomy used in the manuscript.
- G. Prasad and A. Rapinchuk, [*Weakly commensurable arithmetic groups, lengths of closed geodesics and isospectral locally symmetric spaces*](https://arxiv.org/abs/0705.2891).
- D. Witte Morris, [*Introduction to Arithmetic Groups*](https://arxiv.org/abs/math/0106063).
- D. Dolgopyat and D. Jakobson, [*On small gaps in the length spectrum*](https://arxiv.org/abs/1602.04532).
- Y. Hao, [*Marked length pattern rigidity for arithmetic manifolds*](https://arxiv.org/abs/2206.01336).

## 14. Conclusion

The square-root formula identifies three structures: division on the regular centralizer, Galois descent, and a character identity involving only two traces. In type \(A_1\), these structures are represented by the explicit matrix \(I+g\). In higher rank, the centralizer cover remains, but a rational square-root section generally does not. The matrix \(g-I\) is still useful in type \(A\) because it preserves a two-term trace identity, and the failure of its unitary norm to be scalar excludes outer forms.

The proposed sequence of implications is:

\[
\text{division maps on regular centralizers and their Kummer covers}
\;\longrightarrow\;
\text{trace identities that force roots or secants into the commensurator}
\;\longrightarrow\;
\text{product-formula bounds on trace separation}
\;\longrightarrow\;
\text{an inverse theorem recovering a finite algebraic decomposition}.
\]

Sections 3--6 establish versions of the first three steps, with the qualifications and conditional hypotheses stated there. The missing step is an inverse theorem that converts trace sparsity into the finite algebraic decomposition needed for the cocompact bounded-clustering and linear-growth conjectures.
