import TunnellEisensteinGeometry
import TunnellRankinNormalization

/-! The modular transformation of the actual regularized Eisenstein family. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized Matrix MatrixGroups CongruenceSubgroup ModularGroup Set Filter
open UpperHalfPlane hiding I
open scoped ComplexConjugate Topology
noncomputable section

set_option maxHeartbeats 800000 in
lemma action_large {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (z : ℍ)
    (g : SL(2,ℤ)) (hg : g∈Gamma0 (N*k)) {s : ℂ} (hs : 3/2<s.re) :
    χ (g 1 1:ZMod N)*eisenstein (k:=k) χ (g • z) s=denom g z*eisenstein (k:=k) χ z s := by
  obtain ⟨c,hc⟩ := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (Gamma0_mem.mp hg)
  let a := g 0 0
  let b := g 0 1
  let e := g 1 1
  let L : ℤ := (N*k:ℕ)
  have hd : a*e-L*b*c=1 := by
    have H := g.property
    rw [Matrix.det_fin_two] at H
    dsimp [a,b,e,L]
    rw [hc,Nat.cast_mul] at H
    linear_combination H
  let R := rowMove L a b c e hd
  let J := denom g z
  have hJ : J≠0 := denom_ne_zero _ _
  have hHt : (((g • z).im:ℝ):ℂ)^(s-1) = (z.im:ℂ)^(s-1)*(J*kernel s (conj J)) := by
    rw [ModularGroup.im_smul_eq_div_normSq,Complex.normSq_eq_norm_sq]
    exact height_kernel z.im_pos hJ s
  have hR (p : ℤ×ℤ) :
      χ (e:ZMod N)*kernel s (conj J)*physicalTerm (k:=k) χ (g • z) s p =
        physicalTerm (k:=k) χ z s (R p) := by
    have he : ((R p).2:ZMod N) = (e:ZMod N)*(p.2:ZMod N) := by simp [R,rowMove,L]
    have H : (conj J)*((N:ℂ)*k*(p.1:ℂ)*conj ((g • z:ℍ):ℂ)+(p.2:ℂ)) =
        (N:ℂ)*k*((R p).1:ℂ)*conj (z:ℂ)+((R p).2:ℂ) := by
      have eJ : J=(g 1 0:ℂ)*(z:ℂ)+(g 1 1:ℂ) := by simp [J,ModularGroup.denom_apply]
      have em : ((g • z:ℍ):ℂ)=((a:ℂ)*(z:ℂ)+(b:ℂ))/J := by
        rw [UpperHalfPlane.coe_specialLinearGroup_apply,eJ]
        simp [a,b]
      have hj' : conj J≠0 := by simpa using hJ
      rw [em,map_div₀]
      field_simp [hj']
      simp only [eJ,conj_ofReal,map_add,map_mul,map_intCast,map_natCast,R,rowMove,Equiv.coe_fn_mk,a,b,e,L,
        Int.cast_add,Int.cast_mul,Int.cast_natCast,Nat.cast_mul,hc]
      ring
    simp only [physicalTerm,he,map_mul]
    rw [←H,kernel_mul]
    ring
  have H := (physical_lattice (k:=k) χ (g • z) hs).tsum_eq
  have H' := (physical_lattice (k:=k) χ z hs).tsum_eq
  have hh := scalar_reindex R (physicalTerm (k:=k) χ (g • z) s) (physicalTerm (k:=k) χ z s)
    (χ (e:ZMod N)*kernel s (conj J)) hR
  have he := scalar_action ((z.im:ℂ)^(s-1)) ((((g • z).im:ℝ):ℂ)^(s-1)) J (χ (e:ZMod N))
    (kernel s (conj J)) (∑' p,physicalTerm (k:=k) χ z s p) (∑' p,physicalTerm (k:=k) χ (g • z) s p) hHt hh
  rw [H,H'] at he
  simpa only [eisenstein,mul_assoc] using he

theorem action {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) (z : ℍ)
    (g : SL(2,ℤ)) (hg : g∈Gamma0 (N*k)) :
    EqOn (fun s => χ (g 1 1:ZMod N)*eisenstein (k:=k) χ (g • z) s)
      (fun s => denom g z*eisenstein (k:=k) χ z s) domain := by
  apply (analyticOnNhd_const.mul (eisenstein_analytic _ _)).eqOn_of_preconnected_of_eventuallyEq
    (analyticOnNhd_const.mul (eisenstein_analytic _ _)) (convex_halfSpace_re_gt _).isPreconnected
    (z₀:=2) (by norm_num [domain])
  filter_upwards [(isOpen_lt continuous_const Complex.continuous_re).mem_nhds
    (show (3:ℝ)/2<(2:ℂ).re by norm_num)] with s hs
  exact action_large _ _ _ hg hs

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.action
