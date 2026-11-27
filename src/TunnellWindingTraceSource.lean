import TunnellTraceHeight
import TunnellTraceExpansion
import TunnellTraceRegular
import TunnellRankinCentralWinding

/-! The geometric Fourier expansion and the Petersson central value for the same level-32 trace. -/
namespace TunnellWindingTrace
open TunnellShell TunnellToric TunnellToricClass TunnellProperClassGroup TunnellOddTraceHeight TunnellRankinIntegral
open TunnellFiniteSymbols TunnellFricke TunnellHalfFourier TunnellHalfPairing TunnellRankinCotangent
open scoped UpperHalfPlane Classical
noncomputable section

def mass (d : ℕ) := Fintype.card ↥(representatives (2*d))
def sigma (m : ℕ) : ℂ := ∑ k∈m.divisors,(k:ℂ)
def cuspCoeff (m : ℕ) : ℂ := (TunnellQuaternion.etaCoeff m:ℂ)
def signed (d : ℕ) (hd : d%4=1) : ℤ := epsilon d (by omega)*winding (2*d) (by omega)

def Bridge : Prop :=
  ∀ {d : ℕ} [NeZero d] (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) {v : Triple} (hv : v∈shell (2*d)),
    letI := TunnellFullClassTheta.classFintype hn (by omega) hv
    let θ := TunnellFullClassTheta.full hn (by omega) hv
    ∀ D : ProperIdealClass v×ProperIdealClass v → Data d,
      (∀ z : ℍ, θ z*θ (multiple 4 z)=∑ a, TunnellTraceHeight.base (D a) z) →
      let F : ℍ→ℂ := fun z => ∑ a, TunnellTraceHeight.traced (D a) z
      regular F ∧ petersson 32 (pair F)=petersson (4*(2*d)*4) (thetaProduct θ (fun z => θ (multiple 4 z)))

structure Evidence (d : ℕ) (hd : d%4=1) where
  F : ℍ→ℂ
  a : ℕ→ℂ
  reg : regular F
  expansion : Expansion F a
  odd : ∀ m, Odd m → a m=(mass d:ℂ)^2*sigma m+(TunnellShell.b d:ℂ)^2*cuspCoeff m
  central : (2*(Real.pi:ℂ)^2)*petersson 32 (pair F)=(signed d hd:ℂ)*baseConstant^2

theorem evidence (h : Bridge) {d : ℕ} (hs : Squarefree d) (hd : d%4=1) : Nonempty (Evidence d hd) := by
  classical
  letI : NeZero d := ⟨by omega⟩
  have hn : Squarefree (2*d) := (Nat.squarefree_mul (Nat.odd_iff.mpr (by omega) : Odd d).coprime_two_left).mpr ⟨Nat.prime_two.squarefree,hs⟩
  obtain ⟨v,hv⟩ := TunnellThreeSquares.shell_nonempty d hd
  letI := TunnellFullClassTheta.classFintype hn (by omega) hv
  obtain ⟨D,hD,hF,ha⟩ := TunnellTraceHeight.exact hs hn hd (by omega) hv
  obtain ⟨reg,hP⟩ := h hs hn hd hv D (fun z => hD z (multiple 4 z) rfl)
  refine ⟨⟨_,_,reg,hF,?_,?_⟩⟩
  · intro m hm; unfold mass sigma cuspCoeff
    have he := congrArg (fun t : ℚ => (t:ℂ)) (ha m hm)
    push_cast at he ⊢; exact he
  · rw [hP]; exact central_winding hn hd hv

end
end TunnellWindingTrace
#print axioms TunnellWindingTrace.evidence
