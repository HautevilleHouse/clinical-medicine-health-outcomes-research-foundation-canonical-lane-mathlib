import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure PharmacokineticsPKPDPackage where
  drug : Type
  doseRegimen : Type
  concentrationOverTime : Type
  efficacyEndpoint : Type
  toxicityEndpoint : Type
  doseResponseIdentified : Prop
  exposureResponseModeled : Prop
  covariatesIncluded : Prop

structure PharmacokineticsPKPDEvidence (P : PharmacokineticsPKPDPackage) where
  doseResponseIdentifiedClosed : P.doseResponseIdentified
  exposureResponseModeledClosed : P.exposureResponseModeled
  covariatesIncludedClosed : P.covariatesIncluded

def PharmacokineticsPKPDClosed (P : PharmacokineticsPKPDPackage) : Prop :=
  P.doseResponseIdentified ∧ P.exposureResponseModeled ∧ P.covariatesIncluded

theorem pharmacokinetics_pkpd_closed_from_evidence (P : PharmacokineticsPKPDPackage)
    (E : PharmacokineticsPKPDEvidence P) : PharmacokineticsPKPDClosed P := by
  exact And.intro E.doseResponseIdentifiedClosed
    (And.intro E.exposureResponseModeledClosed E.covariatesIncludedClosed)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse