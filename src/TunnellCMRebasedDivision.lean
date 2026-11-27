import TunnellCMNonPrimaryPlaces
import TunnellCMChangeBaseField

/-! Uniform non-primary unramifiedness of the field of a division lift. -/
namespace TunnellCMRebasedDivision
open WeierstrassCurve WeierstrassCurve.Affine IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellCoates TunnellKummer TunnellCMChangeBaseField IntermediateField NumberField
open scoped Classical NumberField
noncomputable section
set_option maxHeartbeats 900000

lemma base_fixed {D F M : Type} [Field D] [Field F] [Field M] [Algebra D F] [Algebra D M] [Algebra F M]
    [IsScalarTower D F M] (n : ℕ) (P : CurvePoints (E (n:D)) D) (φ : D →ₐ[D] M) (σ : M ≃ₐ[F] M) :
    act (E (n:F)) σ (rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ P))=
      rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ P) := by
  have fix (x : D) : σ (φ x)=φ x := by
    have he : φ x=algebraMap D M x := (φ.commutes x)
    rw [he,IsScalarTower.algebraMap_apply D F M,σ.commutes]
  cases P with
  | zero =>
    change act (E (n:F)) σ (rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ (0:CurvePoints (E (n:D)) D)))=
      rebase (K:=F) n (Point.map (W':=(E (n:D)).toAffine) φ (0:CurvePoints (E (n:D)) D))
    rw [map_zero,map_zero,map_zero]
  | some x y h =>
    rw [Point.map_some,show rebase (K:=F) n (Point.some _ _ _) = _ from (rebase_some (K:=F) n _).choose_spec]
    exact Point.some_eq_some _ (fix x) (fix y)

variable {D F N M : Type} [Field D] [Field F] [Field N] [Field M]
  [dD : DecidableEq D] [dN : DecidableEq N]
  [NumberField D] [NumberField F] [NumberField N] [NumberField M]
  [Algebra D N] [Algebra D F] [Algebra D M] [Algebra N M] [Algebra F M]
  [IsScalarTower D F M] [IsScalarTower D N M] [FiniteDimensional D N] [FiniteDimensional D F] [FiniteDimensional F M]
  [IsGalois D N] [IsGalois F M]
theorem unramified (n : ℕ) (hn : 0<n) {p r k : ℕ} (hp : p.Prime) (hsmall : Module.finrank D F<p)
    (hd : Module.finrank D N∣p^k) (A B₀ : WeierstrassCurve (𝓞 F)) (C E' : VariableChange F)
    (hC : C • E (n:F)=A.map (algebraMap (𝓞 F) F)) (hE : E' • E (n:F)=B₀.map (algebraMap (𝓞 F) F))
    (hab : IsCoprime A.Δ B₀.Δ) {x y : N} (hxy : ((E (n:D)).baseChange N).toAffine.Nonsingular x y)
    (hgen : adjoin F {algebraMap N M x,algebraMap N M y}=⊤) (P : CurvePoints (E (n:D)) D)
    (hP : p^r • Point.some _ _ hxy=Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D N) P)
    (v : HeightOneSpectrum (𝓞 D)) (hv : (p:𝓞 D)∉v.asIdeal) (w : HeightOneSpectrum (𝓞 N))
    [w.asIdeal.LiesOver v.asIdeal] : w.asIdeal.ramificationIdx (𝓞 D)=1 := by
  obtain rfl : dD=Classical.decEq D := Subsingleton.elim _ _
  obtain rfl : dN=Classical.decEq N := Subsingleton.elim _ _
  let nMap:=IsScalarTower.toAlgHom D N M
  letI : (E (n:F)).IsElliptic := E_elliptic (by norm_num) (by exact_mod_cast hn.ne')
  let Q:=Point.map (W':=(E (n:D)).toAffine) nMap (Point.some x y hxy)
  obtain ⟨h,hq⟩:=rebase_some (F:=D) (K:=F) (M:=M) n (show ((E (n:D)).baseChange M).toAffine.Nonsingular (nMap x) (nMap y) from
    ((E (n:D)).toAffine.baseChange_nonsingular (nMap).injective x y).mpr hxy)
  have hQ : rebase (K:=F) n Q=Point.some _ _ h := hq
  apply TunnellCMNonPrimaryPlaces.unramified (M:=M) (E (n:F)) A B₀ C E' hC hE hab hp hsmall hd h hgen (r:=r) _ v hv w
  intro σ
  let m:=Point.map (W':=(E (n:D)).toAffine) nMap
  let t:=rebase (F:=D) (K:=F) (M:=M) n
  have hmul : p^r • t Q=t (m (Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D N) P)) := by
    exact (t.toAddMonoidHom.map_nsmul (p^r) Q).symm.trans (congrArg t <|
      (m.map_nsmul (p^r) (Point.some x y hxy)).symm.trans (congrArg m hP))
  have hh : p^r • Point.some _ _ h=t (m (Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D N) P)) :=
    (congrArg (fun X : CurvePoints (E (n:F)) M => p^r • X) hQ.symm).trans hmul
  have fixed : act (E (n:F)) σ (t (m (Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D N) P)))=t (m (Point.map (W':=(E (n:D)).toAffine) (Algebra.ofId D N) P)) := by
    dsimp only [m]
    rw [Point.map_map]
    exact base_fixed n P _ σ
  exact (congrArg (act (E (n:F)) σ) hh).trans (fixed.trans hh.symm)


end
end TunnellCMRebasedDivision
#print axioms TunnellCMRebasedDivision.unramified
