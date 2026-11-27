import TunnellEvenRankReduction
import Mathlib.NumberTheory.Zsqrtd.GaussianInt

/-!
# The Gaussian zeta trace at the central point

The analytic continuation of the Euler product determines a finite trace of
regularized Weierstrass zeta values on the square lattice. The arithmetic
step says that for a congruent-number curve with a point of infinite order,
a rational multiple of the real period giving this trace must vanish.
-/

namespace TunnellEvenTraceReduction
open Set MeasureTheory
open scoped ComplexConjugate Classical

def H1 : Prop :=
  ∀ (n : ℕ) (hn : 0<n),
  letI : NeZero (4*n) := ⟨Nat.ne_of_gt (Nat.mul_pos (by decide) hn)⟩
  let f : ℂ := (4*n:ℕ)
  let a : ℂ := (1+3*(4*n):ℕ)
  let Λ : Submodule ℤ ℂ := Submodule.span ℤ {f,f*Complex.I}
  let ζ (z : ℂ) := ∑' w : Λ, ((z-(w:ℂ))⁻¹+(w:ℂ)⁻¹+z/(w:ℂ)^2)
  let U := ∑ v : ZMod (4*n) × ZMod (4*n),
    let b : GaussianInt := ⟨v.1.val,v.2.val⟩
    let m := b.norm.natAbs
    let χ : ℤ := if (⟨2,2⟩:GaussianInt) ∣ b-1 then
      (if Odd m then jacobiSym n m else 0) else 0
    (χ:ℂ)*(-conj (a*ζ (a*(b:ℂ))-a^2*ζ (b:ℂ)))
  ∀ L : ℂ→ℂ, AnalyticOnNhd ℂ L Set.univ → (∀ s : ℝ, 2<s →
    HasProd (fun p : Nat.Primes => if p.val ∣ 2*n then (1:ℂ) else
      letI : NeZero p.val := ⟨p.property.ne_zero⟩
      let t : ℤ := (p.val:ℤ)-(Finset.univ.filter (fun xy : ZMod p.val × ZMod p.val =>
        xy.2^2=xy.1^3-(n:ZMod p.val)^2*xy.1)).card
      let T : ℂ := (p.val:ℂ)^(-(s:ℂ))
      (1-(t:ℂ)*T+(p.val:ℂ)*T^2)⁻¹) (L s)) → (a^2-a)*L 1=U

def H2 : Prop :=
  ∀ (n : ℕ) (hn : 0<n),
  letI : NeZero (4*n) := ⟨Nat.ne_of_gt (Nat.mul_pos (by decide) hn)⟩
  let f : ℂ := (4*n:ℕ)
  let a : ℂ := (1+3*(4*n):ℕ)
  let Λ : Submodule ℤ ℂ := Submodule.span ℤ {f,f*Complex.I}
  let ζ (z : ℂ) := ∑' w : Λ, ((z-(w:ℂ))⁻¹+(w:ℂ)⁻¹+z/(w:ℂ)^2)
  let U := ∑ v : ZMod (4*n) × ZMod (4*n),
    let b : GaussianInt := ⟨v.1.val,v.2.val⟩
    let m := b.norm.natAbs
    let χ : ℤ := if (⟨2,2⟩:GaussianInt) ∣ b-1 then
      (if Odd m then jacobiSym n m else 0) else 0
    (χ:ℂ)*(-conj (a*ζ (a*(b:ℂ))-a^2*ζ (b:ℂ)))
  n%8=2 → 2<n →
    ∀ P : (⟨0,0,0,-(n:ℚ)^2,0⟩ : WeierstrassCurve ℚ).toAffine.Point, ¬IsOfFinAddOrder P →
    ∀ r : ℚ, (a^2-a)*((r:ℂ)*(((∫ x in Ioi (n:ℝ), (Real.sqrt (x^3-(n:ℝ)^2*x))⁻¹):ℝ):ℂ))=U → r=0

theorem main : H1 → H2 → TunnellEvenRankReduction.H2 := by
  intro htrace hrank n _ hmod hex P hP L hL r hR
  have hn : 0<n := by omega
  have hn2 : 2<n := by
    have hne : n≠2 := fun h => hex (Or.inl h)
    omega
  have h := htrace n hn L hL.1 hL.2
  rw [hR] at h
  have hr := hrank n hn hmod hn2 P hP r h
  refine ⟨0,fun _ _ _ _ _ _ => ?_⟩
  simp [hr]

end TunnellEvenTraceReduction

#print axioms TunnellEvenTraceReduction.main

#print axioms TunnellEvenTraceReduction.main
