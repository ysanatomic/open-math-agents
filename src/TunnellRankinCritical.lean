import TunnellRankinRows
import TunnellRankinLambert

/-! The explicit central specialization of the Rankin Eisenstein lattice. -/
namespace TunnellRankinEisenstein
open Complex TunnellCMRegularized TunnellRankin TunnellRankinCotangent Finset Set
open UpperHalfPlane hiding I
open scoped ComplexConjugate Topology

noncomputable section

def coord (k : ℕ) (z : ℍ) (c : ℤ) : ℂ := (c:ℂ)*((k:ℂ)*(z:ℂ))
def offset {N : ℕ} (r : ZMod N) : ℂ := (r.val:ℂ)/N

def centralIndex (k : ℕ) [NeZero k] (z : ℍ) : ℤ×ℤ ≃ (periods k z).lattice :=
  (Equiv.prodComm ℤ ℤ).trans (periods k z).latticeEquivProd.symm.toEquiv

lemma centralIndex_val (k : ℕ) [NeZero k] (z : ℍ) (p : ℤ×ℤ) :
    (centralIndex k z p:ℂ)=(p.2:ℂ)+(p.1:ℂ)*((k:ℂ)*conj (z:ℂ)) := by
  change ((periods k z).latticeEquivProd.symm (p.2,p.1):ℂ)=_
  rw [PeriodPair.latticeEquiv_symm_apply]
  simp [periods]

lemma difference_index {N k : ℕ} [NeZero N] [NeZero k] (z : ℍ) (r : ZMod N) (p : ℤ×ℤ) :
    difference (aux N) (offset r) (centralIndex k z p) 1 =
      centralFiber (aux N) (coord k z p.1) (offset r) p.2 := by
  rw [centralIndex_val]
  simp only [difference,kernel_one,centralFiber,coord,offset,map_inv₀,map_add,map_mul,map_div₀,
    map_intCast,map_natCast,Complex.conj_conj]
  abel_nf

lemma indexed_hasSum {N k : ℕ} [NeZero N] [NeZero k] (z : ℍ) (r : ZMod N) :
    HasSum (fun p : ℤ×ℤ => centralFiber (aux N) (coord k z p.1) (offset r) p.2)
      (regularized (periods k z) (aux N) (offset r) 1) := by
  have h := (centralIndex k z).hasSum_iff.mpr
    ((regularized_summable (periods k z) (aux N) (offset r)).summable
      (show (1:ℂ)∈domain by norm_num [domain])).hasSum
  exact h.congr_fun (fun p => (difference_index z r p).symm)

lemma aux_offset {N : ℕ} [NeZero N] (r : ZMod N) :
    (aux N:ℂ)*offset r=offset r+(r.val:ℂ) := by
  have hN : (N:ℂ)≠0 := by exact_mod_cast NeZero.ne N
  unfold aux offset
  push_cast
  field_simp [hN]
  ring

lemma coord_im {k : ℕ} [NeZero k] (z : ℍ) {c : ℤ} (hc : c≠0) :
    (coord k z c).im≠0 := by
  simp [coord,Complex.mul_im,hc,NeZero.ne k,z.im_pos.ne']

lemma offset_im {N : ℕ} (r : ZMod N) : (offset r).im=0 := by
  simp only [offset,Complex.div_im,Complex.natCast_im,mul_zero,zero_mul,sub_zero,zero_div]

lemma offset_mem {N : ℕ} [NeZero N] (r : ZMod N) (hr : r≠0) : offset r∈integerComplement := by
  rintro ⟨b,hb⟩
  have hN : (0:ℝ)<N := Nat.cast_pos.mpr (NeZero.pos N)
  unfold offset at hb
  have h : (b:ℝ)=(r.val:ℝ)/N := by
    apply Complex.ofReal_injective
    simpa only [Complex.ofReal_intCast,Complex.ofReal_div,Complex.ofReal_natCast] using hb
  have h1 : (0:ℝ)<(b:ℝ) := by rw [h]; exact div_pos (Nat.cast_pos.mpr (ZMod.val_pos.mpr hr)) hN
  have h2 : (b:ℝ)<1 := by rw [h,div_lt_one hN]; exact_mod_cast r.val_lt
  have e1 : 0<b := by exact_mod_cast h1
  have e2 : b<1 := by exact_mod_cast h2
  omega

lemma critical_fiber_row {N k : ℕ} [NeZero N] [NeZero k] (z : ℍ) (r : ZMod N) (c : ℤ) :
    ∑' j : ℤ, centralFiber (aux N) (coord k z c) (offset r) j =
      ((aux N:ℂ)^2-(aux N:ℂ))*(cotValue (coord k z c+offset r)-cotValue (coord k z c)) := by
  by_cases hr : r=0
  · subst r
    simp [offset,centralFiber]
  let t := coord k z c
  have ht : t=0 ∨ t∈integerComplement := by
    by_cases hc : c=0
    · simp [t,coord,hc]
    · right; rintro ⟨b,hb⟩
      exact coord_im z hc (by simpa using (congrArg Complex.im hb).symm)
  have hx : t+offset r∈integerComplement := by
    by_cases hc : c=0
    · simpa [t,coord,hc] using offset_mem r hr
    · rintro ⟨b,hb⟩; exact coord_im z hc (by simpa [t,offset_im] using (congrArg Complex.im hb).symm)
  have hx' : t+(aux N:ℂ)*offset r∈integerComplement := by
    rw [aux_offset,←add_assoc]
    simpa using (add_intCast_mem_integerComplement (r.val:ℤ)).mpr hx
  change (∑' j : ℤ, centralFiber (aux N) t (offset r) j) = _
  rw [critical_fiber _ _ _ ht (.inr hx) (.inr hx') ((indexed_hasSum z r).summable.prod_factor c),
    aux_offset,←add_assoc,cotValue_add_nat]
  ring

theorem regular_rows {N k : ℕ} [NeZero N] [NeZero k] {χ : DirichletCharacter ℂ N} (hnt : χ≠1) (z : ℍ) :
    HasSum (fun c : ℤ => row χ (coord k z c)) (regular N k χ z 1) := by
  classical
  let A := (aux N:ℂ)^2-(aux N:ℂ)
  have hA : A≠0 := aux_ne N
  have hh (r : ZMod N) := (indexed_hasSum (k:=k) z r).prod_fiberwise
    (fun c => ((indexed_hasSum (k:=k) z r).summable.prod_factor c).hasSum)
  have he := hasSum_sum (fun r (_ : r∈(univ:Finset (ZMod N))) => (hh r).mul_left (χ r))
  have h := he.mul_right A⁻¹
  change HasSum _ ((∑ r : ZMod N, χ r * regularized (periods k z) (aux N) (offset r) 1)*A⁻¹)
  apply h.congr_fun
  intro c
  simp only [critical_fiber_row]
  have h0 := χ.sum_eq_zero_of_ne_one hnt
  change (∑ r,χ r*cotValue (coord k z c+offset r))=
    (∑ r,χ r*(A*(cotValue (coord k z c+offset r)-cotValue (coord k z c))))*A⁻¹
  simp_rw [show ∀ b u v : ℂ,b*(A*(u-v))=A*(b*u-b*v) by intros; ring]
  rw [←mul_sum,sum_sub_distrib,←sum_mul,h0,zero_mul,sub_zero]
  field_simp
lemma row_neg {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (hχ : χ.Odd) (x : ℂ) :
    row χ (-x)=row χ x := by
  classical
  have hc (y : ℂ) : cotValue (-y)= -cotValue y := by simp [cotValue,Complex.cot,div_neg]
  change (∑ r,χ r*cotValue (-x+offset r))=∑ r,χ r*cotValue (x+offset r)
  apply Fintype.sum_equiv (Equiv.neg _) _ _
  intro r
  simp only [Equiv.neg_apply,hχ.eval_neg]
  by_cases hr : r=0
  · subst r; simp [offset,hc]
  · haveI : NeZero r := ⟨hr⟩
    have hN : (N:ℂ)≠0 := by exact_mod_cast NeZero.ne N
    have he : x+offset (-r) = -(-x+offset r)+(1:ℕ) := by
      simp only [offset,ZMod.val_neg_of_ne_zero,Nat.cast_sub r.val_lt.le,Nat.cast_one]
      field_simp
      ring
    rw [he,cotValue_add_nat,hc,neg_mul_neg]

/-- The normalized Eisenstein lattice specializes at the central point to the quadratic
ideal-counting theta series, with an explicit finite cotangent constant. -/
theorem regular_one {d k : ℕ} [NeZero k] (hd : d%4=1) (hs : Squarefree d) (z : ℍ) :
    haveI : NeZero (4*(2*d)) := ⟨by omega⟩
    let χ := negCharacter d (by omega)
    regular (4*(2*d)) k χ z 1 = row χ 0 +
      (-4*Real.pi*Complex.I*gaussSum χ ZMod.stdAddChar)*theta d (multiple ⟨k,NeZero.pos k⟩ z) := by
  letI : NeZero (4*(2*d)) := ⟨by omega⟩
  let χ := negCharacter d (by omega)
  have hodd : χ.Odd := negCharacter_odd hd
  have hnt : χ≠1 := by
    intro h
    rw [DirichletCharacter.Odd,h,MulChar.one_apply (by simp)] at hodd
    norm_num at hodd
  have h := regular_rows (k:=k) hnt z
  have he : Function.Even (fun c : ℤ => row χ (coord k z c)) := by
    intro c
    simp only [coord,Int.cast_neg,neg_mul,row_neg hodd]
  change regular _ k χ z 1 = row χ 0 + (-4*Real.pi*Complex.I*gaussSum χ ZMod.stdAddChar)*theta d (multiple (⟨k,NeZero.pos k⟩ : ℕ+) z)
  rw [←h.tsum_eq,tsum_int_eq_zero_add_two_mul_tsum_pnat he h.summable]
  have hz (n : ℕ+) : coord k z n.val=(multiple n (multiple ⟨k,NeZero.pos k⟩ z):ℂ) := by simp [coord,multiple]
  have hh : (∑' n : ℕ+,row χ (coord k z (n.val:ℤ))) = _ := (tsum_congr (fun n : ℕ+ => congrArg (row χ) (hz n))).trans (sum_positive_rows hd hs (multiple (⟨k,NeZero.pos k⟩ : ℕ+) z))
  rw [hh]
  simp only [coord,Int.cast_zero,zero_mul,χ]
  ring

end
end TunnellRankinEisenstein
#print axioms TunnellRankinEisenstein.regular_one
