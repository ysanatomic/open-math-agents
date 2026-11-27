import Mathlib.Analysis.Complex.Periodic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic

/-! Fourier expansions on the upper half-plane with period one. -/
namespace TunnellHalfFourier
open scoped UpperHalfPlane
noncomputable section
abbrev q (z : ℍ) := Function.Periodic.qParam 1 (z:ℂ)
def Expansion (F : ℍ→ℂ) (a : ℕ→ℂ) := ∀ z, HasSum (fun m : ℕ => a m*q z^m) (F z)


end
end TunnellHalfFourier
