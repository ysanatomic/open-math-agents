import TunnellRestrictedPlaces
import TunnellPadicDivisionSeries
import EllipticCurves.Mathlib.AdicCompletionExtension

/-! Extending the restriction of a discrete valuation to the actual completed number field. -/
namespace TunnellCompletionRestriction
open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero
open scoped NumberField Uniformity
noncomputable section

private theorem basis {F:Type*} [Field F] [Valued F ℤᵐ⁰] (hs:Function.Surjective (Valued.v (R:=F))) :
    (uniformity F).HasBasis (fun _:ℤ => True) (fun k => {q:F×F | Valued.v (q.2-q.1)<exp k}) := by
  apply (Valued.hasBasis_uniformity F ℤᵐ⁰).to_hasBasis
  · intro u _
    let a:ℤᵐ⁰:=MonoidWithZeroHom.ValueGroup₀.embedding u.val
    have ha:a≠0 := MonoidWithZeroHom.ValueGroup₀.embedding_unit_ne_zero u
    refine ⟨log a,trivial,fun x hx => ?_⟩
    change Valued.v.restrict _<u.val
    rw [Valuation.restrict_lt_iff_lt_embedding]
    change Valued.v _<exp (log a) at hx
    rwa [exp_log ha] at hx
  · intro k _
    obtain ⟨z,hz⟩:=hs (exp k)
    have hn : ((Valued.v (R:=F)).restrict z)≠0 := (Valuation.ne_zero_iff _).mpr (by intro hh; rw [hh,map_zero] at hz; exact exp_ne_zero hz.symm)
    refine ⟨Units.mk0 _ hn,trivial,fun x hx => ?_⟩
    change Valued.v.restrict _<Valued.v.restrict z at hx
    rw [Valuation.restrict_lt_iff,hz] at hx
    exact hx

theorem uniform_inducing {F N:Type*} [Field F] [Field N] [Valued F ℤᵐ⁰] [Valued N ℤᵐ⁰]
    (hs:Function.Surjective (Valued.v (R:=F))) (ht:Function.Surjective (Valued.v (R:=N)))
    (φ:F→+*N) {e:ℕ} (he:0<e) (h:∀x:F,Valued.v (φ x)=Valued.v x^e) : IsUniformInducing φ := by
  apply ((basis hs).isUniformInducing_iff (basis ht)).mpr
  constructor
  · intro j _
    let k:=min j 0
    have hk : k≤0 := min_le_right _ _
    have hkj : (e:ℤ)*k≤j := (show (e:ℤ)*k≤1*k from mul_le_mul_of_nonpos_right (by exact_mod_cast he) hk).trans (by rw [one_mul]; exact min_le_left j 0)
    refine ⟨k,trivial,fun x y hxy => ?_⟩
    change Valued.v (φ y-φ x)<exp j
    change Valued.v (y-x)<exp k at hxy
    rw [←map_sub,h]
    refine (pow_lt_pow_left₀ hxy zero_le he.ne').trans_le ?_
    rw [←exp_nsmul,exp_le_exp,Int.nsmul_eq_mul]; exact hkj
  · intro k _
    refine ⟨(e:ℤ)*k,trivial,fun x y hxy => ?_⟩
    change Valued.v (φ y-φ x)<exp ((e:ℤ)*k) at hxy
    rw [←map_sub,h,←Int.nsmul_eq_mul,exp_nsmul] at hxy
    exact (pow_lt_pow_iff_left₀ zero_le zero_le he.ne').mp hxy

variable {F R K:Type} [Field F] [NumberField F] [CommRing R] [IsDedekindDomain R]
    [Field K] [Algebra R K] [IsFractionRing R K]
    (v:HeightOneSpectrum R) (g:F→+*v.adicCompletion K)
    (s:TunnellRestrictedPlaces.Restriction (B:=v.adicCompletionIntegers K) g)
local notation "M" => v.adicCompletion K
local notation "D" => s.v.adicCompletion F

open WithZeroTopology in
theorem embedding : ∃ f:D→+*M, IsUniformInducing f ∧
    (∀x:F,f (algebraMap F D x)=g x) ∧ ∀ z:D,Valued.v (f z)=Valued.v z^s.e := by
  let E:=WithVal (s.v.valuation F)
  let ψ:E→+*M:=g.comp (WithVal.equiv (s.v.valuation F)).toRingHom
  have hs : Function.Surjective (Valued.v (R:=E)) := (s.v.valuation_surjective F).comp (WithVal.equiv (s.v.valuation F)).surjective
  have hψ : IsUniformInducing ψ := uniform_inducing hs (v.valuedAdicCompletion_surjective K) ψ s.pos (by
    intro x
    exact (v.valuation_maximalIdeal_adicCompletionIntegers _).symm.trans (s.valuation _).symm)
  let ψ' := UniformSpace.Completion.extensionHom ψ hψ.uniformContinuous.continuous
  let f := ψ'.comp (adicCompletion.equiv F s.v).toRingHom
  have hψ' : IsUniformInducing ψ' := UniformSpace.Completion.isUniformInducing_extension hψ
  have hf : IsUniformInducing f := hψ'.comp (adicCompletion.uniformEquiv F s.v).isUniformInducing
  have hbase (x:F) : f (algebraMap F D x)=g x := UniformSpace.Completion.extensionHom_coe ψ hψ.uniformContinuous.continuous ((WithVal.equiv _).symm x)
  refine ⟨f,hf,hbase,?_⟩
  have hc₁ : Continuous (Valued.v (R:=M)) := Valued.continuous_valuation_of_surjective (v.valuedAdicCompletion_surjective K)
  have hc₂ : Continuous (Valued.v (R:=D)) := Valued.continuous_valuation_of_surjective (s.v.valuedAdicCompletion_surjective F)
  apply funext_iff.mp
  apply (s.v.denseRange_algebraMap (K:=F)).equalizer (hc₁.comp hf.uniformContinuous.continuous) (hc₂.pow _)
  funext x
  change Valued.v (f (algebraMap F D x))=Valued.v (algebraMap F D x)^_
  rw [hbase,show Valued.v (algebraMap F D x)=s.v.valuation F x from s.v.valuedAdicCompletion_eq_valuation' x,
    s.valuation,v.valuation_maximalIdeal_adicCompletionIntegers]

theorem base_completion {F:Type} [Field F] [NumberField F] {p:ℕ} [Fact p.Prime]
    (g:F→+*TunnellLocalDivisibility.Local p)
    (s:TunnellRestrictedPlaces.Restriction (B:=TunnellPadicDivisionSeries.IntegerRing p) g) :
    ∃ e:s.v.adicCompletion F≃+*TunnellLocalDivisibility.Local p,IsUniformInducing e ∧
      (∀x:F,e (algebraMap F _ x)=g x) ∧ ∀ z,Valued.v (e z)=Valued.v z^s.e := by
  let w:=TunnellLocalDivisibility.place p
  obtain ⟨f,hf,hbase,hval⟩ := embedding w g s
  have hsub : Set.range (algebraMap ℚ (w.adicCompletion ℚ))⊆Set.range f := by
    rintro _ ⟨q,rfl⟩
    refine ⟨algebraMap F _ (q:F),?_⟩
    rw [hbase,map_ratCast]
    exact (map_ratCast (algebraMap ℚ (w.adicCompletion ℚ)) q).symm
  have hsur : Function.Surjective f := by
    intro y
    exact (closure_minimal hsub hf.isComplete_range.isClosed) ((w.denseRange_algebraMap (K:=ℚ)) y)
  exact ⟨RingEquiv.ofBijective f ⟨f.injective,hsur⟩,hf,hbase,hval⟩

#print axioms embedding
#print axioms base_completion
end
end TunnellCompletionRestriction
