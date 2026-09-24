From local expansion to arithmeticity
======================================

The last part of the proof separates into two cases, according to whether the
original Fuchsian character is algebraic.

The algebraic character
-----------------------

Assume first that the distinguished Fuchsian character :math:`x` is
algebraic.  Apply the local expansion theorem with :math:`y=x`.  For every
nonidentity :math:`b\in\Pi^{(2)}`, the distinguished real place contributes
:math:`\ell_x(b)/2`, whereas the theorem gives

.. math::

   \mathcal J_{k_x}(\operatorname{Tr}_x b)
   \le \frac{\ell_x(b)}2.

Because all local summands are nonnegative, equality holds and every other
local contribution vanishes.  The finite-place vanishing gives algebraic
integrality of the traces.  The nondistinguished archimedean vanishing gives
real conjugates in :math:`[-2,2]` and total reality of the trace field.

The subgroup :math:`\Gamma^{(2)}` has finite index, hence finite covolume.
Takeuchi's finite-covolume criterion applies to its full inverse image in
:math:`\mathrm{SL}_2`; it makes :math:`\Gamma^{(2)}` arithmetic.
Arithmeticity then ascends to :math:`\Gamma` by commensurability.

Excluding a transcendental character
-------------------------------------

Suppose that :math:`x` were transcendental.  Algebraic specialization in its
rational Zariski closure supplies an algebraic faithful Fuchsian character
:math:`y` arbitrarily close to :math:`x` and in the same Fuchsian component.
For every :math:`\gamma\in\Pi`, apply local expansion to
:math:`b=\gamma^2`.  The distinguished real contribution at :math:`y`
gives

.. math::

   \ell_y(\gamma)
   \le \mathcal J_{k_y}(\operatorname{Tr}_y\gamma^2)
   \le \ell_x(\gamma).

Thurston's asymmetric length-spectrum metric is

.. math::

   d_{\mathrm{Th}}(x,y)
   =\log\sup_{\gamma\ne1}
      \frac{\ell_y(\gamma)}{\ell_x(\gamma)}.

The length domination makes this quantity at most zero.  The metric is
nonnegative and separating, so :math:`x=y`, contradicting the algebraicity
of :math:`y` and transcendence of :math:`x`.  Thus the distinguished
character is algebraic, and the previous argument applies.

Dependency summary
------------------

The focused proof can be read as the following chain.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Input
     - Output used next
   * - Trace equalities on the rational closure and critical trace growth
     - Sparse trace support at every algebraic Fuchsian point in that closure
   * - Roth plus the sieve that selects elements whose recurrence ideals have
       bounded prime exponents
     - A lower bound for the reduced recurrence divisor
   * - Bounds on fibers of two traces, congruence counting, and the
       length-two-path inequality
     - The matching upper bound for that divisor
   * - The successive limits in :math:`m`, :math:`\theta`,
       :math:`\varepsilon`, and :math:`N`
     - The local expansion inequality at every such algebraic point
   * - Algebraic specialization and Thurston rigidity
     - Algebraicity of the distinguished character
   * - Local nonnegativity and Takeuchi's criterion
     - Arithmeticity
