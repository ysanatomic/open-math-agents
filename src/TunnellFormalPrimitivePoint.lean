import TunnellFormalPrimitive
import EllipticCurves.WeierstrassFormalGroup.Filtration

/-! A root of the prepared primitive polynomial gives an elliptic formal point of exact order. -/
namespace TunnellFormalPrimitivePoint

open PowerSeries ChabautyColeman IsLocalRing TunnellFormalPrimitive
open scoped Polynomial

variable {O : Type*} [CommRing O] [IsLocalRing O] [UniformSpace O] [Fact (IsAdic (maximalIdeal O))]
    [IsUniformAddGroup O] [CompleteSpace O] [T2Space O] [IsTopologicalRing O]

lemma eval_at_zero (F:O⟦X⟧) : PSeries.eval 0 F=constantCoeff F := by
  let e := PSeries.evalRingHom ((maximalIdeal O).zero_mem)
  have h := congrArg e (eq_X_mul_shift_add_const F)
  simp [e,map_add,map_mul] at h
  exact h

lemma multiple_eval (W : WeierstrassCurve O) (p r:ℕ) (Z : W.formalGroupLaw.Points) :
    PSeries.eval (Z () : O) (multiple (W.formalGroupLaw.mulSeries p) r)=
      ((p^r • Z) () : O) := by
  let F : O⟦X⟧ := W.formalGroupLaw.mulSeries p
  induction r with
  | zero => simp [multiple]
  | succ r ih =>
    have hz : constantCoeff (multiple F r)=0 := multiple_const F (W.formalGroupLaw.constantCoeff_mulSeries _) r
    change MvPSeries.eval (fun _:Unit => (Z ():O)) (F.subst (multiple F r))=_
    rw [WeierstrassCurve.eval_subst_single (Z ()).property hz F]
    change PSeries.eval (PSeries.eval (Z ():O) (multiple F r)) F=_
    rw [ih]
    rw [pow_succ, mul_nsmul]
    exact (W.nsmul_apply_coe_eq_eval (p^r • Z) p).symm

theorem order_of_root (W : WeierstrassCurve O) {p : ℕ} [Fact p.Prime] [CharZero O]
    (hl : coeff 1 (W.formalGroupLaw.mulSeries p) ≠ 0)
    (r:ℕ) (Z : W.formalGroupLaw.Points)
    (hroot:PSeries.eval (Z ():O) (primitive (W.formalGroupLaw.mulSeries p) r)=0) :
    addOrderOf Z=p^(r+1) := by
  let F : O⟦X⟧ := W.formalGroupLaw.mulSeries p
  have hz : constantCoeff F=0 := W.formalGroupLaw.constantCoeff_mulSeries p
  have he (Q : W.formalGroupLaw.Points) : (Q ():O)=0 ↔ Q=0 := by
    constructor
    · intro e; funext i; cases i; exact Subtype.ext e
    · rintro rfl; rfl
  apply addOrderOf_eq_prime_pow
  · intro h
    have hr := (he _).mpr h
    change ((p^r • Z) () : O)=0 at hr
    rw [← multiple_eval] at hr
    change PSeries.eval (Z ():O) (multiple F r)=0 at hr
    have hcomp := WeierstrassCurve.eval_subst_single (Z ()).property (multiple_const F hz r) (quotient F)
    change PSeries.eval (Z ():O) (primitive F r) = PSeries.eval (PSeries.eval (Z ():O) (multiple F r)) (quotient F) at hcomp
    rw [hroot,hr,eval_at_zero] at hcomp
    have hcon : constantCoeff (quotient F)=coeff 1 F := by simp [quotient]
    rw [hcon] at hcomp
    exact hl hcomp.symm
  · apply (he _).mp
    rw [←multiple_eval]
    change PSeries.eval (Z ():O) (multiple F (r+1))=0
    rw [←PSeries.evalRingHom_apply (Z ()).property]
    rw [factor_multiple F hz r,map_mul]
    rw [PSeries.evalRingHom_apply (Z ()).property (primitive F r)]
    rw [hroot,mul_zero]

lemma primitive_map {A B:Type*} [CommRing A] [CommRing B] (f:A→+*B) (F:A⟦X⟧)
    (hz:constantCoeff F=0) (r:ℕ) :
    map f (primitive F r)=primitive (map f F) r := by
  have hm (j:ℕ) : map f (multiple F j)=multiple (map f F) j := by
    induction j with
    | zero => simp [multiple]
    | succ j ih =>
      change MvPowerSeries.map f (F.subst (multiple F j))=_
      rw [map_subst (HasSubst.of_constantCoeff_zero' (multiple_const F hz j))]
      change (map f F).subst (map f (multiple F j))=_
      rw [ih]; rfl
  have hq : map f (quotient F)=quotient (map f F) := by ext; simp [quotient]
  change MvPowerSeries.map f ((quotient F).subst (multiple F r))=_
  rw [map_subst (HasSubst.of_constantCoeff_zero' (multiple_const F hz r))]
  change (map f (quotient F)).subst (map f (multiple F r))=_
  rw [hm,hq]; rfl

lemma map_formal_series {A B:Type*} [CommRing A] [CommRing B] (f:A→+*B) (W : WeierstrassCurve A) (p:ℕ) :
    map f (W.formalGroupLaw.mulSeries p)= (W.map f).formalGroupLaw.mulSeries p := by
  have hm : W.formalGroupLaw.map f = (W.map f).formalGroupLaw := by
    have he : (W.formalGroupLaw.map f).F=(W.map f).formalGroupLaw.F := by
      funext i
      exact W.map_addSeries f
    generalize W.formalGroupLaw.map f = Φ at he ⊢
    generalize (W.map f).formalGroupLaw = Ψ at he ⊢
    cases Φ
    cases Ψ
    congr
  exact (W.formalGroupLaw.map_mulSeries f p).trans (congrArg (fun g : FormalGroupLaw B Unit => g.mulSeries p) hm)

theorem root_of_prepared {A:Type*} [CommRing A] [IsLocalRing A] (f:A→+*O)
    (W:WeierstrassCurve A) {p:ℕ} [Fact p.Prime] [CharZero O]
    (hlin : f (coeff 1 (W.formalGroupLaw.mulSeries p)) ≠ 0) (r:ℕ)
    {P:A[X]} {U:A⟦X⟧} (hfac : (primitive (W.formalGroupLaw.mulSeries p) r).IsWeierstrassFactorization P U)
    {t:O} (ht:t∈maximalIdeal O) (hroot:P.eval₂ f t=0) :
    addOrderOf (show (W.map f).formalGroupLaw.Points from fun _ => ⟨t,ht⟩) = p^(r+1) := by
  apply order_of_root
  · rw [←map_formal_series f W,coeff_map]
    exact hlin
  change PSeries.eval t (primitive ((W.map f).formalGroupLaw.mulSeries p) r)=0
  rw [←PSeries.evalRingHom_apply ht]
  change PSeries.evalRingHom ht (primitive ((W.map f).formalGroupLaw.mulSeries p) r)=0
  rw [← map_formal_series f W, ← primitive_map f _ (W.formalGroupLaw.constantCoeff_mulSeries _) r,hfac.eq_mul,map_mul,map_mul]
  have e : PSeries.evalRingHom ht (map f (P: A⟦X⟧))=0 := by
    rw [← Polynomial.polynomial_map_coe, PSeries.evalRingHom_apply,PSeries.eval_coe,Polynomial.eval_map,hroot]
  rw [e,zero_mul]

#print axioms root_of_prepared
end TunnellFormalPrimitivePoint
