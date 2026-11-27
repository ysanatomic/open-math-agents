import TunnellPreparedHasse
import TunnellPadicDivisionSeries
import TunnellFirstUnitCharacter

/-! The signed Hasse invariant controls the p-power map in the actual first torsion completion. -/
namespace TunnellFirstPlacePowers
open IsLocalRing PowerSeries TunnellFormalPrimitive TunnellPadicDivisionSeries TunnellCoates
open scoped Polynomial
noncomputable section
variable {p:ℕ} [Fact p.Prime]
local notation "A" => IntegerRing p

theorem first_data (n:ℕ) :
    let F:=((E (n:A)).formalGroupLaw.mulSeries p)
    constantCoeff (primitive F 0)=(p:A) ∧ coeff (p-1) (primitive F 0)=coeff p F := by
  let F:=((E (n:A)).formalGroupLaw.mulSeries p)
  have hr:primitive F 0=quotient F := by
    change (quotient F).subst (X:A⟦X⟧)=_
    rw [←map_algebraMap_eq_subst_X (S:=A),Algebra.algebraMap_self,map_id]; rfl
  change constantCoeff (primitive F 0)=(p:A) ∧ coeff (p-1) (primitive F 0)=coeff p F
  rw [hr]
  have hp:0<p := (Fact.out:p.Prime).pos
  constructor
  · simpa [quotient,F] using ChabautyColeman.coeff_single_mulSeries (E (n:A)).formalGroupLaw p
  · simp [quotient,show p-1+1=p by omega]

theorem powers {B C:Type} [CommRing B] [IsDomain B] [IsLocalRing B] [CharZero B]
    [CommRing C] [HenselianLocalRing C] (n:ℕ) (f:A→+*B) [IsLocalHom f]
    (g:C→+*B) [IsLocalHom g] (ρ:ResidueField C≃+*ZMod p)
    {P:A[X]} {U:PowerSeries A}
    (hfac:(primitive ((E (n:A)).formalGroupLaw.mulSeries p) 0).IsWeierstrassFactorization P U)
    (he:P.IsEisensteinAt (maximalIdeal A)) (hd:P.natDegree=p-1)
    (hH:residue A (coeff p ((E (n:A)).formalGroupLaw.mulSeries p))≠1)
    (t:C) (u:Cˣ) (hu:(u:C)*t^(p-1)=(p:C)) (ht:t∈maximalIdeal C) (hr:P.eval₂ f (g t)=0) :
    ∀ c:C, ∃ y:C,(1+t*y)^p=1+t^p*c := by
  have hp:= (Fact.out:p.Prime)
  haveI : CharZero (TunnellLocalDivisibility.Local p) := charZero_of_injective_algebraMap (algebraMap ℚ (TunnellLocalDivisibility.Local p)).injective
  haveI : CharZero A := (algebraMap A (TunnellLocalDivisibility.Local p)).charZero
  obtain ⟨_,b,hb,hsig⟩ := TunnellPreparedHasse.signed_unit f (base_uniformizer (p:=p)).1
    (Nat.cast_ne_zero.mpr hp.ne_zero) hfac he (by rw [hd]; have := hp.two_le; omega)
    (first_data n).1 (g t) hr
  rw [hd,map_natCast] at hb
  have hgu : g (u:C)*(g t)^(p-1)=(p:B) := by simpa using congrArg g hu
  have htz:(g t)^(p-1)≠0 := fun h => (Nat.cast_ne_zero.mpr hp.ne_zero : (p:B)≠0) (by rw [←hb,h,mul_zero])
  have e : g (u:C)=(b:B) := mul_right_cancel₀ htz (hgu.trans hb.symm)
  let r:=ρ.toRingHom.comp (residue C)
  apply TunnellPrincipalPowers.pth_root_principal_of_residue r (ρ.surjective.comp residue_surjective) t (u:C)
    (by change ρ (residue C t)=0; rw [(residue_eq_zero_iff _).mpr ht,map_zero]) hu (u.isUnit.map r).ne_zero
  intro h
  have hru : residue C (u:C)= -1 := by
    apply ρ.injective
    change 1+ρ (residue C (u:C))=0 at h
    rw [map_neg,map_one]; linear_combination h
  have hbg : residue B (b:B)= -1 := by
    rw [←e,←ResidueField.map_residue,hru,map_neg,map_one]
  rw [hd,(first_data n).2,hbg,neg_inj] at hsig
  apply hH
  apply (ResidueField.map f).injective
  simpa only [ResidueField.map_residue,map_one] using hsig.symm

#print axioms powers
end
end TunnellFirstPlacePowers
