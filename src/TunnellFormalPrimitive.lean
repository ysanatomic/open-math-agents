import TunnellFormalEisenstein
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.Data.Nat.Totient

/-! # Eisenstein polynomials for all primitive levels of a height-one tower -/

namespace TunnellFormalPrimitive

open PowerSeries IsLocalRing
open scoped Polynomial

private lemma const_subst {A:Type*} [CommRing A] (f g:A⟦X⟧)
    (hg:constantCoeff g=0) : constantCoeff (f.subst g) = constantCoeff f := by
  have hs : HasSubst g := .of_constantCoeff_zero' hg
  have h := congrArg (subst (R:=A) g) (eq_X_mul_shift_add_const f)
  rw [subst_add hs,subst_mul hs,subst_X hs,subst_C] at h
  rw [h,map_add,map_mul,hg,zero_mul,zero_add]
  exact MvPowerSeries.constantCoeff_C _

private lemma subst_order {k:Type*} [Field k] (f g:k⟦X⟧) (hg:constantCoeff g=0)
    {a b:ℕ} (hf:f.order=a) (hor:g.order=b) :
    PowerSeries.order (f.subst g) = (a*b:ℕ) := by
  have hs : HasSubst g := .of_constantCoeff_zero' hg
  have hfac : X^a*f.divXPowOrder=f := by
    simpa [hf] using (X_pow_order_mul_divXPowOrder (f:=f))
  have hu : PowerSeries.order (f.divXPowOrder.subst g)=0 := by
    by_contra hh
    have hzero := order_ne_zero_iff_constCoeff_eq_zero.mp hh
    rw [const_subst _ _ hg,constantCoeff_divXPowOrder_eq_zero_iff] at hzero
    simp [hzero] at hf
  have h := congrArg (subst (R:=k) g) hfac
  rw [subst_mul hs,subst_pow hs,subst_X hs] at h
  rw [←h,order_mul,order_pow,hor,hu,add_zero,nsmul_eq_mul,Nat.cast_mul]

/-- Successive formal multiples, with iteration zero the parameter itself. -/
noncomputable def multiple {A:Type*} [CommRing A] (F:A⟦X⟧) : ℕ → A⟦X⟧
  | 0 => X
  | r+1 => F.subst (multiple F r)

lemma multiple_const {A:Type*} [CommRing A] (F:A⟦X⟧) (hz:constantCoeff F=0)
    (r:ℕ) : constantCoeff (multiple F r)=0 := by
  induction r with
  | zero => simp [multiple]
  | succ r ih => exact (const_subst F _ ih).trans hz

/-- The quotient [p](X)/X. -/
noncomputable def quotient {A:Type*} [CommRing A] (F:A⟦X⟧) : A⟦X⟧ :=
  mk (fun j => coeff (j+1) F)

/-- The prepared series for primitive points of order p^(r+1). -/
noncomputable def primitive {A:Type*} [CommRing A] (F:A⟦X⟧) (r:ℕ) : A⟦X⟧ :=
  (quotient F).subst (multiple F r)

theorem factor_multiple {A:Type*} [CommRing A] (F:A⟦X⟧) (hz:constantCoeff F=0) (r:ℕ) :
    multiple F (r+1)=multiple F r * primitive F r := by
  have hF : F=X*quotient F := by simpa [hz,quotient] using eq_X_mul_shift_add_const F
  have hs : HasSubst (multiple F r) := .of_constantCoeff_zero' (multiple_const F hz r)
  change F.subst (multiple F r)=_
  exact (congrArg (subst (R:=A) (multiple F r)) hF).trans (by rw [subst_mul hs,subst_X hs]; rfl)

variable {O:Type*} [CommRing O] [IsLocalRing O] [IsAdicComplete (maximalIdeal O) O]

/-- The primitive division series at every level is a unit times an Eisenstein
polynomial over the base ring, of degree φ(p^(r+1)). -/
theorem primitive_eisenstein (F:O⟦X⟧) {p:ℕ} (hp:p.Prime)
    (hz:constantCoeff F=0) (hlin:coeff 1 F∉maximalIdeal O^2)
    (hbelow:∀ j<p,coeff j F∈maximalIdeal O) (hunit:coeff p F∉maximalIdeal O) (r:ℕ) :
    ∃ (P : O[X]) (U : O⟦X⟧), (primitive F r).IsWeierstrassFactorization P U ∧
      P.natDegree = Nat.totient (p^(r+1)) ∧ P.IsEisensteinAt (maximalIdeal O) := by
  let ρ := residue O
  have hF : (map ρ F).order=p := by
    apply order_eq_nat.mpr
    simpa only [ρ,Ne,coeff_map,residue_eq_zero_iff] using And.intro hunit hbelow
  have hG : (map ρ (quotient F)).order=p-1 := by
    apply order_eq_nat.mpr
    simp only [quotient,coeff_map,coeff_mk,ρ,Ne,residue_eq_zero_iff]
    exact ⟨by rwa [show p-1+1=p by have := hp.pos; omega],
      fun j hj => hbelow _ (by omega)⟩
  have hmapzero (j:ℕ) : constantCoeff (map ρ (multiple F j)) = 0 := by
    rw [← coeff_zero_eq_constantCoeff_apply,coeff_map,coeff_zero_eq_constantCoeff_apply,
      multiple_const F hz j,map_zero]
  have hR (j:ℕ) : (map ρ (multiple F j)).order = (p^j:ℕ) := by
    induction j with
    | zero => simp [multiple]
    | succ j ih =>
      change PowerSeries.order (map ρ (F.subst (multiple F j)))=_
      have hs : HasSubst (multiple F j) :=
        .of_constantCoeff_zero' (multiple_const F hz j)
      change PowerSeries.order (MvPowerSeries.map ρ _) = _
      rw [map_subst hs]
      simpa [pow_succ,mul_comm,PowerSeries.map] using subst_order (map ρ F) (map ρ (multiple F j))
        (hmapzero j) hF ih
  have hprim : (map ρ (primitive F r)).order = (Nat.totient (p^(r+1)) : ℕ) := by
    have hs : HasSubst (multiple F r) := .of_constantCoeff_zero' (multiple_const F hz r)
    change PowerSeries.order (MvPowerSeries.map ρ ((quotient F).subst (multiple F r))) = _
    rw [map_subst hs]
    simpa [Nat.totient_prime_pow_succ hp,mul_comm,PowerSeries.map] using subst_order
      (map ρ (quotient F)) (map ρ (multiple F r)) (hmapzero r) hG (hR r)
  obtain ⟨ha,hb⟩ := order_eq_nat.mp hprim
  apply TunnellFormalEisenstein.prepare
  · rw [primitive,const_subst _ _ (multiple_const F hz r)]
    simpa [quotient] using hlin
  · simpa only [coeff_map,ρ,residue_eq_zero_iff] using hb
  · simpa only [Ne,coeff_map,ρ,residue_eq_zero_iff] using ha

#print axioms primitive_eisenstein
end TunnellFormalPrimitive
