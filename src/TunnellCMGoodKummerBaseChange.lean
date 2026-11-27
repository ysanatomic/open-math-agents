import TunnellCMCompositum
import TunnellCMNonPrimaryPlaces
import TunnellCMUniformGoodBase
import TunnellCMRebasedDivision

/-! Uniform non-primary unramifiedness of the field of a division lift. -/
namespace TunnellCMGoodKummerBaseChange
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellCoates TunnellKummer TunnellCMCompositum IntermediateField NumberField
open scoped Classical NumberField
noncomputable section
set_option maxHeartbeats 900000

variable (D : Type) [Field D] [NumberField D] {B : Type} [Field B] [Algebra D B] (N F : IntermediateField D B)
  [FiniteDimensional D N] [FiniteDimensional D F] [IsGalois D N]
local notation "H" => (N ⊔ F : IntermediateField D B)
local notation "nMap" => inclusion (le_sup_left : N≤H)
local notation "fMap" => inclusion (le_sup_right : F≤H)

theorem base_change (n : ℕ) (hn : 0<n) {p r k : ℕ} (hp : p.Prime) (hsmall : Module.finrank D F<p)
    (hd : Module.finrank D N∣p^k) (A B₀ : WeierstrassCurve (𝓞 F)) (C E' : VariableChange F)
    (hC : C • E (n:F)=A.map (algebraMap (𝓞 F) F)) (hE : E' • E (n:F)=B₀.map (algebraMap (𝓞 F) F))
    (hab : IsCoprime A.Δ B₀.Δ) {x y : N} (hxy : ((E (n:D)).baseChange N).toAffine.Nonsingular x y)
    (hgen : adjoin D {x,y}=⊤) (P : CurvePoints (E (n:D)) D)
    (hP : p^r • Point.some _ _ hxy=Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D N) P)
    (v : HeightOneSpectrum (𝓞 D)) (hv : (p:𝓞 D)∉v.asIdeal) (w : HeightOneSpectrum (𝓞 N))
    [w.asIdeal.LiesOver v.asIdeal] : w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  letI : NumberField N := NumberField.of_module_finite D N
  letI : NumberField F := NumberField.of_module_finite D F
  letI : NumberField H := NumberField.of_module_finite D H
  letI : Algebra N H := (nMap).toAlgebra
  letI : Algebra F H := (fMap).toAlgebra
  letI : SMul F H := (fMap).toAlgebra.toSMul
  letI : SMul N H := (nMap).toAlgebra.toSMul
  letI : Module F H := Algebra.toModule
  letI : IsScalarTower D F H := .of_algebraMap_eq' rfl
  letI : IsScalarTower D N H := .of_algebraMap_eq' rfl
  letI : FiniteDimensional F H := Module.Finite.of_restrictScalars_finite D F H
  letI : IsGalois F H := galois N F
  exact TunnellCMRebasedDivision.unramified (M:=(↥H)) (r:=r) n hn hp hsmall hd A B₀ C E' hC hE hab hxy
    (adjoin_top N F x y hgen) P hP v hv w

end
end TunnellCMGoodKummerBaseChange
#print axioms TunnellCMGoodKummerBaseChange.base_change
