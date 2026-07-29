import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure HealthOutcome where
  population : String
  intervention : String
  outcome : String
  effectSize : ℝ
  confidenceInterval : ℝ × ℝ
  clinicallyRelevant : Prop

structure OutcomeEvidence (O : HealthOutcome) where
  effectSizePositive : O.effectSize > 0
  ciStrictlyPositive : (O.confidenceInterval.1 > 0) ∧ (O.confidenceInterval.2 > 0)
  clinicallyRelevantClosed : O.clinicallyRelevant

def HealthOutcomeClosed (O : HealthOutcome) : Prop :=
  O.effectSize > 0 ∧ (O.confidenceInterval.1 > 0) ∧ (O.confidenceInterval.2 > 0) ∧ O.clinicallyRelevant

theorem outcome_closed_from_evidence (O : HealthOutcome) (E : OutcomeEvidence O) :
    HealthOutcomeClosed O := by
  rcases E with ⟨hp, ⟨h1, h2⟩, hc⟩
  exact And.intro hp (And.intro h1 (And.intro h2 hc))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse