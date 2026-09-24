Chebyshev recurrences and the trace graph
=========================================

The central estimate compares a Diophantine lower bound with a geometric and
combinatorial upper bound.

The recurrence
--------------

Define polynomials

.. math::

   q_0(T)=0,\qquad q_1(T)=1,\qquad
   q_{n+1}(T)=Tq_n(T)-q_{n-1}(T).

If :math:`A\in\mathrm{SL}_2` has trace :math:`s`, Cayley--Hamilton gives

.. math::

   A^n=q_n(s)A-q_{n-1}(s)I

and hence

.. math::

   \operatorname{Tr}(A^nG)
   =q_n(s)\operatorname{Tr}(AG)-q_{n-1}(s)\operatorname{Tr}G.

Cassini's identity reads

.. math::

   q_n(T)^2-q_{n-1}(T)q_{n+1}(T)=1.

Thus consecutive specialized values :math:`q_{N-1}(s)` and
:math:`q_N(s)` generate the unit ideal.  Put

.. math::

   P=q_{N-1}(s),\qquad Q=q_N(s).

The positive and negative trace projections become

.. math::

   \begin{aligned}
   Q\operatorname{Tr}(AG)-P\operatorname{Tr}G
      &=\operatorname{Tr}(A^NG),\\
   Q\operatorname{Tr}G-P\operatorname{Tr}(AG)
      &=\operatorname{Tr}(A^{-(N-1)}G).
   \end{aligned}

Choosing elements with controlled recurrence divisors
------------------------------------------------------

For a fixed recurrence index :math:`N`, the proof chooses elements
:math:`A_m=b^mh_m` that vary with :math:`m`, where
:math:`|h_m|\leq\theta m`. A sieve using expansion modulo rational prime
squares makes every prime exponent in

.. math::

   \mathfrak c_m=
   \bigl(q_{N-1}(\operatorname{Tr}A_m)
         q_N(\operatorname{Tr}A_m)\bigr)

bounded independently of :math:`m`.  Bounded-power superapproximation then
supplies uniform congruence counting for these ideals.
Simultaneous-place Roth gives the complementary reduced-divisor lower bound.

The length-two-path inequality
------------------------------

Let :math:`A` be a Dedekind domain, let nonzero :math:`P,Q\in A` generate
coprime ideals, and let
:math:`\varnothing\ne G\subset U\times V` be a finite bipartite graph with
:math:`U,V\subset A`.  Define the two coordinate supports

.. math::

   \begin{aligned}
   X_-&=\{Qu-Pv:(u,v)\in G\},\\
   X_+&=\{Qv-Pu:(u,v)\in G\}.
   \end{aligned}

For ordered length-two paths :math:`(u,v,u')`, the map

.. math::

   (u,v,u')\longmapsto(Qu-Pv,\;Qv-Pu')

has controlled fibers.  Equality of the image confines :math:`v` to one
residue class modulo :math:`(PQ)` by the Chinese remainder theorem; once
:math:`v` and the image are fixed, :math:`u,u'` are determined.  If
:math:`M_{(PQ)}(V)` is the largest population of a residue class, then

.. math::

   |X_-|\,|X_+|
   \ge \frac{1}{M_{(PQ)}(V)}\sum_{v\in V}\deg_G(v)^2
   \ge \frac{|G|^2}{|V|M_{(PQ)}(V)}.

In the manuscript, :math:`R=Cm` with :math:`C` fixed.  A
radius-:math:`R` ball contains :math:`e^{R+O(1)}` group elements.  Its
graph edges are the trace pairs
:math:`(\operatorname{Tr}(A_mg),\operatorname{Tr}g)` obtained from group
elements in that ball.  Each such pair has at most :math:`e^{o(m)}`
preimages.  Dividing the group-element count by this fiber bound leaves at
least :math:`e^{R-o(m)}` distinct graph edges.  Trace sparsity bounds the
vertex sets, while congruence equidistribution bounds residue-class
occupancy.  The two
recurrence projections identify :math:`X_-` and :math:`X_+` with
trace supports at shifted radii.

Comparing the lower and upper bounds
------------------------------------

Combining Roth's lower estimate with the trace-graph upper estimate yields

.. math::

   (2N-4-\varepsilon)
   \bigl(m\mathcal J_{k_y}(\operatorname{Tr}_y b)-O(\theta m)-O(1)\bigr)
   \le
   \frac{2N-1}{2}
   \bigl(m\ell_x(b)+O(\theta m)+O(1)\bigr)+o(m).

The order of limits is part of the statement: first :math:`m\to\infty`,
then :math:`\theta\to0`, then :math:`\varepsilon\to0`, and finally
:math:`N\to\infty`.  The ratio of the leading coefficients tends to
:math:`1/2`, giving :eq:`local-expansion-bound`.
