# Future research goals around trace rigidity and Sarnak's programs

**Literature status checked:** 22 September 2026<br>
**Principal source inside this repository:**
[*Kummer Division, Polynomial Secants, and Trace Rigidity*](./paper/trace-gap-companion.pdf)

## Purpose and status

This document is a prioritized research plan, not a theorem announcement.  It identifies
open problems in Peter Sarnak's work, work with his collaborators, and closely
adjacent programs for which the methods developed in the companion manuscript
suggest a specific intermediate theorem.  Every entry distinguishes:

1. the open problem found in the literature;
2. a smaller first theorem that the present methods might realistically prove;
3. the part of the manuscript that is relevant;
4. the mathematical step that is still missing; and
5. a short, falsifiable initial test.

The list deliberately excludes famous problems for which the only connection
is thematic.  A shared occurrence of traces, hyperbolic geometry, or arithmetic
groups is not by itself evidence that the manuscript's methods apply.

The compact Fuchsian Sarnak and Schmutz conjectures are not listed as future
conjectures: the focused manuscript claims unconditional proofs. Their next
step is independent mathematical verification, repair of any issues found in
that verification, and publication.  Until that process is complete, those
claims should be described as results of the present manuscripts rather than
as established literature.

## Meaning of the scores

Two scores are kept separate because an important problem can be remote, while
a tractable problem can be comparatively narrow.

- **Proximity** measures how much of a credible first theorem is already
  supplied by the manuscript.  A score of 5 means that the remaining work is a
  sharply defined argument; 3 means that one substantial additional argument
  or theorem is required; 1 means that the present methods offer, at most, a
  useful reformulation.
- **Significance** measures the mathematical impact of a successful result.  It
  does not measure likelihood.

When the full conjecture is much harder than the proposed first theorem, both
proximity scores are stated.  None of the numerical scores is a probability.

## Methods from the companion manuscript

The proposals below use the following substantive components of the companion
manuscript.

- The Hilbert--90 interpretation of the projective square-root map, Kummer
  division torsors, and the classification of rational generic root sections.
- Polynomial secants and trace coordinates that distinguish inner and outer
  forms of type \(A\).
- Finite-type divisor bounds for trace maps and uniform bounds for fibers of
  fixed and moving two-trace maps.
- Chebyshev recurrences for

  \[
  \operatorname{Tr}(A^nB),
  \]

  together with simultaneous recurrence control and local ranks of
  apparition.
- The sieve that selects a moving element while imposing a fixed square
  divisor, bounds for recurrence exponents, superapproximation for ideals with
  bounded prime exponents, and the injection obtained by combining two
  congruence relations.
- Schemes defined by trace collisions that persist along a family,
  birationality and unramifiedness of restriction maps, and specialization of
  trace identities.
- Lower bounds for local heights, the product formula, descent to proper
  integral models, and recovery of an order in a central simple algebra.
- Kummer square classes, gradings by Galois signs, and vectors of traces in
  finite quotients.
- Adelic comparison of all embeddings and the distinction between trace data
  at one real place and trace data over the full defining field.

These methods are strongest when a problem can be reduced to uniform control of
one or two algebraic trace coordinates over a family of group elements.  They
are weaker when the desired conclusion requires analytic cancellation,
positive representation counts, an unrestricted unit action, or recovery of
rotational phase from real length alone.

### Scope of these methods

The proximity scores are conditional on the companion's stated results
surviving independent verification.  They also account for a distinction that
is easy to miss:

- the Hilbert--90 and Kummer constructions, polynomial secants, finite-type
  divisor bounds, and local algebra/order descent do not depend on the
  surface-group setting;
- the argument that combines two congruence relations, the comparison of
  exponential growth rates, lattice-point counting, and several results about
  restriction maps on persistent collision loci are proved in a surface-group
  setting and must be reproved when the ambient group or geometry changes.

Thus a statement below that the manuscript is relevant means that it supplies
specific arguments and intermediate results.  It does not mean that every
cited theorem applies unchanged to the new problem.

## Priority ranking

The order below is not the product of the two scores.  It gives precedence to
problems that are important, currently open, and directly related to the
methods of the manuscript. A related direction suggested by these
methods—classification of Hao's exceptional trace-collision loci—is treated
inside Goal 8 but is not given a separate rank because it is not a named
literature conjecture.

| Priority | Research target | Proximity of first theorem | Proximity of full problem | Significance | Recommendation |
|---:|---|---:|---:|---:|---|
| 1 | Arithmeticity from trace growth for Kleinian groups; higher dimensions later | 3.5 | 2.5 | 5 | Begin with the cocompact algebraic \(\mathrm{PSL}_2(\mathbb C)\) case. |
| 2 | Arbitrary-ideal superapproximation for twisted groups of type \(A_1\) | 3.5 | 3 | 5 | Compare with existing theorems, then study mixed ideals in one quadratic form. |
| 3 | Spectral expansion of the Markoff graphs | 3 for nonconcentration | 2.5--3 | 5 | First state and prove a precise escape estimate. |
| 4 | Deciding whether a matrix in \(\mathrm{SL}_2\) over a ring of \(S\)-integers is a commutator | 3 | 2.5 | 4 | Start with regular semisimple data over \(\mathbb Z[1/p]\). |
| 5 | Marklof's conjecture on gaps in the complex length spectrum of compact arithmetic hyperbolic 3-orbifolds | 2.5 | 2 | 4 | First relate local trace representation to complex-length gaps precisely. |
| 6 | Strong approximation and Nielsen transitivity on generic Markoff levels | 3 | 2.5 | 4.5 | Seek a trace-fiber bound for all non-generating orbits. |
| 7 | Restricted Chebotarev with growing finite targets | 2.5 | 2 | 4 | Begin with regular semisimple trace classes in congruence targets. |
| 8 | Stable trace classes of words in \(F_2\) | 2.5 | 2 | 3 | Formulate the substitution problem precisely before applying results on collision loci. |
| 9 | Corrected local-global problem for Apollonian packings | 2.5 for obstructions | 2 | 5 | First recover the known thin-orbit reciprocity cocycle. |
| 10 | Ghosh--Sarnak Markoff class numbers | 2.5--3 for an improved bound | 2 | 4 | Target a density-one subpower bound or any pointwise exponent saving. |
| 11 | Hooley's count of closed geodesics ordered by discriminant | 3 for new fiber bounds | 2.5 | 4.5 | Combine quadratic norm fibers with recent root-packet ideas. |
| 12 | A quantitative gap above linear Fuchsian trace growth | 3 | 3 | 3 | Repeat the manuscript's exponent calculation with \(T^{1+\eta}\). |
| 13 | Arithmeticity from the real length set of a cusped hyperbolic 3-manifold | 2.5 | 2 | 5 | First quantify the loss of rotational holonomy. |
| 14 | Effective division bounds for metric-graph secular hypersurfaces | 2.5--3 | 2.5 | 2.5--3 | First isolate the effective form of Mordell--Lang that is needed. |
| 15 | Exponential mean multiplicity for semi-arithmetic groups of arithmetic dimension at least 3 | 2.5 for explicit examples | 2 | 4 | Test the simultaneous exponent inequalities for all embeddings in dimension 3. |
| 16 | Arithmeticity from length progressions | 2 | 1.5--2 | 4 | Determine whether persistent progressions force a torus or commensurator family. |
| 17 | Frobenius--Markoff uniqueness | 1.5--2 | 1.5 | 5 | Treat this as a longer-term problem about isolated trace collisions. |

### The most accessible targets

The most plausible near-term advances are:

1. a Kleinian trace-growth theorem for an algebraic cocompact lattice;
2. arbitrary-ideal superapproximation for mixed ideals in a restricted
   quadratic twisted \(A_1\) setting, provided comparison with existing
   theorems confirms that it is not already covered by known results;
3. uniform escape and trace-fiber nonconcentration for Markoff walks;
4. a generic commutator-decision theorem over \(\mathbb Z[1/p]\);
5. classification of positive-dimensional components of the exceptional
   trace-collision locus in Hao's generic length-set theorem;
6. a quantitative trace-growth gap for cocompact Fuchsian groups, if the
   existing exponent inequalities retain a strictly positive margin;
7. new uniform fibers for the discriminant-ordered geodesic problem; and
8. effective division bounds for metric-graph secular hypersurfaces.

### The most significant targets

The problems of greatest potential significance in this area are:

1. the Kleinian or higher-dimensional analogue of trace-growth arithmeticity;
2. arbitrary-ideal superapproximation for twisted restriction-of-scalars
   groups;
3. spectral expansion of the Markoff graphs;
4. arithmeticity from the real length set of a finite-volume hyperbolic
   3-manifold;
5. the corrected Apollonian local-global conjecture;
6. Frobenius--Markoff uniqueness; and
7. optimal prime-point results for affine orbits.

Several entries on this list—notably real-length arithmeticity,
Frobenius--Markoff uniqueness, corrected Apollonian local-global, and optimal
prime points—are much farther from the current methods than the first three.
They should not displace projects with higher proximity scores merely because
their ultimate statements are famous.

## Detailed goals

### 1. Arithmeticity from trace growth for Kleinian groups, followed by higher dimensions

**Literature problem.**  Hao's [Problem 1.7](https://arxiv.org/html/2410.05223)
asks for analogues of his trace-growth theorems for Kleinian groups and for
higher-dimensional Kleinian groups with a suitable trace observable.  The
nonuniform bounded-clustering and positive-gap questions for Kleinian groups
were already treated in Hao's
[earlier paper](https://arxiv.org/html/2303.01395); the open problem here is a
global trace-growth criterion, especially in the cocompact case.

Trace itself is not a function on \(\mathrm{PSL}_2(\mathbb C)\).  For a
projective element \(\gamma\), choose a lift \(\widetilde\gamma\) and write

\[
\operatorname{ptr}(\gamma)
  =\{\operatorname{tr}\widetilde\gamma,
      -\operatorname{tr}\widetilde\gamma\}.
\]

This unordered pair, its modulus, and
\(\operatorname{tr}^2\widetilde\gamma\) are independent of the lift.  The
notation \(|\operatorname{ptr}(\gamma)|\) below means
\(|\operatorname{tr}\widetilde\gamma|\).  The natural provisional Kleinian
analogue is that at most quadratic growth of the projective complex trace set,

\[
D_\Gamma^{\mathrm{proj}}(T)
 =\#\{\operatorname{ptr}(\gamma):
       |\operatorname{ptr}(\gamma)|\leq T\}
 =O(T^2),
\]

forces arithmeticity.  This precise normalization is a proposed formulation,
not a quotation from Hao.  Equivalently, one can count squared traces in the
disk of radius \(T^2\).

**Relevant results from the manuscript.**  The moving two-trace fiber theorem,
the reduced-divisor form of Roth, bounded-power superapproximation, and the
argument combining two congruence relations already provide the ingredients
for an arithmeticity proof.  Descent to a proper integral model is intended to
recover a quaternion order once all non-geometric places are controlled.  In
the algebraic Kleinian case, the final structural
criterion should be supplied by the standard arithmetic characterization of
Kleinian lattices rather than Takeuchi's Fuchsian criterion.

**First theorem to pursue.**  Let \(\Gamma<\mathrm{PSL}_2(\mathbb C)\) be a
cocompact algebraic lattice for which the necessary uniform lattice-point
counting estimate holds.  Prove that
\(D_\Gamma^{\mathrm{proj}}(T)=O(T^2)\) forces the invariant trace field and
quaternion algebra to satisfy the arithmetic Kleinian conditions.
Only after checking the coefficients in the exponent inequalities should one
formulate a theorem
for infinite-covolume geometrically finite deformation spaces or for higher
dimensions.  Finite-volume Kleinian lattices are locally rigid, so the
part of the surface argument that treats transcendental Teichmüller points has
no direct finite-volume analogue here.

**What remains to prove.**  The surface proof must be recalibrated for one
complex place, hence real dimension two in the trace plane.  It also needs a uniform
coset-counting theorem for balls in \(\mathrm{PSL}_2(\mathbb C)\).  The
critical issue is whether the growth rate of the lattice-point count still
exceeds the upper bound for the number of trace values after every coefficient
is doubled.  This cannot be settled by analogy alone.

**Initial test.**  Rewrite every exponent inequality in the proof that combines
two congruence relations, using critical exponent \(2\) and at most \(O(T^2)\)
trace values.  Test it first for one algebraic compact Kleinian lattice, both
symbolically and on congruence data.  A strictly positive final margin supports
continuing the project; a zero or negative coefficient identifies the
additional estimate or argument that is required.

**Scores:** proximity 3.5/5 for the algebraic first theorem, 2.5/5 for the
general problem; significance 5/5.

### 2. Arbitrary-ideal superapproximation for twisted groups of type \(A_1\)

**Research target.**  Let \(k\) be a number field, \(B/k\) a quaternion
algebra, \(S\) a finite set of places, and

\[
\Delta<\mathrm{SL}_1(B)(\mathcal O_{k,S})
\]

a finitely generated Zariski-dense subgroup.  Prove a spectral gap, uniform in
every ideal prime to \(S\), for the Cayley graphs of the reduction images of
\(\Delta\).

This is an auxiliary theorem rather than a conjecture bearing Sarnak's name,
but it belongs directly to the thin-group and superapproximation program in
[Sarnak's notes](https://publications.ias.edu/sites/default/files/NotesOnThinGroups%20final.pdf).
Known results include bounded powers of square-free moduli and important split
cases; see [Salehi Golsefidy, Super-approximation II](https://arxiv.org/abs/1602.00409),
[Salehi Golsefidy--Zhang, Inducing Super-Approximation](https://arxiv.org/abs/1802.03561),
and [Tang--Zhang](https://arxiv.org/abs/2308.09982) for arbitrary moduli in
\(\mathrm{SL}_2\times\mathrm{SL}_2\) and \(\mathrm{ASL}_2\).
Salehi Golsefidy's theorem already includes arbitrary powers of one prime
when the connected Zariski closure is perfect.  Prime powers are therefore a
known starting case to verify in the chosen integral model, not the intended
novelty.

**Relevant results from the manuscript.**  The companion already isolates this
theorem as an alternative approach to trace arithmeticity.  Its two-trace
nonconcentration theorem, divisor bounds on proper integral models, analysis
with a fixed square divisor, injection obtained from two congruence relations,
and gradings by Galois signs arising from Kummer theory provide information
that is usually external to a flattening argument.  In particular, the
gradings can detect diagonal coupling between Galois-conjugate factors.

**First theorem to pursue.**  First determine exactly whether a quadratic
restriction-of-scalars example is already covered, after a faithful rational
representation, by the existing prime-power, induction, or Tang--Zhang
theorems.  If it is not, take \(k/\mathbb Q\) quadratic, let \(B\) split at
exactly the required archimedean place, and prove uniform expansion for mixed
ideals supported on residue-degree-one primes whose exponents vary
independently.  Prime-power expansion is the known starting case.  The new
theorem must control products of different prime powers and the coupling of
their Galois-conjugate factors.

**What remains to prove.**  One needs a mixed-modulus flattening argument and a
proof that a measure cannot concentrate on a Goursat subgroup coupling
conjugate simple factors.  Kummer characters can detect abelian square-class gradings;
they do not, by themselves, exclude a nonabelian diagonal coupling.
Prime-level strong approximation and separate expansion of the marginal
factors do not imply the required mixed statement.

**Initial test.**  For a quadratic example from the surface manuscript, compare
its hypotheses with the precise hypotheses and conclusions of the cited
expansion theorems.  Then calculate the full reduction image and all possible
Goursat subgroups at split primes.  Determine which proper diagonal couplings are
excluded by the two-trace map and which require an argument using the
nonabelian structure.

**Scores:** proximity 3.5/5 for the restricted first theorem, 3/5 for every
prime-to-\(S\) ideal; significance 5/5.

### 3. Spectral expansion of the Markoff graphs

**Literature problem.**  Bourgain--Gamburd--Sarnak ask whether the cubic graphs
on

\[
X^*(p)=\{(x,y,z)\ne(0,0,0):x^2+y^2+z^2=xyz\}
\]

generated by the three Vieta involutions form an expander family.  Their
[Markoff paper](https://publications.ias.edu/sites/default/files/MarkoffDiophantine%20.pdf)
established a giant component; Chen's divisibility theorem, combined with
their work, gives connectivity for all sufficiently large primes.  The 2026
[sharp connectivity preprint](https://arxiv.org/abs/2608.07880) proves
2-connectivity and explicitly records expansion as open.

**Relevant results from the manuscript.**  Fixing the first coordinate \(x\), a Markoff
rotation acts on the other two coordinates by

\[
\begin{pmatrix}0&1\\-1&x\end{pmatrix}.
\]

This matrix has determinant one and trace \(x\), so all of its iterates are
governed by exactly the Chebyshev recurrence used in the companion.  The
moving two-trace fiber theorem, simultaneous recurrence bounds, injection from
two congruence relations, and Kummer distinction between split and nonsplit
tori are therefore directly relevant to the recurrence estimates in the
Bourgain--Gamburd--Sarnak conic decomposition.

**First theorem to pursue.**  Formulate the simple random walk generated by
the three Vieta involutions on the giant component \(C_p\).  For a density-one
set of primes, seek constants \(C,\eta,\eta_0,\kappa>0\) and an explicitly defined
exceptional union \(E_p\) of rotation cycles of size below \(p^\kappa\) such
that

\[
|E_p|\ll p^{2-\eta_0}
\]

and, for every subvariety \(Y\) of the Markoff surface of degree bounded
independently of \(p\), containing no full Markoff orbit,

\[
\sup_{v\in C_p\setminus E_p}
\Pr_v[X_{\lceil C\log p\rceil}\in Y(\mathbb F_p)]
 \leq p^{-\eta}.
\]

One should first prove this for fixed trace fibers and low-order rotation
loci.  The exact treatment of starting points and short periodic orbits is
part of the theorem; “escape from algebraic subsets” without those
quantifiers is not a usable statement.  No result with these uniform
quantifiers was located in the literature search; such a nonconcentration
estimate would remain useful even if it did not imply a spectral gap.

**What remains to prove.**  A Markoff graph is a nonlinear permutation graph, not a
Cayley graph of a finite group.  Full expansion still requires a flattening or
product-growth theorem for the permutation action, quasirandomness of the
relevant representation, and control of transitions between different conic
sections.

**Initial test.**  Prove the desired escape estimate when the large
prime divisors of \(p^2-1\) satisfy a prescribed factorization condition.  The
recurrence order on each conic can then be controlled directly.  Failure even
under that favorable hypothesis would show that the two-trace methods do not
address the missing part of the expansion argument.

**Scores:** proximity 3/5 for uniform nonconcentration, 2.5--3/5 for full
expansion; significance 5/5.

### 4. Deciding commutators over rings of \(S\)-integers

**Literature problem.**  Ghosh--Meiri--Sarnak reduce

\[
[X,Y]=Z
\]

in \(\mathrm{SL}_2\) to integral points on the Markoff surface

\[
x^2+y^2+z^2-xyz=\operatorname{Tr}(Z)+2,
\quad
(x,y,z)=(\operatorname{Tr}X,\operatorname{Tr}Y,
\operatorname{Tr}XY).
\]

Their paper [*Commutators in \(\mathrm{SL}_2\) and Markoff surfaces I*](https://arxiv.org/abs/2110.11030)
describes a subsequent problem: decide whether a given element of
\(\mathrm{SL}_2(D)\) is a commutator when the \(S\)-integer ring \(D\) has
infinitely many units.  No posted sequel was located in this search.

**Relevant results from the manuscript.**  For fixed \(Z\), the map

\[
Y\longmapsto
(\operatorname{Tr}Y,\operatorname{Tr}(ZY))
\]

is exactly a two-trace map.  The algebraic reason is

\[
[X,Y]=Z
\quad\Longleftrightarrow\quad
XYX^{-1}=ZY.
\]

Consequently \(\operatorname{Tr}Y=\operatorname{Tr}(ZY)\) is necessary and,
for regular semisimple matrices over an algebraic closure, generically
sufficient for conjugacy.  It is not sufficient over the ring \(D\):
integral conjugacy, the determinant of a conjugator, and lifting to the
prescribed \(Z\)-class are separate arithmetic obstructions.  Kummer square
classes can describe part of this lifting ambiguity; local heights may
control escape in unit directions; and descent to a proper integral model may
replace an infinite search by finitely many local models.

**First theorem to pursue.**  For \(D=\mathbb Z[1/p]\) and generic regular
semisimple \(Z\), give an effective algorithm that either detects an explicit
reciprocity obstruction or searches a provably bounded height range and
returns a commutator decomposition.

**What remains to prove.**  The main missing statement is a height bound modulo the
infinite unit action.  One must also prove that the proposed Kummer or
Brauer--Manin obstruction is complete in the stated generic range; detecting
some obstructions is not a decision procedure.

**Initial test.**  Put the Markoff cubic into a fundamental domain for
the \(S\)-unit action, and calculate whether the manuscript's local-height
escape gives a height bound for all points outside the explicit reciprocity
classes.  Do this first for one prime \(p\) and one Zariski-open family of
traces of \(Z\).

**Scores:** proximity 3/5 for the generic first theorem, 2.5/5 for the full
decision problem; significance 4/5.

### 5. Marklof's conjecture on gaps in the complex length spectrum

**Literature problem.**  For an arithmetic Kleinian group arising from a
quaternion order, Marklof defines \(\mathcal G(x)\) by counting gaps in the
complex length spectrum up to complex length \(\ell=\log x\), and conjectures

\[
\mathcal G(x)=\kappa x+o(x),
\]

where \(\kappa\geq0\), and perhaps \(\kappa=0\).  The conjecture and its known
Bianchi case are restated as Conjecture 9 in
[*Counting Salem Numbers of Arithmetic Hyperbolic 3-Orbifolds*](https://pmc.ncbi.nlm.nih.gov/articles/PMC9132364/);
the [original paper](https://people.maths.bris.ac.uk/~majm/bib/multi.pdf)
contains Marklof's formulation.  In the quaternion-order model, complex
lengths are encoded by eigenvalues and hence by traces of norm-one elements.
Marklof compares the represented trace set with an explicitly defined
admissible ambient set.  That trace/order translation is an ingredient of his
analysis; it should not be silently taken as the definition of
\(\mathcal G(x)\).

**Relevant results from the manuscript.**  Descent of orders, trace ideals,
vectors of traces in finite quotients, superapproximation, and finite-type
divisor bounds all address
the representation of trace values by norm-one elements.  The problem is a
natural arithmetic counterpart to the manuscript's trace-occurrence results.

**First theorem to pursue.**  For one compact arithmetic hyperbolic
3-orbifold of small quaternion discriminant, define the admissible trace set
exactly and classify the local or spinor-selectivity obstructions to
representing its elements by norm-one elements.  Then prove a quantitative
upper bound for the contribution of the classified obstructions to
\(\mathcal G(x)\).  A zero-density theorem for all remaining gaps is a second
step, not part of the initial classification.

**What remains to prove.**  Counting traces that occur is not the same as
counting complex-length gaps.  One must relate the two counts precisely and
prove a sufficiently uniform local-global or selectivity theorem for the
norm-one equation with a power-saving exceptional set.

**Initial test.**  Enumerate admissible traces and norm-one solutions
in a single small-discriminant compact quaternion order, then compare the
resulting complex lengths with Marklof's gap count.  Classify the observed
misses by local residue data without treating finite computation as evidence
of completeness.  A positive density of unexplained misses would show that
bounded-power congruence information is insufficient.

**Scores:** proximity 2.5/5 for an obstruction theorem, 2/5 for Marklof's full
asymptotic; significance 4/5.

### 6. Strong approximation and Nielsen transitivity on generic Markoff levels

**Literature problem.**  On

\[
M_k:x^2+y^2+z^2-xyz-2=k,
\]

one expects the large generating pairs of \(\mathrm{SL}_2(\mathbb F_p)\) with
fixed commutator trace to lie in one Nielsen orbit, apart from explicitly
classifiable exceptional orbits.  A precise modern formulation appears in
[Campos-Vargas](https://arxiv.org/abs/2508.21671).  This is a more appropriate
open problem than ordinary Markoff connectivity, which is already known for
all sufficiently large primes.

**Relevant results from the manuscript.**  The trace triple is the coordinate
system of the relative character variety.  Kummer root data can separate
lifting classes, while uniform two-trace fibers and vectors of traces in
finite quotients can bound exceptional families across congruence levels that
fail to generate.

**First theorem to pursue.**  Uniformly in generic \(k\), prove that the union
of all non-generating Nielsen orbits has \(o(p^2)\) points, with an explicit
power saving outside a finite list of discriminant classes.

**What remains to prove.**  A small exceptional set need not consist of one
orbit.  To deduce transitivity one needs a general-level analogue of Chen's
orbit-size divisibility theorem, or a different argument showing that two
large generating orbits must merge.

**Initial test.**  For many primes and generic levels, compute the
orbit decomposition together with the Kummer square class and two-trace fiber
of every exceptional orbit.  Determine whether all observed exceptions are
explained by a fixed finite list of algebraic subgroups.

**Scores:** proximity 3/5 for the exceptional-set theorem, 2.5/5 for
transitivity; significance 4.5/5.

### 7. Restricted Chebotarev with growing finite targets

**Literature direction.**  Sarnak's 2025 lectures on
[restricted Chebotarev theorems](https://publications.ias.edu/node/2739)
study Frobenius or finite-quotient data when primitive geodesics are restricted,
especially to simple geodesics.  For a fixed finite quotient the limiting
distribution is governed by the relevant Nielsen or \(T\)-system component.
Uniformity as the congruence target grows is the natural next arithmetic
question.  A compact-target analogue for \(\mathrm{SU}(2)\) is more ambitious.

**Possible relevance of the manuscript.**  Near-uniform distribution of trace
values in finite quotients, trace growth on each component, the argument that
combines two congruence relations, and gradings arising from Kummer square
classes are useful when the observable is trace.  Restricted Chebotarev,
however, concerns element or conjugacy-class data inside mapping-class-group
orbits.  Trace is only a coarse class function.  In
\(\mathrm{SL}_2(\mathbb F_q)\) it comes closest to full class data on the
regular semisimple locus, which is therefore the proper starting point.

**First theorem to pursue.**  Establish an effective restricted Chebotarev
theorem only for regular semisimple trace classes in
\(\mathrm{SL}_2\)-congruence targets whose size grows as a small power of the
length cutoff, first for a fixed topological type of simple curve and for
square-free levels.  Extending the result from trace classes to arbitrary
conjugacy classes requires a separate theorem.

**What remains to prove.**  One must combine trace congruence expansion with
uniform counting of simple curves in mapping-class-group orbits.  Passing from
growing finite targets to \(\mathrm{SU}(2)\) additionally requires quantitative
finite-to-compact approximation and control of the mapping-class action; it
does not follow formally from finite quotient equidistribution.

**Initial test.**  Write the error terms from the available count of simple
curves and from the manuscript's distribution estimate for trace values modulo
an ideal, with explicit dependence on the ideal norm.  Determine the largest
exponent for which the main term remains positive.

**Scores:** proximity 2.5/5 for slowly growing finite targets, 2/5 for the
compact-target analogue; significance 4/5.

### 8. Stable trace classes of words in a free group

**Literature conjecture.**  Ginzburg--Rudnick conjecture that a word in
\(F_2\) admitting no nontrivial substitution decomposition has only the
canonical stable trace companions: inversion, conjugacy, and their
trace-preserving reversal involution.  Their formulation appears in
[Conjecture 1 of the original paper](https://www.math.tau.ac.il/~rudnick/papers/ginzburg-rudnick.pdf);
[Anderson's account](https://eprints.soton.ac.uk/29876/1/horowitz.pdf) explains
the relation to Horowitz trace classes.

Here two words are stable trace companions when their traces agree for every
representation \(F_2\to\mathrm{SL}_2(\mathbb C)\), equivalently when their
Fricke trace polynomials are equal.

**Limited relevance of the manuscript.**  Equality of two Fricke
polynomials is a universal trace identity, so its collision locus is the
entire character variety.  Moreover, words form a discrete set, so the phrase
“positive-dimensional family of words” has no defined meaning here.  The
manuscript's results about trace identities that persist along an algebraic
family therefore do not apply directly.  The useful common language is instead
the algebraic self-map of the \(F_2\) character variety induced by a pair of
substitution words, together with polynomial factorization of trace functions.

**First theorem to pursue.**  For a pair of words \(a,b\), let
\(F_{a,b}:\mathbb A^3\to\mathbb A^3\) be the polynomial map on Fricke
coordinates induced by the substitution \(A\mapsto a,\ B\mapsto b\).  Under
explicit dominance and no-cancellation hypotheses, prove that a fixed word
trace polynomial \(P_w\) has only finitely many Nielsen-equivalence classes of
nontrivial word-induced factorizations

\[
P_w=P_v\circ F_{a,b}
\]

and give an effective degree bound and enumeration procedure.  Each such
factorization exhibits the substitution-decomposable representative
\(v(a,b)\) in the stable trace class of \(w\).  It does not imply that
\(w=v(a,b)\) in \(F_2\); identifying the word itself requires an additional
theorem that recovers a word from its trace data.

**What remains to prove.**  Two converses remain: derive a common
word-induced factorization from an equality \(P_w=P_u\), and determine when
trace equivalence to \(v(a,b)\) forces literal substitution decomposition of
\(w\).  The companion's finite-fiber estimates and its results about trace
identities that persist along a family do not currently do either.

**Initial test.**  Enumerate cyclically reduced words through length
14 or 16, compute their Fricke polynomials in
\(\mathbb Q[\operatorname{tr}A,\operatorname{tr}B,
\operatorname{tr}AB]\), quotient by canonical symmetries, and apply an exact
algorithm for detecting substitution decompositions to every collision class.  A single prime
word with a noncanonical companion disproves the conjecture; otherwise the
factorization data should indicate how to formulate the required implication.

This computation is valuable independently of the manuscript and should not
be counted as evidence for the geometric approach until that implication is
formulated.

**Scores:** proximity 2.5/5 for a structural reduction, 2/5 for the full
conjecture; significance 3/5.

#### A geometric problem more directly addressed by the manuscript

There is a related problem to which the manuscript's results on collision loci
apply much more directly.  In Hao's recent
[length-set preprint](https://arxiv.org/html/2607.20808), accidental squared
trace coincidences are removed by excluding a countable union of proper
algebraic subsets of Teichmüller space.  One can ask to classify the
positive-dimensional irreducible components of those coincidence loci and to
separate components forced by universal word identities, surface symmetries,
or covering constructions from components not forced by any such relation.

Here the words are fixed and the representation varies, so results on
persistent collision loci, birationality and unramifiedness of restriction
maps, and the two-evaluation theorem apply to this setting.  A first theorem
would
classify all such components for pairs of words lying in one complementary
free subgroup, under the nonparabolic two-evaluation hypothesis used in the
companion.  Extending the classification to arbitrary word pairs is the
missing step.  This is an inferred research direction rather than a named
conjecture in the literature.

**Scores for this related problem:** proximity 3.5/5; significance 3/5.

### 9. Corrected local-global theory for Apollonian packings

**Literature problem.**  Sarnak's original
[local-global conjecture](https://www.math.ias.edu/files/Sarnak_IntegralAppolonian.pdf)
for integral Apollonian packings is false.  Haag--Kertzer--Rickards--Stange
found infinite quadratic and quartic reciprocity obstruction families and
formulated a corrected conjecture asserting that only finitely many sporadic
exceptions remain; see
[*The local-global conjecture for Apollonian circle packings is false*](https://arxiv.org/abs/2307.02749).
[Rickards--Stange](https://arxiv.org/abs/2401.01860) develops the corresponding
reciprocity obstructions in \(\mathrm{SL}_2(\mathbb Z)\) semigroup orbits.

**Possible relevance of the manuscript.**  Kummer covers and gradings by deck
characters may describe the relevant reciprocity characters.  Decompositions
by square classes and Galois signs, proper local models, and the sieve that
selects a moving element with a prescribed square divisor may also contribute.
However, the known Apollonian obstruction belongs to the thin orbit and is
invisible from the Zariski closure and from ordinary congruence admissibility
alone.  An algebraic Kummer cover of the
ambient group may therefore miss exactly the information that matters.

**First theorem to pursue.**  Define the semigroup cocycle, or equivalent
cohomology group, on the actual Descartes thin orbit whose characters recover
the known quadratic and quartic obstruction families.  Only after proving this
recovery property should one seek a uniform classification for related
\(\mathrm{SL}_2\)-semigroup orbits or prove that no further character exists
in a specified family of square classes.

**What remains to prove.**  The full corrected conjecture is a positive
representation statement.  It needs a circle method, minor-arc bounds, or an
equivalent analytic lower bound.  Trace rigidity can exclude concentration and classify
obstructions, but it does not prove the existence of an integral orbit point.

**Initial test.**  Compute the proposed cocycle and its characters on the
Descartes orbit and compare the resulting character group exactly with
the known quadratic and quartic obstruction families.  Extra characters would
predict new obstructions; a smaller character group would show that the
proposed cocycle fails to capture some thin-orbit arithmetic information.

**Scores:** proximity 2.5/5 for obstruction classification, 2/5 for the
corrected local-global conjecture; significance 5/5.

### 10. Ghosh--Sarnak Markoff class numbers

**Literature conjecture.**  Let \(\mathfrak h_M(k)\) be the number of orbits of
integral points on

\[
x^2+y^2+z^2-xyz=k
\]

under the Markoff morphisms.  Ghosh--Sarnak
[Conjecture 10.1](https://arxiv.org/abs/1706.06712) predicts

\[
\mathfrak h_M(k)\ll_\varepsilon |k|^\varepsilon.
\]

Their pointwise argument gives the much larger exponent
\(1/3+\varepsilon\).  Their Conjecture 10.2 predicts a power-law count for
levels of fixed class number and for Hasse failures.

**Relevant results from the manuscript.**  The Markoff equation is a Fricke
trace identity.  Finite-type divisor bounds, polynomial secants, and uniform
quadratic norm fibers can control the number of reduced representatives within
a fixed trace slice.

**First theorem to pursue.**  Either improve the pointwise exponent
\(1/3\), or prove the subpower conjecture outside an explicit zero-density
exceptional set.  Either conclusion would improve the known pointwise bound,
although neither would give the full class-number asymptotic.

**What remains to prove.**  The companion controls trace fibers inside group
word balls.  The class number counts mapping-class orbits of all reduced
integral points.  One needs a uniform conversion from the Ghosh--Sarnak fundamental
region to boundedly many families parametrized by trace words or unit lattices.
Merely applying
the divisor theorem separately to \(O(|k|^{1/3})\) slices reproduces the known
loss.

**Initial test.**  Rewrite the reduced region as a family of explicit
quadratic norm equations and determine whether the uniform divisor theorem
removes any positive power of the number of slices.  If it does not, the
current methods cannot improve the pointwise exponent without an estimate that
couples the slices globally.

**Scores:** proximity 2.5--3/5 for an exponent improvement or density-one
theorem, 2/5 for the full conjecture; significance 4/5.

### 11. Hooley's count of closed geodesics ordered by discriminant

**Literature conjecture.**  In his account of
[reciprocal geodesics and class numbers](https://math.nyu.edu/~tschinke/books/gauss-dirichlet/sarnak.pdf),
Sarnak discusses Hooley's prediction that a discriminant-ordered geodesic
count has main term

\[
\frac{25}{12\pi^2}X(\log X)^2.
\]

The recent preprint of Gamburd--Ghosh--Sarnak--Whang on
[indefinite ternary quadratic forms](https://arxiv.org/abs/2603.05849)
underscores that the binary-form analogue remains poorly understood.

**Relevant results from the manuscript.**  The relation

\[
t^2-4=du^2
\]

is a quadratic norm fiber.  The sieve for choosing a moving element with
prescribed divisibility by a prime square, two-trace divisor bounds, and adelic
separation may give uniform control of fibers of the discriminant map.  Recent
root-packet decompositions may organize these fibers in a way that a word-ball
argument does not.

**First theorem to pursue.**  Prove a subpower bound for generic fibers of the
discriminant map, or a power-saving upper bound for the exceptional fibers,
and use it in the existing discriminant-ordered count.

**What remains to prove.**  The main term depends on class numbers, regulators,
and analytic averaging.  Uniform algebraic fibers alone do not deliver the
constant or even the correct lower bound.

**Initial test.**  Determine whether one root packet admits a
parametrization by a bounded collection of the manuscript's quadratic norm
fibers; such a parametrization is not presently known.  If it exists, check
whether all constants remain uniform in \(d\).  Failure of the parametrization
or a regulator-dependent loss of a positive power identifies the obstruction
to this approach.

**Scores:** proximity 3/5 for a new fiber or upper-bound theorem, 2.5/5 for the
full asymptotic; significance 4.5/5.

### 12. A quantitative gap above linear Fuchsian trace growth

**Literature question.**  Geninska asks whether a Fuchsian group can have
trace growth strictly between linear and quadratic; see
[*Examples of infinite covolume subgroups of \(\mathrm{PSL}(2,\mathbb R)^r\) with big limit sets*](https://numdam.org/item/10.5802/afst.1437.pdf).
Hao excludes the whole \(o(T\log\log\log T)\) range for nonuniform lattices.
For compact lattices, the focused manuscript treats the \(O(T)\) case and,
more generally, every upper polynomial trace-growth exponent at most one.
Generic surfaces are known to have much larger growth.

**Proposed theorem.**  Every nonarithmetic cocompact Fuchsian lattice satisfies

\[
D_\Gamma(T)\geq T^{1+\varepsilon_\Gamma}
\]

for some \(\varepsilon_\Gamma>0\), or at least no exponent in a universal
interval \((1,1+\varepsilon_0)\) occurs.

**Relevant results from the manuscript.**  Every term in the final compact
proof has an explicit growth-rate or height coefficient.  It is therefore
possible that the proof yields a quantitative margin beyond the contradiction
at the critical exponent.

**What remains to prove.**  Replacing \(T\) by \(T^{1+\eta}\) increases the
number of admissible trace values in every pigeonhole and congruence estimate.
The surface proof may be exactly balanced at \(\eta=0\), in which case no power
gap follows.

**Initial test.**  Introduce a formal variable \(\eta\) in every exponent
inequality used in the finite-cover argument, the Roth estimate, the sieve for
a moving element, and the final combination of congruences.  Optimize all
auxiliary parameters and solve for the largest interval on which the final
contradiction remains strict.  This is a
finite calculation and should precede any new conceptual work.

This calculation is preliminary; it is not itself the proposed theorem.

**Scores:** proximity 3/5 for a small power-gap theorem; significance 3/5.

### 13. Arithmeticity from the real length set of a cusped hyperbolic 3-manifold

**Literature problem.**  Hao's
[Problem 1.8](https://arxiv.org/html/2410.05223) asks whether a complete
finite-volume noncompact hyperbolic 3-manifold is arithmetic when its number
of distinct real lengths up to \(n\) has finite positive order \(e^n\).

**Possible relevance of the manuscript.**  Complex traces determine both
translation length and rotational holonomy.  If sparse real lengths could be
upgraded to sparse complex traces with controlled fibers, the Kleinian
trace-rigidity approach above would become available.

**What remains to prove.**  Real length sees the modulus of the loxodromic
eigenvalue but loses its phase.  There is no present theorem bounding the number of
holonomy angles above one real length.  This is a genuine information loss,
not a technicality.

**First theorem to pursue.**  In an algebraic cusped Kleinian lattice, bound
the multiplicity of complex trace values over a fixed real translation length
outside a classified exceptional set.  Only then attempt to transfer a real
length count into a complex trace count.

**Initial test.**  In a census of nonarithmetic cusped hyperbolic
3-manifolds, enumerate primitive loxodromics, record complex traces and
holonomy angles, and measure the largest phase fiber over equal or
algebraically related real lengths.  Exponential phase fibers would rule out
this proposed reduction.

**Scores:** proximity 2.5/5; significance 5/5.

### 14. Effective division bounds for metric-graph secular hypersurfaces

**Literature direction.**  Kurasov--Sarnak's
[work on metric graphs](https://arxiv.org/abs/2004.05678) uses division groups
and Lang--Liardet theory to decompose the relevant support into finitely many
full arithmetic progressions and a remainder that meets every arithmetic
progression in at most \(c(P)\) points.

**Relevant results from the manuscript.**  This is a direct setting in which to
apply the Kummer-division theory: the secular equation defines an algebraic
hypersurface inside a torus, while a length progression is a cyclic division orbit.
Finite-type divisors and the classification of root sections may help make
non-toric exceptional components explicit.  They do not constitute an
effective Mordell--Lang theorem for division points.

**First theorem to pursue.**  If \(N\) is the nonprogression remainder and
\(A\) is any arithmetic progression, give an effective uniform bound for

\[
\#(N\cap A)
\]

in terms of the degree or Newton polytope of the secular polynomial, and
classify the components that contain positive-dimensional division
subgroups.

**What remains to prove.**  Kurasov--Sarnak already obtain a decomposition into
full progressions and a remainder meeting each progression in at most \(c(P)\)
points.  The new content must be effectivity or uniformity of \(c(P)\) in
degree or Newton polytope.  Qualitative Mordell--Lang and subspace-theorem
theorems are not automatically effective, and the manuscript's finite-type
divisor theorem counts bounded-complexity factorizations rather than division
points.

**Initial test.**  Carry out the complete component analysis for
connected loopless graphs with a fixed small number of edges and compare the
resulting bound with the known qualitative decomposition.

**Scores:** proximity 2.5--3/5; significance 2.5--3/5.

### 15. Exponential mean multiplicity for semi-arithmetic groups in higher arithmetic dimension

**Literature problem.**  The 2025 work of
[Belolipetsky--Cosac--Dória--Paula](https://arxiv.org/abs/2507.00211) proves
exponential mean multiplicity under a modular-embedding hypothesis in
arithmetic dimension two and asks what happens in higher dimension.
Arithmetic dimension one is the classical arithmetic case, not part of that
new theorem.  A recent August 2026 preprint by
[Zuevsky](https://arxiv.org/abs/2608.17604) treats arbitrary arithmetic
dimension under both a generalized modular-embedding hypothesis and a strong
contraction condition.

**Possible relevance of the manuscript.**  The adelic product formula, trace
estimates at all embeddings, quaternion orders, and gradings arising from
Kummer square classes offer a systematic way to compare the geometric
embedding with all conjugate embeddings.

**First theorem to pursue.**  Verify exponential mean multiplicity for one
explicit arithmetic-dimension-three family not covered by the present
contraction bound, for example by obtaining sharper joint trace control than
separate estimates at the three embeddings.

**What remains to prove.**  Mean multiplicity requires an upper bound on the
number of distinct trace values, whereas much of the companion proves lower
bounds or rigidity from an assumed upper bound.  Controlling several simultaneously
unbounded embeddings without contraction requires an additional argument.

**Initial test.**  Combine the two-trace divisor estimate with the published
exponent inequalities for norm counting in arithmetic dimension three with
zero contraction.  If no positive mean-multiplicity exponent survives, the
present methods cannot solve the general problem without an estimate that
treats several embeddings jointly.

**Scores:** proximity 2.5--3/5 for an explicit family, 2/5 for the general
problem; significance 4/5.

### 16. Arithmeticity from arithmetic progressions in the primitive length spectrum

**Literature conjecture.**  Lafont--McReynolds
[conjecture](https://arxiv.org/abs/1401.7487) that if every primitive length of
a complete finite-volume manifold occurs in arithmetic progressions in their
specific sense, then the manifold is arithmetic.  Explicitly, a primitive
length \(\ell\) has this property when, for every \(k\), there are positive
integers \(a,b\) such that

\[
\{\ell(a+bs):1\leq s\leq k\}
\]

consists entirely of primitive lengths.  This is stronger than merely asking
the length set to contain some unrelated \(k\)-term progression.  Miller
[proved](https://arxiv.org/abs/1602.01869) the
arithmetic-to-progression direction for classical locally symmetric
orbifolds; the converse remains the target.

**Possible relevance of the manuscript.**  Powers in an eigenvalue torus
produce Chebyshev recurrences, and Kummer division explains compatible systems
of roots.  If the unrelated geodesics in a long progression could be placed in
one such algebraic family, trace rigidity would become relevant.

**What remains to prove.**  The conjecture only asserts existence of geodesics
with specified lengths.  It supplies no common multiplier, word family, or
commensurator relation.  Extracting a coherent algebraic torus from many
unrelated witnesses is the main problem.

**First theorem to pursue.**  Fix words
\(\gamma,\gamma_1,\ldots,\gamma_k\) and integers \(a,b\), and classify
positive-dimensional Fricke-space components on which

\[
\ell(\gamma_s)=(a+bs)\ell(\gamma)
\quad(1\leq s\leq k)
\]

persists, with every \(\gamma_s\) primitive.  Test whether every such component
is forced by a commensurator or torus construction.

**Initial test.**  Impose these integer-multiple length equations,
equivalently the associated Chebyshev trace equations, on low-word trace
functions in a genus-two Fricke chart.  Compute their irreducible components
and compare them with arithmetic and commensurator loci.

**Scores:** proximity 2/5 for the theorem about algebraic families, 1.5--2/5
for the full converse; significance 4/5.

### 17. Frobenius--Markoff uniqueness

**Literature conjecture.**  The largest coordinate of an ordered Markoff
triple should determine the other two.  The conjecture remains open; its
relation to Markoff geodesics and traces is reviewed in the
[Bourgain--Gamburd--Sarnak paper](https://publications.ias.edu/sites/default/files/MarkoffDiophantine%20.pdf).

**Limited relevance of the manuscript.**  This is a trace-collision
problem.  The companion is strongest when a collision persists on an
algebraic family or when collisions have a sufficiently large exponential
growth rate in word balls.  Frobenius uniqueness asks for the absence of an
isolated collision at a specified arithmetic point.
Showing that a collision is isolated does not show that it is absent.

**First theorem to pursue.**  Classify every persistent Markoff collision over
the relative character family and give an explicit Kummer description of the
remaining zero-dimensional collision scheme.  This would sharpen the problem
without settling the full conjecture.

**What remains to prove.**  An additional arithmetic result is needed to rule
out integral points on the isolated exceptional scheme.

**Initial test.**  Compute the zero-dimensional schemes for bounded
Markoff word complexity and inspect whether their defining fields and local
obstructions stabilize in a form that could support a general argument.

**Scores:** proximity 1.5--2/5; significance 5/5.

## Important problems outside the present plan

The following problems are significant, but the present methods do not offer
a credible approach to a proof.

- **Prime points in affine orbits.**  The Bourgain--Gamburd--Sarnak
  [prime-points conjecture](https://www.math.ias.edu/files/Bourgain_Gamburd_Sarnak_Affine.pdf)
  has significance 5/5 and proximity about 1/5.  The companion may improve
  square-full removal, radical lower bounds, or congruence distribution, but
  it does not cross the parity barrier.
- **The short-geodesic, Lehmer, and Salem-number circle.**  The short-geodesic
  conjecture is closely related to Mahler measure near one; see
  [Belolipetsky](https://arxiv.org/abs/1506.03727).  A positive gap between
  distinct traces and radical growth for Chebyshev sequences do not give a
  lower bound for Mahler measure.  Significance is 5/5 and proximity 1/5.
- **Quantum unique ergodicity, arithmetic Poisson statistics, number
  variance, and “bass-note” problems.**  These require analytic cancellation,
  spectral estimates, or eigenfunction control absent from the manuscript.
  Their use of a trace formula does not connect them to the present methods.
- **Almost-everywhere spectral gap in \(\mathrm{SU}(2)\) or
  \(\mathrm{SO}(3)\).**  Failure of spectral gap is not visibly a finite-type
  algebraic condition, and specialization constants degenerate near typical
  transcendental generators.
- **Hypergeometric-monodromy thinness.**  Polynomial secants may identify
  algebraic envelopes, but thinness is an infinite-index assertion and needs a
  new criterion.
- **Marked-length-pattern rigidity among all negatively curved metrics.**
  The manuscript controls finite-dimensional character varieties; the
  question quantifies over an infinite-dimensional space of metrics or Livšic
  cocycles.  A Fricke-space result would be informative but not a solution.

## Updates from recent literature

The following items were removed from the current list after checking recent
literature.

- Hao proved the nonuniform Fuchsian Schmutz statement in the stronger
  \(o(T\log\log\log T)\) range in
  [*On trace sets of hyperbolic surfaces*](https://arxiv.org/html/2410.05223).
- Hao proved nonuniform Kleinian bounded clustering and the positive trace-gap
  implication in
  [*Bounded clustering property characterizes arithmetic nonuniform Kleinian groups*](https://arxiv.org/html/2303.01395).
- Ordinary Markoff connectivity is known for all sufficiently large primes;
  spectral expansion, not connectivity, is the important open problem.
- The original Apollonian local-global conjecture is false; only the corrected
  form and the classification of reciprocity obstructions should be pursued.
- Hao's 2025 high-genus Weil--Petersson conjecture is implied in its stated
  fixed-\(\varepsilon\) range by his recent 2026
  [preprint on length sets of closed hyperbolic surfaces](https://arxiv.org/html/2607.20808):
  outside a countable union of positive-codimension algebraic sets it gives
  \(N_d^*(L)\geq\tau(d)e^{\delta(g)L}\), while
  \(\delta(g)\to1\).  Since \(T\asymp e^{L/2}\), this gives trace growth
  \(T^{2\delta(g)}\), and the exceptional set has Weil--Petersson measure
  zero.  Given fixed \(\varepsilon>0\), choose \(g_0\) so that
  \(2\delta(g)>2-\varepsilon\) for every \(g\geq g_0\).  This deduction is why
  the older conjecture is not retained as a current goal.
- Reciprocal-geodesic equidistribution is now largely a
  [solved counting program](https://academic.oup.com/imrn/article/2024/13/10298/7658386);
  its remaining class-number refinements are analytically driven and do not
  closely match the companion.
- A [May 2026 preprint](https://arxiv.org/abs/2605.02518) claims the broad
  Zaremba conjecture.  The sharp small-alphabet problem remains, but the
  companion does not treat the required entropy and minor-arc estimates with
  enough strength for inclusion here.

## Recommended order of work

Work should begin with verification of the current results, followed by four
short preliminary projects in parallel.  Each project can determine whether
the corresponding approach is viable before more extensive work begins.

0. **Independent verification of the present results.** Complete the
   verification of the focused manuscript's claimed compact Sarnak and
   Schmutz proofs, including algebraic realization of the representations,
   uniform counting in congruence cosets, and the final applications of
   Thurston's and Takeuchi's theorems. Correct any
   issues found.  The extension scores in this file assume that these results
   are validated.
1. **Kleinian coefficient calculation.**  Repeat the compact surface exponent
   calculation using an \(O(T^2)\) upper bound for the number of complex trace
   values, and determine whether the arithmeticity contradiction retains a
   strictly positive margin.
2. **Twisted expansion for mixed ideals.**  Compare the proposed statement
   with existing theorems, then work out one quadratic quaternion example
   completely, including every possible diagonal coupling of conjugate
   factors across independently varying prime powers.
3. **Markoff nonconcentration.**  State and prove the strongest escape theorem
   obtainable directly from the Chebyshev recurrence and two-trace fibers,
   without asserting spectral expansion.
4. **Exact computation.**  Compute stable trace collisions among words and
   commutators over rings of \(S\)-integers.  Either calculation may produce a
   counterexample or identify the algebraic pattern needed for a proof.

The first theorem that passes its initial test should become a focused
paper.  The arbitrary-ideal theorem and the Kleinian extension have the
greatest potential to yield results for several other entries.  The Markoff and
commutator projects are valuable because their algebraic coordinates are
explicit enough to test the proposed statements directly.

## Standard for adding a new goal

A future item belongs in this file only if it comes with all four of the
following:

1. a primary source showing that the problem remains open or identifying
   the exact current frontier;
2. a precise first theorem smaller than the ultimate conjecture;
3. a precise explanation of how the hypotheses in that theorem relate to named
   results of the companion manuscript; and
4. a clearly stated unproved step and a finite initial test that could show
   that the proposed approach cannot work.

This standard is meant to keep the program concentrated on actual advances
rather than on thematic analogies.
