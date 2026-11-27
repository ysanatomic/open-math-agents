import TunnellEisensteinGCD
import Mathlib.Data.ZMod.Units

/-! Replacing primitive lattice parameters by actual bottom rows of Γ₀(Nk). -/
namespace TunnellRankinEisenstein
open Complex Matrix MatrixGroups ModularGroup CongruenceSubgroup EisensteinSeries TunnellCMRegularized Set
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

def Rows (L : ℕ) := {p : ℤ×ℤ // (L:ℤ)∣p.1 ∧ IsCoprime p.1 p.2}
def Active (N k : ℕ) (v : Primitives) := IsCoprime (((N*k:ℕ):ℤ)*(v.val 0)) (v.val 1)

def rowMap (N k : ℕ) (v : {v : Primitives // Active N k v}) : Rows (N*k) :=
  ⟨(((N*k:ℕ):ℤ)*(v.val.val 0),v.val.val 1),dvd_mul_right _ _,v.property⟩

lemma rowMap_bijective (N k : ℕ) [NeZero N] [NeZero k] : Function.Bijective (rowMap N k) := by
  have hL : ((N*k:ℕ):ℤ)≠0 := by exact_mod_cast mul_ne_zero (NeZero.ne N) (NeZero.ne k)
  constructor
  · intro v w h
    have h₀ := congrArg (fun x : Rows (N*k) => x.val.1) h
    have h₁ := congrArg (fun x : Rows (N*k) => x.val.2) h
    apply Subtype.ext; apply Subtype.ext
    funext i
    fin_cases i
    · exact mul_left_cancel₀ hL h₀
    · exact h₁
  · rintro ⟨⟨c,e⟩,⟨⟨b,hb⟩,hcop⟩⟩
    have hb' : c=((N*k:ℕ):ℤ)*b := hb
    subst c
    let v : Primitives := ⟨![b,e],(mem_gammaSet_one _).mpr (hcop.of_isCoprime_of_dvd_left (dvd_mul_left _ _))⟩
    exact ⟨⟨v,hcop⟩,rfl⟩

def rowTerm {N L : ℕ} (χ : DirichletCharacter ℂ N) (z : ℍ) (s : ℂ) (v : Rows L) :=
  χ (v.val.2:ZMod N)*kernel s ((v.val.1:ℂ)*conj (z:ℂ)+(v.val.2:ℂ))

lemma rows_sum {N k : ℕ} [NeZero N] [NeZero k] (hk : k∣N) (χ : DirichletCharacter ℂ N)
    (z : ℍ) (s : ℂ) :
    (∑' v : Primitives,nativeTerm (k:=k) χ z s v)=∑' v : Rows (N*k),rowTerm χ z s v := by
  let f := fun v : Primitives => nativeTerm (k:=k) χ z s v
  have ha (v : Primitives) (hv : f v≠0) : Active N k v := by
    have hχ : χ (v.val 1:ZMod N)≠0 := by intro h; exact hv (by simp [f,nativeTerm,physicalTerm,h])
    have hco := (ZMod.coe_int_isUnit_iff_isCoprime _ _).mp (by
      by_contra h; exact hχ (χ.map_nonunit h))
    have hp := (mem_gammaSet_one _).mp v.property
    exact (by
      change IsCoprime (((N*k:ℕ):ℤ)*(v.val 0)) (v.val 1)
      rw [Nat.cast_mul]; exact (hco.mul_left (hco.of_isCoprime_of_dvd_left (by exact_mod_cast hk))).mul_left hp)
  have e1 : (∑' w : {v : Primitives // Active N k v}, f w)=∑' v,f v :=
    Subtype.val_injective.tsum_eq (fun v hv => ⟨⟨v,ha v hv⟩,rfl⟩)
  change (∑' v,f v)=_
  rw [←e1,←(Equiv.ofBijective (rowMap N k) (rowMap_bijective N k)).tsum_eq (rowTerm χ z s)]
  apply tsum_congr
  rintro ⟨v,hv⟩
  simp [rowTerm,f,nativeTerm,physicalTerm,Equiv.ofBijective_apply,rowMap,mul_assoc]

def matrixRow {L : ℕ} (g : Gamma0 L) : Rows L :=
  ⟨(g.val 1 0,g.val 1 1),(ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (Gamma0_mem.mp g.property),bottom_row_coprime g.val⟩

lemma matrixRow_surjective (L : ℕ) : Function.Surjective (matrixRow (L:=L)) := by
  rintro ⟨⟨c,e⟩,hL,h⟩
  obtain ⟨g,hc,he⟩ := h.exists_SL2_row 1
  have hg : g∈Gamma0 L := Gamma0_mem.mpr ((ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr (hc.symm ▸ hL))
  exact ⟨⟨g,hg⟩,Subtype.ext (Prod.ext hc he)⟩

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.rows_sum
