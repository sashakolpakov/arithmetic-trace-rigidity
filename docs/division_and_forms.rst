Division, Hilbert 90, and algebraic forms
=========================================

This page summarizes the geometric theme of the companion manuscript.  It is
not an input to the focused compact proof, but it explains why the original
square-root construction belongs to a broader algebraic-group theory.

The rank-one projective square root
-----------------------------------

Let :math:`k` have characteristic different from two, let :math:`B/k` be a
quaternion algebra, and let
:math:`g\in\mathrm{SL}_1(B)(k)` be regular semisimple.  Put
:math:`E=k[g]`.  Then :math:`E` is a quadratic étale algebra.  Its nontrivial
involution sends :math:`g` to :math:`g^{-1}`.  For :math:`u=1+g`,

.. math::

   \frac{u}{\bar u}=g,
   \qquad
   u\bar u=2+\operatorname{Trd}(g).

The first identity is the elementary Hilbert--90 equation.  It also gives
:math:`u^2=(u\bar u)g`, so after choosing a scalar square root,

.. math::

   R(g)=\frac{1+g}{\sqrt{2+\operatorname{Trd}(g)}},
   \qquad R(g)^2=g.

The two choices differ by :math:`-1`.  Consequently the projective class

.. math::

   R_{\mathrm{ad}}(g)=[1+g]\in\mathrm{PGL}_1(B)

is rational over :math:`k` even when the normalized root is not.  An actual
:math:`k`-rational root exists exactly when
:math:`2+\operatorname{Trd}(g)` is a square in :math:`k`; its obstruction is
the Kummer class in :math:`k^\times/k^{\times2}`.

Geometrically, a loxodromic element of :math:`\mathrm{PSL}_2(\mathbb C)`
with complex translation length :math:`\lambda` has eigenvalues
:math:`e^{\pm\lambda/2}`.  A branch of
:math:`R(g)` has the same eigenspaces and eigenvalues
:math:`e^{\pm\lambda/4}`: it keeps the oriented axis and halves both
translation and rotation.

Roots in a general reductive group
----------------------------------

For a connected reductive group :math:`G`, the centralizer
:math:`J_g=Z_G(g)` of a regular semisimple element is a torus.  The family of
:math:`m`-th roots is therefore not normally a single-valued rational map.
It is the finite Kummer torsor

.. math::

   \mathcal R_m=\{(g,h)\in G^{\mathrm{rs}}\times G:h^m=g\}
   \longrightarrow G^{\mathrm{rs}}

under :math:`J[m]`, of degree :math:`m^{\operatorname{rank}G}` when the
characteristic does not divide :math:`m`.  At a rational point, the
obstruction to a rational branch lies in
:math:`H^1(k,J_g[m])`.  A splitting or cameral cover splits and labels the
maximal torus, removing the Weyl ambiguity in that choice.  The Kummer torsor
then supplies the root branches, which Weyl and Galois monodromy permute.

For a connected real semisimple linear group, the real geometry is still
simple.  If :math:`h^m=g` with :math:`g` regular semisimple, their Jordan
projections satisfy

.. math::

   \lambda(h)=\frac1m\lambda(g).

To see why, conjugate the hyperbolic part of :math:`h` to
:math:`\exp H` in a fixed closed positive Weyl chamber.  Every character
obeys

.. math::

   \log|\chi((\exp H)^m)|=m\log|\chi(\exp H)|.

The simple-root characters determine :math:`H`, so taking the power is
literally scalar multiplication by :math:`m` in logarithmic character
coordinates.  Translation length in the symmetric space is the norm of the
Jordan projection and is divided by :math:`m` as well.

Inner and outer forms in type A
-------------------------------

For :math:`d\ge3`, an inner form of :math:`\mathrm{SL}_d` is
:math:`\mathrm{SL}_1(D)` for a degree-:math:`d` central simple algebra
:math:`D/k`.  Its adjoint group is :math:`\mathrm{PGL}_1(D)`.  If
:math:`f\in k[z,z^{-1}]` is a Laurent polynomial, then :math:`f(g)\in D`;
wherever it is
invertible, :math:`[f(g)]` automatically defines a rational point of the
adjoint inner form.

An outer form is described by the full unitary datum
:math:`(L/k,E,*)`: a quadratic extension, a central simple
:math:`L`-algebra, and an involution of the second kind.  It is important
that “defining algebra” here means this whole datum, not :math:`E` alone.
For :math:`g\in\mathrm{SU}(E,*)`, one has :math:`g^*=g^{-1}` and

.. math::

   f(g)^*f(g)=f(g^{-1})f(g).

The projective class :math:`[f(g)]` descends to the projective unitary group
only if this product is scalar.  If :math:`f\in k[z,z^{-1}]` has at least
two nonzero terms, then :math:`f(z^{-1})f(z)` is nonconstant.  On a generic diagonal
torus in rank at least two its values can vary independently, so the product
is noncentral.  Thus polynomial secants with at least two terms descend
generically for inner forms and fail generically for outer forms.  The
failure detects the nontrivial Galois action on the type-:math:`A` Dynkin
diagram.

Rank one is exceptional.  Cayley--Hamilton gives
:math:`g+g^{-1}=\operatorname{Tr}(g)I`, making the secant obstruction scalar
and permitting the projective square root above.  The companion manuscript
proves a sharper classification.  Let :math:`G_{\mathrm{sc}}` be a nontrivial
semisimple simply connected group over an algebraically closed field of
characteristic zero and let
:math:`\pi:G_{\mathrm{sc}}\to G_{\mathrm{ad}}` be the adjoint quotient.  A
rational map :math:`s:G_{\mathrm{sc}}\dashrightarrow G_{\mathrm{ad}}`
satisfying :math:`s(g)^m=\pi(g)` on a nonempty open set can occur only for
:math:`m=2` when every simple factor has type :math:`A_1`; the componentwise
map :math:`g\mapsto[1+g]` gives the converse.

See the :doc:`manuscripts` page for the companion PDF and its complete proofs,
hypotheses, and arithmetic applications.
