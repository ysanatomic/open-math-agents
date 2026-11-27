import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1
import Mathlib

/-! In a cyclic tower of local fields the norm index equals the cyclic extension degree. Finite local reciprocity turns these indices into the natural norm-quotient isomorphisms. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1
open NumberField IsDedekindDomain
open scoped Classical NumberField

def H1 : Prop :=
  ∀(K:Type)[Field K][ValuativeRel K][TopologicalSpace K][IsNonarchimedeanLocalField K]
   (L:Type)[Field L][Algebra K L][FiniteDimensional K L](Y:Type)[Field Y][Algebra L Y]
   [FiniteDimensional L Y][IsGalois L Y][IsCyclic Gal(Y/L)],
   Nat.card (Lˣ ⧸ (Units.map (Algebra.norm L (S:=Y))).range)=Module.finrank L Y

def H2 : Prop :=
  (∀(K:Type)[Field K][ValuativeRel K][TopologicalSpace K][IsNonarchimedeanLocalField K]
   (L:Type)[Field L][Algebra K L][FiniteDimensional K L](Y:Type)[Field Y][Algebra L Y]
   [FiniteDimensional L Y][IsGalois L Y][IsCyclic Gal(Y/L)],
   Nat.card (Lˣ ⧸ (Units.map (Algebra.norm L (S:=Y))).range)=Module.finrank L Y) →
  ∀(F:Type)[Field F][NumberField F](w:HeightOneSpectrum (𝓞 F)),let L:=w.adicCompletion F
  ∀(Y:Type)[Field Y][Algebra L Y][FiniteDimensional L Y][IsAbelianGalois L Y],
  ∃ f:Lˣ→*Gal(Y/L),Function.Surjective f ∧ f.ker=(Units.map (Algebra.norm L (S:=Y))).range ∧
  ∀(d:L≃+*L)(s:Y≃+*Y),(∀z,Valued.v (d z)=Valued.v z) → (∀z:L,s (algebraMap L Y z)=algebraMap L Y (d z)) →
  ∀(u:Lˣ)(z:Y),s (f u z)=f (Units.map d.toMonoidHom u) (s z)

theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1.H1 := fun h reciprocity=>reciprocity h
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H1_R1

