import TunnellCMUniversalNorm
import Mathlib.NumberTheory.NumberField.Basic

/-! Transport the entire arithmetic norm sequence to a prescribed realization
of its first field, keeping each higher field and unit unchanged. -/
namespace TunnellCMAlignedNorm
open NumberField IntermediateField TunnellCMRelativeOrbitNorm TunnellCMUniversalNorm
open scoped NumberField
noncomputable section
variable {K B T : Type} [Field K] [Field B] [Field T] [Algebra K B] [Algebra K T]
variable {A : IntermediateField K B}

def align (e : T →ₐ[K] B) (he : e.fieldRange=A) : T ≃ₐ[K] A := e.equivFieldRange.trans (equivOfEq he)

lemma align_val (e : T →ₐ[K] B) (he : e.fieldRange=A) (x : T) : ((align e he x:A):B)=e x := rfl

def pullUnit (e : T →ₐ[K] B) (he : e.fieldRange=A) (u : (𝓞 A)ˣ) : (𝓞 T)ˣ :=
  Units.map (RingOfIntegers.mapRingHom (align e he).symm.toRingHom).toMonoidHom u

lemma pull_spec (e : T →ₐ[K] B) (he : e.fieldRange=A) (u : (𝓞 A)ˣ) :
    e (pullUnit e he u).val.val=(u.val.val:B) := by
  rw [←align_val e he]; exact congrArg Subtype.val ((align e he).apply_symm_apply u.val.val)

def extend (e : T →ₐ[K] B) (he : e.fieldRange=A) {N : IntermediateField K B} (h : A≤N) : T →ₐ[K] N :=
  (inclusion h).comp (align e he).toAlgHom

lemma transported_norm (e : T →ₐ[K] B) (he : e.fieldRange=A) {N : IntermediateField K B} (h : A≤N) (x : N) :
    letI : Algebra T N := (extend e he h).toAlgebra
    Algebra.norm T x=(align e he).symm (relativeNorm h x) := by
  letI : Algebra T N := (extend e he h).toAlgebra
  letI : Algebra A N := (inclusion h).toAlgebra
  exact Algebra.norm_eq_of_equiv_equiv (align e he).toRingEquiv (RingEquiv.refl N) rfl x

theorem universal (L : ℕ → IntermediateField K B) [∀ r, FiniteDimensional K (L r)] (inc : ∀ r,L r≤L (r+1))
    (u : (r : ℕ) → (𝓞 (L r))ˣ) (ε : ℤ) (hs : ε*ε=1)
    (H : ∀ r, 0<r → relativeNorm (inc r) (u (r+1)).val.val=(u r).val.val^ε)
    (e : T →ₐ[K] B) (he : e.fieldRange=L 1) (r : ℕ) :
    ∃ h : L 1≤L (r+1), letI : Algebra T (L (r+1)) := (extend e he h).toAlgebra
      ∃ z : (𝓞 (L (r+1)))ˣ, Algebra.norm T z.val.val=(pullUnit e he (u 1)).val.val := by
  obtain ⟨h,hN⟩ := all_levels L inc (fun r => (u r).val.val) ε hs H r
  refine ⟨h,(u (r+1))^(ε^r),?_⟩
  let u' := u (r+1)
  have hv : (u'^(ε^r)).val.val=u'.val.val^(ε^r) := by
    let φ:=Units.map (algebraMap (𝓞 (L (r+1))) (L (r+1))).toMonoidHom
    exact (congrArg Units.val (φ.map_zpow u' (ε^r))).trans (Units.val_zpow_eq_zpow_val _ _)
  rw [transported_norm e he h,hv]
  exact congrArg (align e he).symm hN

end
end TunnellCMAlignedNorm
#print axioms TunnellCMAlignedNorm.universal
