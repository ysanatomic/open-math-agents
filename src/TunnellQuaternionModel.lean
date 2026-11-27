import TunnellQuaternionLine
import TunnellQuaternionLift
import TunnellEigenlines

/-! Norm-prime right divisors parameterized by the projective line at an odd prime. -/

namespace TunnellQuaternion

open Matrix Quaternion

variable {p : ℕ} [Fact p.Prime]

structure Model (p : ℕ) where
  f : Quaternion (ZMod p) ≃+* M2 (ZMod p)
  det (x) : (f x).det=normSq x
  trace (x) : (f x).trace=2*x.re
  bar (x) : f (star x) = (f x).adjugate
  smul (t : ZMod p) (x) : f (t • x)=t • f x

noncomputable def localModel (hp : p≠2) : Model p := Classical.choice <| by
  classical
  obtain ⟨a,b,hab,h2⟩ := exists_splitting p hp
  refine ⟨?_⟩
  exact ⟨RingEquiv.ofBijective (splitHom a b hab) (split_iso a b hab h2),split_det a b hab,
    split_trace a b hab,split_star a b hab,fun t x => by
      change matrixOf a b (t • x) = t • matrixOf a b x
      ext i j; fin_cases i <;> fin_cases j <;> simp [matrixOf] <;> ring⟩

variable (M : Model p)

def residue : Quaternion ℤ →+* M2 (ZMod p) := M.f.toRingHom.comp (red p)

lemma residue_zero (x : Quaternion ℤ) : residue M x = 0 ↔ red p x = 0 :=
  M.f.map_eq_zero_iff

lemma residue_star (x : Quaternion ℤ) : residue M (star x) = (residue M x).adjugate := by
  change M.f (red p (star x)) = _
  rw [red_star,M.bar]
  rfl

lemma residue_det (x : Quaternion ℤ) : (residue M x).det = (normSq x : ℤ) :=
  (M.det _).trans (red_norm p x).symm

lemma norm_prime_nonzero {x : Quaternion ℤ} (hx : normSq x = p) : residue M x ≠ 0 := by
  intro h
  obtain ⟨v,hv⟩ := (div_iff p x).mp ((residue_zero M x).mp h)
  have pp := Fact.out (p:=p.Prime)
  have hh := congrArg normSq hv
  rw [hx,norm_smul,pow_two,mul_assoc] at hh
  have eq := mul_left_cancel₀ (by exact_mod_cast pp.ne_zero : (p:ℤ)≠0)
    (show (p:ℤ)*1=p*((p:ℤ)*normSq v) by simpa using hh)
  have hd : (p:ℤ) ∣ 1 := ⟨_,eq⟩
  have hdn : p ∣ 1 := by exact_mod_cast hd
  exact pp.not_dvd_one hdn

lemma exists_at_line (hp : p≠2) (l : Option (ZMod p)) :
    ∃ x : Quaternion ℤ, normSq x = p ∧ inLine l (residue M x) := by
  let S := {a : Quaternion (ZMod p) | inLine l (M.f a)}
  apply find_generator Fact.out hp S
  · intro a ha b; change inLine l (M.f (a*b)); rw [map_mul]; exact line_mul ha _
  · intro r a ha; change inLine l (M.f (r • a)); rw [M.smul]; exact line_smul ha _
  · intro a ha; rw [←M.det]; exact det_line ha
  · let B : M2 (ZMod p) := vecMulVec (direction l) ![1,0]
    refine ⟨M.f.symm B,?_,?_⟩
    · change inLine l (M.f (M.f.symm B))
      rw [M.f.apply_symm_apply]
      cases l <;> intro j <;> fin_cases j <;> simp [B,vecMulVec,direction]
    · intro h
      have := congrArg M.f h
      rw [M.f.apply_symm_apply,map_zero] at this
      cases l with
      | none => simpa [B,vecMulVec,direction] using congrArg (fun m:M2 (ZMod p) => m 1 0) this
      | some r => simpa [B,vecMulVec,direction] using congrArg (fun m:M2 (ZMod p) => m 0 0) this

lemma scalar_cancel (d : ℤ) (hd : d≠0) {x y : Quaternion ℤ} (h : d • x = d • y) : x=y := by
  apply QuaternionAlgebra.ext
  all_goals
    first
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.re) h)
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.imI) h)
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.imJ) h)
    | exact mul_left_cancel₀ hd (congrArg (fun x:Quaternion ℤ => x.imK) h)

lemma divide_left {q w : Quaternion ℤ} (hq : normSq q=p) {l : Option (ZMod p)}
    (hl : inLine l (residue M q)) (hw : inLine l (residue M w)) :
    ∃ x, w=q*x := by
  have hz := (adj_mul_zero_iff (norm_prime_nonzero M hq) hl (residue M w)).mpr hw
  rw [←residue_star,←map_mul,residue_zero] at hz
  obtain ⟨x,hx⟩ := (div_iff p _).mp hz
  refine ⟨x,?_⟩
  apply scalar_cancel (p:ℤ) (by exact_mod_cast (Fact.out : p.Prime).ne_zero)
  have he := congrArg (q*·) hx
  simpa only [←mul_assoc,self_mul_star,hq,coe_mul_eq_smul,Algebra.mul_smul_comm] using he

lemma same_line_iff {q w : Quaternion ℤ} (hq : normSq q=p) (hw : normSq w=p)
    {l : Option (ZMod p)} (hl : inLine l (residue M q)) :
    inLine l (residue M w) ↔ ∃ u : Quaternion ℤ, normSq u=1 ∧ w=q*u := by
  constructor
  · intro hh
    obtain ⟨u,hu⟩ := divide_left M hq hl hh
    have h := hw
    rw [hu,map_mul,hq] at h
    refine ⟨u,?_,hu⟩
    apply mul_left_cancel₀ (by exact_mod_cast (Fact.out:p.Prime).ne_zero : (p:ℤ)≠0)
    simpa using h
  · rintro ⟨u,_,rfl⟩; rw [map_mul]; exact line_mul hl _

lemma invariant_criterion {l : Option (ZMod p)} {A : M2 (ZMod p)} (hn : A ≠ 0) (hl : inLine l A)
    (W : M2 (ZMod p)) : A.adjugate*W*A=0 ↔ TunnellEigenlines.invariant W l := by
  rw [mul_assoc,adj_mul_zero_iff hn hl]
  obtain ⟨i,hi⟩ : ∃ i, rowOf l A i ≠ 0 := by
    by_contra! hh
    have hr : rowOf l A=0 := funext hh
    have h := line_factored hl
    rw [hr,vecMulVec_zero] at h
    exact hn h.symm
  cases l with
  | none =>
    change ∀ j, A 0 j=0 at hl
    change A 1 i≠0 at hi
    change (∀ j, (W*A) 0 j=0) ↔ W 0 1=0
    simp only [Matrix.mul_apply,Fin.sum_univ_two,hl,mul_zero,zero_add]
    exact ⟨fun h => (mul_eq_zero.mp (h i)).resolve_right hi,by rintro h j; simp [h]⟩
  | some a =>
    change ∀ j, A 1 j=a*A 0 j at hl
    change A 0 i≠0 at hi
    change (∀ j, (W*A) 1 j = a*(W*A) 0 j) ↔ W 1 0+W 1 1*a=a*(W 0 0+W 0 1*a)
    simp only [Matrix.mul_apply,Fin.sum_univ_two,hl,←mul_assoc,←add_mul]
    exact ⟨fun h => mul_right_cancel₀ hi (by simpa [mul_assoc] using h i),
      fun h j => by rw [h,mul_assoc]⟩

end TunnellQuaternion
