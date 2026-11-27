import TunnellHalfFourier
import TunnellTraceRegular
import TunnellRankinPetersson

/-! Pairing Fourier remainders against the conductor-32 eta form. -/
namespace TunnellHalfNormalizer
open TunnellEtaLevel TunnellEtaValue TunnellFricke
open UpperHalfPlane hiding I
lemma eta_anti (z : ℍ) : etaValue (U z)= -etaValue z := by
  rw [physical,physical,U_coe,show 4*((z:ℂ)+1/2)=4*(z:ℂ)+((2:ℤ):ℂ) by push_cast; ring,trans]
  norm_num [Complex.I_sq]

end TunnellHalfNormalizer

namespace TunnellHalfPairing
open Complex MeasureTheory Set TunnellRankinIntegral TunnellEtaValue TunnellHalfNormalizer TunnellHalfFourier
open MatrixGroups ModularGroup CongruenceSubgroup
open scoped UpperHalfPlane
open scoped ComplexConjugate
noncomputable section

lemma pair_eta (F : ℍ→ℂ) (z : ℍ) : pair F z=(z.im:ℂ)^2*etaValue z*conj (F z) := rfl

theorem anti {F : ℍ→ℂ} (he : ∀ z, F (U z)=F z) : pair F ∘ U=fun z => -pair F z := by
  funext z
  simp [Function.comp_def,pair_eta,U_im,eta_anti,he]

theorem value (u v w : ℝ) (F G H : ℍ→ℂ) (z : ℍ) :
    pair (remainder u v w F G H) z=(u:ℂ)*pair F z-(v:ℂ)*pair G z-(w:ℂ)*pair H z := by
  simp only [pair,remainder,map_sub,map_mul,Complex.conj_ofReal]
  ring

theorem regular_sub (u v w : ℝ) {F G H : ℍ→ℂ} (hf : regular F) (hg : regular G) (hh : regular H) :
    regular (remainder u v w F G H) := by
  refine ⟨?_,?_,?_⟩
  · rw [show pair (remainder u v w F G H)=fun z => (u:ℂ)*pair F z-(v:ℂ)*pair G z-(w:ℂ)*pair H z from funext (value u v w F G H)]
    exact ((hf.1.const_mul _).sub (hg.1.const_mul _)).sub (hh.1.const_mul _)
  · intro a z; simp only [value,hf.2.1,hg.2.1,hh.2.1]
  · intro q; simp only [value]
    exact (((hf.2.2 q).const_mul _).sub ((hg.2.2 q).const_mul _)).sub ((hh.2.2 q).const_mul _)

theorem linear (u v w : ℝ) {F G H : ℍ→ℂ} (hf : regular F) (hg : regular G) (hh : regular H) :
    petersson 32 (pair (remainder u v w F G H))=
      (u:ℂ)*petersson 32 (pair F)-(v:ℂ)*petersson 32 (pair G)-(w:ℂ)*petersson 32 (pair H) := by
  classical
  letI := Fintype.ofFinite (Cosets 32)
  simp only [petersson,tsum_fintype,value]
  rw [Finset.mul_sum,Finset.mul_sum,Finset.mul_sum,←Finset.sum_sub_distrib,←Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl; intro q _
  let f (z:ℍ) := (u:ℂ)*pair F (rep q • z)
  let g (z:ℍ) := (v:ℂ)*pair G (rep q • z)
  let h (z:ℍ) := (w:ℂ)*pair H (rep q • z)
  have fi : IntegrableOn f fdo := (hf.2.2 q).const_mul (u:ℂ)
  have gi : IntegrableOn g fdo := (hg.2.2 q).const_mul (v:ℂ)
  have hi : IntegrableOn h fdo := (hh.2.2 q).const_mul (w:ℂ)
  change (∫ z in fdo,(f-g) z-h z)=_
  rw [integral_sub (fi.sub gi) hi]
  change (∫ z in fdo,f z-g z)-(∫ z in fdo,h z)=_
  rw [integral_sub fi gi]
  dsimp only [f,g,h]
  simp only [MeasureTheory.integral_const_mul]

end
end TunnellHalfPairing
#print axioms TunnellHalfPairing.linear
