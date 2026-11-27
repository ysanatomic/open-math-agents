import FormalConjectures.Wikipedia.CongruentNumber

/-! Descent of integral Hamilton quaternions inside specified right ideals modulo an odd prime. -/

namespace TunnellQuaternion

open Quaternion


def redFun (p : ℕ) (q : Quaternion ℤ) : Quaternion (ZMod p) := ⟨q.re,q.imI,q.imJ,q.imK⟩

def red (p : ℕ) : Quaternion ℤ →+* Quaternion (ZMod p) where
  toFun := redFun p
  map_add' x y := by apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_add,Quaternion.imI_add,Quaternion.imJ_add,Quaternion.imK_add] <;> simp [redFun]
  map_mul' x y := by
    apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_mul,Quaternion.imI_mul,Quaternion.imJ_mul,Quaternion.imK_mul] <;> simp [redFun]
  map_zero' := by ext <;> simp [redFun]
  map_one' := by ext <;> simp [redFun]

lemma red_apply (p : ℕ) (x : Quaternion ℤ) : red p x = redFun p x := rfl

lemma red_star (p : ℕ) (x : Quaternion ℤ) : red p (star x) = star (red p x) := by
  change redFun p (star x) = star (redFun p x)
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_star,Quaternion.imI_star,Quaternion.imJ_star,Quaternion.imK_star] <;> simp [redFun]

lemma red_norm (p : ℕ) (x : Quaternion ℤ) : ((normSq x:ℤ) : ZMod p) = normSq (red p x) := by
  rw [normSq_def',normSq_def']
  simp [red_apply,redFun]

lemma red_smul (p : ℕ) (t : ℤ) (x : Quaternion ℤ) :
    red p (t • x) = (t:ZMod p) • red p x := by
  change redFun p (t • x) = (t:ZMod p) • redFun p x
  apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_smul,Quaternion.imI_smul,Quaternion.imJ_smul,Quaternion.imK_smul] <;> simp [redFun,smul_eq_mul]

lemma norm_smul (t : ℤ) (x : Quaternion ℤ) : normSq (t • x) = t^2*normSq x := by
  rw [← coe_mul_eq_smul, map_mul, normSq_coe]

lemma div_iff (m : ℕ) (q : Quaternion ℤ) : red m q = 0 ↔ ∃ v : Quaternion ℤ, q = (m:ℤ) • v := by
  constructor
  · intro h
    have hd (a : ℤ) (ha : (a:ZMod m)=0) : a=(m:ℤ)*(a/m) :=
      (Int.mul_ediv_cancel' (ZMod.intCast_zmod_eq_zero_iff_dvd a m |>.mp ha)).symm
    refine ⟨⟨q.re/m,q.imI/m,q.imJ/m,q.imK/m⟩,?_⟩
    cases q with | mk a b c d =>
      exact QuaternionAlgebra.ext (hd a (congrArg (fun q : Quaternion (ZMod m) => q.re) h)) (hd b (congrArg (fun q : Quaternion (ZMod m) => q.imI) h))
        (hd c (congrArg (fun q : Quaternion (ZMod m) => q.imJ) h)) (hd d (congrArg (fun q : Quaternion (ZMod m) => q.imK) h))
  · rintro ⟨v,rfl⟩
    rw [red_smul]; simp

def lift (m : ℕ) (x : Quaternion (ZMod m)) : Quaternion ℤ :=
  ⟨x.re.valMinAbs,x.imI.valMinAbs,x.imJ.valMinAbs,x.imK.valMinAbs⟩

@[simp] lemma red_lift (m : ℕ) (x : Quaternion (ZMod m)) : red m (lift m x)=x := by
  change redFun m (lift m x)=x
  apply QuaternionAlgebra.ext <;> dsimp only [redFun,lift] <;> simp

lemma norm_lift_lt {m : ℕ} [NeZero m] (hm : Odd m) (x : Quaternion (ZMod m)) :
    normSq (lift m x) < (m:ℤ)^2 := by
  have hn : 0<(m:ℤ) := Nat.cast_pos.mpr (Nat.pos_of_ne_zero (NeZero.ne m))
  have h (a : ZMod m) : 4*a.valMinAbs^2 < (m:ℤ)^2 := by
    obtain ⟨hl,hu⟩ := a.valMinAbs_mem_Ioc
    have hm' := hm
    rcases hm' with ⟨k,hk⟩
    have hu2 : a.valMinAbs*2 < (m:ℤ) := by omega
    nlinarith [mul_pos (sub_pos.mpr hu2) (by linarith [hl] : 0<(m:ℤ)+a.valMinAbs*2)]
  rw [normSq_def']
  dsimp only [lift]
  linarith [h x.re,h x.imI,h x.imJ,h x.imK]

lemma even_descent (x : Quaternion ℤ) (h : Even (normSq x)) :
    ∃ r : Quaternion ℤ, normSq r=2 ∧ red 2 (x*r)=0 := by
  let i : Quaternion ℤ := ⟨1,1,0,0⟩
  let j : Quaternion ℤ := ⟨1,0,1,0⟩
  let k : Quaternion ℤ := ⟨1,0,0,1⟩
  have ee : normSq (red 2 x)=0 := by rw [←red_norm]; exact h.intCast_zmod_two
  letI : DecidableEq (Quaternion (ZMod 2)) := (Quaternion.equivProd _).decidableEq
  have claim : ∀ w : Quaternion (ZMod 2), normSq w=0 →
      w*red 2 i=0 ∨ w*red 2 j=0 ∨ w*red 2 k=0 := by
    intro ⟨a,b,c,d⟩
    revert a b c d
    decide
  rcases claim _ ee with h|h|h
  · exact ⟨i,by decide, by simpa using h⟩
  · exact ⟨j,by decide, by simpa using h⟩
  · exact ⟨k,by decide, by simpa using h⟩

theorem find_generator {p : ℕ} (hp : p.Prime) (ho : p ≠ 2) (S : Set (Quaternion (ZMod p)))
    (hS : ∀ a ∈ S, ∀ b, a*b ∈ S)
    (hSc : ∀ (r : ZMod p) a, a ∈ S → r • a ∈ S)
    (hzero : ∀ a ∈ S, normSq a=0) (hne : ∃ a ∈ S, a≠0) :
    ∃ q : Quaternion ℤ, normSq q = p ∧ red p q ∈ S := by
  classical
  letI : Fact p.Prime := ⟨hp⟩
  have hodd := hp.odd_of_ne_two ho
  have initial : ∃ m : ℕ, 0 < m ∧ m < p ∧ ∃ x : Quaternion ℤ, normSq x = (m:ℤ)*p ∧ red p x ∈ S := by
    obtain ⟨a,ha,ha0⟩ := hne
    let x := lift p a
    have hr : red p x = a := red_lift p a
    have hd : (p:ℤ) ∣ normSq x := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp
      (by rw [red_norm,hr,hzero _ ha])
    obtain ⟨v,hv⟩ := hd
    have hx : 0 < normSq x := (normSq_nonneg (a:=x)).lt_of_ne' (normSq_ne_zero.mpr
      (fun he => ha0 (by rw [←hr,he,map_zero])))
    have hpos : 0 < v := pos_of_mul_pos_right (hv ▸ hx) (by positivity : (0:ℤ) ≤ p)
    have hlt := norm_lift_lt hodd a
    change normSq x < (p:ℤ)^2 at hlt
    refine ⟨v.toNat,by omega,?_,x,?_,hr ▸ ha⟩
    · rw [hv,sq] at hlt
      have := lt_of_mul_lt_mul_left hlt (by positivity : (0:ℤ) ≤ p)
      omega
    · rw [Int.toNat_of_nonneg hpos.le,hv,mul_comm]
  obtain ⟨m,⟨hm0,hmp,x,hx,hxs⟩,minimal⟩ := Nat.findX initial
  by_cases hm1 : m=1
  · subst m; exact ⟨x,by simpa using hx,hxs⟩
  have hm : 1 < m := by omega
  have hp0 : (0:ℤ) < p := by exact_mod_cast hp.pos
  have hm0' : (0:ℤ) < m := by exact_mod_cast hm0
  have preserve {d : ℕ} (hd : 0 < d) (hdp : d < p) {r y : Quaternion ℤ}
      (hy : x*r = (d:ℤ) • y) : red p y ∈ S := by
    have hd0 : (d:ZMod p)≠0 := fun hh =>
      have hh' := (ZMod.natCast_eq_zero_iff _ _).mp hh
      (Nat.not_dvd_of_pos_of_lt hd hdp) hh'
    have hs := hS _ hxs (red p r)
    rw [←map_mul,hy,red_smul] at hs
    have := hSc ((d:ZMod p)⁻¹) _ hs
    simpa [smul_smul,hd0] using this
  exfalso
  by_cases he : Even m
  · obtain ⟨u,hu⟩ := he
    have hx2 : Even (normSq x) := by rw [hx]; exact (by exact_mod_cast (show Even m from ⟨u,hu⟩) : Even (m:ℤ)).mul_right _
    obtain ⟨r,hr,hr0⟩ := even_descent x hx2
    obtain ⟨y,hy⟩ := (div_iff 2 _).mp hr0
    have hnorm := congrArg normSq hy
    rw [map_mul,hx,hr,norm_smul] at hnorm
    have hu' : (m:ℤ)=u+u := by exact_mod_cast hu
    refine minimal u (by omega) ⟨by omega,by omega,y,?_,preserve (d:=2) (by decide) (by omega) hy⟩
    norm_num at hnorm
    nlinarith [congrArg (fun k:ℤ => k*p) hu']
  · have hmOdd := Nat.not_even_iff_odd.mp he
    letI : NeZero m := ⟨hm0.ne'⟩
    let r := lift m (red m x)
    have hr : red m r = red m x := red_lift m _
    have hm_norm : ((normSq x:ℤ):ZMod m)=0 := by simp [hx]
    have hd : (m:ℤ) ∣ normSq r := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp (by
      rw [red_norm,hr,←red_norm]; exact hm_norm)
    obtain ⟨u,hu⟩ := hd
    have hr0 : r≠0 := by
      intro hz
      have hz' : red m x=0 := by rw [←hr,hz,map_zero]
      obtain ⟨w,hw⟩ := (div_iff m x).mp hz'
      rw [hw,norm_smul] at hx
      have hdiv : (m:ℤ) ∣ p := ⟨normSq w,by
        apply mul_left_cancel₀ hm0'.ne' (b := (p:ℤ))
        nlinarith [hx]⟩
      have hdvd : m ∣ p := by exact_mod_cast hdiv
      rcases (Nat.dvd_prime hp).mp hdvd with ee|ee <;> omega
    have hupos : 0 < u := pos_of_mul_pos_right (hu ▸ (normSq_nonneg (a:=r)).lt_of_ne' (normSq_ne_zero.mpr hr0)) hm0'.le
    have hless := norm_lift_lt hmOdd (red m x)
    change normSq r < (m:ℤ)^2 at hless
    rw [hu,sq] at hless
    have huLt := lt_of_mul_lt_mul_left hless hm0'.le
    have hz : red m (x*star r)=0 := by
      rw [map_mul,red_star,hr,self_mul_star,←red_norm,hm_norm,coe_zero]
    obtain ⟨y,hy⟩ := (div_iff m _).mp hz
    have hnorm := congrArg normSq hy
    rw [map_mul,normSq_star,norm_smul,hx,hu] at hnorm
    refine minimal u.toNat (by omega) ⟨by omega,by omega,y,?_,preserve hm0 hmp hy⟩
    rw [Int.toNat_of_nonneg hupos.le]
    apply mul_left_cancel₀ (pow_ne_zero 2 hm0'.ne') (b := normSq y)
    linear_combination -hnorm

#print axioms find_generator

end TunnellQuaternion
