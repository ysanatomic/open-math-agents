import TunnellFormalPrimaryCM
import TunnellLocalGood

/-! # Nondivisibility by the Gaussian prime with nonunit local differential -/
namespace TunnellOrientedNondivisibility
set_option maxHeartbeats 1500000
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates ChabautyColeman TunnellFormalQuarter TunnellGaussianEnd WithZero

variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K
variable (n : v.adicCompletionIntegers K) [(E (n:v.adicCompletion K)).IsElliptic]

private noncomputable def par {k:ℕ} (P:filtration (base_curve n) k) : (E n).formalGroupLaw.Points :=
  (formalPoint_surjective (hW:=base_curve n) (filtration_anti (Nat.zero_le k) P.2)).choose

private lemma par_spec {k:ℕ} (P:filtration (base_curve n) k) : toPoint n (par n P)=P.1 :=
  (formalPoint_surjective (hW:=base_curve n) (filtration_anti (Nat.zero_le k) P.2)).choose_spec

private lemma par_mem {k:ℕ} (P:filtration (base_curve n) k) : ((par n P) ():O)∈maximalIdeal O^(k+1) := by
  apply (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) _ _).mpr
  change (toPoint n) (par n P) ∈ _
  rw [par_spec]; exact P.property

private noncomputable def linearParam (k:ℕ) : filtration (base_curve n) k →+ O ⧸ (maximalIdeal O^(k+2)) :=
  AddMonoidHom.mk' (fun P => Ideal.Quotient.mk _ ((par n P) ():O)) (by
    intro P Q
    have eqp : par n (P+Q)=par n P+par n Q := by
      apply formalPoint_injective (base_curve n)
      change (toPoint n) _=(toPoint n) _
      rw [map_add,par_spec,par_spec,par_spec]; rfl
    rw [eqp,←map_add,Ideal.Quotient.mk_eq_mk_iff_sub_mem]
    rw [(E n).add_apply_coe_eq_addEval]
    have h₁ := (E n).addEval_sub_add_mem (j:=k+1) (Nat.succ_ne_zero k) (par_mem n P) (par_mem n Q)
    exact (Ideal.pow_le_pow_right (I:=maximalIdeal O) (by omega : k+2≤2*(k+1))) h₁)

theorem contraction (i:O) (hi:i^2= -1) (a b:ℤ)
    (hc : (a:O)+(b:O)*i∈maximalIdeal O) (k:ℕ) (P : (E (n:L)).toAffine.Point)
    (hP : P∈filtration (base_curve n) k) :
    endo (TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)) a b P∈filtration (base_curve n) (k+1) := by
  let I := TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)
  let U := filtration (base_curve n) k
  let Q : U := ⟨P,hP⟩
  let Z := par n Q
  have hz : toPoint n Z=P := par_spec n Q
  have hI : I P∈U := by
    rw [←hz,←quarter_toPoint n i hi Z]
    apply (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) _ _).mp
    exact (maximalIdeal O^(k+1)).mul_mem_left i (par_mem n Q)
  let V : U := ⟨I P,hI⟩
  have hV : par n V=quarterParam n i Z := by
    apply formalPoint_injective (base_curve n)
    change (toPoint n) _=(toPoint n) _
    rw [par_spec,quarter_toPoint n i hi Z,hz]
  let B := a • Q + b • V
  let ρ := Ideal.Quotient.mk (maximalIdeal O^(k+2))
  have hval : linearParam n k B=0 := by
    dsimp only [B]
    rw [map_add,map_zsmul,map_zsmul]
    change a • ρ (Z ():O) + b • ρ ((par n V) ():O)=0
    rw [hV]
    change a • ρ (Z ():O) + b • ρ (i*(Z ():O))=0
    simp only [zsmul_eq_mul,map_mul,←map_intCast ρ,←map_mul,←map_add]
    apply (Ideal.Quotient.eq_zero_iff_mem).mpr
    rw [show (a:O)*(Z ():O)+(b:O)*(i*(Z ():O))=((a:O)+(b:O)*i)*(Z ():O) by ring, pow_succ' (maximalIdeal O) (k+1)]
    exact Ideal.mul_mem_mul hc (par_mem n Q)
  have hp : ((par n B) ():O)∈maximalIdeal O^(k+2) := (Ideal.Quotient.eq_zero_iff_mem).mp hval
  have hv := (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) (par n B) (k+1)).mp hp
  change (toPoint n) (par n B) ∈ _ at hv
  rw [par_spec] at hv
  exact hv

theorem bounded (i:O) (hi:i^2= -1) (a b:ℤ) (hc : (a:O)+(b:O)*i∈maximalIdeal O)
    [Finite (R ⧸ v.asIdeal)] (P:(E (n:L)).toAffine.Point) (hP : ¬IsOfFinAddOrder P) :
    ∃ B : ℕ, ∀ r, B<r → ¬∃ Q, (endo (TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)) a b)^[r] Q=P := by
  let H := filtration (base_curve n) 0
  haveI : H.FiniteIndex := filtration_zero_finiteIndex (base_curve n)
  let T := endo (TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)) a b
  let Q : H := ⟨H.index • P,H.nsmul_index_mem P⟩
  let Z := par n Q
  have hZ : toPoint n Z= H.index • P := par_spec n Q
  have hNZ : (Z ():O)≠0 := by
    intro h
    have hh : toPoint n Z=0 := formalPoint_of_param_eq_zero (base_curve n) h
    exact hP (isOfFinAddOrder_iff_nsmul_eq_zero.mpr ⟨H.index,Nat.pos_of_ne_zero (AddSubgroup.FiniteIndex.index_ne_zero (H:=H)),hZ.symm.trans hh⟩)
  obtain ⟨e,_,hval⟩ := ChabautyColeman.exists_valued_eq_exp_neg (Z ()).2 hNZ
  refine ⟨e, fun r hr ⟨Q₀,hQ⟩ => ?_⟩
  have deep (j:ℕ) : H.index • (T^[j] Q₀)∈filtration (base_curve n) j := by
    induction j with
    | zero => exact H.nsmul_index_mem _
    | succ j ih =>
      rw [Function.iterate_succ_apply',←map_nsmul]
      exact contraction n i hi a b hc j _ ih
  have hh := deep r
  change T^[r] Q₀=P at hQ
  rw [hQ,←hZ] at hh
  have h₁ := (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) Z r).mpr hh
  have h₂ := (v.mem_maximalIdeal_pow_iff (K:=K)).mp h₁
  rw [hval,exp_le_exp] at h₂
  push_cast at h₂
  omega

#print axioms bounded
end TunnellOrientedNondivisibility
