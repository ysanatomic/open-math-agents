import TunnellFormalQuarter
import TunnellGaussianEnd

/-! # Separation of the two Gaussian prime components in the formal group -/
namespace TunnellFormalPrimaryCM
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates ChabautyColeman TunnellFormalQuarter TunnellGaussianEnd WithZero

variable {R K:Type*} [CommRing R] [IsDedekindDomain R] [Field K] [CharZero K] [Algebra R K] [IsFractionRing R K]
    {v : HeightOneSpectrum R} [DecidableEq (v.adicCompletion K)]
local notation "O" => v.adicCompletionIntegers K
local notation "L" => v.adicCompletion K

private lemma sum_congr (n i : O) (Z : (E n).formalGroupLaw.Points) {k : ℕ} (hk : k≠0)
    (ht:(Z ():O)∈maximalIdeal O^k) (a b:ℕ) :
    (((a • Z + b • quarterParam n i Z) () : O) - ((a:O)+(b:O)*i)*(Z ():O)) ∈ maximalIdeal O^(2*k) := by
  let J := maximalIdeal O^(2*k)
  let t : O := Z ()
  have hq : (quarterParam n i Z ():O)∈maximalIdeal O^k := (maximalIdeal O^k).mul_mem_left i ht
  obtain ⟨ha,ha'⟩ := (E n).nsmul_apply_coe_mem_and_sub_mem hk ht a
  obtain ⟨hb,hb'⟩ := (E n).nsmul_apply_coe_mem_and_sub_mem hk hq b
  have herr := (E n).addEval_sub_add_mem hk ha hb
  rw [← (E n).add_apply_coe_eq_addEval] at herr
  have e := J.add_mem herr (J.add_mem ha' hb')
  simp only [nsmul_eq_mul] at e
  convert e using 1 <;> change _ = _ <;> dsimp [quarterParam] <;> ring

private lemma zsmul_diff {G:Type*} [AddCommGroup G] (x:G) (a:ℤ) :
    a • x = a.toNat • x - (-a).toNat • x := by
  have ha : a=(a.toNat:ℤ)-((-a).toNat:ℤ) := by omega
  calc a • x = ((a.toNat:ℤ)-((-a).toNat:ℤ)) • x := congrArg (· • x) ha
       _ = _ := by rw [sub_zsmul,natCast_zsmul,natCast_zsmul,sub_eq_add_neg]

theorem unit_kernel (n i:O) (hi:i^2= -1) [(E (n:L)).IsElliptic]
    (a b:ℤ) (hu : IsUnit ((a:O)+(b:O)*i)) (Z : (E n).formalGroupLaw.Points)
    (hz : endo (TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)) a b (toPoint n Z)=0) : Z=0 := by
  by_contra hn
  have htn : (Z ():O) ≠ 0 := fun h => hn (funext fun u => by cases u; exact Subtype.ext h)
  obtain ⟨k,hk,hval⟩ := ChabautyColeman.exists_valued_eq_exp_neg (Z ()).2 htn
  have ht := (v.mem_maximalIdeal_pow_iff (K:=K)).mpr hval.le
  let J := maximalIdeal O^(2*k)
  have he : a.toNat • Z + b.toNat • quarterParam n i Z = (-a).toNat • Z + (-b).toNat • quarterParam n i Z := by
    apply formalPoint_injective (base_curve n)
    change (toPoint n) _ = (toPoint n) _
    rw [map_add,map_add,map_nsmul,map_nsmul,map_nsmul,map_nsmul,quarter_toPoint n i hi]
    change a • (toPoint n Z) + b • (TunnellLocalCM.gaussianI (n:L) (i:L) _ (toPoint n Z))=0 at hz
    rw [zsmul_diff _ a,zsmul_diff _ b] at hz
    apply sub_eq_zero.mp
    convert hz using 1 <;> abel
  have ha := sum_congr n i Z (by omega : k≠0) ht a.toNat b.toNat
  have hb := sum_congr n i Z (by omega : k≠0) ht (-a).toNat (-b).toNat
  rw [he] at ha
  have hab := J.sub_mem hb ha
  have ed (q:ℤ) : ((q.toNat:ℕ):O)-(((-q).toNat:ℕ):O)=(q:O) := by
    simpa only [Int.cast_sub,Int.cast_natCast] using congrArg (fun m:ℤ => (m:O)) (show (q.toNat:ℤ)-((-q).toNat:ℤ)=q by omega)
  have hc : ((a:O)+(b:O)*i)*(Z ():O)∈J := by
    convert hab using 1
    rw [←ed a,←ed b]
    ring
  obtain ⟨u,hu'⟩ := hu.exists_left_inv
  have ht2 : (Z ():O)∈J := by simpa only [←mul_assoc,hu',one_mul] using J.mul_mem_left u hc
  have hh := (v.mem_maximalIdeal_pow_iff (K:=K)).mp ht2
  rw [hval,exp_le_exp] at hh
  push_cast at hh
  omega

/-- All formal p-power torsion belongs to the prime whose differential is nonunit. -/
theorem primary_of_nsmul (n i:O) (hi:i^2= -1) [(E (n:L)).IsElliptic]
    (a b:ℤ) {p:ℕ} (hab : a^2+b^2=(p:ℤ)) (hu : IsUnit ((a:O)-(b:O)*i)) (r:ℕ)
    (Z : (E n).formalGroupLaw.Points) (hz : p^r • Z=0) :
    (endo (TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)) a b)^[r] (toPoint n Z)=0 := by
  let I := TunnellLocalCM.gaussianI (n:L) (i:L) (by exact_mod_cast hi)
  let U := filtration (base_curve n) 0
  let f := endo I a b
  let g := endo I a (-b)
  have hI : ∀ T, I (I T) = -T := TunnellLocalCM.gaussianI_square _ _ _
  have inside (z : (E n).formalGroupLaw.Points) : toPoint n z∈U :=
    (mem_pow_iff_formalPoint_mem_filtration (hW:=base_curve n) z 0).mp (by simpa using (z ()).2)
  have stab (T : (E (n:L)).toAffine.Point) (hT:T∈U) : I T∈U := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) hT
    exact (quarter_toPoint n i hi z) ▸ inside (quarterParam n i z)
  have stable (c:ℤ) (T : (E (n:L)).toAffine.Point) (hT:T∈U) : endo I a c T∈U :=
    U.add_mem (U.zsmul_mem hT _) (U.zsmul_mem (stab T hT) _)
  have hg0 (T : (E (n:L)).toAffine.Point) (hT:T∈U) (h:g T=0) : T=0 := by
    obtain ⟨z,rfl⟩ := formalPoint_surjective (hW:=base_curve n) hT
    have h₀ := unit_kernel n i hi a (-b) (by simpa [sub_eq_add_neg] using hu) z h
    rw [h₀]; exact map_zero (toPoint n)
  have stable_iter (k:ℕ) : f^[k] (toPoint n Z)∈U := by
    induction k with
    | zero => exact inside Z
    | succ k ih => rw [Function.iterate_succ_apply']; exact stable b _ ih
  have killed (k:ℕ) (T : (E (n:L)).toAffine.Point) (hT:T∈U) (h:g^[k] T=0) : T=0 := by
    induction k generalizing T with
    | zero => exact h
    | succ k ih =>
      rw [Function.iterate_succ_apply] at h
      exact hg0 T hT (ih _ (stable (-b) T hT) h)
  have hgf (T : (E (n:L)).toAffine.Point) : g (f T)=p • T := by
    change a • (a • T+b • I T) + (-b) • I (a • T+b • I T)=p • T
    rw [map_add,map_zsmul,map_zsmul,hI,← natCast_zsmul T p,←hab]
    module
  have norm (k:ℕ) (T : (E (n:L)).toAffine.Point) : g^[k] (f^[k] T)=p^k • T := by
    induction k generalizing T with
    | zero => simp
    | succ k ih =>
      rw [Function.iterate_succ_apply',Function.iterate_succ_apply,ih,map_nsmul,hgf,smul_smul,pow_succ]
  apply killed r _ (stable_iter r)
  rw [norm,←map_nsmul,hz,map_zero]

#print axioms unit_kernel
#print axioms primary_of_nsmul
end TunnellFormalPrimaryCM
