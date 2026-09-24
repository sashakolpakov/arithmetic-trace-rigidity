import TraceSparsity.Chebyshev
import TraceSparsity.MovingFiberIdentity
import TraceSparsity.CongruenceWedge
import TraceSparsity.Arithmeticity
import TraceSparsity.ContractAudit

/-!
# Trace sparsity: formalized conditional implications

The theorems in this module contain no proof placeholders and introduce no
project axioms.  Their hypotheses state explicitly which mathematical results
are assumed, while Lean checks the deductions from those results.  The
mathematical meaning of every such hypothesis is recorded in
`MANUSCRIPT_MAP.md`.
-/

namespace TraceSparsity

#print axioms q_cassini
#print axioms traceRec_succ_eq
#print axioms two_trace_projections
#print axioms moving_fiber_quadratic_identity
#print axioms fricke_trace_identity
#print axioms moving_fiber_rhs_eq_commutator
#print axioms wedge_middle_congruent
#print axioms wedge_triple_eq_of_same_middle
#print axioms wedge_fiber_card_le_congruence_class
#print axioms wedge_fiber_card_le_principal_residue_class
#print axioms card_le_fiberBound_mul_product
#print axioms abstract_congruence_wedge_bound
#print axioms congruence_wedge_bound_from_residue_classes
#print axioms half_bound_from_manuscript_order
#print axioms moving_parameter_limit
#print axioms half_bound_from_full_manuscript_estimate
#print axioms half_bound_of_arbitrary_errors
#print axioms persistent_local_expansion
#print axioms persistent_local_expansion_ordered
#print axioms compact_critical_growth_from_inputs
#print axioms compact_critical_growth_from_ordered_inputs
#print axioms compact_schmutz_from_inputs
#print axioms compact_sarnak_from_inputs
#print axioms compact_schmutz_from_ordered_inputs
#print axioms compact_sarnak_from_ordered_inputs
#print axioms ContractAudit.ordered_contract_inhabited
#print axioms ContractAudit.toy_ordered_certificate_applies
#print axioms ContractAudit.critical_growth_alone_not_sufficient

end TraceSparsity
