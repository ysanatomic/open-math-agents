import TunnellFormalQuarter
import TunnellCMTorsionField

/-! The tame scalar on a division point acts on its uniformizer through the same residue scalar. -/
namespace TunnellTameParameter
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellKummer
noncomputable section

def parameter {K:Type*} [Field K] {W:WeierstrassCurve K} : W.toAffine.Point→K
  | .zero => 0
  | .some x y _ => -x/y

lemma parameter_map {F K N:Type*} [Field F] [Field K] [Field N] [Algebra F K] [Algebra F N]
    [DecidableEq K] [DecidableEq N] (e:K→ₐ[F]N) (W:WeierstrassCurve F) (P:CurvePoints W K) :
    parameter (Point.map (W':=W.toAffine) e P)=e (parameter P) := by
  cases P with
  | zero => exact (map_zero e).symm
  | some x y hh => change -e x/e y=e (-x/y); rw [map_div₀,map_neg]

variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K] [IsFractionRing R K]
    {v:HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K
variable {W:WeierstrassCurve (v.adicCompletion K)} {W₀:WeierstrassCurve (v.adicCompletionIntegers K)}
    (hW:W₀.map (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))=W) [W.IsElliptic]

theorem parameter_formal (Z:W₀.formalGroupLaw.Points) :
    parameter (formalPoint hW Z)=((Z ():O):L) := by
  by_cases hz:(Z ():O)=0
  · rw [formalPoint_of_param_eq_zero hW hz,hz]; rfl
  rw [formalPoint_of_param_ne_zero hW hz]
  have hw : ((W₀.wEval (Z ():O):O):L)≠0 := by exact_mod_cast W₀.wEval_ne_zero (Z ()).2 hz
  change -(↑(Z ():O)/(W₀.wEval (Z ():O):L))/(-1/(W₀.wEval (Z ():O):L))=_
  field_simp

theorem tame_ratio [CharZero K] (Z:W₀.formalGroupLaw.Points) {δ:O≃+*O} (k:ℕ)
    (hk:((δ (Z ():O):O):L)=parameter (k • formalPoint hW Z))
    (hπ:maximalIdeal O=Ideal.span {(Z ():O)}) :
    ∃ a:O,δ (Z ():O)=a*(Z ():O) ∧ residue O a=(k:ResidueField O) := by
  have en (m:ℕ) : formalPoint hW (m • Z)=m • formalPoint hW Z := by
    induction m with
    | zero => rw [zero_smul,zero_smul]; exact formalPoint_of_param_eq_zero hW rfl
    | succ m ih => rw [succ_nsmul,succ_nsmul,formalPoint_add,ih]
  rw [←en,parameter_formal] at hk
  have he : δ (Z ():O)=((k • Z) ():O) := (IsFractionRing.injective O L) hk
  have hh:= (W₀.nsmul_apply_coe_mem_and_sub_mem (k:=1) (by decide) (z:=Z) (by simpa only [pow_one] using (Z ()).2) k).2
  rw [←he,nsmul_eq_mul,show 2*1=2 by decide] at hh
  have hmem := (congrArg (fun J:Ideal O => (δ (Z ():O)-(k:O)*(Z ():O))∈J^2) hπ).mp hh
  rw [Ideal.span_singleton_pow,Ideal.mem_span_singleton] at hmem
  obtain ⟨u,hu⟩:=hmem
  refine ⟨(k:O)+(Z ():O)*u,by linear_combination hu,?_⟩
  rw [map_add,map_natCast,map_mul,(residue_eq_zero_iff _).mpr (Z ()).2,zero_mul,add_zero]

#print axioms parameter_formal
#print axioms tame_ratio
end
end TunnellTameParameter
