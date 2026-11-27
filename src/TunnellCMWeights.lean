import TunnellCMResidues

/-! Cancellation of the finite CM character weights on the conductor-torsion grid. -/

namespace TunnellCMWeights

open TunnellCMLSeries TunnellGaussian

def mover (n : ℕ) : GaussianInt := ⟨1+n,n⟩

lemma mover_primary (n : ℕ) (hn : n%8=2) : Primary (mover n) := by
  rw [primary_iff]
  dsimp [mover]
  omega

lemma mover_norm (n : ℕ) : (mover n).norm.natAbs = 1 + 2*n + 2*n^2 := by
  rw [← Int.natCast_inj,GaussianInt.natCast_natAbs_norm,norm_sq]
  simp [mover]
  ring

lemma mover_sign (n : ℕ) (hn : n%8=2) : twistSign n (mover n).norm.natAbs = -1 := by
  let d := n/2
  have hd : d%4=1 := by dsimp [d]; omega
  have h₀ : n=2*d := by dsimp [d]; omega
  let m := 1 + 2*n + 2*n^2
  have hm8 : m%8=5 := by
    have e : n = 2+8*(n/8) := by omega
    dsimp [m]
    conv_lhs => rw [e]
    rw [show 1+2*(2+8*(n/8))+2*(2+8*(n/8))^2 =
        5+8*(1+10*(n/8)+16*(n/8)^2) by ring]
    simp
  have hm : Odd m := Nat.odd_iff.mpr (by omega)
  rw [mover_norm]
  change twistSign n m = -1
  rw [twistSign,if_pos hm,show (n:ℤ)=2*(d:ℤ) by exact_mod_cast h₀,
    jacobiSym.mul_left,jacobiSym.at_two hm,ZMod.χ₈_nat_mod_eight,hm8,
    jacobiSym.quadratic_reciprocity_one_mod_four hd hm]
  have he : (m:ℤ) % (d:ℤ) = 1 % (d:ℤ) := by
    dsimp [m]; rw [h₀]; push_cast
    rw [show (1+(2:ℤ)*(2*d)+2*(2*d)^2)=1+(4+8*d)*d by ring,Int.add_mul_emod_self_right]
  rw [jacobiSym.mod_left' he,jacobiSym.one_left]
  decide

lemma weight_move (n : ℕ) (hn : n%8=2) (x : GaussianInt) :
    charWeight n (mover n*x) = -charWeight n x := by
  classical
  simp only [charWeight,primary_mul_iff (mover_primary n hn),Zsqrtd.norm_mul,Int.natAbs_mul,
    twistSign_mul,mover_sign _ hn]
  split_ifs <;> ring

def forward (n : ℕ) (r : Residues n) : Residues n :=
  (r.1+n*(r.1-r.2), r.2+n*(r.1+r.2))

lemma forward_residue (n : ℕ) (x : GaussianInt) :
    residue n (mover n*x) = forward n (residue n x) := by
  ext <;> simp [residue,forward,mover] <;> ring

noncomputable def permutation (n : ℕ) (hn : n%8=2) : Equiv.Perm (Residues n) where
  toFun := forward n
  invFun := fun r => (r.1-n*(r.1-r.2), r.2-n*(r.1+r.2))
  left_inv := by
    have h : (2:ZMod (4*n))*n^2=0 := by
      have he : 2*n^2=(4*n)*(n/2) := by
        have e : n=2*(n/2) := by omega
        calc
          2*n^2 = 2*n*n := by ring
          _ = (4*n)*(n/2) := by nth_rw 2 [e]; ring
      exact_mod_cast (show ((2*n^2:ℕ):ZMod (4*n))=0 by rw [he,Nat.cast_mul,ZMod.natCast_self,zero_mul])
    intro r
    apply Prod.ext <;> dsimp [forward] <;>
      first | linear_combination r.2*h | linear_combination -r.1*h
  right_inv := by
    have h : (2:ZMod (4*n))*n^2=0 := by
      have he : 2*n^2=(4*n)*(n/2) := by
        have e : n=2*(n/2) := by omega
        calc
          2*n^2 = 2*n*n := by ring
          _ = (4*n)*(n/2) := by nth_rw 2 [e]; ring
      exact_mod_cast (show ((2*n^2:ℕ):ZMod (4*n))=0 by rw [he,Nat.cast_mul,ZMod.natCast_self,zero_mul])
    intro r
    apply Prod.ext <;> dsimp [forward] <;>
      first | linear_combination r.2*h | linear_combination -r.1*h

theorem weight_sum_zero (n : ℕ) (hn : n%8=2) :
    letI : NeZero (4*n) := ⟨by omega⟩
    ∑ r : Residues n, charWeight n (liftResidue r) = 0 := by
  letI : NeZero (4*n) := ⟨by omega⟩
  have hp : 0<n := by omega
  have e (r : Residues n) : charWeight n (liftResidue (permutation n hn r)) = -charWeight n (liftResidue r) := by
    rw [← weight_move n hn]
    apply charWeight_residue
    rw [residue_lift hp,forward_residue,residue_lift hp]
    rfl
  have h := Equiv.sum_comp (permutation n hn) (fun r => charWeight n (liftResidue r))
  simp only [e,Finset.sum_neg_distrib] at h
  omega

end TunnellCMWeights

#print axioms TunnellCMWeights.weight_sum_zero
