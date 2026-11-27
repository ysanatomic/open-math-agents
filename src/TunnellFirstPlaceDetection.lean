import TunnellActualFirstPlace
import TunnellFirstUnitCharacter
import TunnellFullScalarAction

/-! A tame character on the actual first division place forces a norm unit's first coefficient to vanish. -/
namespace TunnellFirstPlaceDetection
open IsLocalRing NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open WeierstrassCurve WeierstrassCurve.Affine TunnellKummer
open scoped NumberField Classical
noncomputable section

theorem detects {R:Type*} [CommRing R] [IsLocalRing R] {p:ℕ} [Fact p.Prime]
    (ρ:ResidueField R≃+*ZMod p) (z:R) (hspan:maximalIdeal R=Ideal.span {z})
    (hpow:∀ c:R,∃ y:R,(1+z*y)^p=1+z^p*c)
    (δ:R≃+*R) (a:R) (hza:δ z=a*z) (q:(ZMod p)ˣ) (hq:orderOf q=p-1) (ha:ρ (residue R a)=q)
    (b:Additive Rˣ→+ZMod p) (hb:∃ u:Rˣ,b (Additive.ofMul u)≠0)
    (he:∀ u:Rˣ,b (Additive.ofMul (Units.map δ.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    {c:Rˣ} {l:R} (hc:(c:R)=1+z*l) (hn:b (Additive.ofMul c)=0) : ρ (residue R l)=0 := by
  let r:R→+*ZMod p:=ρ.toRingHom.comp (residue R)
  obtain ⟨u,hu⟩:=hb
  by_contra h
  apply hu
  apply TunnellFirstUnitCharacter.first_unit_detects r δ z a _ _ hza _ _
    (fun v=>b (Additive.ofMul v)) (fun v w=>b.map_add (Additive.ofMul v) (Additive.ofMul w)) _ _ hc h hn u
  · have hh : z∈maximalIdeal R:=hspan ▸ Ideal.mem_span_singleton_self _
    change ρ (residue R z)=0
    simp [(residue_eq_zero_iff _).mpr hh]
  · intro x hx
    have hres:residue R x=0:=ρ.injective (hx.trans (map_zero ρ).symm)
    have hx':= (residue_eq_zero_iff _).mp hres
    rwa [hspan,Ideal.mem_span_singleton] at hx'
  · exact TunnellResiduePrime.fixed ρ δ
  · intro k hk hl
    change ρ (residue R a)^k≠ρ (residue R a)
    rw [ha]
    exact TunnellFullScalarAction.tame_inequality q hq k hk hl
  · intro v
    exact (he v).trans (by rw [show r a=(q:ZMod p) from ha])
  · rintro v ⟨d,hd⟩
    obtain ⟨y,hy⟩:=hpow d
    have ey:(1+z*y)^p=(v:R):=by rw [hy,←hd]; ring
    let w:=v.ofPow (1+z*y) (Fact.out:p.Prime).ne_zero ey
    have hw:w^p=v:=Units.ext ey
    rw [←hw,show Additive.ofMul (w^p)=p • Additive.ofMul w from rfl,map_nsmul,nsmul_eq_mul,ZMod.natCast_self,zero_mul]

theorem detects_at_point {D:Type} [Field D] [NumberField D] [DecidableEq D]
    (w:HeightOneSpectrum (𝓞 D)) {p:ℕ} [Fact p.Prime] {W:WeierstrassCurve (w.adicCompletion D)}
    {W₀:WeierstrassCurve (w.adicCompletionIntegers D)}
    (hW:W₀.map (algebraMap _ (w.adicCompletion D))=W) [W.IsElliptic]
    (Z:W₀.formalGroupLaw.Points) (ρ:ResidueField (w.adicCompletionIntegers D)≃+*ZMod p)
    (hspan:maximalIdeal _=Ideal.span {(Z ():w.adicCompletionIntegers D)})
    (hpow:∀ e:w.adicCompletionIntegers D,∃ y:w.adicCompletionIntegers D,
      (1+(Z ():w.adicCompletionIntegers D)*y)^p=1+(Z ():w.adicCompletionIntegers D)^p*e)
    (δ:(w.adicCompletionIntegers D)≃+*(w.adicCompletionIntegers D))
    (k:ℕ) (hδ:((δ (Z ()):w.adicCompletionIntegers D):w.adicCompletion D)=TunnellTameParameter.parameter (k • formalPoint hW Z))
    (q:(ZMod p)ˣ) (hq:orderOf q=p-1) (hk:(k:ZMod p)=q)
    (b:Additive (w.adicCompletionIntegers D)ˣ→+ZMod p) (hb:∃ u,b (Additive.ofMul u)≠0)
    (he:∀ u,b (Additive.ofMul (Units.map δ.toMonoidHom u))=(q:ZMod p)*b (Additive.ofMul u))
    {c:(w.adicCompletionIntegers D)ˣ} {l:w.adicCompletionIntegers D} (hc:(c:w.adicCompletionIntegers D)=1+(Z ():w.adicCompletionIntegers D)*l)
    (hn:b (Additive.ofMul c)=0) : ρ (residue _ l)=0 := by
  obtain ⟨a,hza,ha⟩:=TunnellTameParameter.tame_ratio hW Z k hδ hspan
  exact detects ρ _ hspan hpow δ a hza q hq (by rw [ha,map_natCast,hk]) b hb he hc hn

#print axioms detects_at_point
end
end TunnellFirstPlaceDetection
