import TunnellTraceSeries
import TunnellOddTraceHeight

/-! Scalar rectangular theta product and the exact projected coefficients of its ramified trace. -/
namespace TunnellTraceHeight
open TunnellShell TunnellToric TunnellToricClass TunnellProperClassGroup TunnellOddTraceHeight TunnellTraceChoices TunnellAnalyticLine TunnellRectangularIdeal
open scoped UpperHalfPlane Classical
noncomputable section
variable {d : ℕ}

def base [NeZero d] (D : Data d) (z : ℂ) :=
  letI : NeZero D.U.a := ⟨D.U.pos.ne'⟩
  letI : NeZero D.V.a := ⟨D.V.pos.ne'⟩
  rect d D.U.a 1 D.U.b 0 z*rect d D.V.a 4 D.V.b 0 z

def traced [NeZero d] (D : Data d) (z : ℂ) := TunnellAnalyticLine.trace D.U D.V z
def coeff (D : Data d) (m : ℕ) := TunnellTraceChoices.weight D.U.atPrime D.V.atPrime m

theorem exact [NeZero d] (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d)) :
    letI := TunnellFullClassTheta.classFintype hn h2 hv
    ∃ D : ProperIdealClass v×ProperIdealClass v → Data d,
      (∀ z w:ℍ, (w:ℂ)=4*(z:ℂ) → TunnellFullClassTheta.full hn h2 hv z*TunnellFullClassTheta.full hn h2 hv w=∑ a, base (D a) z) ∧
      (∀ z:ℍ, HasSum (fun m : ℕ => ((∑ a, coeff (D a) m:ℕ):ℂ)*(Function.Periodic.qParam 1 z)^m) (∑ a, traced (D a) z)) ∧
      ∀ m, Odd m → ((∑ a, coeff (D a) m:ℕ):ℚ)=
        (Fintype.card ↥(representatives (2*d)):ℚ)^2*(∑ k∈m.divisors,(k:ℚ))+
          (TunnellShell.b d:ℚ)^2*(TunnellQuaternion.etaCoeff m:ℚ) := by
  classical
  letI := TunnellFullClassTheta.classFintype hn h2 hv
  obtain ⟨D,h,he⟩ := total hs hn hd h2 hv
  refine ⟨D,?_,?_,?_⟩
  · intro z w ew; rw [h z w]; apply Finset.sum_congr rfl; intro a _
    letI : NeZero (D a).U.a := ⟨(D a).U.pos.ne'⟩
    letI : NeZero (D a).V.a := ⟨(D a).V.pos.ne'⟩
    change _=rect d (D a).U.a 1 (D a).U.b 0 z*rect d (D a).V.a 4 (D a).V.b 0 z
    rw [unshifted (D a).U (D a).hI z.im_pos,unshifted (D a).V (D a).hJ z.im_pos,ew]; simp
  · intro z
    have H := hasSum_sum (s:=Finset.univ) fun a _ => TunnellTraceSeries.trace_expansion hs hn h2 (D a).hI (D a).hJ (D a).U (D a).V z.im_pos
    apply H.congr_fun; intro m; simp only [coeff,Nat.cast_sum,Finset.sum_mul]
  · intro m hm; rw [Nat.cast_sum]; exact he m hm

end
end TunnellTraceHeight
#print axioms TunnellTraceHeight.exact

