import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  population : Type u
  compartments : List String
  inflowRates : String -> Type v
  outflowRates : String -> Type w
  conservationLaw : Prop
  steadyStateExistence : Prop
  parameterIdentifiability : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  conservationLawClosed : C.conservationLaw
  steadyStateExistenceClosed : C.steadyStateExistence
  parameterIdentifiabilityClosed : C.parameterIdentifiability

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.conservationLaw ∧ C.steadyStateExistence ∧ C.parameterIdentifiability

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.conservationLawClosed
    (And.intro E.steadyStateExistenceClosed E.parameterIdentifiabilityClosed)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse