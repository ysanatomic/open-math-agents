import TunnellCMFirstEmbedding
import TunnellCMAlignedNorm

/-! Compatible identifications of both division fields with the canonical
tower, preserving the global unit norm used by the local character. -/
namespace TunnellCMHigherEmbedding
open WeierstrassCurve WeierstrassCurve.Affine IntermediateField NumberField TunnellCoates TunnellKummer TunnellCMTorsionField
open TunnellCMCoherentPoints TunnellCMCoherentFields TunnellCMEllipticNormTower TunnellLocalCMCoordDegree
open TunnellCMRelativeOrbitNorm TunnellCMAlignedNorm
open scoped Classical NumberField
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1)
  (hiC : ((algebraMap K B i:B):ℂ)=Complex.I) {p : ℕ} (hp : p.Prime) (h₂ : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)
local notation "W" => E (n:K)
local notation "L" => level K n hn hp q hq

include hiC h₂ in
theorem image {D : Type} [Field D] [Algebra K D] [FiniteDimensional K D] [DecidableEq D] (r : ℕ)
    (S : CurvePoints W D) (hS : cm (n:K) i hi (q^r) S=0) (hg : coordField W S=⊤)
    (hdeg : Module.finrank K D=(p^r).totient) (hcan : Module.finrank K (L r)=(p^r).totient) (e : D →ₐ[K] B) :
    e.fieldRange=L r := by
  let T:=primitive K n hn hp q hq r
  obtain ⟨_,ho,hgen⟩ := generates K n hn hp q hq i hi hiC h₂ r
  letI : FiniteDimensional K (L r) := finite_coord n (p^r) hn (pow_pos hp.pos _) T (by
    rw [←ho]; exact addOrderOf_nsmul_eq_zero _)
  let U:=Point.map (W':=(W).toAffine) e S
  have hu : cm (n:K) i hi (q^r) U=0 := by change cm _ _ _ _ (Point.map e S)=_; rw [←cm_map,hS,map_zero]
  obtain ⟨k,hk⟩:=hgen U hu
  have hle : coordField W U≤L r := coord_le W <| hk ▸ (rationalPoints W (L r)).zsmul_mem (point_rational W T) k
  have he : e.fieldRange=coordField W U := by rw [←coord_map W e S,hg,AlgHom.fieldRange_eq_map]
  apply IntermediateField.eq_of_le_of_finrank_le (he ▸ hle)
  exact (hcan.trans (hdeg.symm.trans e.equivFieldRange.toLinearEquiv.finrank_eq)).le

theorem extend_embedding {T D : Type} [Field T] [Field D] [Algebra K T] [Algebra K D] [Algebra T D]
    [IsScalarTower K T D] [FiniteDimensional T D] (e : T →ₐ[K] B) :
    ∃ g : D →ₐ[K] B, ∀ a : T, g (algebraMap T D a)=e a := by
  letI : IsAlgClosure K B := closed_over K
  letI : IsAlgClosed B := IsAlgClosure.isAlgClosed K
  letI : Algebra T B := e.toAlgebra
  letI : IsScalarTower K T B := .of_algebraMap_eq (fun x => (e.commutes x).symm)
  let f : D →ₐ[T] B := IsAlgClosed.lift
  exact ⟨f.restrictScalars K,fun a => f.commutes a⟩

theorem transfer_norm {T D : Type} [Field T] [Field D] [Algebra K T] [Algebra K D] [Algebra T D]
    (e : T →ₐ[K] B) (g : D →ₐ[K] B) (eg : ∀ a : T, g (algebraMap T D a)=e a)
    {A H : IntermediateField K B} (ea : e.fieldRange=A) (eh : g.fieldRange=H) (le : A≤H)
    (u : (𝓞 A)ˣ) (v : (𝓞 H)ˣ) (hN : relativeNorm le v.val.val=u.val.val) :
    Algebra.norm T (pullUnit g eh v).val.val=(pullUnit e ea u).val.val := by
  letI : Algebra A H := (inclusion le).toAlgebra
  let f:=align e ea
  let l:=align g eh
  have hh : (algebraMap A H).comp f.toRingEquiv.toRingHom = l.toRingEquiv.toRingHom.comp (algebraMap T D) := by
    apply RingHom.ext
    intro a
    apply H.val.injective
    exact (eg a).symm
  let z:=(pullUnit g eh v).val.val
  have hz : l z=v.val.val := Subtype.ext (pull_spec g eh v)
  have hy : f (pullUnit e ea u).val.val=u.val.val := Subtype.ext (pull_spec e ea u)
  have eq:=Algebra.norm_eq_of_equiv_equiv f.toRingEquiv l.toRingEquiv hh z
  apply f.injective
  change f (Algebra.norm T z)=_
  rw [eq]
  change f (f.symm (Algebra.norm A (l z)))=_
  rw [f.apply_symm_apply,hz,hy]
  exact hN

end
end TunnellCMHigherEmbedding
#print axioms TunnellCMHigherEmbedding.image
#print axioms TunnellCMHigherEmbedding.extend_embedding
#print axioms TunnellCMHigherEmbedding.transfer_norm
