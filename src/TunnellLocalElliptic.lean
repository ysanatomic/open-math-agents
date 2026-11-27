import TunnellLocalCM
import TunnellLocalDivisibility
import TunnellSplitPadic
import EllipticCurves.WeierstrassFormalGroup.Filtration
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.NumberTheory.SumTwoSquares

/-! Nondivisibility of non-torsion congruent-number points over a split rational completion. -/

namespace TunnellLocalDivisibility

open IsDedekindDomain TunnellCoates WeierstrassCurve TunnellLocalCM

noncomputable abbrev place (p : ℕ) [Fact p.Prime] : HeightOneSpectrum ℤ :=
  Rat.HeightOneSpectrum.primesEquiv.symm ⟨p,Fact.out⟩

abbrev Local (p : ℕ) [Fact p.Prime] := (place p).adicCompletion ℚ

open scoped Classical in
theorem elliptic_local_structure {p : ℕ} [Fact p.Prime] (W : Affine (Local p)) [W.IsElliptic] :
    ∃ U : AddSubgroup W.Point, U.FiniteIndex ∧ Nonempty (U ≃+ ℤ_[p]) := by
  letI : Finite (ℤ ⧸ (place p).asIdeal) := Ring.HasFiniteQuotients.finiteQuotient (place p).ne_bot
  obtain ⟨U,hU,⟨e⟩⟩ := Affine.exists_finiteIndex_addSubgroup_equiv_adicCompletionIntegers (place p) W
  letI : Algebra ℤ ((place p).adicCompletionIntegers ℚ) := Ring.toIntAlgebra _
  exact ⟨U,hU,⟨e.trans (PadicInt.adicCompletionIntegersEquiv ℤ ⟨p,Fact.out⟩).toAlgEquiv.toRingEquiv.toAddEquiv.symm⟩⟩

open scoped Classical in
private theorem local_point_bounded_aux {p : ℕ} [Fact p.Prime] {K : Type*} [Field K]
    (e : ℚ_[p] →+* K) (hp : p%4=1) (n : K) [(E n).IsElliptic]
    (struct : ∃ U : AddSubgroup (E n).toAffine.Point, U.FiniteIndex ∧ Nonempty (U ≃+ ℤ_[p]))
    (P : (E n).toAffine.Point) (hP : ¬ IsOfFinAddOrder P) :
    ∃ (i : K) (hi : i^2 = -1) (a b : ℤ), a^2+b^2=(p:ℤ) ∧ ∃ B : ℕ, ∀ r, B<r →
      ¬ ∃ Q : (E n).toAffine.Point, (fun x => a • x + b • gaussianI n i hi x)^[r] Q=P := by
  obtain ⟨U,hU,⟨u⟩⟩ := struct
  letI := hU
  obtain ⟨z,hz⟩ := split_padic_root hp
  let i : K := e (z:ℚ_[p])
  have hzi : (z:ℚ_[p])^2 = -1 := by
    simpa only [PadicInt.coe_pow,PadicInt.coe_neg,PadicInt.coe_one] using
      congrArg ((↑) : ℤ_[p] → ℚ_[p]) hz
  have hi : i^2 = -1 := by simpa [i] using congrArg e hzi
  obtain ⟨a,b,hab⟩ := Nat.Prime.sq_add_sq (p:=p) (by omega)
  have hab' : (a:ℤ)^2+(b:ℤ)^2=(p:ℤ) := by exact_mod_cast hab
  obtain ⟨B,b',hb',hnd⟩ := bounded_divisibility U u (gaussianI n i hi) (gaussianI_square n i hi)
    z hz (a:ℤ) (b:ℤ) hab' P hP
  refine ⟨i,hi,a,b',?_,B,hnd⟩
  rcases hb' with rfl|rfl <;> simpa using hab'

open scoped Classical in
theorem local_point_bounded {p : ℕ} [Fact p.Prime] (hp : p%4=1) (n : Local p) [(E n).IsElliptic]
    (P : (E n).toAffine.Point) (hP : ¬ IsOfFinAddOrder P) :
    ∃ (i : Local p) (hi : i^2 = -1) (a b : ℤ), a^2+b^2=(p:ℤ) ∧ ∃ B : ℕ, ∀ r, B<r →
      ¬ ∃ Q : (E n).toAffine.Point, (fun x => a • x + b • gaussianI n i hi x)^[r] Q=P := by
  exact local_point_bounded_aux (Padic.adicCompletionEquiv ℤ ⟨p,Fact.out⟩).toAlgEquiv.toRingHom
    hp n (elliptic_local_structure (p:=p) (E n).toAffine) P hP

#print axioms local_point_bounded

end TunnellLocalDivisibility
