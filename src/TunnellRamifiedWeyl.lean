import TunnellRamifiedPlane

/-! The Weyl representative built from the two elementary unipotents of a ramified
quadratic plane. Its first row gives the exact scalar for the level trace. -/
namespace TunnellRamifiedWeyl
open Finset TunnellRamifiedPlane
noncomputable section
variable {p : ℕ} [Fact p.Prime]
local notation "F" => ZMod p
local notation "V" => F×F
local notation "ψ" => ZMod.stdAddChar (N:=p)

def bil (a t : F) (x y : V) : F := 2*a*(x.1*y.1-t*x.2*y.2)
def translate (a t k : F) (f : V→ℂ) (x : V) : ℂ := ψ (k*form a t x)*f x
def fourier (a t k : F) (f : V→ℂ) (x : V) : ℂ := ∑ u : V, ψ (k*bil a t x u)*f u
def lower (a t : F) (f : V→ℂ) (x : V) : ℂ :=
  ((p:ℂ)^2)⁻¹*fourier a t 1 (translate a t (-1) (fourier a t (-1) f)) x
def weyl (a t : F) (f : V→ℂ) :=
  translate a t (-1) (lower a t (translate a t (-1) f))

lemma complete (a t : F) (x v u : V) :
    -(form a t x) + bil a t x u - form a t u - bil a t u v - form a t v =
      form (-a) t (u+(v-x)) - bil a t x v := by
  simp [form,bil]
  ring

lemma weyl_kernel (hp : p≠2) {a t : F} (ha : a≠0) (ht : t≠0) (f : V→ℂ) (x : V) :
    weyl a t f x=gauss a t/(p:ℂ)^2*fourier a t (-1) f x := by
  classical
  have hG : gauss (-a) t=gauss a t := (gauss_eq hp (neg_ne_zero.mpr ha) ht).trans (gauss_eq hp ha ht).symm
  have block (u v : V) : ψ (-(form a t x))* (ψ (bil a t x u)*
      (ψ (-form a t u)*(ψ (-bil a t u v)*(ψ (-form a t v)*f v)))) =
      ψ (form (-a) t (u+(v-x)))*(ψ (-bil a t x v)*f v) := by
    simp only [←mul_assoc,←AddChar.map_add_eq_mul]
    congr 2
    convert complete a t x v u using 1 <;> ring
  have hsum (v : V) : (∑ u : V, ψ (form (-a) t (u+(v-x))))=gauss a t := by
    rw [←hG,gauss]
    exact Equiv.sum_comp (Equiv.addRight (v-x)) (fun w : V => ψ (form (-a) t w))
  unfold weyl lower translate fourier
  simp only [one_mul,neg_one_mul]
  calc
    _ = ((p:ℂ)^2)⁻¹*∑ u : V, ∑ v : V, ψ (-(form a t x))*(ψ (bil a t x u)*
          (ψ (-form a t u)*(ψ (-bil a t u v)*(ψ (-form a t v)*f v)))) := by
      rw [mul_left_comm]
      simp only [mul_sum]
    _ = ((p:ℂ)^2)⁻¹*∑ v : V, (∑ u : V, ψ (form (-a) t (u+(v-x))))*(ψ (-bil a t x v)*f v) := by
      congr 1
      simp only [block,sum_mul]
      rw [sum_comm]
    _ = _ := by simp only [hsum,←mul_sum]; ring

theorem weyl_trace (hp : p≠2) {a t : F} (ha : a≠0) (ht : t≠0) (f : V→ℂ) :
    f 0 + ∑ j : F, weyl a t (translate a t j f) 0 = trace a t f := by
  simp [weyl_kernel hp ha ht,fourier,bil,translate,trace,Finset.mul_sum]
  rfl

end
end TunnellRamifiedWeyl
#print axioms TunnellRamifiedWeyl.weyl_trace
