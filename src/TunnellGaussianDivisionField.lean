import TunnellGaussianBase
import TunnellPrimaryDivision
import TunnellLocalGood

/-! Local nonabelianity for all sufficiently high Gaussian division fields of a non-torsion point. -/
namespace TunnellGaussianEnd

open TunnellCoates TunnellKummer WeierstrassCurve TunnellLocalCM TunnellLocalDivisibility

lemma iterate_compatible {A B : Type*} [AddCommGroup A] [AddCommGroup B]
    (f:A→+B) (I:A→+A) (J:B→+B) (h : ∀ x, J (f x)=f (I x)) (a b:ℤ) (r:ℕ) (x:A) :
    (endo J a b)^[r] (f x)=f ((endo I a b)^[r] x) := by
  induction r with
  | zero => rfl
  | succ r ih => rw [Function.iterate_succ_apply',Function.iterate_succ_apply',ih,endo_apply,endo_apply,h,map_add,map_zsmul,map_zsmul]

private def iterEnd {A : Type*} [AddCommGroup A] (f : A→+A) (r:ℕ) : A→+A where
  toFun := f^[r]
  map_zero' := Function.iterate_fixed (map_zero f) r
  map_add' x y := iterate_map_add f r x y

variable {F L : Type*} [Field F] [Field L] [Algebra F L] [DecidableEq F] [DecidableEq L]
  [FiniteDimensional F L]

theorem gaussian_division_nonabelian (n i:F) [(E n).IsElliptic] (hi:i^2 = -1)
    (a b : ℤ) {p r : ℕ} [Fact p.Prime] (hab:a^2+b^2=(p:ℤ))
    (P : CurvePoints (E n) F) (hn : ∀ x : CurvePoints (E n) F, p^r • x=0 → x=0)
    (hnd : ¬∃ x, (endo (baseI (L:=F) n i hi) a b)^[r] x=P)
    (Q : CurvePoints (E n) L)
    (hQ : (endo (baseI n i hi) a b)^[r] Q=changeBase (E n) P) : ¬ IsAbelianGalois F L := by
  let I := baseI (L:=F) n i hi
  let J := baseI (L:=L) n i hi
  let ψ : AddMonoid.End (CurvePoints (E n) F) := iterEnd (endo I a b) r
  let φ : AddMonoid.End (CurvePoints (E n) L) := iterEnd (endo J a b) r
  apply primary_division_nonabelian (E n) (p:=p) (r:=r) φ ψ _ _ _ hn P hnd Q hQ
  · exact iterate_compatible (changeBase (E n)) I J (map_baseI n i hi) a b r
  · intro σ
    exact iterate_compatible (act (E n) σ) J J (act_baseI n i hi σ) a b r
  · intro T
    apply gaussian_kernel_annihilated J _ a b hab r T T.property
    have hJ : ∀ x, J (J x)= -x := by
      intro x
      letI : ((E n).baseChange L).IsElliptic := by change ((E n).map (algebraMap F L)).IsElliptic; infer_instance
      exact quarter_sq (base_E n) _ _ x
    exact hJ

open scoped Classical in
theorem eventual_nonabelian {p n : ℕ} [Fact p.Prime] (hp : p%4 = 1) (hn : ¬p∣2*n)
    (P : (E (n:Local p)).toAffine.Point) (hP : ¬ IsOfFinAddOrder P) :
    ∃ (i:Local p) (hi:i^2= -1) (a b:ℤ), a^2+b^2=(p:ℤ) ∧ ∃ B:ℕ, ∀ r, B<r →
      ∀ (L:Type) [Field L] [Algebra (Local p) L] [FiniteDimensional (Local p) L],
      ∀ Q : CurvePoints (E (n:Local p)) L,
        (let _ : (E (n:Local p)).IsElliptic := by
           have : CharZero (Local p) := charZero_of_injective_algebraMap (algebraMap ℚ (Local p)).injective
           apply E_elliptic (by norm_num); exact_mod_cast (show n≠0 by intro h; subst n; simp at hn)
         (endo (baseI (n:Local p) i hi) a b)^[r] Q)=changeBase (E (n:Local p)) P →
           ¬IsAbelianGalois (Local p) L := by
  have : CharZero (Local p) := charZero_of_injective_algebraMap (algebraMap ℚ (Local p)).injective
  have hn0 : n≠0 := by intro h; subst n; simp at hn
  have : (E (n:Local p)).IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast hn0)
  obtain ⟨i,hi,a,b,hab,B,hB⟩ := local_point_bounded hp (n:Local p) P hP
  refine ⟨i,hi,a,b,hab,B,fun r hr L _ _ _ Q hQ => ?_⟩
  apply gaussian_division_nonabelian (n:Local p) i hi a b hab P
    (local_no_primary_torsion (by have := (Fact.out:p.Prime).two_le; omega) hn r) _ Q hQ
  have he : baseI (L:=Local p) (n:Local p) i hi=gaussianI (n:Local p) i hi := by ext x; cases x <;> rfl
  rw [he]; exact hB r hr

#print axioms eventual_nonabelian
end TunnellGaussianEnd
