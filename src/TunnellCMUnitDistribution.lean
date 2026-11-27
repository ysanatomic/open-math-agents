import TunnellCMNormDistribution

/-! Exact distribution along a split-prime tower for elliptic products whose weights sum to zero. -/
namespace TunnellCMUnitDistribution

open Complex LSG.Weierstrass TunnellCMLemniscate TunnellCMNormDistribution
open TunnellCMEllipticUnit TunnellCMDistribution

noncomputable section

def weighted {ι : Type*} (L : PeriodPair) (a : ℕ) (s : Finset ι) (w : ι → ℤ)
    (y : ι → ℂ) (z : ℂ) : ℂ :=
  ∏ i ∈ s, divisionProduct L a (z + y i) ^ w i

private theorem prod_const {ι : Type*} (s : Finset ι) (w : ι → ℤ) {c : ℂ} (hc : c ≠ 0) :
    (∏ i ∈ s, c ^ w i) = c ^ (∑ i ∈ s, w i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert i s hi ih => simp [hi, ih, zpow_add₀ hc]

variable (n : ℕ) (hn : 0 < n)
local notation "L" => twistPeriods n hn

theorem distribution {ι : Type*} (q : GaussianInt) (hq : q ≠ 0) [Fintype (kernel n hn q)]
    (a : ℕ) [NeZero a] (hc : (Nat.card (kernel n hn q)).Coprime a)
    (t : kernel n hn q → ℂ) (ht : ∀ j, expE L (t j) = j.val)
    (s : Finset ι) (w : ι → ℤ) (hw : ∑ i ∈ s, w i = 0) (y y' : ι → ℂ)
    (hy : ∀ i ∈ s, (q : ℂ) * y i - y' i ∈ (L).lattice)
    (z : ℂ) (hz : ∀ i ∈ s, (q : ℂ) * (z + y i) ∈ regular L a) :
    (∏ j, weighted L a s w y (z + t j)) = weighted L a s w y' ((q : ℂ) * z) := by
  classical
  obtain ⟨c, hc0, H⟩ := norm_constant n hn q hq a hc t ht
  unfold weighted
  rw [Finset.prod_comm]
  have e (i : ι) (hi : i ∈ s) :
      (∏ j, divisionProduct L a (z + t j + y i) ^ w i) =
        c ^ w i * divisionProduct L a ((q : ℂ) * z + y' i) ^ w i := by
    simp_rw [add_right_comm z (t _) (y i)]
    rw [Finset.prod_zpow,H (z + y i) (hz i hi),mul_zpow,mul_add]
    rw [show (q : ℂ) * z + (q : ℂ) * y i =
      ((q : ℂ) * z + y' i) + ((q : ℂ) * y i - y' i) by ring]
    rw [division_periodic L a _ (hy i hi)]
  rw [Finset.prod_congr rfl e,Finset.prod_mul_distrib,prod_const s w hc0,hw,zpow_zero,one_mul]

theorem inverse_scalar {f : ℕ} (q : GaussianInt) (h : q.norm.natAbs.Coprime f) :
    ∃ b : GaussianInt, ∃ k : ℤ, (q : ℂ) * (b : ℂ) = 1 + (k : ℂ) * (f : ℂ) := by
  let p := q.norm.natAbs
  let A := Nat.gcdA p f
  let B := Nat.gcdB p f
  have he : (1 : ℤ) = (p : ℤ) * A + (f : ℤ) * B := by
    simpa only [A,B,p,h.gcd_eq_one,Nat.cast_one] using Nat.gcd_eq_gcd_ab p f
  have qq : q * star q = (p : GaussianInt) := by
    rw [← Zsqrtd.norm_eq_mul_conj,GaussianInt.natCast_natAbs_norm]
  refine ⟨(A : GaussianInt) * star q,-B,?_⟩
  have e : (q : ℂ) * ((star q : GaussianInt) : ℂ) = (p : ℂ) := by
    simpa using congrArg (fun x : GaussianInt => (x : ℂ)) qq
  have eb : (q : ℂ) * (((A : GaussianInt) * star q : GaussianInt) : ℂ) = (p : ℂ) * (A : ℂ) := by
    rw [GaussianInt.toComplex_mul,mul_left_comm, e]
    simp [mul_comm]
  rw [eb, Int.cast_neg]
  have hh := congrArg (fun x : ℤ => (x : ℂ)) he
  push_cast at hh
  linear_combination -hh

theorem iterate_period {ι : Type*} (q b : GaussianInt) (f : ℕ) (k : ℤ)
    (hb : (q : ℂ) * (b : ℂ) = 1 + (k : ℂ) * (f : ℂ)) (r : ℕ)
    (y : ι → ℂ) {i : ι} (hy : (f : ℂ) * y i ∈ (L).lattice) :
    (q : ℂ) * ((b : ℂ)^(r+1) * y i) - (b : ℂ)^r * y i ∈ (L).lattice := by
  have e : (q : ℂ) * ((b : ℂ)^(r+1) * y i) - (b : ℂ)^r * y i =
      (b : ℂ)^r * ((k : ℂ) * ((f : ℂ) * y i)) := by
    linear_combination (b : ℂ)^r * y i * hb
  rw [e,← map_pow GaussianInt.toComplex]
  apply cm_lattice n hn
  simpa only [zsmul_eq_mul] using (L).lattice.smul_mem k hy

lemma regular_of_sub {a : ℕ} {x y : ℂ} (hy : y ∈ regular L a)
    (hxy : x-y ∈ (L).lattice) : x ∈ regular L a := by
  intro hx
  have he := (L).lattice.sub_mem hx (mul_mem L a hxy)
  apply hy
  simpa only [mul_sub,sub_sub_cancel] using he

def points {p : ℕ} (hp : p.Prime) (h2 : p ≠ 2) {q : GaussianInt} (hq : q.norm.natAbs=p) :
    Finset (kernel n hn q) := by
  classical
  letI : Finite (kernel n hn q) := Nat.finite_of_card_ne_zero ((gram_card n hn hp h2 hq).trans_ne hp.ne_zero)
  exact @Finset.univ _ (Fintype.ofFinite _)

theorem tower {ι : Type*} {p f : ℕ} (hp : p.Prime) (h2 : p ≠ 2)
    (q : GaussianInt) (hq : q.norm.natAbs = p) (hf : p.Coprime f)
    (a : ℕ) [NeZero a] (ha : p.Coprime a)
    (s : Finset ι) (w : ι → ℤ) (hw : ∑ i ∈ s, w i = 0)
    (y : ι → ℂ) (hy : ∀ i ∈ s, (f : ℂ) * y i ∈ (L).lattice)
    (hya : ∀ i ∈ s, y i ∈ regular L a) :
    ∃ b : GaussianInt, ∃ t : kernel n hn q → ℂ,
      (∀ j, expE L (t j) = j.val) ∧
      ∀ r : ℕ, let z := fun l : ℕ => (L).ω₁/(q : ℂ)^l
                let Y := fun (l : ℕ) (i : ι) => (b : ℂ)^l*y i
                (∀ i ∈ s, z r + Y r i ∈ regular L a) ∧
                (∏ j ∈ points n hn hp h2 hq,
                  weighted L a s w (Y (r+1)) (z (r+1) + t j)) = weighted L a s w (Y r) (z r) := by
  classical
  have hc := gram_card n hn hp h2 hq
  letI : Finite (kernel n hn q) := Nat.finite_of_card_ne_zero (hc.trans_ne hp.ne_zero)
  letI : Fintype (kernel n hn q) := Fintype.ofFinite _
  obtain ⟨b,k,hb⟩ := inverse_scalar q (hq ▸ hf)
  let t (j : kernel n hn q) := (TunnellCMTorus.exp_surjective L j.val).choose
  have ht (j : kernel n hn q) : expE L (t j) = j.val := (TunnellCMTorus.exp_surjective L j.val).choose_spec
  let z (r : ℕ) := (L).ω₁/(q : ℂ)^r
  let Y (r : ℕ) (i : ι) := (b : ℂ)^r*y i
  have q0 : q ≠ 0 := by rintro rfl; exact hp.ne_zero (by simpa using hq.symm)
  have q0' := GaussianInt.toComplex_eq_zero.not.mpr q0
  have hstep (r : ℕ) : (q : ℂ) * z (r+1) = z r := by
    dsimp [z]
    rw [pow_succ]
    field_simp
  have hpY (r : ℕ) (i : ι) (hi : i ∈ s) : (q : ℂ) * Y (r+1) i - Y r i ∈ (L).lattice :=
    iterate_period n hn q b f k hb r y (hy i hi)
  have transport (r : ℕ) (i : ι) (hi : i ∈ s) :
      (q : ℂ)*(z (r+1)+Y (r+1) i) - (z r+Y r i) ∈ (L).lattice := by
    simpa only [mul_add,hstep,add_sub_add_left_eq_sub] using hpY r i hi
  have hreg (r : ℕ) (i : ι) (hi : i ∈ s) : z r+Y r i ∈ regular L a := by
    induction r with
    | zero =>
      apply regular_of_sub n hn (hya i hi)
      simpa [z,Y] using (L).ω₁_mem_lattice
    | succ r ih =>
      have hh := regular_of_sub n hn ih (transport r i hi)
      intro he
      apply hh
      rw [mul_left_comm]
      exact cm_lattice n hn q he
  refine ⟨b,t,ht,fun r => ⟨hreg r,?_⟩⟩
  have e := distribution n hn q q0 a (hc ▸ ha) t ht s w hw (Y (r+1)) (Y r)
    (hpY r) (z (r+1)) (fun i hi => regular_of_sub n hn (hreg r i hi) (transport r i hi))
  rw [hstep] at e
  exact e

end
end TunnellCMUnitDistribution

#print axioms TunnellCMUnitDistribution.distribution
#print axioms TunnellCMUnitDistribution.inverse_scalar
#print axioms TunnellCMUnitDistribution.iterate_period
#print axioms TunnellCMUnitDistribution.tower
