import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure ClinicalTrial where
  treatment : String
  control : String
  outcome : String
  randomization : Prop
  blinding : Prop
  significanceLevel : ℝ
  statisticallySignificant : Prop

structure TrialEvidence (T : ClinicalTrial) where
  randomizationClosed : T.randomization
  blindingClosed : T.blinding
  significant : T.statisticallySignificant

def ClinicalTrialClosed (T : ClinicalTrial) : Prop :=
  T.randomization ∧ T.blinding ∧ T.statisticallySignificant

theorem trial_closed_from_evidence (T : ClinicalTrial) (E : TrialEvidence T) :
    ClinicalTrialClosed T := by
  exact And.intro E.randomizationClosed (And.intro E.blindingClosed E.significant)

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse