import TunnellCMLemniscate
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Algebra.AlgebraicCard

/-! Specialization of the generic point of the congruent-number curve over a transcendental
x-coordinate. -/
namespace TunnellCMTranscendental

open Polynomial Set Complex LSG.Weierstrass

abbrev F := RatFunc ℚ
abbrev K := AlgebraicClosure F

noncomputable section
local instance : DecidableEq K := Classical.decEq _

noncomputable def Xgeneric : K := algebraMap F K RatFunc.X

lemma specialize {x : ℂ} (hx : Transcendental ℚ x) : ∃ φ : K →ₐ[ℚ] ℂ, φ Xgeneric=x := by
  let h : F →ₐ[ℚ] ℂ := IsFractionRing.liftAlgHom (transcendental_iff_injective.mp hx)
  obtain ⟨φ,hφ⟩ := IsAlgClosed.surjective_domRestrict_of_isAlgebraic (K := ℚ) (L := F)
    (E := K) (M := ℂ) h
  refine ⟨φ,?_⟩
  change φ.domRestrict F RatFunc.X = x
  change φ.domRestrict F = h at hφ
  rw [hφ,← RatFunc.algebraMap_X]
  simp only [h,IsFractionRing.liftAlgHom_apply,IsFractionRing.lift_algebraMap]
  exact aeval_X x

lemma values_fiber_countable (M : PeriodPair) (x : ℂ) :
    {z : ℂ | z∉M.lattice ∧ M.weierstrassP z=x}.Countable := by
  by_cases h : ∃ b : ℂ, b∉M.lattice ∧ M.weierstrassP b=x
  · obtain ⟨b,hb,rfl⟩ := h
    have hc := lattice_countable M
    refine ((hc.image (fun l : ℂ => l+b)).union (hc.image (fun l : ℂ => l-b))).mono ?_
    rintro z ⟨hz,he⟩
    rcases (weierstrassP_eq_iff M hb hz).mp he with h|h
    · exact Or.inl ⟨z-b,h,sub_add_cancel _ _⟩
    · exact Or.inr ⟨z+b,h,add_sub_cancel_right _ _⟩
  · apply countable_empty.mono
    exact fun z hz => (h ⟨z,hz⟩).elim

lemma generic_analytic_point (M : PeriodPair) (a : ℕ) (ha : 0<a) :
    ∃ z : ℂ, z∉M.lattice ∧ (a:ℂ)*z∉M.lattice ∧ Transcendental ℚ (M.weierstrassP z) := by
  let bad := ⋃ x ∈ {x : ℂ | IsAlgebraic ℚ x}, {z : ℂ | z∉M.lattice ∧ M.weierstrassP z=x}
  have hc : bad.Countable := (Algebraic.countable ℚ ℂ).biUnion (fun x _ => values_fiber_countable M x)
  have hn : (a:ℂ)≠0 := by exact_mod_cast ha.ne'
  have hD := (lattice_countable M).preimage (mul_right_injective₀ hn)
  let B := (bad ∪ (M.lattice : Set ℂ)) ∪ (fun x : ℂ => (a:ℂ)*x) ⁻¹' (M.lattice : Set ℂ)
  let : Uncountable ℂ := Complex.ofReal_injective.uncountable
  have hb : B.Countable := (hc.union (lattice_countable M)).union hD
  obtain ⟨z,hz⟩ : ∃ z, z∉B := by
    by_contra! h
    exact not_countable_univ (α := ℂ) (hb.mono (fun z _ => h z))
  have h1 : z ∉ M.lattice := fun h => hz (Or.inl (Or.inr h))
  refine ⟨z,h1,fun h => hz (Or.inr h),fun he => hz (Or.inl (Or.inl ?_))⟩
  exact mem_iUnion₂.mpr ⟨_,he,h1,rfl⟩

noncomputable def E (n : ℕ) : WeierstrassCurve ℚ := ⟨0,0,0,-(n:ℚ)^2,0⟩

lemma model (n : ℕ) (k : Type*) [Field k] [CharZero k] :
    (E n).baseChange k = (⟨0,0,0,-(n:k)^2,0⟩ : WeierstrassCurve k) := by
  ext <;> simp [E,WeierstrassCurve.baseChange]

instance elliptic (n : ℕ) [NeZero n] : (E n).IsElliptic := by
  constructor
  have hn : (n:ℚ)≠0 := by exact_mod_cast NeZero.ne n
  have h : (E n).Δ=64*(n:ℚ)^6 := by
    simp [E,WeierstrassCurve.Δ,WeierstrassCurve.b₂,WeierstrassCurve.b₄,
      WeierstrassCurve.b₆,WeierstrassCurve.b₈]
    ring
  rw [h]
  exact isUnit_iff_ne_zero.mpr (mul_ne_zero (by norm_num) (pow_ne_zero _ hn))

noncomputable def Ygeneric (n : ℕ) : K :=
  (IsAlgClosed.exists_pow_nat_eq (Xgeneric^3-(n:K)^2*Xgeneric) zero_lt_two).choose

lemma generic_nonsingular (n : ℕ) [NeZero n] :
    ((E n).baseChange K).toAffine.Nonsingular Xgeneric (Ygeneric n) := by
  letI : ((E n).baseChange K).IsElliptic :=
    inferInstanceAs (((E n).map (algebraMap ℚ K)).IsElliptic)
  apply WeierstrassCurve.Affine.equation_iff_nonsingular.mp
  rw [WeierstrassCurve.Affine.equation_iff,model]
  have hY : Ygeneric n^2 = Xgeneric^3-(n:K)^2*Xgeneric :=
    (IsAlgClosed.exists_pow_nat_eq (Xgeneric^3-(n:K)^2*Xgeneric) zero_lt_two).choose_spec
  simpa only [zero_mul,zero_add,mul_zero,add_zero,neg_mul,sub_eq_add_neg] using hY

noncomputable def genericPoint (n : ℕ) [NeZero n] : ((E n).baseChange K).toAffine.Point :=
  .some _ _ (generic_nonsingular n)

open WeierstrassCurve.Affine (Point)

lemma generic_killed_iff (n a : ℕ) [NeZero n] {x y : ℂ} (hx : Transcendental ℚ x)
    (h : ((E n).baseChange ℂ).toAffine.Nonsingular x y) :
    a • genericPoint n = 0 ↔ a • (Point.some x y h) = 0 := by
  classical
  obtain ⟨φ,hφ⟩ := specialize hx
  let m := Point.map (W' := (E n).toAffine) φ
  have he : a • genericPoint n=0 ↔ a • m (genericPoint n)=0 := by
    rw [← map_nsmul,← map_zero m]
    exact (Point.map_injective (W' := (E n).toAffine) φ).eq_iff.symm
  rw [he]
  have e := (Point.X_eq_iff (h₁ := (((E n).toAffine.baseChange_nonsingular φ.injective ..).mpr
    (generic_nonsingular n))) (h₂ := h)).mp hφ
  change m (genericPoint n)=Point.some x y h ∨ m (genericPoint n)= -Point.some x y h at e
  rcases e with e|e
  · rw [e]
  · rw [e,smul_neg,neg_eq_zero]

noncomputable def killedAt (W : WeierstrassCurve ℂ) (a : ℕ) (x : ℂ) : Prop :=
  ∃ y, ∃ h : W.toAffine.Nonsingular x y, a • Point.some x y h=0

lemma uniform_killed (n a : ℕ) [NeZero n] {x : ℂ} (hx : Transcendental ℚ x)
    (h : killedAt ((E n).baseChange ℂ) a x) :
    ∀ {x' y' : ℂ}, Transcendental ℚ x' →
      ∀ h' : ((E n).baseChange ℂ).toAffine.Nonsingular x' y', a • Point.some x' y' h'=0 := by
  obtain ⟨y,h,he⟩ := h
  intro x' y' hx' h'
  exact (generic_killed_iff n a hx' h').mp ((generic_killed_iff n a hx h).mpr he)

lemma analytic_killed (M : PeriodPair) (a : ℕ) (z : ℂ) :
    a • expE M z = 0 ↔ (a:ℂ)*z ∈ M.lattice := by
  have e : expE M ((a:ℂ)*z) = a • expE M z := by
    simpa only [Int.cast_natCast,natCast_zsmul] using expE_intCast_mul M (a:ℤ) z
  rw [← e]
  by_cases h : (a:ℂ)*z∈M.lattice
  · simp [h,expE_of_mem M h]
  · rw [expE_of_notMem M h]
    simp [h]

theorem torsion_x_algebraic (n a : ℕ) (hn : 0<n) (ha : 0<a) {x : ℂ}
    (h : killedAt ((E n).baseChange ℂ) a x) : IsAlgebraic ℚ x := by
  classical
  by_contra hx
  letI : NeZero n := ⟨hn.ne'⟩
  let M := TunnellCMLemniscate.twistPeriods n hn
  have eqM : (E n).baseChange ℂ = curve M :=
    (model n ℂ).trans (TunnellCMLemniscate.curve_eq n hn).symm
  obtain ⟨v,hv,hav,hxv⟩ := generic_analytic_point M a ha
  have all := @uniform_killed n a _ x hx h
  rw [eqM] at all
  have hp := all hxv (nonsingular_weierstrassP M hv)
  rw [← expE_of_notMem M hv,analytic_killed] at hp
  exact hav hp

theorem division_x_algebraic (n a : ℕ) (hn : 0<n) (ha : 0<a) {z : ℂ}
    (hz : z∉(TunnellCMLemniscate.twistPeriods n hn).lattice)
    (haz : (a:ℂ)*z∈(TunnellCMLemniscate.twistPeriods n hn).lattice) :
    IsAlgebraic ℚ ((TunnellCMLemniscate.twistPeriods n hn).weierstrassP z) := by
  let M := TunnellCMLemniscate.twistPeriods n hn
  apply torsion_x_algebraic n a hn ha
  rw [(model n ℂ).trans (TunnellCMLemniscate.curve_eq n hn).symm]
  refine ⟨_,nonsingular_weierstrassP M hz,?_⟩
  rw [← expE_of_notMem M hz,analytic_killed]
  exact haz

end
end TunnellCMTranscendental

#print axioms TunnellCMTranscendental.division_x_algebraic
