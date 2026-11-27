import TunnellCMFirstJet

/-! Evaluating the translated coordinates over a local ring and modulo the square of a parameter. -/
namespace TunnellCMReductionJet
open IsLocalRing WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellCMModelUnit TunnellCMFirstJet
noncomputable section
variable {R K S : Type*} [CommRing R] [IsLocalRing R] [Field K] [DecidableEq K] [CommRing S]

theorem difference_unit (f : R →+* K) (ρ : R →+* S) (n c d v t h : R)
    (ht : t ∈ maximalIdeal R) (ht0 : f t≠0) (hh0 : f h≠0)
    (ht2 : (ρ t)^2=0) (hth : ρ t*(ρ h-1)=0) (B : Rˣ) (hB : (B:R)=c-v)
    (hp : (E (f n)).toAffine.Nonsingular (1/((f t)^2*f h)) (-1/((f t)^3*f h)))
    (hu : (E (f n)).toAffine.Nonsingular (f c) (f d)) :
    ∃ u : Rˣ,
      f (u:R) = X (Point.some _ _ hp + Point.some _ _ hu) - f v ∧
      ρ (u:R) = ρ (B:R)*(1+ρ t*(2*ρ d*ρ (↑B⁻¹:R))) := by
  let D := denominator c t h
  let N := numerator n c d t h - v*D
  have hres := (residue_eq_zero_iff _).mpr ht
  have d1 : residue R D=1 := by simp [D,denominator,hres]
  have hd : IsUnit D := (residue_ne_zero_iff_isUnit D).mp (by rw [d1]; exact one_ne_zero)
  have nB : residue R N=residue R (B:R) := by simp [N,numerator,hres,d1,hB]
  have hnu : IsUnit N := (residue_ne_zero_iff_isUnit N).mp
    (nB.trans_ne ((residue_ne_zero_iff_isUnit _).mpr B.isUnit))
  let u := hnu.unit / hd.unit
  have eqn : (u:R)*D=N := by
    calc (u:R)*D = ((u*hd.unit:Rˣ):R) := by rw [Units.val_mul,hd.unit_spec]
         _ = N := by simp [u,hnu.unit_spec]
  have den (g : R →+* K) : g D = denominator (g c) (g t) (g h) := by simp [D,denominator]
  have hfd : f D ≠ 0 := (hd.map f).ne_zero
  have hs : 1-f c*(f t)^2*f h≠0 := by
    rw [den] at hfd
    exact fun h' => hfd (by simp [denominator,h'])
  refine ⟨u,?_,?_⟩
  · rw [chord_parameter ht0 hh0 hp hu hs]
    have e : f (u:R) * denominator (f c) (f t) (f h) =
        numerator (f n) (f c) (f d) (f t) (f h) - f v * denominator (f c) (f t) (f h) := by
      simpa only [map_mul,N,map_sub,numerator,map_add,map_ofNat,map_pow,den] using congrArg f eqn
    apply eq_sub_iff_add_eq.mpr
    apply (eq_div_iff ((den f).symm.trans_ne hfd)).mpr
    linear_combination e
  · obtain ⟨he,hD⟩ := linear_chord (ρ n) (ρ c) (ρ d) (ρ t) (ρ h) ht2 hth
    have eD : ρ D=1 := by simpa only [D,denominator,map_pow,map_sub,map_one,map_mul] using hD
    have eN : ρ (numerator n c d t h)=ρ c+2*ρ d*ρ t := by
      simpa only [numerator,map_sub,map_add,map_pow,map_mul,map_ofNat] using he
    have eu : ρ (u:R)=ρ c+2*ρ d*ρ t-ρ v := by
      simpa only [map_mul,N,map_sub,eN,eD,mul_one] using congrArg ρ eqn
    have eB : ρ (B:R)*ρ (↑B⁻¹:R)=1 := by rw [← map_mul,B.mul_inv,map_one]
    have eB' := congrArg ρ hB
    rw [map_sub] at eB'
    rw [eu]
    linear_combination -2*ρ t*ρ d*eB - eB'

end
end TunnellCMReductionJet
#print axioms TunnellCMReductionJet.difference_unit
