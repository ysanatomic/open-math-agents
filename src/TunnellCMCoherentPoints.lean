import TunnellCMActualNormUnits
import TunnellLocalCMCoordDegree

/-! Explicit, compatible primitive points in the algebraic division fields. -/
namespace TunnellCMCoherentPoints
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMCriticalCoefficients TunnellCMAlgebraicKernel
open TunnellCMCriticalIntegers TunnellCMAbsoluteUnit TunnellCMLemniscate TunnellCMToricDivision
open TunnellCMNormDistribution TunnellCMTorsionOrder TunnellCMTorsionField TunnellGaussianEnd
open scoped Classical
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [CharZero K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
local notation "W" => E (n:K)
local notation "Lat" => twistPeriods n hn
variable {p : ℕ} (hp : p.Prime) (q : GaussianInt) (hq : q.norm.natAbs=p)

include hp hq in
lemma exists_point (r : ℕ) : ∃ P : CurvePoints W AlgC,
    toric K n hn P=generator n hn (q^r) := by
  have hq0 : q≠0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have ht := TunnellCMCriticalTower.parameter_torsion n hn q hq0 hq r
  obtain ⟨U,hU⟩ := torsion_lift n hn (pow_pos hp.pos r) ht
  let P := (Point.equivOfEq (eq_E K AlgC n)).symm U
  refine ⟨P,?_⟩
  change (Point.equivOfEq _).symm (mapPoint AlgC ℂ n ((Point.equivOfEq _) ((Point.equivOfEq _).symm U)))=_
  rw [AddEquiv.apply_symm_apply,hU,uniformize_apply,AddEquiv.symm_apply_apply]
  simp only [generator,TunnellCMCriticalTower.parameter,map_pow]
  rfl

def primitive (r : ℕ) := (exists_point K n hn hp q hq r).choose

lemma toric_primitive (r : ℕ) : toric K n hn (primitive K n hn hp q hq r)=generator n hn (q^r) :=
  (exists_point K n hn hp q hq r).choose_spec

local notation "T" => primitive K n hn hp q hq
variable [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K AlgC i:AlgC):ℂ)=I)
local notation "φ" => cm (L := AlgC) (n:K) i hi

include hiC in
theorem compatible (r : ℕ) : φ q (T (r+1))=T r := by
  apply toric_inj K n hn
  rw [toric_gaussian K n hn i hi hiC,toric_primitive,toric_primitive,generator,action_exp,generator]
  congr 1
  have hq0 : (q:ℂ)≠0 := GaussianInt.toComplex_eq_zero.not.mpr (by
    rintro rfl; exact hp.ne_zero (by simpa using hq.symm))
  rw [map_pow,map_pow,pow_succ]
  field_simp

include hiC in
theorem generates (h2 : p≠2) (r : ℕ) : φ (q^r) (T r)=0 ∧ addOrderOf (T r)=p^r ∧
      ∀ P : CurvePoints W AlgC, φ (q^r) P=0 → ∃ k : ℤ, k • T r=P := by
  have q0 : q≠0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have qr := pow_ne_zero r q0
  have hT := toric_primitive K n hn hp q hq r
  have hh (a : GaussianInt) (P : CurvePoints W AlgC) : φ a P=0 ↔ action n hn a (toric K n hn P)=0 := by
    rw [← toric_gaussian K n hn i hi hiC,← map_zero (toric K n hn)]
    exact (toric_inj K n hn).eq_iff.symm
  obtain ⟨hc,hd⟩ := TunnellCMGaussianCRT.prime_power_real hp h2 hq r
  have hz (k : ℤ) : k • T r=0 ↔ (p:ℤ)^r∣k := by
    rw [← (toric_inj K n hn).eq_iff,map_zsmul,map_zero,hT,← int_action,annihilator n hn qr,hd]
  refine ⟨(hh _ _).mpr (hT ▸ (annihilator n hn qr _).mpr dvd_rfl),Nat.dvd_antisymm ?_ ?_,?_⟩
  · rw [addOrderOf_dvd_iff_nsmul_eq_zero,← natCast_zsmul,hz,Nat.cast_pow]
  · exact_mod_cast (hz (addOrderOf (T r))).mp (by simp)
  · intro P hP
    obtain ⟨b,hb⟩ := generator_orbit n hn qr _ ((hh _ _).mp hP)
    obtain ⟨k,hk⟩ := hc b
    have he := (annihilator n hn qr _).mpr hk
    rw [add_action,sub_eq_zero,int_action] at he
    exact ⟨k,toric_inj K n hn (by rw [map_zsmul,hT]; exact he.symm.trans hb)⟩

end
end TunnellCMCoherentPoints
#print axioms TunnellCMCoherentPoints.compatible
#print axioms TunnellCMCoherentPoints.generates
