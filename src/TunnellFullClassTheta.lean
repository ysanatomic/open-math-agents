import TunnellClassThetaExpansion

/-! The coefficient theta in the Rankin integral is the full ideal class theta with its constant removed. -/
namespace TunnellFullClassTheta
open TunnellShell TunnellToricClass TunnellToric TunnellClassThetaCount TunnellClassThetaExpansion
open TunnellRankin TunnellIdealHNF Complex Finset
open scoped Classical UpperHalfPlane
noncomputable section

def inverted (n : ℕ) (hn : 0<n) (z : ℍ) : ℍ := ⟨-1/(4*n*(z:ℂ)),by
  have h : (0:ℝ)<n := Nat.cast_pos.mpr hn
  have hq : (0:ℝ)<(4*(n:ℂ)*(z:ℂ)).im := by simpa [Complex.mul_im] using (show 0<4*(n:ℝ)*z.im by positivity)
  have hq' : (4*(n:ℂ)*(z:ℂ))≠0 := fun h => by rw [h] at hq; exact lt_irrefl _ hq
  rw [neg_div,one_div,Complex.neg_im,Complex.inv_im,neg_div,neg_neg]
  exact div_pos hq (Complex.normSq_pos.mpr hq')⟩

theorem ideal_fricke {n : ℕ} (hn : 0<n) (I : Ideal (R n)) (hI : I≠⊥) (z : ℍ) :
    thetaI I (inverted n hn z)= 2*(Real.sqrt n:ℂ)*(-Complex.I*z)*thetaI I z := by
  obtain ⟨s,rfl⟩ := normal_form hn hI
  letI : NeZero n := ⟨hn.ne'⟩
  letI : NeZero s.a := ⟨s.pos_a.ne'⟩
  rw [thetaI,(TunnellIdealThetaExpansion.hnf_hasSum s hn (inverted n hn z).im_pos).tsum_eq,
    thetaI,(TunnellIdealThetaExpansion.hnf_hasSum s hn z.im_pos).tsum_eq]
  exact TunnellIdealTheta.theta_fricke n s.a s.b z.im_pos

variable {d : ℕ} {v : Triple} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hv : v∈shell (2*d))

def classFintype : Fintype (ProperIdealClass v) := Fintype.ofEquiv ↥(representatives (2*d)) (idealEquiv hn h2 hv).symm

def full (z : ℍ) : ℂ := by
  letI := classFintype hn h2 hv
  exact ∑ c : ProperIdealClass v, thetaI (liftClass hv c) z

theorem full_fricke (z : ℍ) : full hn h2 hv (inverted (2*d) (by omega) z) =
    2*(Real.sqrt (2*d:ℕ):ℂ)*(-Complex.I*z)*full hn h2 hv z := by
  letI := classFintype hn h2 hv
  simp only [full,Finset.mul_sum]
  exact Finset.sum_congr rfl (fun c _ => ideal_fricke (by omega) _ (lift_ne_bot hn h2 hv c) z)

theorem full_expansion (z : ℍ) : letI := classFintype hn h2 hv
    full hn h2 hv z= (Fintype.card (ProperIdealClass v):ℂ)+2*TunnellRankin.theta d z := by
  classical
  letI := classFintype hn h2 hv
  let q := Function.Periodic.qParam 1 (z:ℂ)
  let h : ℂ := Fintype.card (ProperIdealClass v)
  have H := hasSum_sum (s:=univ) (fun (c : ProperIdealClass v) _ => thetaI_expansion hn h2 (lift_ne_bot hn h2 hv c) hv z.im_pos)
  have H' : HasSum (fun m : ℕ => (if m=0 then h else 2*(idealCoeff d m:ℂ))*q^m) (full hn h2 hv z) := by
    apply H.congr_fun
    intro m
    change (if m=0 then h else 2*(idealCoeff d m:ℂ))*q^m = ∑ c : ProperIdealClass v, (thetaCoeff (liftClass hv c) m:ℂ)*q^m
    rw [←sum_mul]; congr 1
    by_cases hm : m=0
    · subst m; simp [h,thetaCoeff]
    · rw [if_neg hm,rankin_ideal_count d m hn (Nat.pos_of_ne_zero hm)]
      simp only [thetaCoeff,hm,if_false,←Nat.cast_sum,Int.cast_natCast]
      exact_mod_cast (total_count hn h2 hv (Nat.pos_of_ne_zero hm)).symm
  have h0 : HasSum (fun m : ℕ => if m=0 then h else 0) h := by simpa using (hasSum_ite_eq (0:ℕ) h)
  have A : HasSum (fun m : ℕ => 2*((idealCoeff d m:ℂ)*q^m)) (full hn h2 hv z-h) := by
    apply (H'.sub h0).congr_fun
    intro m; by_cases hm : m=0
    · subst m; simp [idealCoeff]
    · simp [hm,mul_assoc]
  have e := A.tsum_eq
  rw [tsum_mul_left] at e
  change 2*TunnellRankin.theta d z=full hn h2 hv z-h at e
  change _=h+_
  linear_combination -e

end
end TunnellFullClassTheta
#print axioms TunnellFullClassTheta.full_expansion
#print axioms TunnellFullClassTheta.full_fricke
