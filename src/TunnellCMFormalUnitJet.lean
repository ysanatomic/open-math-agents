import TunnellCMReductionJet
import TunnellFormalQuarter

/-! Reduction of the actual elliptic-unit value of a formal point modulo the square of the maximal ideal. -/
namespace TunnellCMFormalUnitJet
open IsLocalRing WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellCMModelUnit TunnellCMFirstJet
open TunnellCMReductionJet TunnellFormalQuarter IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
noncomputable section
variable {R K : Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K]
  [IsFractionRing R K] {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K
local notation "ρ" => Ideal.Quotient.mk ((maximalIdeal O)^2)

theorem local_factor (n c d a : O) [(E (n:L)).IsElliptic] (Z : (E n).formalGroupLaw.Points)
    (hZ : (Z () : O)≠0) (hc : (E (n:L)).toAffine.Nonsingular (c:L) (d:L)) (B : Oˣ) (hB : (B:O)=c-a) :
    ∃ u : Oˣ, ((u:O):L) = X (toPoint n Z + Point.some _ _ hc) - (a:L) ∧
      ρ (u:O) = ρ (B:O)*(1+ρ (Z ():O)*(2*ρ d*ρ (↑B⁻¹:O))) := by
  let t : O := Z ()
  let h := (E n).vEval t
  let f := algebraMap O L
  have ht : t∈maximalIdeal O := (Z ()).2
  have ht0 : f t≠0 := fun e => hZ ((FaithfulSMul.algebraMap_injective O L) (e.trans f.map_zero.symm))
  have hh : f h≠0 := (((E n).isUnit_vEval ht).map f).ne_zero
  have wh := (E n).wEval_eq_cube_mul ht
  have hx : (t:L)/((E n).wEval t:L)=1/((f t)^2*f h) := by
    change f t / f ((E n).wEval t)=_
    rw [wh,map_mul,map_pow]
    change f t / (f t^3*f h)=1/(f t^2*f h)
    field_simp
  have hy : (-1:L)/((E n).wEval t:L)= -1/((f t)^3*f h) := by
    change -1/f ((E n).wEval t)=_
    rw [wh,map_mul,map_pow]
  have hp := formalPoint_nonsingular (base_curve n) ht hZ
  rw [hx,hy] at hp
  have hP : toPoint n Z = Point.some _ _ hp := by
    change formalPoint (base_curve n) Z = _
    rw [formalPoint_of_param_ne_zero _ hZ,Point.some.injEq]
    exact ⟨hx,hy⟩
  rw [hP]
  have hh' := (E n).vEval_sub_one_mem ht
  apply difference_unit f ρ n c d a t h ht ht0 hh _ _ B hB hp hc
  · rw [← map_pow,Ideal.Quotient.eq_zero_iff_mem]
    exact Ideal.pow_mem_pow ht 2
  · rw [← map_one ρ,← map_sub,← map_mul,Ideal.Quotient.eq_zero_iff_mem,pow_two]
    exact Ideal.mul_mem_mul ht hh'

theorem unit_jet {ι κ : Type*} [Fintype ι] [Fintype κ]
    (n : O) [(E (n:L)).IsElliptic] (Z : (E n).formalGroupLaw.Points) (hZ : (Z () : O)≠0)
    (c d : ι → O) (a : κ → O) (hU : ∀ i, (E (n:L)).toAffine.Nonsingular (c i:L) (d i:L))
    (B : ι → κ → Oˣ) (hB : ∀ i j, (B i j:O)=c i-a j) (w : ι → ℤ) :
    ∃ u : Oˣ, ((u:O):L)=∏ i, (∏ j, (X (toPoint n Z + Point.some _ _ (hU i))-(a j:L)))^w i ∧
      ρ (((u/(∏ i, (∏ j, B i j)^w i)):Oˣ):O) =
        1+ρ (Z ():O)*(∑ i, (w i : O ⧸ (maximalIdeal O)^2)*∑ j, (2*ρ (d i)*ρ (↑(B i j)⁻¹:O))) := by
  choose u hu hj using fun i j => local_factor n (c i) (d i) (a j) Z hZ (hU i) (B i j) (hB i j)
  refine ⟨∏ i, (∏ j, u i j)^w i,?_,?_⟩
  · change (Units.map (algebraMap O L).toMonoidHom (∏ i, (∏ j, u i j)^w i) : Lˣ).val=_
    simp only [map_prod,map_zpow,Units.coe_prod,Units.val_zpow_eq_zpow_val,Units.coe_map]
    exact Finset.prod_congr rfl (fun i _ => congrArg (·^w i) (Finset.prod_congr rfl (fun j _ => hu i j)))
  · let χ := Units.map (ρ).toMonoidHom
    have ht : (ρ (Z () : O))^2=0 := by
      rw [← map_pow,Ideal.Quotient.eq_zero_iff_mem]
      exact Ideal.pow_mem_pow (Z ()).2 2
    change (χ ((∏ i, (∏ j, u i j)^w i)/(∏ i, (∏ j, B i j)^w i))).val=_
    simp only [map_div,map_prod,map_zpow]
    exact product_jet _ ht (fun i j => χ (u i j)) (fun i j => χ (B i j))
      (fun i j => 2*ρ (d i)*ρ (↑(B i j)⁻¹:O)) w hj

end
end TunnellCMFormalUnitJet
#print axioms TunnellCMFormalUnitJet.unit_jet
