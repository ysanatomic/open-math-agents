module

public import EllipticCurves.WeierstrassFormalGroup.Reduction
import all EllipticCurves.WeierstrassFormalGroup.Reduction
import all EllipticCurves.WeierstrassFormalGroup.Foundations

@[expose] public section

/-! The valuation of a division product on a residue class disjoint from its divisor. -/
set_option maxHeartbeats 900000
namespace TunnellCMLocalUnit

open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing WithZero

variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)} {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W)
  [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
  [W.IsElliptic] [W₀.IsElliptic]

lemma tame_kernel {l q : ℕ} (hl : l.Prime) (hq : q.Prime) (hql : q≠l)
    (hlm : (l:v.adicCompletionIntegers K)∈maximalIdeal (v.adicCompletionIntegers K))
    {P : W.Point} (hp : q • P=0) (hr : adicRed hW P=0) : P=0 := by
  have hf := (adicRed_eq_zero_iff hW).mp hr
  obtain ⟨θ,_⟩ := exists_points_equiv_filtration (hW := hW)
  let Q : filtration hW 0 := ⟨P,hf⟩
  have he : q • θ.symm Q=0 := by
    rw [← map_nsmul,show q • Q=0 from Subtype.ext hp,map_zero]
  have e := points_eq_zero_of_nsmul_prime_ne hl hq hlm hql he
  have eqQ : Q=0 := by simpa using congrArg θ e
  exact congrArg Subtype.val eqQ

lemma separated {l q f m a : ℕ} (hl : l.Prime) (hq : q.Prime) (hql : q≠l)
    (hlm : (l:v.adicCompletionIntegers K)∈maximalIdeal (v.adicCompletionIntegers K))
    (hf : 0 < f) (hqf : q∣f) (hc : q.Coprime (a*m))
    (U V : W.Point) (hu : addOrderOf U=f) (hv : m • V=0) : a • adicRed hW (U+V)≠0 := by
  intro he
  let B := (f/q) • U
  have hb : q • B=0 := by dsimp [B]; rw [← mul_nsmul,Nat.div_mul_cancel hqf,← hu,addOrderOf_nsmul_eq_zero]
  have hb' : B≠0 := by
    intro hh
    have hd := addOrderOf_dvd_iff_nsmul_eq_zero.mpr hh
    rw [hu] at hd
    exact (Nat.not_dvd_of_pos_of_lt (Nat.div_pos (Nat.le_of_dvd hf hqf) hq.pos) (Nat.div_lt_self hf hq.one_lt)) hd
  let ρ := adicRedHom hW
  change a • ρ (U+V)=0 at he
  have ha : (a*m) • ρ U=0 := by
    have e := congrArg (fun x : (adicRedCurve W₀).Point => m • x) he
    change m • (a • ρ (U+V))=m • (0:(adicRedCurve W₀).Point) at e
    rw [smul_comm m a,map_add,nsmul_add,← map_nsmul ρ m V,hv,map_zero,add_zero,nsmul_zero] at e
    rw [mul_nsmul,smul_comm]; exact e
  have heB : (a*m) • ρ B=0 := by
    dsimp [B]
    rw [map_nsmul,smul_comm,ha,nsmul_zero]
  have qB : q • ρ B=0 := by rw [← map_nsmul,hb,map_zero]
  have hdiv := Nat.dvd_gcd (addOrderOf_dvd_of_nsmul_eq_zero qB) (addOrderOf_dvd_of_nsmul_eq_zero heB)
  rw [hc.gcd_eq_one,Nat.dvd_one,AddMonoid.addOrderOf_eq_one_iff] at hdiv
  exact hb' (tame_kernel hW hl hq hql hlm hb hdiv)

set_option maxHeartbeats 3000000 in
theorem difference_value {x y u t : v.adicCompletion K} {hP : W.Nonsingular x y} {hQ : W.Nonsingular u t}
    (h0 : adicRed hW (.some x y hP)≠0)
    (h1 : adicRed hW (.some x y hP)≠adicRed hW (.some u t hQ))
    (h2 : adicRed hW (.some x y hP)≠ -adicRed hW (.some u t hQ)) :
    Valued.v (x-u)=max 1 (Valued.v u) := by
  have hx : ¬ exp (2:ℤ)≤Valued.v x := fun h => h0 (adicRed_some_of_mem hW h)
  have hxi := (integral_of_not_mem hW hP.1 hx).1
  by_cases hu : exp (2:ℤ)≤Valued.v u
  · have hu' : 1<Valued.v u := (show exp (0:ℤ)<exp (2:ℤ) from exp_lt_exp.mpr (by decide)).trans_le hu
    exact (Valued.v.map_sub_eq_of_lt_right (lt_of_le_of_lt hxi hu')).trans (max_eq_right hu'.le).symm
  have hui := (integral_of_not_mem hW hQ.1 hu).1
  rw [max_eq_left hui]
  have eP := adicRed_some_of_not_mem (h := hP) hW hx
  have eQ := adicRed_some_of_not_mem (h := hQ) hW hu
  have hne : residue _ (⟨x,hxi⟩ : v.adicCompletionIntegers K) ≠ residue _ (⟨u,hui⟩ : v.adicCompletionIntegers K) := by
    intro e
    have hP' := adicRed_nonsingular hW hP.1 hxi (integral_of_not_mem hW hP.1 hx).2
    have hQ' := adicRed_nonsingular hW hQ.1 hui (integral_of_not_mem hW hQ.1 hu).2
    rcases (Point.X_eq_iff (h₁ := hP') (h₂ := hQ')).mp e with he|he
    · exact h1 (eP.trans (he.trans eQ.symm))
    · exact h2 (eP.trans (he.trans (congrArg Neg.neg eQ.symm)))
  have hxu := valued_sub_le (v := v) hxi hui
  have hres : residue _ (⟨x-u,hxu⟩ : v.adicCompletionIntegers K)≠0 := by
    rw [res_sub hxi hui hxu]
    exact sub_ne_zero.mpr hne
  exact valued_eq_one_of_residue_ne (v := v) hxu hres

end TunnellCMLocalUnit

#print axioms TunnellCMLocalUnit.tame_kernel
#print axioms TunnellCMLocalUnit.separated
#print axioms TunnellCMLocalUnit.difference_value
