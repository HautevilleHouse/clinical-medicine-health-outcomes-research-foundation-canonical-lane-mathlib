import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean

structure MetaAnalysisPackage where
  heterogeneity : Prop
  publicationBias : Prop
  effectSize : Prop
  forestPlot : Prop
  subgroupAnalysis : Prop

structure MetaAnalysisEvidence (M : MetaAnalysisPackage) where
  heterogeneityClosed : M.heterogeneity
  publicationBiasClosed : M.publicationBias
  effectSizeClosed : M.effectSize
  forestPlotClosed : M.forestPlot
  subgroupAnalysisClosed : M.subgroupAnalysis

def MetaAnalysisClosed (M : MetaAnalysisPackage) : Prop :=
  M.heterogeneity ∧ M.publicationBias ∧ M.effectSize ∧ M.forestPlot ∧ M.subgroupAnalysis

theorem meta_analysis_closed_from_evidence (M : MetaAnalysisPackage)
    (E : MetaAnalysisEvidence M) : MetaAnalysisClosed M := by
  exact And.intro E.heterogeneityClosed
    (And.intro E.publicationBiasClosed
      (And.intro E.effectSizeClosed
        (And.intro E.forestPlotClosed E.subgroupAnalysisClosed)))

end ClinicalMedicineHealthOutcomesResearchFoundationCanonicalLaneLean
end HautevilleHouse
