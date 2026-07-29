import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure HealthEconomicsPackage where
  costEffectiveness : Prop
  utilityMeasurement : Prop
  discountRate : Prop
  sensitivityAnalysis : Prop
  budgetImpact : Prop

structure HealthEconomicsEvidence (H : HealthEconomicsPackage) where
  costEffectivenessClosed : H.costEffectiveness
  utilityMeasurementClosed : H.utilityMeasurement
  discountRateClosed : H.discountRate
  sensitivityAnalysisClosed : H.sensitivityAnalysis
  budgetImpactClosed : H.budgetImpact

def HealthEconomicsClosed (H : HealthEconomicsPackage) : Prop :=
  H.costEffectiveness ∧ H.utilityMeasurement ∧ H.discountRate ∧ H.sensitivityAnalysis ∧ H.budgetImpact

theorem health_economics_closed_from_evidence (H : HealthEconomicsPackage)
    (E : HealthEconomicsEvidence H) : HealthEconomicsClosed H := by
  exact And.intro E.costEffectivenessClosed
    (And.intro E.utilityMeasurementClosed
      (And.intro E.discountRateClosed
        (And.intro E.sensitivityAnalysisClosed E.budgetImpactClosed)))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse
