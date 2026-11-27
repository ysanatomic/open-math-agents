import TunnellSignedFinite
import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H3_R1_H2_R1

/-! Identification with the exact signed square asserted by the public reduction,
including its polynomial Gauss sign and its displayed Nat.rec cusp algorithm. -/
namespace TunnellPublicSignedSquare
open TunnellCuspEuclid TunnellFiniteSymbols TunnellTwistCharacter Finset
noncomputable section

def folded := Nat.rec (motive:=fun _ => ℤ → ℕ → GaussianInt) (fun _ _ => 1)
  (fun _ f a n => let r := a.bmod n
                  rot (a.bdiv n)*(if r=0 then 1 else if 2*r= -(n:ℤ) then 1-iunit else
                    1-f (if 0≤r then -(n:ℤ) else (n:ℤ)) (2*r.natAbs)))

lemma folded_step (n : ℕ) (a : ℤ) (d : ℕ) :
    folded (n+1) a d = let r := a.bmod d
      rot (a.bdiv d)*(if r=0 then 1 else if 2*r= -(d:ℤ) then 1-iunit else
        1-folded n (if 0≤r then -(d:ℤ) else (d:ℤ)) (2*r.natAbs)) := rfl

lemma folded_eq (n : ℕ) : folded n=symbolAux n := by
  induction n with
  | zero => rfl
  | succ n ih => funext a d; rw [folded_step,symbolAux,ih]

theorem public_H1 (h : ∀ d : ℕ, Squarefree d → (hd : d%4=1) →
    epsilon d (by omega)*winding (2*d) (by omega)=shellPeriod d^2) :
    OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1_H2_R1.H1 := by
  intro d hs hd
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  change epsilon d (by omega)*(∑ j : ZMod (4*(2*d)),weight (2*d) j.val*
    (folded (2*d) (j.val:ℤ) (2*d)).re)=shellPeriod d^2
  rw [folded_eq]
  exact h d hs hd

end
end TunnellPublicSignedSquare
#print axioms TunnellPublicSignedSquare.public_H1
