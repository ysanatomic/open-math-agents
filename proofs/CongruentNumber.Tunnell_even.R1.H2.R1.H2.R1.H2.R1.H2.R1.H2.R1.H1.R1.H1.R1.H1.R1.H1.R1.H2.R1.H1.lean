import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1
import Mathlib

namespace TunnellTensorFactors
open scoped TensorProduct WithZero NumberField Classical
open IsDedekindDomain NumberField

theorem actual_eval {D N : Type} [Field D] [NumberField D] [Field N] [NumberField N]
    [Algebra D N] [FiniteDimensional D N]
    (v : HeightOneSpectrum (𝓞 D)) (t : HeightOneSpectrum (𝓞 N))
    (f : v.adicCompletion D →+* t.adicCompletion N) (hf : Continuous f)
    (hc : ∀ c : D, f (algebraMap D _ c) = algebraMap N _ (algebraMap D N c)) :
    letI : Algebra (v.adicCompletion D) (t.adicCompletion N) := f.toAlgebra
    ∃ e : v.adicCompletion D ⊗[D] N →ₐ[v.adicCompletion D] t.adicCompletion N, Function.Surjective e := by
  let K := v.adicCompletion D
  let W := t.adicCompletion N
  letI : NontriviallyNormedField K := Valued.toNontriviallyNormedField K ℤᵐ⁰
  letI : Algebra K W := f.toAlgebra
  letI : Algebra D W := ((algebraMap N W).comp (algebraMap D N)).toAlgebra
  letI : IsScalarTower D K W := IsScalarTower.of_algebraMap_eq fun x => (hc x).symm
  letI : ContinuousSMul K W := continuousSMul_of_algebraMap K W hf
  let j : N →ₐ[D] W := ⟨algebraMap N W,fun _ => rfl⟩
  let e : K ⊗[D] N →ₐ[K] W := Algebra.TensorProduct.lift (Algebra.ofId K W) j (fun _ _ => Commute.all ..)
  refine ⟨e,fun y => ?_⟩
  haveI : FiniteDimensional K e.range := Module.Finite.of_surjective e.rangeRestrict.toLinearMap e.rangeRestrict_surjective
  have h : IsClosed (e.range : Set W) := e.range.toSubmodule.closed_of_finiteDimensional
  apply (t.denseRange_algebraMap N).induction_on (p:=fun y => y ∈ e.range) y h
  intro x
  refine ⟨1 ⊗ₜ[D] x,?_⟩
  simp [e, j]
  rfl

end TunnellTensorFactors

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

end
end TunnellCompletionRestriction

namespace TunnellArtinRationalBase
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open scoped Classical TensorProduct NumberField WithZero

theorem rationalBase : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1.H1 := by
  intro F _ _ w L
  let p : HeightOneSpectrum (𝓞 ℚ) :=
    ⟨w.asIdeal.under (𝓞 ℚ), inferInstance, Ideal.under_ne_bot (𝓞 ℚ) w.ne_bot⟩
  let : w.asIdeal.LiesOver p.asIdeal := ⟨rfl⟩
  let g := algebraMap (WithVal (p.valuation ℚ)) (WithVal (w.valuation F))
  have hg : UniformContinuous g := uniformContinuous_algebraMap_liesOver (K:=ℚ) (L:=F) p w
  let i := (adicCompletion.equiv F w).symm.toRingHom.comp
    ((UniformSpace.Completion.mapRingHom g hg.continuous).comp (adicCompletion.equiv ℚ p).toRingHom)
  have hi : Continuous i := (adicCompletion.continuous_ofCompletion F w).comp
    (UniformSpace.Completion.continuous_map.comp (adicCompletion.continuous_toCompletion ℚ p))
  have hc (q : ℚ) : i (algebraMap ℚ _ q) = algebraMap F _ (algebraMap ℚ F q) := by
    apply adicCompletion.ext
    change UniformSpace.Completion.mapRingHom g hg.continuous
      (((WithVal.equiv (p.valuation ℚ)).symm q : WithVal _) : (p.valuation ℚ).Completion) = _
    rw [UniformSpace.Completion.mapRingHom_coe]
    rfl
  refine ⟨p,i,hi,?_,?_⟩
  · let : Algebra (p.adicCompletion ℚ) L := i.toAlgebra
    obtain ⟨e,he⟩ := TunnellTensorFactors.actual_eval p w i hi hc
    exact Module.Finite.of_surjective e.toLinearMap he
  · intro d hd z
    have hcont : Continuous d := (TunnellCompletionRestriction.uniform_inducing
      (w.valuedAdicCompletion_surjective F) (w.valuedAdicCompletion_surjective F) d.toRingHom
      (e:=1) Nat.zero_lt_one (fun t => (hd t).trans (pow_one _).symm)).uniformContinuous.continuous
    have eq := (p.denseRange_algebraMap ℚ).equalizer (hcont.comp hi) hi (by
      funext q
      change d (i (algebraMap ℚ _ q)) = i (algebraMap ℚ _ q)
      have rat : i (algebraMap ℚ _ q) = (q : L) := by
        simpa only [Rat.cast_id, RingHom.comp_apply] using (map_ratCast (i.comp (algebraMap ℚ _)) q)
      rw [rat, map_ratCast])
    exact congrFun eq z

end TunnellArtinRationalBase

theorem OMA.solution : OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1.H1 := TunnellArtinRationalBase.rationalBase
