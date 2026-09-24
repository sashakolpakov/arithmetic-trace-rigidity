Trace sparsity and the main theorem
===================================

Counting distinct trace values
------------------------------

For :math:`X\ge2`, put

.. math::

   N_\Gamma(X)=\#\bigl(T(\Gamma)\cap[-X,X]\bigr)

and define the upper trace-growth exponent

.. math::

   \overline\delta_T(\Gamma)
   =\limsup_{X\to\infty}\frac{\log N_\Gamma(X)}{\log X}.

The **critical trace-growth bound** is
:math:`\overline\delta_T(\Gamma)\le1`, equivalently

.. math::

   N_\Gamma(X)=O_{\Gamma,\eta}(X^{1+\eta})
   \qquad\text{for every }\eta>0.

Two more familiar hypotheses are

.. math::

   N_\Gamma(X)=O_\Gamma(X)

for **linear growth**, and

.. math::

   \sup_{u\in\mathbb R}
   \#\bigl(T(\Gamma)\cap[u-1,u+1]\bigr)<\infty

for **bounded clustering**.  Covering :math:`[-X,X]` by :math:`O(X)`
intervals of length two gives the implication chain

.. math::

   \text{bounded clustering}
   \Longrightarrow \text{linear growth}
   \Longrightarrow \overline\delta_T\le1.

Main theorem
------------

.. admonition:: Trace sparsity forces arithmeticity
   :class: theorem

   If :math:`\Gamma<\mathrm{PSL}_2(\mathbb R)` is torsion-free and
   cocompact and :math:`\overline\delta_T(\Gamma)\le1`, then
   :math:`\Gamma` is arithmetic.

Selberg's lemma and invariance of arithmeticity under commensurability extend
the result to cocompact Fuchsian lattices with torsion.  Consequently the
linear-growth and bounded-clustering conclusions also hold for compact
orientable hyperbolic orbifolds.

Why exponent one is critical here
---------------------------------

A hyperbolic ball of radius :math:`R` contains :math:`e^{R+O(1)}` group
elements.  Under trace-growth exponent :math:`\sigma`, it contributes only
:math:`e^{\sigma R/2+o(R)}` distinct trace values.  The trace-graph argument
eventually yields

.. math::

   \log N\mathfrak c_m
   \le (2\sigma-2)R
      +\frac{\sigma(2N-1)}2D_m+o(m).

At :math:`\sigma=1`, the auxiliary-radius term cancels.  If
:math:`\sigma>1`, a positive multiple of :math:`R` remains, so this argument
does not prove the local expansion theorem.  Thus this trace-graph
calculation reaches exponent one, but no larger exponent.
