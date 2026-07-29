import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  dose : ℝ
  concentrationCurve : ℝ → ℝ
  bioavailabilityComplete : Prop
  linearKinetics : Prop

structure PharmacokineticEvidence (M : PharmacokineticModel) where
  bioavailabilityCompleteClosed : M.bioavailabilityComplete
  linearKineticsClosed : M.linearKinetics

def PharmacokineticClosed (M : PharmacokineticModel) : Prop :=
  M.bioavailabilityComplete ∧ M.linearKinetics

theorem pharmacokinetic_closed_from_evidence (M : PharmacokineticModel) (E : PharmacokineticEvidence M) :
    PharmacokineticClosed M := by
  exact And.intro E.bioavailabilityCompleteClosed E.linearKineticsClosed

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse