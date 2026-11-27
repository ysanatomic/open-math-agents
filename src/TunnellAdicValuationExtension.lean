import TunnellAdicLocalization

/-! Compatibility and integral closure for the genuine completed valuation rings in a finite Galois extension. -/
namespace TunnellAdicValuationExtension
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open AlgebraicNumberTheory.Valuations TunnellAdicLocalField TunnellAdicLocalization
open scoped ValuativeRel Classical NNReal TunnellAdicLocalField TunnellAdicLocalization
noncomputable section
variable {K L:Type} [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
variable (v:HeightOneSpectrum (𝓞 K))
local notation "F" => adicCompletion K v

theorem hasExtension (W:Fibre (L:=L) v) :
    letI:Algebra F (W.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v W).toAlgebra
    Valuation.HasExtension (ValuativeRel.valuation F) (ValuativeRel.valuation (W.1.adicCompletion L)) := by
  obtain ⟨a,rfl⟩:=(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v).surjective W
  let w:=(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a).1
  let W:=finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a
  letI:Algebra F (w.adicCompletion L):=(finitePlaceAdicCompletionMap K L v W).toAlgebra
  haveI:w.asIdeal.LiesOver v.asIdeal:=finitePlaceExtensionCentre_liesOver v a
  change Valuation.HasExtension (ValuativeRel.valuation F) (ValuativeRel.valuation (w.adicCompletion L))
  apply Valuation.HasExtension.ofComapInteger
  ext x
  change algebraMap F (w.adicCompletion L) x∈𝒪[w.adicCompletion L] ↔ x∈𝒪[F]
  rw [mem_integers_iff,mem_integers_iff]
  change Valued.v (finitePlaceAdicCompletionMap K L v W x)≤1 ↔ Valued.v x≤1
  rw [finitePlaceAdicCompletionMap_valued]
  exact pow_le_one_iff_of_nonneg zero_le (Ideal.IsDedekindDomain.ramificationIdx'_ne_zero_of_liesOver w.asIdeal v.ne_bot)

private lemma equiv_integral {R S A B:Type*} [CommRing R] [CommRing S] [CommRing A] [CommRing B]
    [Algebra R A] [Algebra S B] (e:R≃+*S) (f:A≃+*B) (h:∀x:R,f (algebraMap R A x)=algebraMap S B (e x)) (x:A) :
    IsIntegral R x ↔ IsIntegral S (f x) := by
  constructor
  · apply IsIntegral.map_of_comp_eq e.toRingHom f.toRingHom
    exact RingHom.ext fun t=>(h t).symm
  · intro hx
    have h' (y:S) : f.symm (algebraMap S B y)=algebraMap R A (e.symm y) := by
      apply f.injective
      rw [f.apply_symm_apply,h,e.apply_symm_apply]
    have hh := IsIntegral.map_of_comp_eq e.symm.toRingHom f.symm.toRingHom (RingHom.ext fun t=>(h' t).symm) hx
    simpa using hh

theorem integralClosure (W:Fibre (L:=L) v) :
    letI:Algebra F (W.1.adicCompletion L):=(finitePlaceAdicCompletionMap K L v W).toAlgebra
    IsIntegralClosure 𝒪[W.1.adicCompletion L] 𝒪[F] (W.1.adicCompletion L) := by
  obtain ⟨a,rfl⟩:=(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v).surjective W
  let v₀:=NumberField.HeightOneSpectrum.adicAbv K v
  let w:=(finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a).1
  let M:=w.adicCompletion L
  let W:=finitePlaceExtensionEquivAbove (K:=K) (L:=L) v a
  let E:=Loc v a
  letI:Algebra F M:=(finitePlaceAdicCompletionMap K L v W).toAlgebra
  letI:Valued E ℝ≥0:=localizedCompletionFinitePlaceValued v₀ a (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K v)
  letI:ValuativeRel E:=localizedCompletionFinitePlaceValuativeRel v₀ a (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K v)
  letI:Algebra 𝒪[Base v] E:=Algebra.ofSubsemiring _
  haveI:=localizedCompletionIsIntegralClosureWithExtension v₀ a (RayClass.adicAbv_isNontrivial v)
    (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K v)
  let e:𝒪[Base v]≃+*𝒪[F]:=(finitePlaceCompletionIntegerRingEquiv v).trans (integers v).symm
  let f:=locEquiv v a
  have hm (y:E) : f y∈𝒪[M] ↔ y∈𝒪[E] := by
    rw [mem_integers_iff w]
    change finitePlaceExtensionAdicCompletionRingEquiv v a
      ((localizedCompletionEquivCompletion _ (RayClass.adicAbv_isNontrivial v) a) y)∈(finitePlaceExtensionCentre (K:=K) (L:=L) v a).adicCompletionIntegers L ↔ _
    rw [finitePlaceExtensionAdicCompletionRingEquiv_mem_integers_iff,mem_absoluteValueCompletionIntegers_iff,
      localizedCompletion_mem_integers_iff_norm_le_one v₀ a (NumberField.HeightOneSpectrum.isNonarchimedean_adicAbv K v)]
    rfl
  change IsIntegralClosure 𝒪[M] 𝒪[F] M
  refine ⟨Subtype.val_injective,?_⟩
  intro y
  obtain ⟨x,rfl⟩:=f.surjective y
  have hh:=equiv_integral e f (fun z:𝒪[Base v] => (RingHom.congr_fun (comparison v a) (z:Base v)).symm) x
  rw [←hh,IsIntegralClosure.isIntegral_iff (A:=𝒪[E])]
  constructor
  · rintro ⟨z,rfl⟩
    exact ⟨⟨_,(hm _).mpr z.2⟩,rfl⟩
  · rintro ⟨z,hz⟩
    exact ⟨⟨x,(hm x).mp (hz ▸ z.2)⟩,rfl⟩

#print axioms hasExtension
#print axioms integralClosure
end
end TunnellAdicValuationExtension
