import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.Modular
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-! The weight-two eta pairing and its integrability on the level-32 tiles. -/
namespace TunnellHalfPairing
open ModularForm Complex MeasureTheory MatrixGroups ModularGroup CongruenceSubgroup UpperHalfPlane
open scoped UpperHalfPlane ComplexConjugate
noncomputable section
def pair (F : ℍ→ℂ) (z : ℍ) := (z.im:ℂ)^2*(ModularForm.eta (4*(z:ℂ))^2*ModularForm.eta (8*(z:ℂ))^2)*conj (F z)
def regular (F : ℍ→ℂ) :=
  Measurable (pair F) ∧ (∀ (g : Gamma0 32) z, pair F (g.val • z)=pair F z) ∧
  ∀ q : SL(2,ℤ) ⧸ Gamma0 32, IntegrableOn (fun z => pair F (q.out⁻¹ • z)) fdo


end
end TunnellHalfPairing
