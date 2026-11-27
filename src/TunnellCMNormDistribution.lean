import TunnellCMMeromorphicPeriod
import TunnellCMTorsionOrder

/-! Norm distribution for the multiplication product under Gaussian isogenies. -/
namespace TunnellCMNormDistribution
open LSG.Weierstrass Complex Filter Set TunnellCMLemniscate TunnellCMDivisor
open TunnellCMToricDivision TunnellCMTorsionOrder TunnellCMEllipticUnit TunnellCMDistribution

noncomputable section
open Classical in
def delta {A : Type*} [Zero A] (x:A) : ℤ := if x=0 then 1 else 0

open Classical in
lemma sum_delta {A : Type*} [AddCommGroup A] (H : AddSubgroup A) [Fintype H] (X:A) :
    (∑ t:H,delta (X+(t:A)))=(if X∈H then 1 else 0:ℤ) := by
  by_cases h : X∈H
  · let s : H := ⟨-X,H.neg_mem h⟩
    rw [Finset.sum_eq_single s,if_pos h]
    · simp [s,delta]
    · intro b _ hb
      simp only [delta,ite_eq_right_iff,one_ne_zero,false_implies,imp_false]
      intro e
      exact hb (Subtype.ext (eq_neg_of_add_eq_zero_right e))
    · simp
  · rw [if_neg h,Finset.sum_eq_zero]
    intro t _
    simp only [delta,ite_eq_right_iff,one_ne_zero,imp_false]
    intro he
    exact h ((eq_neg_of_add_eq_zero_left he) ▸ H.neg_mem t.2)

variable (n : ℕ) (hn : 0<n)
local notation "L" => twistPeriods n hn

abbrev kernel (q : GaussianInt) := (action n hn q).ker

lemma mult_eq (z:ℂ) : mult L z=delta (expE L z) := by
  classical
  simp only [mult,delta,zero_iff]

lemma sum_mult (q : GaussianInt) [Fintype (kernel n hn q)]
    (φ : kernel n hn q ≃ kernel n hn q) (t : kernel n hn q → ℂ)
    (ht : ∀ i, expE L (t i)=(φ i).val) (z : ℂ) :
    (∑ i, mult L (z+t i))=mult L ((q:ℂ)*z) := by
  classical
  simp only [mult_eq,expE_add,ht,← action_exp]
  rw [φ.sum_comp (fun j : kernel n hn q => delta (expE L z+j.val)),sum_delta,delta]
  rfl

lemma gram_card {p : ℕ} (hp:p.Prime) (h2:p≠2) {q:GaussianInt} (h:q.norm.natAbs=p) :
    Nat.card (kernel n hn q)=p := by
  obtain ⟨T,ht,ho,hg⟩ := split_generator n hn hp h2 h 1
  simp only [pow_one] at ht ho hg
  have he : kernel n hn q=AddSubgroup.zmultiples T := by
    ext P
    constructor
    · intro hP
      exact AddSubgroup.mem_zmultiples_iff.mpr (hg P hP)
    · intro hP
      obtain ⟨k,rfl⟩ := AddSubgroup.mem_zmultiples_iff.mp hP
      change action n hn q (k • T)=0
      rw [map_zsmul,ht,zsmul_zero]
  rw [he,Nat.card_zmultiples,ho]

lemma nsmul_exp (a:ℕ) (z:ℂ) : expE L ((a:ℂ)*z)=a • expE L z := by
  simpa only [Int.cast_natCast,natCast_zsmul] using expE_intCast_mul L (a:ℤ) z

lemma norm_orders (q:GaussianInt) [Fintype (kernel n hn q)] (a:ℕ) [NeZero a]
    (hc : (Nat.card (kernel n hn q)).Coprime a) (t : kernel n hn q→ℂ)
    (ht : ∀ i, expE L (t i)=i.val) (z:ℂ) :
    (∑ i, (2*mult L ((a:ℂ)*(z+t i))-2*(a:ℤ)^2*mult L (z+t i)))=
      2*mult L ((a:ℂ)*((q:ℂ)*z))-2*(a:ℤ)^2*mult L ((q:ℂ)*z) := by
  let V := kernel n hn q
  let φ : V≃V := Equiv.ofBijective (fun A : V => a • A) hc.nsmul_right_bijective
  have hφ (i:V) : expE L ((a:ℂ)*t i)=(φ i).val := by rw [nsmul_exp,ht]; rfl
  simp only [mul_add,Finset.sum_sub_distrib,← Finset.mul_sum]
  rw [sum_mult n hn q φ (fun i => (a:ℂ)*t i) hφ,sum_mult n hn q (Equiv.refl _) t ht]
  rw [mul_left_comm (q:ℂ) (a:ℂ)]

lemma cm_lattice (q:GaussianInt) {x:ℂ} (hx:x∈(L).lattice) : (q:ℂ)*x∈(L).lattice := by
  rw [← zero_iff,← action_exp,(zero_iff n hn x).mpr hx,map_zero]

lemma division_meromorphic (M:PeriodPair) (a:ℕ) (z:ℂ) : MeromorphicAt (divisionProduct M a) z := by
  unfold divisionProduct
  exact .fun_prod (fun j _ => (M.meromorphic_weierstrassP z).sub (.const _ _))

private lemma prod_analytic {ι:Type*} (s:Finset ι) (f:ι→ℂ→ℂ) (z:ℂ) (h:∀ i∈s, AnalyticAt ℂ (f i) z) :
    AnalyticAt ℂ (fun w => ∏ i ∈ s, f i w) z := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using (analyticAt_const : AnalyticAt ℂ (fun _ : ℂ => (1:ℂ)) z)
  | insert i s hi ih =>
    simp only [Finset.prod_insert hi]
    exact (h i (Finset.mem_insert_self ..)).mul (ih (fun j hj => h j (Finset.mem_insert_of_mem hj)))

lemma division_analytic (M:PeriodPair) (a:ℕ) {z:ℂ} (hz:z∉M.lattice) : AnalyticAt ℂ (divisionProduct M a) z := by
  unfold divisionProduct
  exact prod_analytic _ _ _ (fun j _ => (M.analyticOnNhd_weierstrassP z hz).sub analyticAt_const)

lemma division_periodic (M:PeriodPair) (a:ℕ) (z:ℂ) {w:ℂ} (hw:w∈M.lattice) :
    divisionProduct M a (z+w)=divisionProduct M a z := by
  simp only [divisionProduct,M.weierstrassP_add_coe z ⟨w,hw⟩]

private lemma div_nonzero (M : PeriodPair) (a : ℕ) [NeZero a] {z : ℂ} (hz : z∈regular M a) :
    divisionProduct M a z ≠ 0 := by
  classical
  apply Finset.prod_ne_zero_iff.mpr
  intro j hj
  have hs : z∉M.lattice := fun h => hz (mul_mem M a h)
  have ht : liftGrid M j∉M.lattice := (Finset.mem_filter.mp hj).2
  exact sub_ne_zero.mpr (fun h => ((LSG.Weierstrass.weierstrassP_eq_iff M ht hs).mp h).elim
    (sub_regular M hz j) (add_regular M hz j))

theorem norm_constant (q:GaussianInt) (hq:q≠0) [Fintype (kernel n hn q)] (a:ℕ) [NeZero a]
    (hc : (Nat.card (kernel n hn q)).Coprime a) (t : kernel n hn q→ℂ)
    (ht : ∀ i, expE L (t i)=i.val) :
    ∃ c:ℂ, c≠0 ∧ ∀ z : ℂ, (q:ℂ)*z∈regular L a →
      (∏ i, divisionProduct L a (z+t i))=c*divisionProduct L a ((q:ℂ)*z) := by
  classical
  let D := divisionProduct L a
  let h (i : kernel n hn q) (z:ℂ) := D (z+t i)
  let g (z:ℂ) := D ((q:ℂ)*z)
  let F (z:ℂ) := (∏ i,h i z)/g z
  have hq' : (q:ℂ)≠0 := GaussianInt.toComplex_eq_zero.not.mpr hq
  have dq (z:ℂ) : HasDerivAt (fun w:ℂ => (q:ℂ)*w) (q:ℂ) z := by
    simpa only [mul_one] using (hasDerivAt_id' z).const_mul (q:ℂ)
  have hm (i : kernel n hn q) (z:ℂ) : MeromorphicAt (h i) z :=
    (division_meromorphic L a (z+t i)).comp_analyticAt (g := fun w:ℂ => w+t i) (by fun_prop)
  have gm (z:ℂ) : MeromorphicAt g z :=
    (division_meromorphic L a ((q:ℂ)*z)).comp_analyticAt (g := fun w:ℂ => (q:ℂ)*w) (by fun_prop)
  have fm : Meromorphic F := fun z => (MeromorphicAt.fun_prod (fun i _ => hm i z)).div (gm z)
  have ord (z:ℂ) : meromorphicOrderAt F z=0 := by
    change meromorphicOrderAt ((fun w:ℂ => ∏ i,h i w)/g) z=0
    rw [meromorphicOrderAt_div (.fun_prod (fun i _ => hm i z)) (gm z),meromorphicOrderAt_fun_prod (fun i _ => hm i z)]
    have eo (i : kernel n hn q) : meromorphicOrderAt (h i) z=meromorphicOrderAt D (z+t i) :=
      meromorphicOrderAt_comp_add_const_eq_meromorphicOrderAt (f := D) (c := t i) (x := z)
    have eg : meromorphicOrderAt g z=meromorphicOrderAt D ((q:ℂ)*z) :=
      meromorphicOrderAt_comp_of_deriv_ne_zero (f := D) (g := fun w:ℂ => (q:ℂ)*w) (by fun_prop) (by rw [(dq z).deriv]; exact hq')
    simp only [eo,eg,D,order_formula,← WithTop.coe_sum]
    rw [norm_orders n hn q a hc t ht z]
    exact LinearOrderedAddCommGroupWithTop.sub_self_eq_zero_of_ne_top (WithTop.coe_ne_top)
  have per (z:ℂ) (s:(L).lattice) : F (z+s)=F z := by
    dsimp only [F,h,g,D]
    simp only [add_right_comm z (s:ℂ),division_periodic L a _ s.property,mul_add,division_periodic L a _ (cm_lattice n hn q s.property)]
  obtain ⟨c,hc0,H⟩ := TunnellCMMeromorphicPeriod.constant L F fm ord per
  refine ⟨c,hc0,fun z hz => ?_⟩
  have hgz : (q:ℂ)*z∉(L).lattice := fun hh => hz (mul_mem L a hh)
  have gt : g z≠0 := div_nonzero L a hz
  apply (div_eq_iff gt).mp
  apply H
  have e (i : kernel n hn q) : (q:ℂ)*t i∈(L).lattice := by
    rw [← zero_iff,← action_exp,ht]
    exact i.property
  have hh (i : kernel n hn q) : z+t i∉(L).lattice := by
    intro he
    have he' := cm_lattice n hn q he
    rw [mul_add] at he'
    exact hgz ((L).lattice.add_mem_iff_left (e i) |>.mp he')
  have hd (i) : AnalyticAt ℂ (h i) z :=
    (division_analytic L a (hh i)).comp (f := fun w:ℂ => w+t i) (by fun_prop)
  exact (prod_analytic Finset.univ h z (fun i _ => hd i)).div
    ((division_analytic L a hgz).comp (f := fun w:ℂ => (q:ℂ)*w) (by fun_prop)) gt

end
end TunnellCMNormDistribution

#print axioms TunnellCMNormDistribution.norm_constant
