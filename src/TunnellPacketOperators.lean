import TunnellRectangularPacket
import TunnellRamifiedWeyl

/-! Linear operators on the complementary factor and the ramified quadratic plane
of a four-dimensional theta packet. -/
namespace TunnellPacketOperators
open Complex Finset MatrixGroups ModularGroup ModularForm
open scoped ModularForm
open UpperHalfPlane hiding I
noncomputable section

variable {X Y : Type*}

def Law (F : X→Y→ℍ→ℂ) (g : SL(2,ℤ)) (A : Module.End ℂ (X→Y→ℂ)) : Prop :=
  ∀ x y z, ((F x y) ∣[(2:ℤ)] g) z = A (fun x y => F x y z) x y

lemma law_mul {F : X→Y→ℍ→ℂ} {g h : SL(2,ℤ)} {A B : Module.End ℂ (X→Y→ℂ)}
    (hg : Law F g A) (hh : Law F h B) : Law F (g*h) (A.comp B) := by
  intro x y z
  rw [SlashAction.slash_mul,SL_slash_apply,hg]
  have H : B (fun x y => F x y z)=((denom h z)^(-2:ℤ)) • (fun x y => F x y (h • z)) := by
    funext i j
    rw [←hh i j z,SL_slash_apply]
    simp [mul_comm]
  rw [LinearMap.comp_apply,H,map_smul]
  simp [mul_comm]

def plane (A : Module.End ℂ (Y→ℂ)) : Module.End ℂ (X→Y→ℂ) where
  toFun f x := A (f x)
  map_add' f g := funext (fun x => A.map_add _ _)
  map_smul' c f := funext (fun x => A.map_smul _ _)

def left [Fintype X] (K : X→X→ℂ) : Module.End ℂ (X→Y→ℂ) where
  toFun f x := ∑ u, K x u • f u
  map_add' f g := by ext x y; simp [smul_add,sum_add_distrib]
  map_smul' c f := by ext x y; simp [Finset.mul_sum,mul_left_comm]

lemma commute [Fintype X] (A : Module.End ℂ (Y→ℂ)) (K : X→X→ℂ) (f : X→Y→ℂ) :
    left K (plane A f)=plane A (left K f) := by
  funext x
  change ∑ u, K x u • A (f u) = A (∑ u, K x u • f u)
  simp

lemma left_cancel [Fintype X] [DecidableEq X] (K J : X→X→ℂ) (c : ℂ)
    (h : ∀ x y, ∑ u, K x u*J u y=if x=y then c else 0) (f : X→Y→ℂ) :
    left K (left J f)=c • f := by
  ext x y
  change (∑ u, K x u • (∑ v, J u v • f v)) y = c*f x y
  simp only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul,mul_sum,←mul_assoc]
  rw [sum_comm]
  simp_rw [←sum_mul,h]
  simp

def matrix [Fintype Y] (A : Y→Y→ℂ) : Module.End ℂ (Y→ℂ) where
  toFun f x := ∑ y, A x y*f y
  map_add' f g := by ext x; simp [mul_add,sum_add_distrib]
  map_smul' c f := by ext x; simp [mul_sum,mul_left_comm]

def diagonal (t : Y→ℂ) : Module.End ℂ (Y→ℂ) where
  toFun f x := t x*f x
  map_add' f g := by ext x; simp [mul_add]
  map_smul' c f := by ext x; simp [mul_left_comm]

def weylLift (m : ℤ) : SL(2,ℤ) := T^(-m)*S*T^(-m)*S*T^(-m)

open TunnellRamifiedPlane TunnellRamifiedWeyl
variable {p : ℕ} [Fact p.Prime]
local notation "Fₚ" => ZMod p
local notation "Vₚ" => Fₚ × Fₚ
local notation "ψ" => ZMod.stdAddChar (N:=p)

def U (a t j : Fₚ) : Module.End ℂ (Vₚ→ℂ) := diagonal fun x => ψ (j*form a t x)
def W (a t j : Fₚ) : Module.End ℂ (Vₚ→ℂ) := matrix fun x y => ψ (j*bil a t x y)

theorem weyl_slash [Fintype X] [DecidableEq X] (F : X→Vₚ→ℍ→ℂ) (m : ℤ) (a t : Fₚ)
    (c b : ℂ) (hc : c*c*b=((p:ℂ)^2)⁻¹) (K J : X→X→ℂ)
    (inv : ∀ x y, ∑ u, K x u*J u y=if x=y then b else 0)
    (hT : Law F (T^(-m)) (plane (U a t (-1))))
    (hS : Law F S (c • (left K).comp (plane (W a t 1))))
    (hi : Law F S (c • (left J).comp (plane (W a t (-1)))))
    (x : X) (v : Vₚ) (z : ℍ) :
    ((F x v) ∣[(2:ℤ)] (weylLift m)) z=weyl a t (fun v => F x v z) v := by
  have h := law_mul (law_mul (law_mul (law_mul hT hS) hT) hi) hT x v z
  rw [weylLift,h]
  simp only [LinearMap.comp_apply,LinearMap.smul_apply,map_smul,commute]
  rw [left_cancel K J b inv]
  simp only [map_smul,Pi.smul_apply,smul_eq_mul,←mul_assoc,hc]
  let H := TunnellRamifiedWeyl.fourier a t 1 (TunnellRamifiedWeyl.translate a t (-1)
      (TunnellRamifiedWeyl.fourier a t (-1) (TunnellRamifiedWeyl.translate a t (-1) (fun u => F x u z)))) v
  change ((p:ℂ)^2)⁻¹ * (ψ ((-1)*form a t v)*H) = ψ ((-1)*form a t v)*(((p:ℂ)^2)⁻¹*H)
  ac_rfl

end
end TunnellPacketOperators
#print axioms TunnellPacketOperators.weyl_slash
