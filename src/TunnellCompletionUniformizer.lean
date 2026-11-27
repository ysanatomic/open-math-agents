import TunnellCompletionRestriction
import TunnellGlobalTotalRamification
import TunnellTameParameter

/-! Recovering the global formal parameter as a uniformizer in the actual local integer ring. -/
namespace TunnellCompletionUniformizer
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WithZero NumberField
open scoped NumberField
noncomputable section

variable {F D R K:Type} [Field F] [NumberField F] [Field D] [NumberField D] [Algebra F D]
    [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]

theorem uniformizer (v:HeightOneSpectrum (𝓞 F)) (w:HeightOneSpectrum (𝓞 D))
    [w.asIdeal.LiesOver v.asIdeal] {p d:ℕ} (hbase:v.valuation F (p:F)=exp (-1:ℤ))
    (hd:w.asIdeal.ramificationIdx (𝓞 F)=d) (t:D) (ht:(w.valuation D t)^d=w.valuation D (p:D)) :
    ∃ z:w.adicCompletionIntegers D,(z:w.adicCompletion D)=algebraMap D _ t ∧
      maximalIdeal (w.adicCompletionIntegers D)=Ideal.span {z} ∧
      ∃ u:(w.adicCompletionIntegers D)ˣ,(u:w.adicCompletionIntegers D)*z^d=(p:w.adicCompletionIntegers D) := by
  let O:=w.adicCompletionIntegers D
  let M:=w.adicCompletion D
  have e:=valuation_liesOver D v w (p:F)
  rw [map_natCast (algebraMap F D) p,hbase,Ideal.ramificationIdx'_eq_ramificationIdx _ _ v.ne_bot,hd] at e
  have hd₀ : d≠0 := hd ▸ (w.asIdeal.ramificationIdx_pos (𝓞 F)).ne'
  have htv : w.valuation D t=exp (-1:ℤ) := (pow_left_inj₀ zero_le zero_le hd₀).mp (ht.trans e.symm)
  have htM : Valued.v (algebraMap D M t)=exp (-1:ℤ) := (w.valuedAdicCompletion_eq_valuation' t).trans htv
  let z:O:=⟨algebraMap D M t,by
    change Valued.v (algebraMap D M t)≤1
    rw [htM]; exact exp_le_exp.mpr (by decide : (-1:ℤ)≤0)⟩
  have hspan : Ideal.span {z}=maximalIdeal O := by
    simpa only [pow_one] using w.span_singleton_eq_maximalIdeal_pow (x:=z) (e:=1) htM
  let y:M:=(p:M)/(z:M)^d
  have hnon : (z:M)≠0 := (Valuation.ne_zero_iff _).mp (htM.trans_ne exp_ne_zero)
  have hpM : Valued.v (p:M)=Valued.v (z:M)^d := by
    rw [←map_natCast (algebraMap D M) p]
    exact (w.valuedAdicCompletion_eq_valuation' (p:D)).trans (ht.symm.trans (congrArg (·^d) (w.valuedAdicCompletion_eq_valuation' t).symm))
  have hy : Valued.v y=1 := by
    rw [show y=(p:M)/(z:M)^d from rfl,map_div₀,map_pow,hpM,div_self (pow_ne_zero _ ((Valuation.ne_zero_iff _).mpr hnon))]
  have hyn:y≠0 := fun h => by rw [h,map_zero] at hy; exact zero_ne_one hy
  let u:Oˣ :=
    { val:=⟨y,hy.le⟩
      inv:=⟨y⁻¹,by change Valued.v y⁻¹≤1; rw [map_inv₀,hy,inv_one]⟩
      val_inv:=Subtype.ext (mul_inv_cancel₀ hyn)
      inv_val:=Subtype.ext (inv_mul_cancel₀ hyn) }
  refine ⟨z,rfl,hspan.symm,u,Subtype.ext ?_⟩
  change (p:M)/(z:M)^d*(z:M)^d=_
  rw [div_mul_cancel₀ _ (pow_ne_zero _ hnon)]
  exact (map_natCast (algebraMap O M) p).symm

theorem integral_embedding (w:HeightOneSpectrum (𝓞 D)) (v:HeightOneSpectrum R)
    (g:w.adicCompletion D→+*v.adicCompletion K) {e:ℕ} (he:0<e)
    (hg:∀x,Valued.v (g x)=Valued.v x^e) :
    ∃ f:w.adicCompletionIntegers D→+*v.adicCompletionIntegers K,IsLocalHom f ∧
      ∀x:w.adicCompletionIntegers D,(f x:v.adicCompletion K)=g (x:w.adicCompletion D) := by
  let O:=w.adicCompletionIntegers D
  let B:=v.adicCompletionIntegers K
  let f:O→+*B := (g.comp (algebraMap O (w.adicCompletion D))).codRestrict B.toSubring (fun x => by
    change Valued.v (g (x:w.adicCompletion D))≤1
    rw [hg]; exact pow_le_one' x.2 _)
  refine ⟨f,⟨fun x hx => ?_⟩,fun _=> rfl⟩
  by_contra h
  apply (show ¬IsUnit (f x) from ?_) hx
  apply Valuation.Integer.not_isUnit_iff_valuation_lt_one.mpr
  change Valued.v (g (x:w.adicCompletion D))<1
  rw [hg]
  exact pow_lt_one₀ zero_le (Valuation.Integer.not_isUnit_iff_valuation_lt_one.mp h) he.ne'

#print axioms uniformizer
#print axioms integral_embedding
end
end TunnellCompletionUniformizer
