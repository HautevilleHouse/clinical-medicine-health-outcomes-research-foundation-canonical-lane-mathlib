import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure HealthOutcome where
  outcomeType : String
  measurementScale : String
  minimalClinicallyImportantDifference : ℝ
  reliability : ℝ
  validityEstablished : Prop

structure HealthOutcomesMeasurePackage (O : HealthOutcome) where
  validityClosed : Prop
  reliabilityAcceptable : Prop

structure HealthOutcomesMeasureEvidence {O : HealthOutcome} (P : HealthOutcomesMeasurePackage O) where
  validityClosedClosed : P.validityClosed
  reliabilityAcceptableClosed : P.reliabilityAcceptable

def HealthOutcomesMeasureClosed {O : HealthOutcome} (P : HealthOutcomesMeasurePackage O) : Prop :=
  P.validityClosed ∧ P.reliabilityAcceptable

theorem health_outcomes_measure_closed_from_evidence {O : HealthOutcome} (P : HealthOutcomesMeasurePackage O) (E : HealthOutcomesMeasureEvidence P) :
    HealthOutcomesMeasureClosed P := by
  exact And.intro E.validityClosedClosed E.reliabilityAcceptableClosed

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse