import TunnellRankinIntegrands
import TunnellGluePacket

/-! Projective bottom rows index the level 32d to level 32 cosets. -/
namespace TunnellTraceCosets
open Finset Matrix MatrixGroups CongruenceSubgroup TunnellRamifiedLines TunnellGluePacket
noncomputable section
variable {d : ℕ}
private instance pPrime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

abbrev Choices (d : ℕ) := (i : P d)→Option (ZMod i.val)

def slope (g : SL(2,ℤ)) : Choices d := fun i =>
  if (g 1 0:ZMod i.val)=0 then none else some ((g 1 1:ZMod i.val)/(g 1 0:ZMod i.val))

lemma row_nz (g : SL(2,ℤ)) (i : P d) : (g 1 0:ZMod i.val)=0 → (g 1 1:ZMod i.val)≠0 := by
  intro h0 h1
  have e := g.det_coe
  rw [Matrix.det_fin_two] at e
  have he := congrArg (fun n : ℤ => (n:ZMod i.val)) e
  push_cast at he
  simp [h0,h1] at he

lemma slope_iff (g h : SL(2,ℤ)) (i : P d) : slope g i=slope h i ↔
    (g 1 0:ZMod i.val)*h 1 1-(g 1 1:ZMod i.val)*h 1 0=0 := by
  unfold slope
  by_cases hg : (g 1 0:ZMod i.val)=0 <;> by_cases hh : (h 1 0:ZMod i.val)=0
  · simp [hg,hh]
  · simp [hg,hh,row_nz g i hg]
  · simp [hg,hh,row_nz h i hh]
  · simp only [hg,hh,if_false,Option.some.injEq,div_eq_div_iff hg hh,sub_eq_zero]
    constructor <;> intro H <;> linear_combination -H

lemma slope_level (hs : Squarefree d) (hd : d%4=1) (g h : Gamma0 32) :
    slope (d:=d) g.val=slope h.val ↔ g.val*h.val⁻¹ ∈ Gamma0 (32*d) := by
  have c (g h : SL(2,ℤ)) : (g*h⁻¹) 1 0=g 1 0*h 1 1-g 1 1*h 1 0 := by
    change (g.val*h⁻¹.val) 1 0=_
    rw [Matrix.mul_apply,Fin.sum_univ_two,SpecialLinearGroup.SL2_inv_expl]
    simp; ring
  have h32 : (32:ℤ)∣(g.val*h.val⁻¹) 1 0 := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp
    (Gamma0_mem.mp (Subgroup.mul_mem _ g.property (Subgroup.inv_mem _ h.property)))
  have cop : IsCoprime (32:ℤ) (d:ℤ) := by
    rw [Int.isCoprime_iff_gcd_eq_one]
    change Nat.gcd 32 d=1
    have h2 : Nat.Coprime 2 d := Nat.prime_two.coprime_iff_not_dvd.mpr (by omega)
    simpa using h2.pow_left 5
  rw [Gamma0_mem,ZMod.intCast_zmod_eq_zero_iff_dvd,Nat.cast_mul,Nat.cast_ofNat]
  constructor
  · intro e
    apply cop.mul_dvd h32
    apply int_dvd hs
    intro i
    rw [←ZMod.intCast_zmod_eq_zero_iff_dvd,c]
    push_cast
    exact (slope_iff _ _ i).mp (congrFun e i)
  · intro H
    funext i
    apply (slope_iff _ _ i).mpr
    have hi : (i.val:ℤ)∣(g.val*h.val⁻¹) 1 0 := dvd_trans (by exact_mod_cast Nat.dvd_of_mem_primeFactors i.property : (i.val:ℤ)∣(d:ℤ)) (dvd_trans (dvd_mul_left _ _) H)
    have e := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr hi
    rw [c] at e
    push_cast at e
    exact e

def relative (d : ℕ) : Subgroup (Gamma0 32) := (Gamma0 (32*d)).comap (Gamma0 32).subtype

def rightClass (g : Gamma0 32) : Gamma0 32 ⧸ relative d := QuotientGroup.mk g⁻¹

lemma class_iff (hs : Squarefree d) (hd : d%4=1) (g h : Gamma0 32) :
    rightClass (d:=d) g=rightClass h ↔ slope (d:=d) g.val=slope h.val := by
  rw [rightClass,rightClass,QuotientGroup.eq,inv_inv,slope_level hs hd]
  rfl

/-- Any set of lifts with the prescribed projective bottom rows enumerates all
left cosets of the smaller congruence subgroup, exactly once. -/
def cosets (hs : Squarefree d) (hd : d%4=1) (r : Choices d→Gamma0 32)
    (h : ∀ i,slope (r i).val=i) : Choices d ≃ Gamma0 32 ⧸ relative d :=
  Equiv.ofBijective (fun i => rightClass (r i)) (by
    constructor
    · intro i j e
      simpa only [h] using (class_iff hs hd (r i) (r j)).mp e
    · intro q
      let g : Gamma0 32 := q.out⁻¹
      refine ⟨slope (d:=d) g.val,?_⟩
      have e := (class_iff hs hd (r (slope g.val)) g).mpr (h _)
      exact e.trans (by simp [rightClass,g,Quotient.out_eq']) )

end
end TunnellTraceCosets
#print axioms TunnellTraceCosets.cosets
