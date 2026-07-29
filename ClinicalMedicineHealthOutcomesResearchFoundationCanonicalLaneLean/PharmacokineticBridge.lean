import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure PharmacokineticPackage where
  drug : Type u
  dose : drug -> ℕ
  concentration : drug -> ℕ -> ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  halfLife : ℝ
  clearance : Prop
  linearDynamics : Prop
  doseProportionality : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  clearanceClosed : P.clearance
  linearDynamicsClosed : P.linearDynamics
  doseProportionalityClosed : P.doseProportionality

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.clearance ∧ P.linearDynamics ∧ P.doseProportionality

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.clearanceClosed
    (And.intro E.linearDynamicsClosed E.doseProportionalityClosed)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse