import TunnellHeightOne
import TunnellFormalPrimitive
import TunnellLocalGood
import Mathlib.RingTheory.AdicCompletion.Topology

/-! # The primitive division equations over the rational completion at a split good prime -/
namespace TunnellPadicDivisionSeries
open TunnellLocalDivisibility TunnellCoates PowerSeries IsLocalRing
open scoped Polynomial
variable {p:ℕ} [Fact p.Prime]
noncomputable abbrev IntegerRing (l:ℕ) [Fact l.Prime] := (place l).adicCompletionIntegers ℚ
local notation "O" => IntegerRing p

lemma base_uniformizer :
    maximalIdeal O = Ideal.span {(p:O)} ∧ (p:O) ∉ maximalIdeal O^2 := by
  let e := localIntegralEquiv p
  constructor
  · ext x
    rw [← Ideal.apply_mem_of_equiv_iff (f:=e),← Ideal.apply_mem_of_equiv_iff (f:=e) (I:=Ideal.span {(p:O)})]
    simp [IsLocalRing.map_ringEquiv_maximalIdeal,PadicInt.maximalIdeal_eq_span_p,Ideal.map_span]
  · intro h
    have he := Ideal.mem_map_of_mem e h
    rw [map_natCast,Ideal.map_pow,IsLocalRing.map_ringEquiv_maximalIdeal,PadicInt.maximalIdeal_eq_span_p,
      Ideal.span_singleton_pow] at he
    have hv := (PadicInt.mem_span_pow_iff_le_valuation _ (show (p:ℤ_[p])≠0 by exact_mod_cast (Fact.out:p.Prime).ne_zero) _).mp he
    rw [PadicInt.valuation_p] at hv
    omega

theorem equations {m n:ℕ} (hp:p=4*m+1) (hn:¬p∣n) (r:ℕ) :
    let F := (E (n:O)).formalGroupLaw.mulSeries p
    ∃ (P : O[X]) (U : O⟦X⟧), (TunnellFormalPrimitive.primitive F r).IsWeierstrassFactorization P U ∧
      P.natDegree=Nat.totient (p^(r+1)) ∧ P.IsEisensteinAt (maximalIdeal O) ∧
      residue O (coeff p F) ≠ 1 := by
  let e := (ResidueField.mapEquiv (localIntegralEquiv p)).trans PadicInt.residueField
  have hnn : e (residue O (n:O)) ≠ 0 := by simpa [ZMod.natCast_eq_zero_iff] using hn
  obtain ⟨h₀,h₁,hbelow,_,hH,hH₁⟩ := TunnellHeightOne.split_prime_series hp e (n:O) hnn
  have hcomp : IsAdicComplete (maximalIdeal O) O :=
    (Fact.out : IsAdic (maximalIdeal O)).isAdicComplete_iff.mpr ⟨inferInstance,inferInstance⟩
  have hu : coeff p ((E (n:O)).formalGroupLaw.mulSeries p) ∉ maximalIdeal O := by
    exact fun h => hH (by rw [(residue_eq_zero_iff _).mpr h,map_zero])
  have hl := (base_uniformizer (p:=p)).2
  obtain ⟨P,U,hf,hd,he⟩ := TunnellFormalPrimitive.primitive_eisenstein _ (Fact.out:p.Prime) h₀
    (h₁ ▸ hl) hbelow hu r
  exact ⟨P,U,hf,hd,he,fun h => hH₁ (by rw [h,map_one])⟩

#print axioms equations
end TunnellPadicDivisionSeries
