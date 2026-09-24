Arithmetic Trace Rigidity
=========================

This site is a mathematical guide to the manuscripts and formal material in
the `Arithmetic Trace Rigidity repository
<https://github.com/sashakolpakov/arithmetic-trace-rigidity>`_.  Its purpose
is to expose the definitions, main estimates, and logical structure without
reproducing every technical proof.  The manuscripts remain authoritative for
the complete arguments and citations.

.. admonition:: Principal result
   :class: theorem

   Let :math:`\Gamma<\mathrm{PSL}_2(\mathbb R)` be a cocompact Fuchsian
   lattice and let :math:`N_\Gamma(X)` count its distinct signed trace values
   in :math:`[-X,X]`.  The focused manuscript proves that

   .. math::

      \limsup_{X\to\infty}
      \frac{\log N_\Gamma(X)}{\log X}\le 1

   forces :math:`\Gamma` to be arithmetic.  Linear trace growth and bounded
   clustering are immediate special cases.

The proof converts sparse trace values into an inequality for all local
expansion rates of a Chebyshev recurrence.  At the original real place that
inequality is already an equality; the remaining local terms must vanish,
which supplies the arithmetic data in Takeuchi's criterion.

.. toctree::
   :maxdepth: 2
   :caption: Mathematical guide

   overview
   trace_sparsity
   local_expansion
   recurrence_graph
   arithmeticity
   division_and_forms

.. toctree::
   :maxdepth: 2
   :caption: Verification and sources

   formal_contract
   nonvacuity
   source_interfaces
   reproducibility
   manuscripts

Current status
--------------

The focused and companion texts are unattributed working papers.  Nikolay
Bogachev is the author of the positive-trace-gap manuscript.  The compact
arithmeticity theorem would settle the compact cases of the Schmutz
linear-growth and Sarnak bounded-clustering conjectures.  It is presented in
a public pre-release and requires independent expert verification before it
is cited as settled literature.
