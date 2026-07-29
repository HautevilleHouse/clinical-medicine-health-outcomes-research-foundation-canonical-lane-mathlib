import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure HealthOutcomesMeasurementPackage where
  outcome : Type
  instrument : Type
  reliability : Type
  validity : Type
  responsiveness : Type
  minimallyImportantDifference : Type
  instrumentValidated : Prop
  measurementPropertiesClosed : Prop
  scoreInterpretationDefined : Prop

structure HealthOutcomesMeasurementEvidence (P : HealthOutcomesMeasurementPackage) where
  instrumentValidatedClosed : P.instrumentValidated
  measurementPropertiesClosedClosed : P.measurementPropertiesClosed
  scoreInterpretationDefinedClosed : P.scoreInterpretationDefined

def HealthOutcomesMeasurementClosed (P : HealthOutcomesMeasurementPackage) : Prop :=
  P.instrumentValidated ∧ P.measurementPropertiesClosed ∧ P.scoreInterpretationDefined

theorem health_outcomes_measurement_closed_from_evidence (P : HealthOutcomesMeasurementPackage)
    (E : HealthOutcomesMeasurementEvidence P) : HealthOutcomesMeasurementClosed P := by
  exact And.intro E.instrumentValidatedClosed
    (And.intro E.measurementPropertiesClosedClosed E.scoreInterpretationDefinedClosed)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse