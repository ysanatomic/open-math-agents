import TunnellCMConductorOrder
import TunnellCMUnitDistribution

/-! Distribution of the actual critical-value unit under a primary Gaussian isogeny. -/
namespace TunnellCMTraceDistribution

open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMNormDistribution
open TunnellCMEllipticUnit TunnellCMDistribution TunnellCMCritical TunnellCMUnitTrace
open TunnellCMUnitDistribution TunnellCMLSeries TunnellGaussian

noncomputable section
variable (n : ℕ) (hn : 0 < n)
local notation "L" => twistPeriods n hn

def forward (c : GaussianInt) (r : Residues n) : Residues n :=
  (c.re*r.1-c.im*r.2,c.im*r.1+c.re*r.2)

lemma forward_residue (c z : GaussianInt) : forward n c (residue n z) = residue n (c*z) := by
  ext <;> simp [forward,residue] <;> ring

lemma forward_mul (b c : GaussianInt) (r : Residues n) :
    forward n b (forward n c r) = forward n (b*c) r := by
  ext <;> simp [forward] <;> ring

lemma forward_inv (q b : GaussianInt) (k : ℤ)
    (hb : (q : ℂ)*(b : ℂ)=1+(k : ℂ)*((4*n : ℕ) : ℂ)) (r : Residues n) :
    forward n (q*b) r = r := by
  have he : q*b = 1+(k : GaussianInt)*((4*n : ℕ) : GaussianInt) := by
    apply GaussianInt.toComplex_injective
    simpa only [map_mul,map_add,map_natCast,map_intCast,map_one] using hb
  rw [he]
  have e : (4 : ZMod (4*n)) * n = 0 := by
    simpa only [Nat.cast_mul,Nat.cast_ofNat] using ZMod.natCast_self (4*n)
  ext <;> simp [forward,e]

def perm (q : GaussianInt) (h : q.norm.natAbs.Coprime (4*n)) : Equiv.Perm (Residues n) := by
  let b := (inverse_scalar q h).choose
  let k := (inverse_scalar q h).choose_spec.choose
  have hk := (inverse_scalar q h).choose_spec.choose_spec
  exact ⟨forward n q,forward n b,
    fun r => by rw [forward_mul,mul_comm b q]; exact forward_inv n q b k hk r,
    fun r => by rw [forward_mul]; exact forward_inv n q b k hk r⟩

lemma perm_apply (q : GaussianInt) (h : q.norm.natAbs.Coprime (4*n)) (r : Residues n) :
    perm n q h r = forward n q r := rfl

lemma shift (q : GaussianInt) (r : Residues n) :
    (q : ℂ)*point n r - point n (forward n q r) ∈ (L).lattice := by
  have e := coe_sub_mem n hn
    (x := q*liftResidue r) (y := liftResidue (forward n q r))
    (by rw [← forward_residue,residue_lift hn,residue_lift hn])
  obtain ⟨h₁,h₂⟩ := base_dilations n hn
  have h := (TunnellCMScale.lattice_mem _ _ (dilation_ne n hn) h₁ h₂ _).mpr e
  simpa only [point,mul_sub,GaussianInt.toComplex_mul,mul_left_comm (dilation n : ℂ) (q : ℂ)] using h

include hn in
lemma weight_forward (q : GaussianInt) (hq : Primary q) (r : Residues n) :
    weight n (forward n q r) = twistSign n q.norm.natAbs * weight n r := by
  unfold weight
  rw [charWeight_residue n (z := liftResidue (forward n q r)) (w := q*liftResidue r)
    (by rw [residue_lift hn,← forward_residue,residue_lift hn])]
  classical
  simp only [charWeight,primary_mul_iff hq,Zsqrtd.norm_mul,Int.natAbs_mul,twistSign_mul]
  split_ifs <;> ring

lemma signed {p : ℕ} (hp : p.Prime) (h2 : p ≠ 2) (hc : p.Coprime (4*n)) :
    twistSign n p * twistSign n p = 1 := by
  have hd : (n : ℤ).gcd p = 1 := by
    simpa only [Int.gcd_eq_natAbs,Int.natAbs_natCast] using
      (hc.coprime_dvd_right (dvd_mul_left n 4)).symm
  rw [twistSign,if_pos (hp.odd_of_ne_two h2)]
  rcases jacobiSym.eq_one_or_neg_one hd with h|h <;> rw [h] <;> norm_num

private lemma unfilter {ι : Type*} [Fintype ι] (w : ι → ℤ) (g : ι → ℂ) :
    (∏ i ∈ Finset.univ.filter (fun i => w i ≠ 0), g i ^ w i) = ∏ i, g i ^ w i := by
  apply Finset.prod_filter_of_ne
  intro i _ hi h
  exact hi (by simp [h])

theorem norm_trace {p : ℕ} (hp : p.Prime) (h2 : p ≠ 2)
    (q : GaussianInt) (hq : q.norm.natAbs = p) (hpr : Primary q)
    (hf : p.Coprime (4*n)) (ha : p.Coprime (aux n)) (hn8 : n%8=2)
    [Fintype (kernel n hn q)] (t : kernel n hn q → ℂ) (ht : ∀ j, expE L (t j) = j.val)
    (z : ℂ) (hz : ∀ r : Residues n, weight n r ≠ 0 →
      (q : ℂ)*(z + point n r) ∈ regular L (aux n)) :
    (∏ j, traceUnit n hn (z+t j)) = traceUnit n hn ((q : ℂ)*z) ^ twistSign n p := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  letI : NeZero (aux n) := ⟨by unfold aux; omega⟩
  let s := Finset.univ.filter (fun r : Residues n => weight n r ≠ 0)
  let e := perm n q (hq ▸ hf)
  let D r := divisionProduct L (aux n) ((q : ℂ)*z+point n r)
  have he (r : Residues n) : weight n (e r) = twistSign n p * weight n r := by
    simpa only [e,perm_apply,hq] using weight_forward n hn q hpr r
  have hsq := signed n hp h2 hf
  have hw : ∑ r ∈ s, weight n r = 0 := by
    rw [Finset.sum_filter_ne_zero]
    exact TunnellCMWeights.weight_sum_zero n hn8
  have q0 : q ≠ 0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have H := distribution n hn q q0 (aux n) (by rw [gram_card n hn hp h2 hq]; exact ha)
    t ht s (weight n) hw (point n) (fun r => point n (e r))
    (fun r _ => shift n hn q r) z (fun r hr => hz r (Finset.mem_filter.mp hr).2)
  change (∏ j, weighted L (aux n) s (weight n) (point n) (z+t j)) = _
  rw [H]
  change (∏ r ∈ s, D (e r) ^ weight n r) = (∏ r ∈ s, D r ^ weight n r) ^ twistSign n p
  rw [unfilter,unfilter,← Finset.prod_zpow,← Equiv.prod_comp e (fun r => (D r ^ weight n r) ^ twistSign n p)]
  apply Finset.prod_congr rfl
  intro r _
  rw [← zpow_mul,he,mul_right_comm,hsq,one_mul]

end
end TunnellCMTraceDistribution
#print axioms TunnellCMTraceDistribution.norm_trace
