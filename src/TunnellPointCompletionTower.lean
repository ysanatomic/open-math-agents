import TunnellAdicGenerators
import TunnellAdicValuationExtension

/-! The two scalar towers from a number field to a completed extension. -/
namespace TunnellPointCompletionTower
open NumberField IsDedekindDomain IsDedekindDomain.HeightOneSpectrum TunnellAdicLocalization
open scoped Classical
noncomputable section
variable {K D:Type} [Field K] [Field D] [NumberField K] [NumberField D] [Algebra K D]
variable (v:HeightOneSpectrum (𝓞 K)) (w:Fibre (L:=D) v)
local notation "F" => adicCompletion K v
local notation "M" => adicCompletion D (Subtype.val w)
local instance : Algebra F M := (finitePlaceAdicCompletionMap K D v w).toAlgebra
scoped instance direct : Algebra K M := ((algebraMap D M).comp (algebraMap K D)).toAlgebra
scoped instance globalTower : IsScalarTower K D M := IsScalarTower.of_algebraMap_eq' rfl
scoped instance localTower : IsScalarTower K F M := IsScalarTower.of_algebraMap_eq (fun x=>(finitePlaceAdicCompletionMap_coe K D v w x).symm)

def fibre (w':HeightOneSpectrum (𝓞 D)) (hw:w'.asIdeal.LiesOver v.asIdeal) : Fibre (L:=D) v :=
  ⟨w',HeightOneSpectrum.ext hw.over.symm⟩

theorem unique (h:∀u:HeightOneSpectrum (𝓞 D),u.asIdeal.LiesOver v.asIdeal → u=w.val) :
    ∀u:Fibre (L:=D) v,u=w := by
  rintro ⟨u,hu⟩
  apply Subtype.ext
  refine h u ?_
  rw [←hu]
  exact inferInstanceAs (u.asIdeal.LiesOver (u.asIdeal.under (𝓞 K)))

variable {N:Type} [Field N] [NumberField N] [Algebra D N] [Algebra K N] [IsScalarTower K D N]
def comp (u:Fibre (L:=N) w.1) : Fibre (L:=N) v :=
  ⟨u.1,(finitePlaceBelow_finitePlaceBelow (K:=K) («M»:=D) (L:=N) u.1).symm.trans ((congrArg (finitePlaceBelow (K:=K)) u.2).trans w.2)⟩

theorem along_unique (u:Fibre (L:=N) v) (hw:∀ w':Fibre (L:=D) v,w'=w) (hu:∀ u':Fibre (L:=N) v,u'=u) :
    ∃ t:Fibre (L:=N) w.1,t.val=u.val ∧ ∀ t':Fibre (L:=N) w.1,t'=t := by
  let s:=finitePlaceBelow (K:=D) u.val
  have h:finitePlaceBelow (K:=K) s=v:=(finitePlaceBelow_finitePlaceBelow (K:=K) («M»:=D) (L:=N) u.val).trans u.2
  let t:Fibre (L:=N) w.1:=⟨u.val,congrArg Subtype.val (hw ⟨s,h⟩)⟩
  refine ⟨t,rfl,?_⟩
  intro t'
  have he:(comp v w t').val=u.val:=congrArg (fun a:Fibre (L:=N) v=>a.val) (hu _)
  exact Subtype.ext he

#print axioms along_unique
#print axioms localTower
#print axioms unique
end
end TunnellPointCompletionTower
