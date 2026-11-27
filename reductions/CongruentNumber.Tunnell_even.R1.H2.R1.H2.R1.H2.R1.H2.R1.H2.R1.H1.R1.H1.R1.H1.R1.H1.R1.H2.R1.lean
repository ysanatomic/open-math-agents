import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! Each valuation-preserving automorphism of a number-field completion fixes its rational completion. The semilinear local symbol can therefore be obtained from conjugation of relative symbols in one separable closure of that rational completion. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1
open NumberField IsDedekindDomain
open scoped NumberField Classical

def H1 : Prop :=
  ∀ (F : Type) [Field F] [NumberField F] (w : HeightOneSpectrum (𝓞 F)),
  let L := w.adicCompletion F
  ∃ p : HeightOneSpectrum (𝓞 ℚ), ∃ i : p.adicCompletion ℚ →+* L,
    Continuous i ∧ (letI := i.toAlgebra; FiniteDimensional (p.adicCompletion ℚ) L) ∧
    ∀ (d : L ≃+* L), (∀ z : L, Valued.v (d z) = Valued.v z) →
      ∀ z : p.adicCompletion ℚ, d (i z) = i z

def H2 : Prop :=
  (∀ (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (L : Type) [Field L] [Algebra K L] [FiniteDimensional K L]
    (Y : Type) [Field Y] [Algebra L Y] [FiniteDimensional L Y] [IsGalois L Y] [IsCyclic Gal(Y/L)],
    Nat.card (Lˣ ⧸ (Units.map (Algebra.norm L (S := Y))).range) = Module.finrank L Y) →
  ∀ (p : HeightOneSpectrum (𝓞 ℚ)), let k := p.adicCompletion ℚ
  ∀ (L Y : Type) [Field L] [Algebra k L] [FiniteDimensional k L]
    [Field Y] [Algebra L Y] [FiniteDimensional L Y] [IsAbelianGalois L Y]
    [Algebra k Y] [IsScalarTower k L Y],
    ∃ f : Lˣ →* Gal(Y/L), Function.Surjective f ∧
      f.ker = (Units.map (Algebra.norm L (S := Y))).range ∧
      ∀ (d : Gal(L/k)) (s : Gal(Y/k)),
      (∀ z : L, s (algebraMap L Y z) = algebraMap L Y (d z)) →
      ∀ (u : Lˣ) (z : Y), s (f u z) = f (Units.map d.toMonoidHom u) (s z)

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1.H2 := by
  intro base relative index F _ _ w L Y _ _ _ _
  obtain ⟨p, i, _, hfinite, fixed⟩ := base F w
  let k := p.adicCompletion ℚ
  let : Algebra k L := i.toAlgebra
  have : FiniteDimensional k L := hfinite
  let : Algebra k Y := ((algebraMap L Y).comp i).toAlgebra
  let : IsScalarTower k L Y := .of_algebraMap_eq' rfl
  obtain ⟨f, hf, hk, naturality⟩ := relative index p L Y
  refine ⟨f, hf, hk, ?_⟩
  intro d s hd hs u z
  let d' : Gal(L/k) := { d with commutes' := fixed d hd }
  have hs' (t : k) : s (algebraMap k Y t) = algebraMap k Y t :=
    (hs (i t)).trans (congrArg (algebraMap L Y) (fixed d hd t))
  let s' : Gal(Y/k) := { s with commutes' := hs' }
  exact naturality d' s' hs u z

end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1_H2_R1
