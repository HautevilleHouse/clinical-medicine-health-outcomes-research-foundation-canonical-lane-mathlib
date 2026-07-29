import ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClinicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse