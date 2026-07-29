import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure DiagnosticTestPackage where
  disease : Type u
  test : Type v
  sensitivity : test -> ℝ
  specificity : test -> ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  bayesianUpdate : Prop
  thresholdAnalysis : Prop
  rocCurve : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  bayesianUpdateClosed : D.bayesianUpdate
  thresholdAnalysisClosed : D.thresholdAnalysis
  rocCurveClosed : D.rocCurve

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  D.bayesianUpdate ∧ D.thresholdAnalysis ∧ D.rocCurve

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.bayesianUpdateClosed
    (And.intro E.thresholdAnalysisClosed E.rocCurveClosed)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse