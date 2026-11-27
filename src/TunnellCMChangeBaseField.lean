import TunnellGeometricPrimaryKernel
import EllipticCurves.VariableChange

/-! Invariance of the geometric CM kernel when the field of coefficients is completed. -/
namespace TunnellCMChangeBaseField
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField
open scoped Classical
noncomputable section
variable {F K M:Type} [Field F] [Field K] [Field M] [Algebra F K] [Algebra K M] [Algebra F M] [IsScalarTower F K M]
variable (n:ℕ)

def rebase : CurvePoints (E (n:F)) M≃+CurvePoints (E (n:K)) M :=
  Point.equivOfEq (by ext <;> simp [E,WeierstrassCurve.baseChange,WeierstrassCurve.map])

@[simp] theorem rebase_some {x y:M} (h:((E (n:F)).baseChange M).toAffine.Nonsingular x y) :
    ∃ h',rebase (K:=K) n (.some x y h)=.some x y h' := ⟨_,Point.equivOfEq_some _ h⟩

variable [(E (n:F)).IsElliptic] [(E (n:K)).IsElliptic] (i:F) (j:K) (hi:i^2= -1) (hj:j^2= -1)
variable (hij:algebraMap F K i=j)

include hij hi in
theorem cm_rebase (a:GaussianInt) (P:CurvePoints (E (n:F)) M) :
    rebase (K:=K) n (cm (n:F) i hi a P)=cm (n:K) j hj a (rebase (K:=K) n P) := by
  have hJ:rebase (K:=K) n (baseI (n:F) i hi P)=baseI (n:K) j hj (rebase (K:=K) n P) := by
    cases P with
    | zero=>change rebase n (baseI _ _ _ 0)=baseI _ _ _ (rebase n 0); simp only [map_zero]
    | some x y hh=>
      obtain ⟨h₁,h₁'⟩:∃ h',baseI (n:F) i hi (.some x y hh)=.some (-x) (algebraMap F M i*y) h':=⟨_,rfl⟩
      obtain ⟨h₂,h₂'⟩:=rebase_some (K:=K) n hh
      obtain ⟨h₃,h₃'⟩:=rebase_some (K:=K) n h₁
      rw [h₁',h₃',h₂']
      change Point.some _ _ _=Point.some _ _ _
      exact (Point.some.injEq ..).mpr ⟨rfl,congrArg (·*y) (by rw [←hij,←IsScalarTower.algebraMap_apply])⟩
  rw [cm_apply,cm_apply,map_add,map_zsmul,map_zsmul,hJ]

include hij hi in
theorem generates [CharZero F] [Algebra F ℂ] (hn:0<n) (hI:algebraMap F ℂ i=Complex.I)
    {p:ℕ} (hp:p.Prime) (h₂:p≠2) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ)) (r:ℕ)
    (S:CurvePoints (E (n:K)) M) (hS:cm (n:K) j hj (a^r) S=0) (ho:addOrderOf S=p^r) :
    ∀ P:CurvePoints (E (n:K)) M,cm (n:K) j hj (a^r) P=0 → P∈AddSubgroup.zmultiples S := by
  let e:=rebase (F:=F) (K:=K) (M:=M) n
  obtain ⟨T,rfl⟩:=e.surjective S
  have hT:cm (n:F) i hi (a^r) T=0 := e.injective (by rw [cm_rebase n i j hi hj hij,show rebase (K:=K) n T=e T from rfl,hS,map_zero])
  have horder:addOrderOf T=p^r := (addOrderOf_injective e.toAddMonoidHom e.injective T).symm.trans ho
  intro P hP
  obtain ⟨U,rfl⟩:=e.surjective P
  have hU:cm (n:F) i hi (a^r) U=0 := e.injective (by rw [cm_rebase n i j hi hj hij,show rebase (K:=K) n U=e U from rfl,hP,map_zero])
  obtain ⟨k,hk⟩:=AddSubgroup.mem_zmultiples_iff.mp (TunnellGeometricPrimaryKernel.generates n hn i hi hI hp h₂ a ha hnorm r T hT horder U hU)
  exact AddSubgroup.mem_zmultiples_iff.mpr ⟨k,by rw [←map_zsmul,hk]⟩

#print axioms generates
end
end TunnellCMChangeBaseField
