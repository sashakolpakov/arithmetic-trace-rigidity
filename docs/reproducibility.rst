Reproducibility and deployment
==============================

Local verification
------------------

The repository's verification command rebuilds the manuscripts, validates the
common bibliography, checks reproducible PDF hashes, scans the Lean sources,
builds the formal project, audits printed axiom dependencies, and builds this
documentation with warnings treated as errors:

.. code-block:: console

   make verify

The documentation alone can be checked with:

.. code-block:: console

   python3 -m pip install --requirement docs/requirements.txt
   make check-docs

``make docs`` writes the HTML tree to ``docs/_build/html``.  The two top-level
documentation dependencies are pinned in ``docs/requirements.txt``.  The Lean
toolchain and Mathlib revision are independently pinned under ``formal/``.

What each check establishes
---------------------------

.. list-table::
   :header-rows: 1
   :widths: 32 68

   * - Check
     - Evidence supplied
   * - Strict Sphinx build
     - The reStructuredText parses, every internal reference resolves, and
       Sphinx emits no warning.
   * - Lean source scan
     - Project source contains no project ``axiom``, ``sorry``, ``admit``, or
       other forbidden proof placeholder.
   * - Direct Lean compilation and ``#print axioms`` audit
     - Public declarations compile and use only the documented standard
       logical principles inherited from Mathlib.
   * - Finite consistency examples
     - The abstract assumptions can hold simultaneously, and critical growth
       alone does not imply arithmeticity.
   * - PDF isolation rebuild
     - Fresh builds in different absolute paths reproduce the checked-in
       manuscript PDFs byte for byte.
   * - Manuscript and source tables
     - Each Lean field is matched with a statement in the manuscript, and
       each external statement is compared with the cited theorem.

Publication
-----------

The ``Documentation`` workflow repeats the strict Sphinx build on every push
to ``main`` and deploys its artifact to GitHub Pages.  The published site is
`sashakolpakov.github.io/arithmetic-trace-rigidity
<https://sashakolpakov.github.io/arithmetic-trace-rigidity/>`_.
