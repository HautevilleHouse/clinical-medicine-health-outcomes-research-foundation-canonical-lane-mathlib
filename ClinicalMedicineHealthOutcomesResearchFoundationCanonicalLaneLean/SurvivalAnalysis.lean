import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  population : Type u
  timeToEvent : population -> ℝ
  censoringIndicator : population → Bool
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  kaplanMeier : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  kaplanMeierClosed : S.kaplanMeier
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.kaplanMeier ∧ S.coxProportionalHazards ∧ S.logRankTest

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.kaplanMeierClosed
    (And.intro E.coxProportionalHazardsClosed E.logRankTestClosed)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse