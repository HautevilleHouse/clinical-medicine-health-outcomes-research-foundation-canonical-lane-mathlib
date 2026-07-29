import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure SurvivalFunctionModel where
  survivalTimes : List ℝ
  eventIndicator : List Nat
  hazardFunction : ℝ → ℝ
  kaplanMeierEstimator : List ℝ
  medianSurvivalTime : ℝ
  confidenceInterval : ℝ × ℝ

def SurvivalFunctionClosed (M : SurvivalFunctionModel) : Prop :=
  (∀ t, M.survivalTimes.all (λ x => x ≥ 0)) ∧
  (∀ i ∈ M.eventIndicator, i = 0 ∨ i = 1) ∧
  (∀ t ≥ 0, M.hazardFunction t ≥ 0) ∧
  (∀ t ∈ M.kaplanMeierEstimator, t ≥ 0 ∧ t ≤ 1) ∧
  M.medianSurvivalTime ≥ 0 ∧
  M.confidenceInterval.1 ≤ M.confidenceInterval.2

structure SurvivalFunctionEvidence (M : SurvivalFunctionModel) where
  survivalTimesClosed : ∀ t ∈ M.survivalTimes, t ≥ 0
  eventIndicatorClosed : ∀ i ∈ M.eventIndicator, i = 0 ∨ i = 1
  hazardFunctionClosed : ∀ t ≥ 0, M.hazardFunction t ≥ 0
  kaplanMeierEstimatorClosed : ∀ t ∈ M.kaplanMeierEstimator, t ≥ 0 ∧ t ≤ 1
  medianSurvivalTimeClosed : M.medianSurvivalTime ≥ 0
  confidenceIntervalClosed : M.confidenceInterval.1 ≤ M.confidenceInterval.2

theorem survival_function_closed_from_evidence (M : SurvivalFunctionModel) (E : SurvivalFunctionEvidence M) : SurvivalFunctionClosed M := by
  exact And.intro (by
    intro t ht
    exact E.survivalTimesClosed t ht) (
    And.intro (by
      intro i hi
      exact E.eventIndicatorClosed i hi) (
    And.intro (by
      intro t ht
      exact E.hazardFunctionClosed t ht) (
    And.intro (by
      intro t ht
      exact E.kaplanMeierEstimatorClosed t ht) (
    And.intro E.medianSurvivalTimeClosed E.confidenceIntervalClosed))))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse
