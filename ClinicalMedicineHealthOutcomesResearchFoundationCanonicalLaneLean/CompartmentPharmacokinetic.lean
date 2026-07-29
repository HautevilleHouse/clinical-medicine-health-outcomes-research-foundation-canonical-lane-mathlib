import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure CompartmentPharmacokineticModel where
  compartments : Nat
  volumeDistribution : ℝ → ℝ
  eliminationRate : ℝ
  concentrationCurve : ℝ → ℝ → ℝ
  doseRegimen : List ℝ
  steadyStateReached : Prop
  areaUnderCurve : Prop

structure CompartmentPharmacokineticEvidence (M : CompartmentPharmacokineticModel) where
  volumeDistributionClosed : M.volumeDistribution 0 = 0
  eliminationRateClosed : M.eliminationRate > 0
  concentrationCurveClosed : ∀ (t : ℝ) (d : ℝ), M.concentrationCurve t d ≥ 0
  doseRegimenClosed : M.doseRegimen.length ≥ 1
  steadyStateReachedClosed : M.steadyStateReached
  areaUnderCurveClosed : M.areaUnderCurve

def CompartmentPharmacokineticClosed (M : CompartmentPharmacokineticModel) : Prop :=
  M.volumeDistribution 0 = 0 ∧
  M.eliminationRate > 0 ∧
  (∀ (t : ℝ) (d : ℝ), M.concentrationCurve t d ≥ 0) ∧
  M.doseRegimen.length ≥ 1 ∧
  M.steadyStateReached ∧
  M.areaUnderCurve

theorem compartment_pharmacokinetic_closed_from_evidence (M : CompartmentPharmacokineticModel) (E : CompartmentPharmacokineticEvidence M) : CompartmentPharmacokineticClosed M := by
  exact And.intro E.volumeDistributionClosed (
    And.intro E.eliminationRateClosed (
    And.intro E.concentrationCurveClosed (
    And.intro E.doseRegimenClosed (
    And.intro E.steadyStateReachedClosed E.areaUnderCurveClosed))))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse
