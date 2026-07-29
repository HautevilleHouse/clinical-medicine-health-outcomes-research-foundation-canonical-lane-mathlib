import ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : ClinicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ClinicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse