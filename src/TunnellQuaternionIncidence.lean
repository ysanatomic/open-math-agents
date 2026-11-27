import TunnellQuaternionModel
import TunnellQuaternionOrbit
import TunnellShellFibers

/-! Integral inverse images of a rotation by a prime-norm quaternion. -/

namespace TunnellQuaternion
open Quaternion Finset TunnellShell


def act (q x : QInt) : QInt := q*x*star q

lemma norm_act (q x : QInt) : Quaternion.normSq (act q x)=Quaternion.normSq q^2*Quaternion.normSq x := by
  simp only [act,map_mul,Quaternion.normSq_star]
  ring

lemma re_act (q x : QInt) : (act q x).re=Quaternion.normSq q*x.re := by
  simp only [act,Quaternion.normSq_def',Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,
    Quaternion.imK_mul,Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star]
  ring

lemma act_smul (q : QInt) (t : ℤ) (x : QInt) : act q (t • x)=t • act q x := by
  simp only [act,Algebra.mul_smul_comm,smul_mul_assoc]

lemma act_dual (q x : QInt) : act (star q) (act q x) = (Quaternion.normSq q)^2 • x := by
  unfold act
  rw [star_star,show star q*(q*x*star q)*q=(star q*q)*x*(star q*q) by simp [mul_assoc],
    star_mul_self,coe_mul_eq_smul,mul_coe_eq_smul,smul_smul,pow_two]

lemma act_injective {q : QInt} (hq : Quaternion.normSq q ≠ 0) : Function.Injective (act q) := by
  intro x y h
  have := congrArg (act (star q)) h
  simp only [act_dual] at this
  exact scalar_cancel _ (pow_ne_zero 2 hq) this

lemma pure_injective : Function.Injective pure := fun _ _ h => congrArg vec h

lemma pure_vec_of_re {x : QInt} (hx : x.re=0) : pure (vec x)=x := by
  cases x
  simp_all [pure,vec]
  rfl

lemma pure_rotate (q : QInt) (v : Triple) : pure (rotate q v) = act q (pure v) :=
  pure_vec_of_re (x:=act q (pure v)) (by rw [re_act]; simp [pure])

lemma pure_smul (t : ℤ) (v : Triple) : pure (t • v)=t • pure v := by
  apply QuaternionAlgebra.ext
  · exact (Int.mul_zero t).symm
  all_goals rfl

lemma norm_pure (v : Triple) : Quaternion.normSq (pure v)=TunnellShell.normSq v := by
  rw [Quaternion.normSq_def']
  change (0:ℤ)^2+v.1^2+v.2.1^2+v.2.2^2=_
  simp [TunnellShell.normSq]

variable {p : ℕ} [Fact p.Prime] (M : Model p)

lemma prime_ne_zero : (p:ℤ)≠0 := by exact_mod_cast (Fact.out : p.Prime).ne_zero

lemma residue_trace (w : QInt) : (residue M w).trace=2*(w.re:ZMod p) :=
  M.trace _

lemma residue_pure_zero (v : Triple) :
    residue M (pure v)=0 ↔ TunnellShellFibers.divisible p v := by
  rw [residue_zero]
  constructor
  · intro h
    refine ⟨(ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (congrArg QuaternionAlgebra.imI h),
      (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (congrArg QuaternionAlgebra.imJ h),
      (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (congrArg QuaternionAlgebra.imK h)⟩
  · rintro ⟨a,b,c⟩
    apply QuaternionAlgebra.ext
    · exact Int.cast_zero
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr a
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr b
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mpr c

lemma solve_primitive {q w : QInt} {N : ℤ} (hq : Quaternion.normSq q=p)
    (hw : Quaternion.normSq w=(p:ℤ)^2*N) (hre : w.re=0) (hpw : residue M w≠0)
    {l : Option (ZMod p)} (hl : inLine l (residue M q)) :
    (∃ v, act q v=w) ↔ inLine l (residue M w) := by
  constructor
  · rintro ⟨v,rfl⟩
    simp only [act,map_mul]
    exact line_mul (line_mul hl _) _
  · intro h
    obtain ⟨x,hx⟩ := divide_left M hq hl h
    have hn := hw
    rw [hx,map_mul,hq,pow_two,mul_assoc] at hn
    have hnx := mul_left_cancel₀ (prime_ne_zero (p:=p)) hn
    have had : (residue M q).det=0 := by rw [residue_det,hq]; simp
    have hbd : (residue M x).det=0 := by rw [residue_det,hnx]; simp
    have hpq : residue M q*residue M x=residue M w := by rw [hx,map_mul]
    have htr : (residue M w).trace=0 := by rw [residue_trace,hre]; simp
    have hb := reversed_product_zero had hbd (hpq ▸ hpw) (hpq ▸ htr)
    rw [←map_mul,residue_zero] at hb
    obtain ⟨v,hv⟩ := (div_iff p _).mp hb
    have he := congrArg (· * star q) hv
    simp only [mul_assoc,self_mul_star,hq,mul_coe_eq_smul,smul_mul_assoc] at he
    have hxx := scalar_cancel _ (prime_ne_zero (p:=p)) he
    exact ⟨v,by rw [hx,hxx]; simp [act,mul_assoc]⟩

lemma solve_scaled {q : QInt} (hq : Quaternion.normSq q=p) {l : Option (ZMod p)}
    (hl : inLine l (residue M q)) (w : QInt) :
    (∃ v, act q v=(p:ℤ) • w) ↔ TunnellEigenlines.invariant (residue M w) l := by
  have ha : (∃ v, act q v=(p:ℤ) • w) ↔ red p (act (star q) w)=0 := by
    rw [div_iff]
    constructor
    · rintro ⟨v,hv⟩
      have he := congrArg (act (star q)) hv
      rw [act_dual,act_smul,hq,pow_two,←smul_smul] at he
      exact ⟨v,(scalar_cancel _ (prime_ne_zero (p:=p)) he).symm⟩
    · rintro ⟨v,hv⟩
      have he := congrArg (act q) hv
      rw [show act q (act (star q) w)=act (star (star q)) (act (star q) w) by rw [star_star],
        act_dual,Quaternion.normSq_star,hq,pow_two,←smul_smul,act_smul] at he
      exact ⟨v,(scalar_cancel _ (prime_ne_zero (p:=p)) he).symm⟩
  rw [ha,←residue_zero M]
  simp only [act,map_mul,star_star,residue_star]
  exact invariant_criterion (norm_prime_nonzero M hq) hl _

omit [Fact p.Prime] in
lemma rotate_mem {N : ℕ} {q : QInt} (hq : Quaternion.normSq q=p) {v : Triple} (hv : v∈shell N) :
    rotate q v ∈ shell (p^2*N) := by
  rw [mem_shell,←norm_pure,pure_rotate,norm_act,hq,norm_pure,mem_shell.mp hv]; push_cast; rfl

lemma rotate_injective {q : QInt} (hq : Quaternion.normSq q=p) : Function.Injective (rotate q) := by
  intro x y h
  have he := congrArg pure h
  simp only [pure_rotate] at he
  exact pure_injective (act_injective (hq ▸ prime_ne_zero) he)

lemma rotate_lift {N : ℕ} {q : QInt} (hq : Quaternion.normSq q=p) {w : Triple}
    (hw : w ∈ shell (p^2*N)) (h : ∃ u, act q u=pure w) : ∃ v∈shell N, rotate q v=w := by
  obtain ⟨u,hu⟩ := h
  have hr := congrArg QuaternionAlgebra.re hu
  rw [re_act,hq] at hr
  have hur := (mul_eq_zero.mp (show (p:ℤ)*u.re=0 from hr)).resolve_left prime_ne_zero
  have hn := congrArg Quaternion.normSq hu
  rw [norm_act,hq,norm_pure,mem_shell.mp hw] at hn
  push_cast at hn
  refine ⟨vec u,mem_shell.mpr ?_,pure_injective ?_⟩
  · rw [←norm_pure,pure_vec_of_re hur]
    exact mul_left_cancel₀ (pow_ne_zero 2 prime_ne_zero) hn
  · rw [pure_rotate,pure_vec_of_re hur,hu]

open scoped Classical in
lemma count_rotation {N : ℕ} {w : Triple} (hw : w ∈ shell (p^2*N)) :
    TunnellShellFibers.count (quatShell p ×ˢ shell N) (fun x => rotate x.1 x.2) w =
      ((quatShell p).filter (fun q => ∃ u, act q u=pure w)).card := by
  classical
  apply Finset.card_bij (fun x _ => x.1)
  · intro ⟨q,v⟩ hx
    obtain ⟨h,hv⟩ := mem_filter.mp hx
    exact mem_filter.mpr ⟨(mem_product.mp h).1,⟨pure v,by simp only [←pure_rotate,hv]⟩⟩
  · intro ⟨q,v⟩ h ⟨q',v'⟩ h' he; dsimp at he; subst q'
    have hv := (mem_filter.mp h).2
    have hv' := (mem_filter.mp h').2
    congr 1
    exact rotate_injective (mem_quatShell.mp (mem_product.mp (mem_filter.mp h).1).1) (hv.trans hv'.symm)
  · intro q hq
    obtain ⟨hqn,hu⟩ := mem_filter.mp hq
    obtain ⟨v,hv,hvw⟩ := rotate_lift (mem_quatShell.mp hqn) hw hu
    exact ⟨(q,v),mem_filter.mpr ⟨mem_product.mpr ⟨hqn,hv⟩,hvw⟩,rfl⟩

end TunnellQuaternion
