import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure StudyResult where
  studyName : String
  effectSize : ℝ
  standardError : ℝ
  sampleSize : Nat
  outcomeType : String

structure MetaAnalysisModel where
  studies : List StudyResult
  overallEffectSize : ℝ
  heterogeneityI2 : ℝ
  publicationBiasTestPValue : ℝ
  confidenceIntervalOverall : ℝ × ℝ
  forestPlotIncluded : Prop

def HealthOutcomesMetaAnalysisClosed (M : MetaAnalysisModel) : Prop :=
  M.studies.length ≥ 2 ∧
  (∀ s ∈ M.studies, s.sampleSize ≥ 1) ∧
  (∀ s ∈ M.studies, s.standardError ≥ 0) ∧
  (M.heterogeneityI2 ≥ 0 ∧ M.heterogeneityI2 ≤ 100) ∧
  (M.publicationBiasTestPValue ≥ 0 ∧ M.publicationBiasTestPValue ≤ 1) ∧
  M.confidenceIntervalOverall.1 ≤ M.confidenceIntervalOverall.2 ∧
  M.forestPlotIncluded

structure HealthOutcomesMetaAnalysisEvidence (M : MetaAnalysisModel) where
  studiesCountClosed : M.studies.length ≥ 2
  sampleSizeClosed : ∀ s ∈ M.studies, s.sampleSize ≥ 1
  standardErrorClosed : ∀ s ∈ M.studies, s.standardError ≥ 0
  heterogeneityClosed : M.heterogeneityI2 ≥ 0 ∧ M.heterogeneityI2 ≤ 100
  publicationBiasClosed : M.publicationBiasTestPValue ≥ 0 ∧ M.publicationBiasTestPValue ≤ 1
  confidenceIntervalClosed : M.confidenceIntervalOverall.1 ≤ M.confidenceIntervalOverall.2
  forestPlotIncludedClosed : M.forestPlotIncluded

theorem health_outcomes_meta_analysis_closed_from_evidence (M : MetaAnalysisModel) (E : HealthOutcomesMetaAnalysisEvidence M) : HealthOutcomesMetaAnalysisClosed M := by
  exact And.intro E.studiesCountClosed (
    And.intro E.sampleSizeClosed (
    And.intro E.standardErrorClosed (
    And.intro E.heterogeneityClosed (
    And.intro E.publicationBiasClosed (
    And.intro E.confidenceIntervalClosed E.forestPlotIncludedClosed)))))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse
