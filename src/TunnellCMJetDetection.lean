import TunnellFirstPlaceDetection
import TunnellCMFormalNormJet

/-! Passage from the computed elliptic-unit jet to tame first-place detection. -/
namespace TunnellCMJetDetection
open IsLocalRing NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer
open scoped NumberField Classical
noncomputable section
lemma lift_coefficient {R : Type*} [CommRing R] [IsLocalRing R] (c t d : R)
    (ht : maximalIdeal R=Ideal.span {t})
    (hj : let f:=Ideal.Quotient.mk ((maximalIdeal R)^2); f c=1+f t*f d) :
    ∃ l : R, c=1+t*l ∧ residue R l=residue R d := by
  let f:=Ideal.Quotient.mk ((maximalIdeal R)^2)
  have hh : f c=f (1+t*d) := by simpa only [map_add,map_mul,map_one] using hj
  have h := Ideal.Quotient.eq.mp hh
  rw [ht,Ideal.span_singleton_pow,Ideal.mem_span_singleton] at h
  obtain ⟨a,ha⟩:=h
  have h0 : residue R t=0 := (residue_eq_zero_iff _).mpr (ht ▸ Ideal.mem_span_singleton_self t)
  exact ⟨d+t*a,by linear_combination ha,by rw [map_add,map_mul,h0,zero_mul,add_zero]⟩

theorem nonzero_character {D : Type} [Field D] [NumberField D] [DecidableEq D]
    (w : HeightOneSpectrum (𝓞 D)) {p : ℕ} [Fact p.Prime]
    {W : WeierstrassCurve (w.adicCompletion D)} {W₀ : WeierstrassCurve (w.adicCompletionIntegers D)}
    (hW : W₀.map (algebraMap _ (w.adicCompletion D))=W) [W.IsElliptic]
    (Z : W₀.formalGroupLaw.Points) (ρ : ResidueField (w.adicCompletionIntegers D) ≃+* ZMod p)
    (hspan : maximalIdeal _=Ideal.span {(Z ():w.adicCompletionIntegers D)})
    (hpow : ∀ e:w.adicCompletionIntegers D,∃ y:w.adicCompletionIntegers D,
      (1+(Z ():w.adicCompletionIntegers D)*y)^p=1+(Z ():w.adicCompletionIntegers D)^p*e)
    (δ : (w.adicCompletionIntegers D)≃+*(w.adicCompletionIntegers D))
    (k : ℕ) (hδ : ((δ (Z ()):w.adicCompletionIntegers D):w.adicCompletion D)=TunnellTameParameter.parameter (k • formalPoint hW Z))
    (q : (ZMod p)ˣ) (hq : orderOf q=p-1) (hk : (k:ZMod p)=q)
    (b : Additive (w.adicCompletionIntegers D)ˣ→+ZMod p) (hb : ∃ u,b (Additive.ofMul u)≠0)
    (he : ∀ u,b (Additive.ofMul (Units.map δ.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    (u u₀ : (w.adicCompletionIntegers D)ˣ) (d : w.adicCompletionIntegers D) (hd : IsUnit d)
    (hj : let f := Ideal.Quotient.mk ((maximalIdeal (w.adicCompletionIntegers D))^2);
      f ((u/u₀ : (w.adicCompletionIntegers D)ˣ):w.adicCompletionIntegers D)=1+f (Z ():w.adicCompletionIntegers D)*f d) :
    b (Additive.ofMul u)≠b (Additive.ofMul u₀) := by
  intro eq
  obtain ⟨l,hl,hl'⟩:=lift_coefficient _ _ _ hspan hj
  have hn : b (Additive.ofMul (u/u₀))=0 := by
    change b (Additive.ofMul u-Additive.ofMul u₀)=0
    rw [map_sub,eq,sub_self]
  have hh:=TunnellFirstPlaceDetection.detects_at_point w hW Z ρ hspan hpow δ k hδ q hq hk b hb he hl hn
  rw [hl'] at hh
  exact ((hd.map ((ρ.toRingHom).comp (residue _))).ne_zero) hh

end
end TunnellCMJetDetection
#print axioms TunnellCMJetDetection.nonzero_character
