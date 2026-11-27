import TunnellCMLComplete

/-! Grouping the Hecke character by its Gaussian residue classes. -/

namespace TunnellCMLSeries

open TunnellGaussian Finset

abbrev Residues (n : ℕ) := ZMod (4*n) × ZMod (4*n)

def residue (n : ℕ) (z : GaussianInt) : Residues n := (z.re, z.im)

def liftResidue {n : ℕ} (r : Residues n) : GaussianInt := ⟨r.1.val,r.2.val⟩

lemma residue_lift {n : ℕ} (hn : 0<n) (r : Residues n) : residue n (liftResidue r) = r := by
  letI : NeZero (4*n) := ⟨by omega⟩
  simp [liftResidue,residue]

noncomputable def charWeight (n : ℕ) (z : GaussianInt) : ℤ := by
  classical exact if Primary z then twistSign n z.norm.natAbs else 0

lemma twistSign_mod (n m : ℕ) : twistSign n (m % (4*n)) = twistSign n m := by
  have he : Even (4*n) := Even.mul_right (by decide) _
  have h : Odd (m % (4*n)) ↔ Odd m := by
    simp only [Nat.odd_iff, Nat.mod_mod_of_dvd _ he.two_dvd]
  by_cases hm : Odd m
  · simpa [twistSign, h, hm] using (jacobiSym.mod_right' n hm).symm
  · simp [twistSign, h, hm]

theorem charWeight_residue (n : ℕ) {z w : GaussianInt} (h : residue n z = residue n w) :
    charWeight n z = charWeight n w := by
  have ha := (ZMod.intCast_eq_intCast_iff _ _ _).mp (congrArg Prod.fst h)
  have hb := (ZMod.intCast_eq_intCast_iff _ _ _).mp (congrArg Prod.snd h)
  change z.re ≡ w.re [ZMOD ↑(4*n)] at ha
  change z.im ≡ w.im [ZMOD ↑(4*n)] at hb
  have h2 : (2:ℤ) ∣ (↑(4*n) : ℤ) := by exact_mod_cast (dvd_mul_of_dvd_left (by decide : 2∣4) n)
  have h4 : (4:ℤ) ∣ (↑(4*n) : ℤ) := by exact_mod_cast dvd_mul_right 4 n
  have hpr : Primary z ↔ Primary w := by
    rw [primary_iff,primary_iff,(hb.of_dvd h2).eq,((ha.add hb).of_dvd h4).eq]
  have hnorm : (z.norm.natAbs : ℕ) ≡ w.norm.natAbs [MOD 4*n] := by
    apply Int.natCast_modEq_iff.mp
    rw [GaussianInt.natCast_natAbs_norm,GaussianInt.natCast_natAbs_norm,norm_sq,norm_sq]
    exact (ha.pow 2).add (hb.pow 2)
  classical
  simp only [charWeight,hpr]
  have he := (twistSign_mod n z.norm.natAbs).symm.trans ((congrArg (twistSign n) hnorm).trans (twistSign_mod n w.norm.natAbs))
  rw [he]

lemma term_eq_weight (n : ℕ) (s : ℝ) (z : GaussianInt) :
    term n s z = (charWeight n z : ℂ) * gaussianTerm s z := by
  classical by_cases h : Primary z <;> simp [term,charWeight,h]

lemma lattice_as_tsum (n : ℕ) (s : ℝ) : latticeValue n s = ∑' z, term n s z := by
  classical
  exact tsum_subtype {z : GaussianInt | Primary z}
    (fun z => (twistSign n z.norm.natAbs:ℂ) * gaussianTerm s z)

noncomputable def residueSum (n : ℕ) (s : ℝ) (r : Residues n) : ℂ :=
  ∑' z : {z : GaussianInt // residue n z = r}, gaussianTerm s z.val

theorem lattice_by_residues (n : ℕ) (hn : 0<n) (s : ℝ) (hs : 3/2<s) :
    latticeValue n s =
      letI : NeZero (4*n) := ⟨by omega⟩
      ∑ r : Residues n, (charWeight n (liftResidue r):ℂ) * residueSum n s r := by
  classical
  letI : NeZero (4*n) := ⟨by omega⟩
  rw [lattice_as_tsum]
  have h := (summable_lattice n s hs).hasSum.tsum_fiberwise (residue n)
  rw [← h.tsum_eq,tsum_fintype]
  apply Finset.sum_congr rfl
  intro r _
  rw [residueSum,← tsum_mul_left]
  apply tsum_congr
  intro z
  rw [term_eq_weight,charWeight_residue n (z.property.trans (residue_lift hn r).symm)]

end TunnellCMLSeries
