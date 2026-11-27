import EllipticCurves.WeierstrassFormalGroup.GroupLaw
import TunnellCoates

/-! # The invariant differential of the congruent-number chord law -/

namespace TunnellChordDifferential

open MvPowerSeries ChabautyColeman
open scoped PowerSeries
variable {O : Type*} [CommRing O] [IsDomain O]

private abbrev B (O : Type*) [CommRing O] := MvPowerSeries (Unit ⊕ Unit) O
private noncomputable abbrev T : B O := X (Sum.inl ())
private noncomputable abbrev Y : B O := X (Sum.inr ())
private noncomputable def ev : B O →ₐ[O] O⟦X⟧ :=
  substAlgHom (FormalGroupLaw.hasSubst_unitR (ι:=Unit) (O:=O))
private lemma ev_T : ev (T : B O) = PowerSeries.X :=
by rw [ev,coe_substAlgHom,subst_X FormalGroupLaw.hasSubst_unitR]; rfl
private lemma ev_Y : ev (Y : B O) = 0 :=
by rw [ev,coe_substAlgHom,subst_X FormalGroupLaw.hasSubst_unitR]; rfl
private lemma ev_C (a : O) : ev (MvPowerSeries.C a : B O) = PowerSeries.C a :=
  ev.commutes a
private lemma ev_left (f:O⟦X⟧) :
    ev (rename (fun _:Unit=>Sum.inl ()) f) = f := by
  rw [ev,coe_substAlgHom]
  rw [rename_eq_subst,subst_comp_subst_apply (.X_comp _) FormalGroupLaw.hasSubst_unitR]
  have hh : (fun u:Unit => subst
      (Sum.elim MvPowerSeries.X (fun _=>0) : Unit ⊕ Unit → O⟦X⟧)
      ((MvPowerSeries.X ∘ fun _:Unit=>Sum.inl () : Unit → B O) u)) = MvPowerSeries.X := by
    funext u
    rw [Function.comp_apply, subst_X FormalGroupLaw.hasSubst_unitR]
    rfl
  rw [hh, ← map_algebraMap_eq_subst_X, Algebra.algebraMap_self, map_id]
  rfl

private lemma chord_specialization (n:O) :
    let W := TunnellCoates.E n
    let L := ev W.slopeSeries
    let A := PowerSeries.C (-n^2)
    let M := W.formalGroupLaw.diffMatrix () ()
    L = PowerSeries.X^2*(1 + A*L^2) ∧
      M*(1 + A*L^2) = 1 - A*L^2 := by
  let W := TunnellCoates.E n
  let A : B O := C (-n^2)
  let Λ := W.slopeSeries
  let N := W.interceptSeries
  let F := W.addSeries
  let V := 1 + A*Λ^2
  let d := pderiv O (Sum.inr () : Unit ⊕ Unit)
  have hT : d (T : B O) = 0 := pderiv_X_of_ne (by decide)
  have hY : d (Y : B O) = 1 := pderiv_X_self
  have hA : d A = 0 := pderiv_C
  have heF : ev F = PowerSeries.X := by rw [ev,coe_substAlgHom]; exact W.subst_unitR_addSeries
  have hYw :
      rename (fun _:Unit => Sum.inr ()) W.wSeries =
        Y ^ 3 * rename (fun _:Unit => Sum.inr ()) W.vSeries := by
    rw [W.wSeries_eq_X_pow_three_mul, map_mul, map_pow]
    change _ = _
    rw [show (PowerSeries.X : O⟦X⟧) = MvPowerSeries.X () from rfl,rename_X]
  have hN : N = Y^3 * rename (fun _:Unit => Sum.inr ()) W.vSeries - Λ*Y :=
    W.interceptSeries_eq.trans (by rw [hYw])
  have heN : ev N = 0 := by simp [hN,ev_Y]
  have hdN : ev (d N) = -ev Λ := by
    rw [hN,map_sub,Derivation.leibniz,Derivation.leibniz,Derivation.leibniz_pow,
      hY]
    simp [ev_Y,smul_eq_mul]
  have hL : PowerSeries.X * ev Λ = W.wSeries := by
    have eqN : N = rename (fun _:Unit=>Sum.inl ()) W.wSeries - Λ*T := rfl
    have eq := congrArg ev eqN
    rw [heN,map_sub,map_mul,ev_left,ev_T] at eq
    linear_combination eq
  have hfix : ev Λ = PowerSeries.X^2*(1+PowerSeries.C (-n^2)*(ev Λ)^2) := by
    apply PowerSeries.X_mul_cancel
    rw [hL]
    conv_lhs => rw [W.wSeries_eq]
    rw [← hL]
    simp only [W,TunnellCoates.E,map_zero,zero_mul,zero_add,add_zero]
    ring
  have hu : W.uSeries = 1 := by simp [W,WeierstrassCurve.uSeries,TunnellCoates.E]
  have hi : W.inverseSeries = -PowerSeries.X := by
    have huu := W.mul_invOfUnit_uSeries
    rw [hu,one_mul] at huu
    simp [WeierstrassCurve.inverseSeries,hu,huu]
  have hF : F = -W.thirdRootSeries := by
    change MvPowerSeries.subst (fun _:Unit=> W.thirdRootSeries) W.inverseSeries = _
    rw [hi, ← coe_substAlgHom W.hasSubst_thirdRootSeries,map_neg]
    rw [coe_substAlgHom]
    change -MvPowerSeries.subst (fun _:Unit=>W.thirdRootSeries) (MvPowerSeries.X ()) = _
    rw [subst_X W.hasSubst_thirdRootSeries]
  have hV : V * invOfUnit V 1 = 1 := MvPowerSeries.mul_invOfUnit _ _ (by
    simp [V,A,Λ])
  have hFV : (F-T-Y)*V = 2*A*Λ*N := by
    rw [hF,WeierstrassCurve.thirdRootSeries]
    change _ = _
    simp only [W,TunnellCoates.E,map_zero,zero_mul,mul_zero,add_zero,zero_add] at *
    change (-(-T-Y-(2*A*Λ*N)*invOfUnit V 1)-T-Y)*V = _
    linear_combination 2*A*Λ*N*hV
  have htwo : d (2:B O) = 0 := d.map_natCast 2
  have hdFV := congrArg (fun z : B O => ev (d z)) hFV
  simp only [map_sub, Derivation.leibniz,  hA,hT,hY,
    htwo, smul_eq_mul,map_mul,map_add,map_zero,map_one,heF,ev_T,ev_Y,
    hdN,heN,sub_zero,sub_self,zero_mul,mul_zero,add_zero,zero_add] at hdFV
  have hM : W.formalGroupLaw.diffMatrix () () = ev (d F) := by rw [ev,coe_substAlgHom]; rfl
  refine ⟨hfix,?_⟩
  change W.formalGroupLaw.diffMatrix () () * (1+PowerSeries.C (-n^2)*(ev Λ)^2) = _
  rw [hM]
  have heV : ev V = 1 + PowerSeries.C (-n^2)*(ev Λ)^2 := by simp [V,A,ev_C]
  rw [heV, show ev A = PowerSeries.C (-n^2) from ev_C _] at hdFV
  rw [map_ofNat] at hdFV
  linear_combination hdFV

/-- The inverse Jacobian of Stoll's integral chord law is the square root
appearing in the lemniscatic elliptic integral. -/
theorem differential_square (n:O) :
    let D := (TunnellCoates.E n).formalGroupLaw.diffMatrix⁻¹ () ()
    D^2 * (1 + PowerSeries.C (4*n^2) * PowerSeries.X^4) = 1 := by
  let W := TunnellCoates.E n
  let L := ev W.slopeSeries
  let A := PowerSeries.C (-n^2)
  let M := W.formalGroupLaw.diffMatrix () ()
  let D := W.formalGroupLaw.diffMatrix⁻¹ () ()
  let V := 1+A*L^2
  obtain ⟨hl,hm⟩ := chord_specialization n
  change L = PowerSeries.X^2 * V at hl
  change M*V = 1-A*L^2 at hm
  have hL0 : PowerSeries.constantCoeff L=0 := by
    simpa using congrArg PowerSeries.constantCoeff hl
  have hV0 : V ≠ 0 := by
    intro hz
    have hh := congrArg PowerSeries.constantCoeff hz
    simp [V,hL0] at hh
  have hM : M^2=1-4*A*PowerSeries.X^4 := by
    apply mul_right_cancel₀ (pow_ne_zero 2 hV0)
    calc
      M^2 * V^2 = (1-A*L^2)^2 := by rw [← mul_pow,hm]
      _ = V^2-4*A*L^2 := by dsimp [V]; ring
      _ = _ := by conv_lhs => arg 2; rw [hl]
                  ring
  have hMD : M*D=1 := by
    have hh := congrArg (fun m => m () ()) (Matrix.mul_nonsing_inv _
      ((Matrix.isUnit_iff_isUnit_det _).mp W.formalGroupLaw.isUnit_diffMatrix))
    simpa [M,D,Matrix.mul_apply] using hh
  have hA : -4*A=PowerSeries.C (4*n^2) := by simp [A,map_mul,map_ofNat]
  change D^2 * (1+PowerSeries.C (4*n^2)*PowerSeries.X^4)=1
  rw [←hA,show 1+(-4*A)*PowerSeries.X^4=1-4*A*PowerSeries.X^4 by ring, ←hM,
    ←mul_pow,mul_comm D M,hMD,one_pow]

#print axioms differential_square

end TunnellChordDifferential
