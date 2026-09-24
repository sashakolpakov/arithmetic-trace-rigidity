Manuscripts and further reading
===============================

Focused proof
-------------

**Trace Sparsity and Arithmeticity for Compact Hyperbolic Surfaces**

* `PDF <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/paper/compact-trace-rigidity.pdf>`_
* `TeX source <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/paper/compact-trace-rigidity.tex>`_

This is the recommended starting point.  It contains the critical-growth
theorem, all proof-specific lemmas, exact statements of the principal
external inputs, the compact Schmutz and Sarnak deductions, and the orbifold
extension.

Algebraic-group companion
-------------------------

**Kummer Division, Polynomial Secants, and Trace Rigidity**

* `PDF <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/paper/trace-gap-companion.pdf>`_
* `TeX source <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/paper/trace-gap-companion.tex>`_

The companion develops the projective square-root map through Hilbert 90,
Kummer division, inner and outer forms, higher-rank phenomena, auxiliary
results, countermodels, and alternative approaches that are not used in the
focused proof. It is not a prerequisite
for the focused compact proof.

Positive trace gap
------------------

Nikolay Bogachev, **Proof of the Positive Trace Gap Conjecture**

* `PDF <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/paper/positive-trace-gap.pdf>`_
* `TeX source <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/paper/positive-trace-gap.tex>`_

This manuscript proves the positive trace-gap characterization using the
projective square-root construction and commensurator rigidity.

Repository records
------------------

The repository also contains:

* the `theorem-status ledger
  <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/STATUS.md>`_;
* the `proof and source audit log
  <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/AUDIT_LOG.md>`_;
* the `provenance and influence ledger
  <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/PROVENANCE_INFLUENCE_LEDGER.md>`_;
* the `Lean correspondence table
  <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/formal/MANUSCRIPT_MAP.md>`_; and
* the `ranked future directions
  <https://github.com/sashakolpakov/arithmetic-trace-rigidity/blob/main/FUTURE_GOALS.md>`_.

Building this site
------------------

Install the pinned documentation dependencies and build with warnings treated
as errors:

.. code-block:: console

   python3 -m pip install -r docs/requirements.txt
   make docs

The generated site is written to ``docs/_build/html``.  GitHub Actions
deploys the same strict build to GitHub Pages after every push to ``main``.
