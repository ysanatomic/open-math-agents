import TunnellToricIntertwiners
import TunnellQuaternionIncidence

/-! Every odd local prime admits an integral unit intertwining two primitive embeddings. -/

namespace TunnellToricLocal
open Matrix TunnellQuaternion
variable {K : Type*} [Field K]

def cyclicBasis (x y : K) (A : M2 K) : M2 K :=
  !![x,A 0 0*x+A 0 1*y;y,A 1 0*x+A 1 1*y]

lemma cyclic_exists (A : M2 K) (h2 : (2:K)≠0) (hn : A≠0) (ht : A.trace=0) :
    ∃ x y : K, (cyclicBasis x y A).det ≠ 0 := by
  by_contra! h
  have h1 := h 1 0
  have h2' := h 0 1
  have h3 := h 1 1
  simp only [cyclicBasis,det_fin_two,of_apply,Matrix.cons_val_zero,Matrix.cons_val_one,
    Matrix.cons_val_fin_one,one_mul,mul_one,zero_mul,mul_zero,zero_add,add_zero,sub_zero,zero_sub,neg_eq_zero] at h1 h2' h3
  have htt : A 0 0+A 1 1=0 := by simpa [Matrix.trace,Fin.sum_univ_two] using ht
  have hd : A 0 0=0 := (mul_eq_zero.mp (show 2*A 0 0=0 by linear_combination htt - h3 - h2' + h1)).resolve_left h2
  apply hn
  ext i j
  fin_cases i <;> fin_cases j <;> simp_all

lemma cyclic_action (A : M2 K) (ht : A.trace=0) (x y : K) :
    A*cyclicBasis x y A = cyclicBasis x y A*!![0,-A.det;1,0] := by
  have htt : A 0 0+A 1 1=0 := by simpa [Matrix.trace,Fin.sum_univ_two] using ht
  ext i j
  fin_cases i <;> fin_cases j
  all_goals simp [cyclicBasis,det_fin_two,mul_apply,Fin.sum_univ_two]
  all_goals first | linear_combination (A 0 0*x+A 0 1*y)*htt | linear_combination (A 1 0*x+A 1 1*y)*htt

lemma matrix_intertwiner (V W : M2 K) (h2 : (2:K)≠0) (hv : V≠0) (hw : W≠0)
    (htv : V.trace=0) (htw : W.trace=0) (hd : V.det=W.det) :
    ∃ S : M2 K, (W*S+S*V).det≠0 := by
  obtain ⟨x,y,hb⟩ := cyclic_exists V h2 hv htv
  obtain ⟨u,v,hc⟩ := cyclic_exists W h2 hw htw
  let B := cyclicBasis x y V
  let C := cyclicBasis u v W
  let J : M2 K := !![0,-V.det;1,0]
  let T : M2 K := !![0,1;0,0]
  have heB : V*B=B*J := cyclic_action V htv _ _
  have heC : W*C=C*J := by simpa [C,J,hd] using cyclic_action W htw u v
  have hIB : J*B⁻¹=B⁻¹*V := by
    have hu := (isUnit_iff_ne_zero.mpr hb : IsUnit B.det)
    calc J*B⁻¹ = B⁻¹*(B*J)*B⁻¹ := by simp [←mul_assoc,Matrix.nonsing_inv_mul B hu]
         _ = _ := by rw [←heB]; simp [mul_assoc,Matrix.mul_nonsing_inv B hu]
  have hJT : J*T+T*J=1 := by ext i j; fin_cases i <;> fin_cases j <;> simp [J,T,mul_apply,Fin.sum_univ_two]
  refine ⟨C*T*B⁻¹,?_⟩
  have h : W*(C*T*B⁻¹)+C*T*B⁻¹*V=C*B⁻¹ := by
    calc _=C*(J*T+T*J)*B⁻¹ := by
           rw [mul_add,add_mul]
           simp only [mul_assoc]
           rw [←hIB]
           simp only [←mul_assoc,heC]
         _=_ := by rw [hJT,mul_one]
  rw [h,det_mul,det_nonsing_inv,Ring.inverse_eq_inv]
  exact mul_ne_zero hc (inv_ne_zero hb)

variable {p : ℕ} [Fact p.Prime]

lemma residue_surj (M : Model p) (S : M2 (ZMod p)) :
    residue M (lift p (M.f.symm S))=S := by
  change M.f (red p (lift p (M.f.symm S)))=S
  rw [red_lift,M.f.apply_symm_apply]

lemma residue_nonzero (M : Model p) {n : ℕ} (hs : Squarefree n) {v : TunnellShell.Triple}
    (hv : v∈TunnellShell.shell n) : residue M (TunnellQuaternion.pure v)≠0 := by
  intro hz
  obtain ⟨hx,hy,hz⟩ := (residue_pure_zero M v).mp hz
  obtain ⟨a,b,c,he⟩ := TunnellHurwitz.primitive hs hv
  have hdiv : (p:ℤ)∣1 := he ▸ dvd_add (dvd_add (dvd_mul_of_dvd_left hx a) (dvd_mul_of_dvd_left hy b)) (dvd_mul_of_dvd_left hz c)
  exact (Fact.out : p.Prime).not_dvd_one (by exact_mod_cast hdiv)

lemma coprime_intertwiner (hp : p≠2) {n : ℕ} (hs : Squarefree n) (v w : TunnellShell.Triple)
    (hv : v∈TunnellShell.shell n) (hw : w∈TunnellShell.shell n) :
    ∃ q : Quaternion ℤ, TunnellQuaternion.pure w*q=q*TunnellQuaternion.pure v ∧ ¬ (p:ℤ) ∣ Quaternion.normSq q := by
  let M := localModel hp
  let V := residue M (TunnellQuaternion.pure v)
  let W := residue M (TunnellQuaternion.pure w)
  have ht (u : TunnellShell.Triple) : (residue M (TunnellQuaternion.pure u)).trace=0 := by
    rw [residue_trace]; simp [TunnellQuaternion.pure]
  have hd : V.det=W.det := by
    change (residue M _).det=(residue M _).det
    rw [residue_det,residue_det,norm_pure,norm_pure,TunnellShell.mem_shell.mp hv,TunnellShell.mem_shell.mp hw]
  have h2 : (2:ZMod p)≠0 := by
    intro hh
    have hp2 : p∣2 := (ZMod.natCast_eq_zero_iff 2 p).mp (by simpa using hh)
    exact hp ((Nat.dvd_prime Nat.prime_two).mp hp2 |>.resolve_left (Fact.out : p.Prime).ne_one)
  obtain ⟨S,hS⟩ := matrix_intertwiner V W h2 (residue_nonzero M hs hv) (residue_nonzero M hs hw) (ht v) (ht w) hd
  let s := lift p (M.f.symm S)
  let q := TunnellQuaternion.pure w*s+s*TunnellQuaternion.pure v
  have he (u : TunnellShell.Triple) (hu : u∈TunnellShell.shell n) : TunnellQuaternion.pure u*TunnellQuaternion.pure u=-(n:Quaternion ℤ) := by
    have hm : star (TunnellQuaternion.pure u) = -TunnellQuaternion.pure u := by
      apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg,
        Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star] <;> simp [TunnellQuaternion.pure]
    have hn := Quaternion.self_mul_star (TunnellQuaternion.pure u)
    rw [hm,mul_neg,norm_pure,TunnellShell.mem_shell.mp hu] at hn
    simpa only [neg_neg,Quaternion.coe_natCast] using congrArg Neg.neg hn
  refine ⟨q,?_,?_⟩
  · dsimp only [q]
    rw [mul_add,add_mul,←mul_assoc,he w hw,mul_assoc s,he v hv,mul_assoc,neg_mul,mul_neg]
    rw [Nat.cast_comm,add_comm]
  · intro h
    apply hS
    have hq : residue M q=W*S+S*V := by simp only [q,map_add,map_mul,s,residue_surj,W,V]
    rw [←hq,residue_det]
    exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr h

end TunnellToricLocal
