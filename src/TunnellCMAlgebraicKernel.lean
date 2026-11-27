import TunnellCMCriticalCoefficients
import TunnellCMTorsionField

/-! The complex and algebraic Gaussian division kernels agree under uniformization. -/
namespace TunnellCMAlgebraicKernel
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine
open TunnellCoates TunnellKummer TunnellCMCriticalCoefficients TunnellCMAbsoluteUnit
open TunnellCMCriticalIntegers TunnellCMLemniscate TunnellCMToricDivision
open TunnellCMNormDistribution TunnellCMTorsionField TunnellGaussianEnd
open scoped Classical
noncomputable section
local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type*) [Field K] [CharZero K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n)
local notation "W" => E (n:K)
local notation "Lat" => twistPeriods n hn

def toric : CurvePoints W B →+ (curve Lat).toAffine.Point :=
  (Point.equivOfEq (model_eq n hn)).symm.toAddMonoidHom.comp (realize K n)

theorem toric_inj : Function.Injective (toric K n hn) :=
  (Point.equivOfEq _).symm.injective.comp ((mapPoint_injective B ℂ n).comp (Point.equivOfEq _).injective)

theorem toric_parameter (P : CurvePoints W B) : ∃ z, toric K n hn P=expE Lat z :=
  (TunnellCMTorus.exp_surjective Lat _).imp fun _ h => h.symm

theorem integral_parameter {P : CurvePoints W B} {z : ℂ} {m : ℕ}
    (hz : toric K n hn P=expE Lat z) (hp : m • P=0) : (m:ℂ)*z∈(Lat).lattice := by
  apply (TunnellCMTranscendental.analytic_killed Lat _ _).mp
  rw [← hz,← map_nsmul,hp,map_zero]

theorem realize_parameter {P : CurvePoints W B} {z : ℂ} (hz : toric K n hn P=expE Lat z) :
    realize K n P=uniformize n hn z := (Point.equivOfEq _).symm.injective (by
      rw [uniformize_apply,AddEquiv.symm_apply_apply]; exact hz)

variable [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1) (hiC : ((algebraMap K B i:B):ℂ)=I)
local notation "φ" => cm (L := B) (n:K) i hi

lemma symm_curve {A : Type*} [Field A] [DecidableEq A] {V V' : WeierstrassCurve A} (h : V=V') :
    (Point.equivOfEq h).symm=Point.equivOfEq h.symm := by cases h; rfl

include hiC in
theorem toric_gaussian (q : GaussianInt) (P : CurvePoints W B) :
    toric K n hn (φ q P)=action n hn q (toric K n hn P) := by
  have eqI : toric K n hn (baseI (n:K) i hi P)=rot n hn (toric K n hn P) := by
    cases P with
    | zero =>
      change toric K n hn (baseI (n:K) i hi 0)=rot n hn (toric K n hn 0)
      simp only [map_zero]
    | some x y h =>
      obtain ⟨h',eh⟩ : ∃ h', baseI (n:K) i hi (Point.some x y h)=Point.some (-x) (algebraMap K B i*y) h' :=
        ⟨_,rfl⟩
      simp only [eh,toric,realize,mapPoint,TunnellCMGlobalModelUnit.pointMap,AddMonoidHom.comp_apply,
        AddEquiv.coe_toAddMonoidHom,symm_curve,Point.equivOfEq_some,Point.map_some]
      change Point.some ((-(x:B):B):ℂ) (((algebraMap K B i)*y:B):ℂ) _ =
        Point.some (-(x:ℂ)) (I*(y:ℂ)) _
      exact some_eq_some Lat rfl (congrArg (·*(y:ℂ)) hiC)
  rw [cm_apply,map_add,map_zsmul,map_zsmul,eqI]
  rfl

include hiC in
def kernel_equiv {p : ℕ} (hp : p.Prime) (q : GaussianInt) (hq : q.norm.natAbs=p) :
    (φ q).ker ≃ kernel n hn q := by
  let f (x : (φ q).ker) : kernel n hn q := ⟨toric K n hn x.val,by
    change action n hn q _=0
    exact (toric_gaussian K n hn i hi hiC q x.val).symm.trans
      ((congrArg (toric K n hn) (show φ q x.val=0 from x.property)).trans (map_zero _))⟩
  apply Equiv.ofBijective f
  refine ⟨fun x y h => Subtype.ext (toric_inj K n hn (congrArg Subtype.val h)),?_⟩
  intro x
  obtain ⟨z,hz⟩ := TunnellCMTorus.exp_surjective Lat x.val
  have hqz : (q:ℂ)*z∈(Lat).lattice := (TunnellCMTorsionOrder.zero_iff n hn _).mp (by
    rw [← action_exp,hz]; exact x.property)
  have hprod : ((star q:GaussianInt):ℂ)*(q:ℂ)=(p:ℂ) := by
    rw [mul_comm]; simpa only [map_mul,map_natCast,hq] using congrArg GaussianInt.toComplex (TunnellGaussian.norm_product q)
  obtain ⟨Q,hQ⟩ := torsion_lift n hn hp.pos (show (p:ℂ)*z∈(Lat).lattice by
    rw [← hprod,mul_assoc]; exact cm_lattice n hn (star q) hqz)
  let P : CurvePoints W B := (Point.equivOfEq (eq_E K B n)).symm Q
  have e : toric K n hn P=x.val := by
    change (Point.equivOfEq _).symm (mapPoint B ℂ n ((Point.equivOfEq _) ((Point.equivOfEq _).symm Q)))=_
    rw [AddEquiv.apply_symm_apply,hQ,uniformize_apply,AddEquiv.symm_apply_apply,hz]
  have mem : φ q P=0 := toric_inj K n hn (by rw [toric_gaussian K n hn i hi hiC,e,map_zero]; exact x.property)
  exact ⟨⟨P,mem⟩,Subtype.ext e⟩

lemma kernel_equiv_val {p : ℕ} (hp : p.Prime) (q : GaussianInt) (hq : q.norm.natAbs=p)
    (u : (φ q).ker) :
    (kernel_equiv K n hn i hi hiC hp q hq u).val=toric K n hn u.val := rfl

end
end TunnellCMAlgebraicKernel
#print axioms TunnellCMAlgebraicKernel.kernel_equiv
