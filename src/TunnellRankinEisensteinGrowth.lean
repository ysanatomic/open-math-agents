import TunnellRankinSize
import TunnellRankinNormalization
import Mathlib.NumberTheory.Modular

/-! Polynomial growth of the continued Eisenstein series, valid throughout the upper half-plane. -/
namespace TunnellRankinMajorant
open Complex Matrix MatrixGroups ModularGroup TunnellRankinEisenstein TunnellCMRegularized
open UpperHalfPlane hiding I
open scoped ComplexConjugate
noncomputable section

theorem eisenstein_bound {N k : ℕ} [NeZero N] [NeZero k] (χ : DirichletCharacter ℂ N) :
    ∃ C : ℝ, 0≤ C ∧ ∀ (z : ℍ) {s : ℂ}, ‖s‖≤12 → 3/4<s.re →
      ‖eisenstein (k:=k) χ z s‖≤ C*(size z)^66 := by
  obtain ⟨B,hB,hh⟩ := regular_bound N k χ
  refine ⟨B*((N:ℝ)+2+k)^27,by positivity,?_⟩
  intro z s hs hs'
  have h1 := size_one z
  have h2 := (scale_base N k z).1
  have hN : 1≤(N:ℝ) := by exact_mod_cast NeZero.pos N
  have hker : ‖kernel s (N:ℂ)‖≤1 := by
    rw [norm_kernel _ _ (by exact_mod_cast NeZero.ne N),Complex.norm_natCast]
    exact Real.rpow_le_one_of_one_le_of_nonpos hN (by linarith)
  rw [eisenstein,norm_mul,norm_mul]
  calc
    _ ≤ (size z^12*1)*(B*scale N k z^27) := by
      apply mul_le_mul (mul_le_mul (height_power hs hs' z) hker (norm_nonneg _) (by positivity)) (hh z hs hs') (norm_nonneg _) (by positivity)
    _ ≤ size z^12*(B*(((N:ℝ)+2+k)*size z^2)^27) := by rw [mul_one]; gcongr; apply scale_le
    _ = _ := by
      let A : ℝ := N+2+k
      change size z^12*(B*(A*size z^2)^27)=B*A^27*(size z)^66
      rw [mul_pow]
      calc
        _ = B*A^27*((size z)^12*((size z)^2)^27) := by simp only [mul_left_comm,mul_comm,mul_assoc]
        _ = _ := by rw [←pow_mul,←pow_add]

end
end TunnellRankinMajorant
#print axioms TunnellRankinMajorant.eisenstein_bound
