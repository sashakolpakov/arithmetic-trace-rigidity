The local expansion functional
==============================

The proof sums the archimedean and nonarchimedean expansion of a trace in one
nonnegative quantity.

Definition
----------

Let :math:`k` be a number field, :math:`t\in k`, and :math:`v` a place of
:math:`k`.  Choose a root :math:`z_v` of

.. math::

   z+z^{-1}=t^2-2.

With :math:`n_v=[k_v:\mathbb Q_v]`, define

.. math::

   \chi_v(t)=\frac12\log\max\{|z_v|_v,|z_v|_v^{-1}\},
   \qquad
   \mathcal J_k(t)=\sum_v n_v\chi_v(t).

The two possible roots are reciprocal, so :math:`\chi_v` is well defined.
Every summand is nonnegative, only finitely many finite-place summands are
nonzero, and :math:`\mathcal J_k(-t)=\mathcal J_k(t)`.

If :math:`\lambda+\lambda^{-1}=t`, then

.. math::

   \chi_v(t)=\log\max\{|\lambda|_v,|\lambda|_v^{-1}\}.

This is the geometric meaning of the definition: it measures the local
spectral expansion of an element having trace :math:`t`.

Basic properties
----------------

For a finite extension :math:`L/k`, local-degree compatibility gives

.. math::

   \mathcal J_L(t)=[L:k]\mathcal J_k(t).

The functional also differs from the normalized Weil height by a uniformly
bounded archimedean error:

.. math::

   \left|\mathcal J_k(t)-[k:\mathbb Q]h(t)\right|
   \le [k:\mathbb Q]\log 2.

At nonarchimedean places the corresponding local contributions agree
exactly.

The distinguished real place
----------------------------

Suppose a real embedding realizes :math:`t` as the trace of a hyperbolic
element of translation length :math:`L`.  Then
:math:`|t|=2\cosh(L/2)` and the real local contribution is exactly

.. math::

   \chi_{v_0}(t)=\frac L2.

This identity makes the local bound sharp at the distinguished place.  The
local theorem gives an upper bound of :math:`L/2`, while that place alone
contributes :math:`L/2`.  Every other local term is nonnegative, so all of
them must vanish.

Local expansion on the rational Zariski closure
------------------------------------------------

Let :math:`Z_x` be the rational Zariski closure of a faithful cocompact
Fuchsian character :math:`x`.  If :math:`y\in Z_x(\overline{\mathbb Q})` is
an algebraic faithful cocompact Fuchsian character and

.. math::

   k_y=\mathbb Q(\operatorname{Tr}_y h:h\in\Pi^{(2)}),

then critical trace growth at :math:`x` implies, for every
:math:`b\in\Pi^{(2)}`,

.. math::
   :label: local-expansion-bound

   \mathcal J_{k_y}(\operatorname{Tr}_y b)
   \le \frac{\ell_x(b)}2.

Membership in :math:`Z_x` is used through collision persistence: every
rational polynomial identity among squared traces that holds at :math:`x`
continues to hold at :math:`y`.
