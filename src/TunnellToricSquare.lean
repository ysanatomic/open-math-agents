import TunnellQuaternionToricSum
import TunnellThreeSquares

/-! Unconditional test-vector identity in the ramified congruent-number case. -/
namespace TunnellToricSign
open TunnellHurwitzFour TunnellHurwitz TunnellToric TunnellShell TunnellToricClass

/-- Base embedding and a full set of 2-adic local ideal generators, with their toric period square. -/
theorem toric_square (d : ℕ) (hsq : Squarefree d) (hd : d%4=1) :
    ∃ (v : Triple) (hv : v∈shell (2*d)) (hs : Squarefree (2*d)) (h₂ : (2*d)%4=2),
      let e := idealEquiv hs h₂ hv
      letI := Fintype.ofEquiv ↥(representatives (2*d)) e.symm
      ∃ localGen : ProperIdealClass v → H ℤ,
        (∀ c, LocalGenerator v (e c).val (localGen c)) ∧
        (∑ c, character (modFour (localGen c)))^2=(TunnellShell.b d)^2 := by
  classical
  have hco : Nat.Coprime 2 d := Nat.prime_two.coprime_iff_not_dvd.mpr (by omega)
  have hs : Squarefree (2*d) := (Nat.squarefree_mul hco).mpr ⟨Nat.prime_two.squarefree,hsq⟩
  have h₂ : (2*d)%4=2 := by omega
  obtain ⟨t,ht⟩ := TunnellThreeSquares.shell_nonempty d hd
  obtain ⟨v,hv,hx,hy,hz⟩ := aligned_base (show (2*d)%8=2 by omega) ht
  refine ⟨v,hv,hs,h₂,?_⟩
  dsimp only
  let e := idealEquiv hs h₂ hv
  letI := Fintype.ofEquiv ↥(representatives (2*d)) e.symm
  have h (c : ProperIdealClass v) : ∃ q, LocalGenerator v (e c).val q :=
    local_generator_exists h₂ hv (Finset.mem_filter.mp (e c).property).1
  choose f hf using h
  exact ⟨f,hf,by rw [quaternionic_period hs h₂ hv hx hy hz f hf,mul_pow,aligned_sign hx hy hz,one_mul]⟩

#print axioms toric_square
end TunnellToricSign
