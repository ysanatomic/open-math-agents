module

public import TunnellCMLocalUnit
public import Mathlib.RingTheory.DedekindDomain.SInteger

@[expose] public section

/-! At each finite place the divisor weights cancel, giving valuation one. -/
namespace TunnellCMUnitCriterion

open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open IsLocalRing WithZero TunnellCMLocalUnit

lemma exists_divisor (n l : ℕ) (hn : n%8=2) (h2 : 2<n) : ∃ q : ℕ, q.Prime ∧ q∣4*n ∧ q≠l := by
  by_cases e : l=2
  · obtain ⟨q,hq,hd⟩ := Nat.exists_prime_and_dvd (n := n/2) (by omega)
    have hn2 : 2*(n/2)=n := by omega
    refine ⟨q,hq,hd.trans ((show n/2∣n from ⟨2,by omega⟩).trans (dvd_mul_left _ _)),?_⟩
    intro he
    rw [he,e] at hd
    omega
  · exact ⟨2,Nat.prime_two,dvd_mul_of_dvd_left (by decide) _,Ne.symm e⟩

private lemma const_prod {G : Type*} [CommGroupWithZero G] {ι : Type*} (s:Finset ι) (w:ι→ℤ) {c:G} (hc:c≠0) :
    (∏ i ∈ s, c^(w i))=c^(∑ i ∈ s, w i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert i s hi ih => simp [hi,ih,zpow_add₀ hc]

variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
  {v : HeightOneSpectrum R} {W : Affine (v.adicCompletion K)} {W₀ : WeierstrassCurve (v.adicCompletionIntegers K)}
  (hW : W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W)
  [DecidableEq (v.adicCompletion K)] [DecidableEq (ResidueField (v.adicCompletionIntegers K))]
  [W.IsElliptic] [W₀.IsElliptic]

theorem valuation_one {ι κ : Type*} (s:Finset ι) (t:Finset κ) (w : ι→ℤ) (hw : ∑ i ∈ s,w i=0)
    (x y : ι → v.adicCompletion K) (u v' : κ → v.adicCompletion K) (c : v.adicCompletion K) (hc : c≠0)
    (hp : ∀ i, W.Nonsingular (x i) (y i)) (hq : ∀ j, W.Nonsingular (u j) (v' j))
    (a : ℕ) (ht : ∀ j∈t, a • Point.some (u j) (v' j) (hq j)=0)
    (hP : ∀ i∈s, a • adicRed hW (Point.some (x i) (y i) (hp i))≠0) :
    Valued.v (∏ i ∈ s, (∏ j ∈ t,c*(x i-u j))^w i)=1 := by
  classical
  let D := ∏ j ∈ t, Valued.v c * max 1 (Valued.v (u j))
  have hD : D≠0 := Finset.prod_ne_zero_iff.mpr (fun j _ => mul_ne_zero ((Valuation.ne_zero_iff Valued.v).mpr hc) (ne_of_gt (lt_of_lt_of_le zero_lt_one (le_max_left _ _))))
  have hval (i) (hi:i∈s) (j) (hj:j∈t) : Valued.v (x i-u j)=max 1 (Valued.v (u j)) := by
    let P := Point.some (x i) (y i) (hp i)
    let Q := Point.some (u j) (v' j) (hq j)
    let ρ := adicRedHom hW
    have hQ : a • ρ Q=0 := by rw [← map_nsmul,ht _ hj,map_zero]
    have hP' : a • ρ P≠0 := hP _ hi
    apply difference_value (hP := hp i) (hQ := hq j) hW
    · intro h; exact hP' (by change a • adicRed hW P=0; rw [h,nsmul_zero])
    · intro h; exact hP' ((congrArg (a • ·) h).trans hQ)
    · intro h; exact hP' (by change a • adicRed hW P=0; rw [h]; change a • (-ρ Q)=0; exact (smul_neg a (ρ Q)).trans (neg_eq_zero.mpr hQ))
  have e (i) (hi:i∈s) : Valued.v (∏ j ∈ t,c*(x i-u j))=D := by
    rw [map_prod]
    apply Finset.prod_congr rfl
    intro j hj
    rw [map_mul,hval i hi j hj]
  rw [map_prod]
  calc
    _ = ∏ i ∈ s,D^w i := Finset.prod_congr rfl (fun i hi => by rw [map_zpow₀,e i hi])
    _ = 1 := by rw [const_prod s w hD,hw,zpow_zero]

theorem global_unit (u:K) (hu:u≠0) (h:∀ w:HeightOneSpectrum R,w.valuation K u=1) :
    ∃ z:Rˣ, algebraMap R K z=u := by
  obtain ⟨a,ha⟩ := mem_integers_of_valuation_le_one K u (fun w => (h w).le)
  obtain ⟨b,hb⟩ := mem_integers_of_valuation_le_one (R := R) K u⁻¹ (fun w => by simp [map_inv₀,h])
  have e : a*b=1 := (IsFractionRing.injective R K) (by rw [map_mul,ha,hb,mul_inv_cancel₀ hu,map_one])
  exact ⟨⟨a,b,e,mul_comm b a ▸ e⟩,ha⟩

end TunnellCMUnitCriterion

#print axioms TunnellCMUnitCriterion.valuation_one
#print axioms TunnellCMUnitCriterion.global_unit
