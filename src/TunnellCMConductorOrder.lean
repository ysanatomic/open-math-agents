import TunnellCMAlgebraicUnits

/-! Each shift with nonzero weight in the elliptic unit has exact additive order 4n. -/
namespace TunnellCMConductorOrder

open Complex LSG.Weierstrass LSG.LemniscateIndep TunnellCMLemniscate TunnellCMDistribution
open TunnellCMUnitTrace TunnellCMLSeries TunnellCMCritical TunnellCoates TunnellGaussian

lemma weight_coprime {n : ℕ} (r : Residues n) (hr : weight n r≠0) :
    (liftResidue r).norm.natAbs.Coprime (4*n) := by
  classical
  let g := liftResidue r
  change charWeight n g≠0 at hr
  have hp : Primary g := by by_contra h; exact hr (by simp [charWeight,h])
  have ho : Odd g.norm.natAbs := by by_contra h; exact hr (by simp [charWeight,hp,twistSign,h])
  have hn : jacobiSym n g.norm.natAbs≠0 := by simpa [charWeight,hp,twistSign,ho] using hr
  have hg : g.norm.natAbs≠0 := by intro h; rw [h] at ho; simpa using ho
  letI : NeZero g.norm.natAbs := ⟨hg⟩
  have e : (n:ℤ).gcd g.norm.natAbs=1 := by by_contra hh; exact hn (jacobiSym.eq_zero_iff_not_coprime.mpr hh)
  have ec : n.Coprime g.norm.natAbs := by simpa [Int.gcd_eq_natAbs] using e
  exact Nat.coprime_mul_iff_right.mpr ⟨by simpa using ho.coprime_two_right.pow_right 2,ec.symm⟩

variable (n : ℕ) (hn : 0<n)
local notation "M" => twistPeriods n hn

lemma scaled_mem (z : GaussianInt) : (realPeriod n:ℂ)*(z:ℂ)∈(M).lattice := by
  apply PeriodPair.mem_lattice.mpr
  refine ⟨z.re,z.im,?_⟩
  change (z.re:ℂ)*(realPeriod n:ℂ)+z.im*(I*(realPeriod n:ℂ))=_
  rw [GaussianInt.toComplex_def]
  ring

theorem conductor_order (r : Residues n) (hr : weight n r≠0) :
    addOrderOf (expE M (point n r))=4*n := by
  let g := liftResidue r
  let f := 4*n
  have hf : (f:ℂ)≠0 := by exact_mod_cast (show f≠0 by dsimp [f]; omega)
  have hω : (realPeriod n:ℂ)≠0 := ofReal_ne_zero.mpr (realPeriod_pos (by exact_mod_cast hn)).ne'
  have hpt : point n r=(realPeriod n:ℂ)*(g:ℂ)/(f:ℂ) := by
    dsimp [f,point,dilation,g]
    push_cast
    ring
  have hg : IsCoprime g (f:GaussianInt) := by
    have h := (weight_coprime r hr).isCoprime.map (Int.castRingHom GaussianInt)
    have hg0 : g∣(g.norm.natAbs:GaussianInt) := by
      rw [GaussianInt.natCast_natAbs_norm,Zsqrtd.norm_eq_mul_conj]
      exact dvd_mul_right _ _
    apply IsCoprime.of_isCoprime_of_dvd_left _ hg0
    simpa [g,f] using h
  apply Nat.dvd_antisymm
  · apply addOrderOf_dvd_of_nsmul_eq_zero
    apply (TunnellCMTranscendental.analytic_killed M _ _).mpr
    exact TunnellCMAlgebraicUnits.conductor_point n hn r
  · let k := addOrderOf (expE M (point n r))
    have e := (TunnellCMTranscendental.analytic_killed M k _).mp (addOrderOf_nsmul_eq_zero _)
    rw [hpt,mem_lattice_sq (a := realPeriod n) rfl rfl] at e
    obtain ⟨u,v,he⟩ := e
    let b : GaussianInt := ⟨u,v⟩
    have hd : (f:GaussianInt)∣(k:GaussianInt)*g := by
      refine ⟨b,GaussianInt.toComplex_inj.mp ?_⟩
      change GaussianInt.toComplex _=GaussianInt.toComplex _
      rw [map_mul,map_mul,map_natCast,map_natCast]
      change (k:ℂ)*(g:ℂ)=(f:ℂ)*(b:ℂ)
      rw [GaussianInt.toComplex_def' u v]
      field_simp [hf] at he
      simpa only [mul_comm] using he.symm
    have e' := hg.symm.dvd_of_dvd_mul_right hd
    obtain ⟨b,hb⟩ := e'
    have hh : (k:ℤ)=(f:ℤ)*b.re := by simpa using congrArg Zsqrtd.re hb
    exact_mod_cast (show (f:ℤ)∣(k:ℤ) from ⟨_,hh⟩)

end TunnellCMConductorOrder

#print axioms TunnellCMConductorOrder.conductor_order
