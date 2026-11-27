import TunnellAdicLocalization
import ClassFieldTheory.LocalClassFieldTheory.Finite.LocalReciprocity.SemilinearNaturality

/-! Full global Galois action and its degree in the completion at a unique prime. -/
namespace TunnellAdicDecomposition
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open AlgebraicNumberTheory.Valuations HilbertRamification LocalClassFieldTheory TunnellAdicLocalization
open scoped Classical TunnellAdicLocalization IsMulCommutative
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K)) (a:Ext (L:=L) v)
local notation "w" => (finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a)
local notation "F" => v.adicCompletion K
local notation "M" => adicCompletion L (Subtype.val (finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a))
local notation "v₀" => NumberField.HeightOneSpectrum.adicAbv K v
local instance alg : Algebra F M := (finitePlaceAdicCompletionMap K L v w).toAlgebra

private lemma comm (x:Base v) : locEquiv v a (algebraMap (Base v) (Loc v a) x)=algebraMap F M (finitePlaceCompletionRingEquiv v x) :=
  (RingHom.congr_fun (comparison v a) x).symm

def galEquiv : absoluteValueDecompositionGroup K a.1≃*Gal(M/F) :=
  (decompositionGroupEquivAlgebraicLocalizationAut _ (RayClass.adicAbv_isNontrivial v) a).trans
    (semilinearGaloisGroupCongr (Base v) F (Loc v a) M _ _ (comm v a))

theorem on_global (σ:absoluteValueDecompositionGroup K a.1) (x:L) :
    galEquiv v a σ (algebraMap L M x)=algebraMap L M (σ.1 x) := by
  let j:=AbsoluteValue.toAlgebraicLocalization v₀ a.1 a.2
  have hj (z:L) : locEquiv v a (j z)=algebraMap L M z := by
    change finitePlaceExtensionAdicCompletionRingEquiv v a
      ((localizedCompletionEquivCompletion _ (RayClass.adicAbv_isNontrivial v) a) (j z))=_
    rw [localizedCompletionEquivCompletion_coe]
    exact finitePlaceExtensionAdicCompletionRingEquiv_toCompletion v a z
  rw [←hj,←hj]
  change semilinearGaloisGroupCongr (Base v) F (Loc v a) M _ _ (comm v a) _ (locEquiv v a (j x))=_
  rw [semilinearGaloisGroupCongr_apply_equiv]
  exact congrArg (locEquiv v a) (localizationRamificationGroups_decompositionGroupEquiv_toLocalization v₀
    (RayClass.adicAbv_isNontrivial v) a σ x)

theorem action (W:Fibre (L:=L) v) :
    letI:Algebra F (W.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v W).toAlgebra
    ∃ r:Gal(W.1.adicCompletion L/F)→*Gal(L/K),Function.Injective r ∧
      ∀ g x,g (algebraMap L (W.1.adicCompletion L) x)=algebraMap L (W.1.adicCompletion L) (r g x) := by
  obtain ⟨u,rfl⟩:=(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v).surjective W
  let r:=(absoluteValueDecompositionGroup K u.1).subtype.comp (galEquiv v u).symm.toMonoidHom
  refine ⟨r,fun _ _ h=>(galEquiv v u).symm.injective (Subtype.ext h),fun g x=>?_⟩
  have hh:=on_global v u ((galEquiv v u).symm g) x
  rw [(galEquiv v u).apply_symm_apply g] at hh
  exact hh

theorem unique_action (W:Fibre (L:=L) v) (hu:∀ W':Fibre (L:=L) v,W'=W) :
    letI:Algebra F (W.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v W).toAlgebra
    ∃ e:Gal(L/K)≃*Gal(W.1.adicCompletion L/F),
      (∀ g x,e g (algebraMap L (W.1.adicCompletion L) x)=algebraMap L (W.1.adicCompletion L) (g x)) ∧
      Module.finrank F (W.1.adicCompletion L)=Module.finrank K L := by
  obtain ⟨u,rfl⟩:=(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v).surjective W
  have hall (g:Gal(L/K)) : g∈absoluteValueDecompositionGroup K u.1 := by
    apply (mem_absoluteValueDecompositionGroup_iff_extensionConjugate_eq v₀ (RayClass.adicAbv_isNontrivial v) u g).mpr
    exact (finitePlaceExtensionEquivAbove (K:=K) (L:=L) v).injective (hu _)
  let i:=MulEquiv.ofBijective (absoluteValueDecompositionGroup K u.1).subtype
    ⟨Subtype.val_injective,fun g=>⟨⟨g,hall g⟩,rfl⟩⟩
  let e:=i.symm.trans (galEquiv v u)
  letI:= (finitePlaceAdicCompletionMap K L v (finitePlaceExtensionEquivAbove v u)).toAlgebra
  haveI:=TunnellAdicLocalization.galois v (finitePlaceExtensionEquivAbove v u)
  haveI:=finitePlaceAdicCompletionMap_moduleFinite K L v (finitePlaceExtensionEquivAbove v u)
  refine ⟨e,fun g x=>?_,?_⟩
  · have h : (i.symm g).1=g := i.apply_symm_apply g
    exact (on_global v u (i.symm g) x).trans (by rw [h])
  · rw [←IsGalois.card_aut_eq_finrank,←IsGalois.card_aut_eq_finrank]
    exact Nat.card_congr e.symm.toEquiv

#print axioms action
#print axioms unique_action
end
end TunnellAdicDecomposition
