#!/usr/bin/env python3
"""Compile the public Lean entry point and audit its printed axioms."""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FORMAL = ROOT / "formal"
ALLOWED_AXIOMS = {"propext", "Quot.sound", "Classical.choice"}
EXPECTED_DECLARATIONS = {
    "CoefficientAudit.varying_data_is_insufficient",
    "CoefficientAudit.moving_dependent_constant_is_insufficient",
    "half_bound_of_all_coefficients",
    "CoefficientAudit.all_coefficients_iff",
    "CoefficientAudit.all_coefficients_iff_half",
    "CoefficientAudit.sharp_positive_family",
    "CoefficientAudit.strict_positive_family",
    "CoefficientAudit.zero_boundary",
    "CoefficientAudit.negative_length_example",
    "CoefficientAudit.negative_length_converse_fails",
    "CoefficientAudit.single_index_is_insufficient",
    "CoefficientAudit.finite_prefix_is_insufficient",
    "CoefficientAudit.strict_conclusion_is_false",
    "CoefficientAudit.smaller_constant_is_false",
    "CoefficientAudit.every_violation_has_a_failing_index",
    "CoefficientAudit.existential_error_is_insufficient",
    "CoefficientAudit.one_epsilon_is_insufficient",
    "CoefficientAudit.theta_dependent_constant_is_insufficient",
    "CoefficientAudit.one_theta_is_insufficient",
    "CoefficientAudit.positive_moving_witness",
    "CoefficientAudit.positive_moving_witness_applies",
    "CoefficientAudit.sharp_ordered_estimate",
    "CoefficientAudit.sharp_ordered_family_applies",
    "CoefficientAudit.unbounded_indices_suffice",
    "CoefficientAudit.nonvanishing_remainder_is_insufficient",
    "CoefficientAudit.one_moving_index_is_insufficient",
    "q_cassini",
    "traceRec_succ_eq",
    "two_trace_projections",
    "moving_fiber_quadratic_identity",
    "fricke_trace_identity",
    "moving_fiber_rhs_eq_commutator",
    "wedge_middle_congruent",
    "wedge_triple_eq_of_same_middle",
    "wedge_fiber_card_le_congruence_class",
    "wedge_fiber_card_le_principal_residue_class",
    "card_le_fiberBound_mul_product",
    "abstract_congruence_wedge_bound",
    "congruence_wedge_bound_from_residue_classes",
    "coefficientBound_from_manuscript_order",
    "half_bound_from_manuscript_order",
    "moving_parameter_limit",
    "coefficientBound_from_full_manuscript_estimate",
    "half_bound_from_full_manuscript_estimate",
    "OrderedLocalExpansionInputs.toLocalExpansionInputs",
    "half_bound_of_arbitrary_errors",
    "persistent_local_expansion",
    "persistent_local_expansion_ordered",
    "compact_critical_growth_from_inputs",
    "compact_critical_growth_from_ordered_inputs",
    "compact_schmutz_from_inputs",
    "compact_sarnak_from_inputs",
    "compact_schmutz_from_ordered_inputs",
    "compact_sarnak_from_ordered_inputs",
    "ContractAudit.ordered_contract_inhabited",
    "ContractAudit.toy_ordered_certificate_applies",
    "ContractAudit.toy_post_limit_certificate_applies",
    "ContractAudit.toy_noncentral_sharp",
    "ContractAudit.critical_growth_alone_not_sufficient",
}
STATUS = re.compile(
    r"'TraceSparsity\.(?P<name>[^']+)' "
    r"(?:depends on axioms:\s*\[(?P<axioms>[^]]*)\]"
    r"|does not depend on any axioms)"
)


def main() -> int:
    result = subprocess.run(
        ["lake", "env", "lean", "TraceSparsity/Main.lean"],
        cwd=FORMAL,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    if result.returncode != 0:
        print(result.stdout, file=sys.stderr, end="")
        print("Lean entry-point compilation failed.", file=sys.stderr)
        return result.returncode or 1

    observed: dict[str, set[str]] = {}
    for match in STATUS.finditer(result.stdout):
        raw_axioms = match.group("axioms")
        axioms = (
            {item.strip() for item in raw_axioms.split(",") if item.strip()}
            if raw_axioms is not None
            else set()
        )
        observed[match.group("name")] = axioms

    failures: list[str] = []
    missing = EXPECTED_DECLARATIONS - set(observed)
    extra = set(observed) - EXPECTED_DECLARATIONS
    if missing:
        failures.append(f"missing #print axioms output: {sorted(missing)}")
    if extra:
        failures.append(f"unexpected #print axioms output: {sorted(extra)}")

    for declaration, axioms in sorted(observed.items()):
        forbidden = axioms - ALLOWED_AXIOMS
        if forbidden:
            failures.append(
                f"{declaration}: forbidden or undocumented axioms "
                f"{sorted(forbidden)}"
            )

    if failures:
        print(result.stdout, file=sys.stderr, end="")
        print("\n".join(failures), file=sys.stderr)
        return 1

    used = sorted(set().union(*observed.values()) if observed else set())
    print(
        "Lean entry point: all public declarations compiled; "
        f"documented axioms only ({', '.join(used) or 'none'})"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
