import TunnellLocalCMCoordDegree
import TunnellTameParameter

/-! Reconstructing the primitive formal point over the chosen global coordinate field. -/
namespace TunnellPointTransport
open WeierstrassCurve TunnellKummer TunnellCMTorsionField TunnellLocalCMCoordDegree WithZero
noncomputable section
variable {F D M:Type} [Field F] [Field D] [Field M] [Algebra F D] [Algebra F M]
    [DecidableEq F] [DecidableEq D] [DecidableEq M]

def above_origin {D N:Type*} [Field D] [Field N] [Valued N ℤᵐ⁰]
    (g:D→+*N) {W:WeierstrassCurve D} : W.toAffine.Point→Prop
  | .zero => True
  | .some x _ _ => 1<Valued.v (g x)

theorem generate (W:WeierstrassCurve F) (P:CurvePoints W M) (e:coordField W P≃ₐ[F]D) :
    ∃ S:CurvePoints W D, coordField W S=⊤ ∧
      Affine.Point.map (W':=W.toAffine) ((coordField W P).val.comp e.symm.toAlgHom) S=P := by
  let B:=coordField W P
  obtain ⟨U,hU⟩:=point_rational W P
  have htop : coordField W U=⊤ := by
    apply IntermediateField.map_injective B.val
    rw [coord_map,hU,←AlgHom.fieldRange_eq_map,IntermediateField.fieldRange_val]
  let S:=Affine.Point.map (W':=W.toAffine) e.toAlgHom U
  let g:=B.val.comp e.symm.toAlgHom
  have hg:g.comp e.toAlgHom=B.val := by ext x; change ((e.symm (e x)):M)=_; rw [e.symm_apply_apply]; rfl
  refine ⟨S,?_,?_⟩
  · rw [show coordField W S=(coordField W U).map e.toAlgHom from (coord_map W _ U).symm,htop,←AlgHom.fieldRange_eq_map]
    exact top_unique (fun x _ => e.surjective x)
  · change Affine.Point.map g (Affine.Point.map e.toAlgHom U)=P
    rw [Affine.Point.map_map,hg]; exact hU

open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum IsLocalRing WithZero in
theorem origin_of_formal {R K:Type} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v:HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)] [Algebra F (v.adicCompletion K)]
    (W:WeierstrassCurve F) [(W.baseChange (v.adicCompletion K)).IsElliptic]
    (W₀:WeierstrassCurve (v.adicCompletionIntegers K)) (h:W₀.map (algebraMap _ _)=W.baseChange (v.adicCompletion K))
    (g:D→ₐ[F]v.adicCompletion K) (S:CurvePoints W D)
    (Z:W₀.formalGroupLaw.Points) (he:Affine.Point.map (W':=W.toAffine) g S=Affine.formalPoint h Z) :
    above_origin g.toRingHom S := by
  have hmem:= (Affine.mem_pow_iff_formalPoint_mem_filtration (hW:=h) Z 0).mp (by simpa using (Z ()).2)
  rw [←he] at hmem
  cases S with
  | zero => trivial
  | some x y hh =>
    change exp (2*(0+1):ℤ)≤Valued.v (g x) at hmem
    exact lt_of_lt_of_le (show 1<exp (2*(0+1):ℤ) from exp_lt_exp.mpr (by decide : (0:ℤ)<2*(0+1))) hmem

#print axioms generate
#print axioms origin_of_formal
end
end TunnellPointTransport
