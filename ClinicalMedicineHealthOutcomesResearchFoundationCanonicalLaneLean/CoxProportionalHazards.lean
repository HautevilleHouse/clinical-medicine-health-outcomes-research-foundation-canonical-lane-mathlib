import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure CovariateSet where
  covariates : List String
  hazardRatios : List ℝ
  confidenceIntervals : List (ℝ × ℝ)
  proportionalHazardsAssumption : Prop

structure CoxProportionalHazardsModel where
  baselineHazard : ℝ → ℝ
  covariateSets : List CovariateSet
  logPartialLikelihood : ℝ
  concordanceIndex : ℝ
  modelSignificance : ℝ

def CoxProportionalHazardsClosed (M : CoxProportionalHazardsModel) : Prop :=
  (∀ t ≥ 0, M.baselineHazard t ≥ 0) ∧
  (∀ cs ∈ M.covariateSets, (∀ hr ∈ cs.hazardRatios, hr ≥ 0) ∧ cs.proportionalHazardsAssumption) ∧
  (∀ cs ∈ M.covariateSets, (∀ ci ∈ cs.confidenceIntervals, ci.1 ≤ ci.2)) ∧
  M.concordanceIndex ≥ 0 ∧ M.concordanceIndex ≤ 1 ∧
  M.modelSignificance ≥ 0 ∧ M.modelSignificance ≤ 1

structure CoxProportionalHazardsEvidence (M : CoxProportionalHazardsModel) where
  baselineHazardClosed : ∀ t ≥ 0, M.baselineHazard t ≥ 0
  covariateSetsClosed : ∀ cs ∈ M.covariateSets, (∀ hr ∈ cs.hazardRatios, hr ≥ 0) ∧ cs.proportionalHazardsAssumption
  confidenceIntervalsClosed : ∀ cs ∈ M.covariateSets, ∀ ci ∈ cs.confidenceIntervals, ci.1 ≤ ci.2
  concordanceIndexClosed : M.concordanceIndex ≥ 0 ∧ M.concordanceIndex ≤ 1
  modelSignificanceClosed : M.modelSignificance ≥ 0 ∧ M.modelSignificance ≤ 1

theorem cox_proportional_hazards_closed_from_evidence (M : CoxProportionalHazardsModel) (E : CoxProportionalHazardsEvidence M) : CoxProportionalHazardsClosed M := by
  exact And.intro E.baselineHazardClosed (
    And.intro E.covariateSetsClosed (
    And.intro E.confidenceIntervalsClosed (
    And.intro E.concordanceIndexClosed E.modelSignificanceClosed)))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse
