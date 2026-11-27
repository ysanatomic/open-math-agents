import TunnellSelling
import TunnellShell
import Mathlib.NumberTheory.LSeries.PrimesInAP
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
/-! Existence of the primitive embeddings used in the ramified toric period. -/
namespace TunnellThreeSquares
open TunnellSelling TunnellShell

/-- A prime and two integral quotients defining a unimodular Gram matrix. -/
lemma auxiliary_prime (d : ℕ) (hd : d%4=1) :
    ∃ p b A C : ℤ, 0<p ∧ A*(2*d)=p+1 ∧ p*C=b^2+2*d := by
  have hpos : 0<d := by omega
  let a : ℤ := 2*d-1
  have hbez : IsCoprime a (8*d:ℤ) := by
    refine ⟨a,-(((d:ℤ)-1)/2),?_⟩
    have he : ((d:ℤ)-1)/2*2=(d:ℤ)-1 := by omega
    dsimp [a]
    linear_combination -4*(d:ℤ)*he
  obtain ⟨p,hpgt,hp,hmod⟩ := Nat.forall_exists_prime_gt_and_zmodEq (8*d) (q:=8*d) (a:=a) (by omega) (by simpa using hbez)
  letI : Fact p.Prime := ⟨hp⟩
  have hmd : (p:ℤ) ≡ -1 [ZMOD (d:ℤ)] := by
    apply (hmod.of_dvd (by exact_mod_cast (dvd_mul_left d 8))).trans
    apply Int.modEq_iff_dvd.mpr
    exact ⟨-2,by dsimp [a]; ring⟩
  have h8 : p%8=1 := by
    have he : (p:ℤ) ≡ a [ZMOD 8] := hmod.of_dvd (by exact_mod_cast (dvd_mul_right 8 d))
    change (p:ℤ)%8=a%8 at he
    dsimp only [a] at he; omega
  have hop : Odd p := Nat.odd_iff.mpr (by omega)
  have hod : Odd d := Nat.odd_iff.mpr (by omega)
  have hnn : ((-2*(d:ℤ)):ZMod p)≠0 := by
    have he : ((2*d:ℕ):ZMod p)≠0 := by
      intro he
      have ht := (ZMod.natCast_eq_zero_iff _ _).mp he
      exact (not_le_of_gt (show 2*d<p by omega)) (Nat.le_of_dvd (by positivity) ht)
    push_cast at he ⊢
    simpa using he
  have hsym : legendreSym p (-2*d)=1 := by
    rw [jacobiSym.legendreSym.to_jacobiSym,jacobiSym.mul_left,jacobiSym.at_neg_two hop,
      ZMod.χ₈'_nat_eq_if_mod_eight,h8,jacobiSym.quadratic_reciprocity_one_mod_four hd hop,
      jacobiSym.mod_left' hmd,jacobiSym.at_neg_one hod,ZMod.χ₄_nat_one_mod_four hd]
    simp [show p%2≠0 by omega]
  obtain ⟨u,hu⟩ := (legendreSym.eq_one_iff p (a:=-2*(d:ℤ)) (by simpa using hnn)).mp hsym
  have hq : (p:ℤ) ∣ ((u.val:ℤ)^2+2*d) := by
    apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ p).mp
    push_cast
    rw [ZMod.natCast_zmod_val]
    push_cast at hu
    linear_combination -hu
  obtain ⟨C,hC⟩ := hq
  obtain ⟨t,ht⟩ := hmod.dvd
  push_cast at ht
  refine ⟨p,u.val,1-4*t,C,by exact_mod_cast hp.pos,?_,hC.symm⟩
  dsimp only [a] at ht
  linear_combination ht

def coefficients (p b A C : ℤ) : W :=
  ⟨0,-1,A+1,-b,p+b,C+b+1⟩

lemma form_eval (p b A C : ℤ) (u : V) :
    energy (coefficients p b A C) u=
      A*(u.1-u.2.2.2)^2+p*(u.2.1-u.2.2.2)^2+C*(u.2.2.1-u.2.2.2)^2+
      2*(u.1-u.2.2.2)*(u.2.2.1-u.2.2.2)+2*b*(u.2.1-u.2.2.2)*(u.2.2.1-u.2.2.2) := by
  obtain ⟨x,y,z,t⟩ := u
  dsimp [coefficients,energy]; ring

/-- Every positive integer 2d with d congruent to one modulo four is a sum of three squares. -/
theorem shell_nonempty (d : ℕ) (hd : d%4=1) : (shell (2*d)).Nonempty := by
  obtain ⟨p,b,A,C,hp,hA,hC⟩ := auxiliary_prime d hd
  let n : ℤ := 2*d
  have hn : 0<n := by dsimp [n]; omega
  change A*n=p+1 at hA
  change p*C=b^2+n at hC
  let q := coefficients p b A C
  have hdet : det q=1 := by
    dsimp [q,coefficients,det]
    linear_combination A*hC+hA
  have hpos : psd q := by
    rintro ⟨x,y,z,t⟩
    let X := x-t
    let Y := y-t
    let Z := z-t
    have hQ := form_eval p b A C (x,y,z,t)
    change energy q (x,y,z,t)=A*X^2+p*Y^2+C*Z^2+2*X*Z+2*b*Y*Z at hQ
    have hv : p*n*energy q (x,y,z,t)=(p*X+n*Z)^2+n*(p*Y+b*Z)^2+p*X^2 := by
      rw [hQ]
      linear_combination p*X^2*hA+n*Z^2*hC
    have hpn : 0<p*n := mul_pos hp hn
    exact nonneg_of_mul_nonneg_right (show 0≤p*n*energy q (x,y,z,t) by rw [hv]; positivity) hpn
  have hre : energy q (n,b,-p,0)=n := by
    rw [form_eval]
    dsimp only; ring_nf
    linear_combination n*hA+p*hC
  obtain ⟨x,y,z,h⟩ := three_squares hpos hdet (n,b,-p,0)
  exact ⟨(x,y,z),mem_shell.mpr (by change x^2+y^2+z^2=(↑(2*d:ℕ):ℤ); rw [←h,hre]; simp [n])⟩

#print axioms shell_nonempty
end TunnellThreeSquares
