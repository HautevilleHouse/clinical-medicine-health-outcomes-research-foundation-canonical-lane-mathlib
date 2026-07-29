import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure PharmacokineticModel where
  drug : String
  volumeDistribution : ℝ
  clearanceRate : ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  plasmaConcentration : ℝ -> ℝ
  firstOrder : Prop

structure PKEvidence (PK : PharmacokineticModel) where
  firstOrderClosed : PK.firstOrder
  volumePositive : PK.volumeDistribution > 0
  clearancePositive : PK.clearanceRate > 0

def PKModelClosed (PK : PharmacokineticModel) : Prop :=
  PK.firstOrder ∧ PK.volumeDistribution > 0 ∧ PK.clearanceRate > 0

theorem pk_closed_from_evidence (PK : PharmacokineticModel) (E : PKEvidence PK) :
    PKModelClosed PK := by
  exact And.intro E.firstOrderClosed (And.intro E.volumePositive E.clearancePositive)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse