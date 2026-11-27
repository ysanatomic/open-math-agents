import TunnellRankOnePacket

/-! Orthogonal prime-to-prime coordinates of a rectangular discriminant group.
Coordinates are represented by the two perpendicular subgroups M x and p y. -/
namespace TunnellPacketCRT
open Complex Real TunnellRankOnePacket
noncomputable section

def merge {p M : ℕ} (hc : p.Coprime M) : ZMod p × ZMod M ≃ ZMod (p*M) :=
  ((ZMod.unitOfCoprime M hc.symm).mulLeft.prodCongr (ZMod.unitOfCoprime p hc).mulLeft).trans
    (ZMod.chineseRemainder hc).symm.toEquiv

lemma merge_lifts {p M : ℕ} (hc : p.Coprime M) (x y : ℤ) :
    merge hc ((x:ZMod p),(y:ZMod M))=(((M:ℤ)*x+p*y:ℤ):ZMod (p*M)) := by
  apply (ZMod.chineseRemainder hc).injective
  change (ZMod.chineseRemainder hc) ((ZMod.chineseRemainder hc).symm _) = _
  rw [RingEquiv.apply_symm_apply,map_intCast]
  apply Prod.ext <;> simp [Units.mulLeft,Equiv.prodCongr,ZMod.coe_unitOfCoprime]

lemma fourier_split {p M : ℕ} [NeZero p] [NeZero M] (hc : p.Coprime M)
    (x y : ZMod p) (u v : ZMod M) :
    ZMod.stdAddChar (merge hc (x,u)*merge hc (y,v)) =
      ZMod.stdAddChar ((M:ZMod p)*x*y)*ZMod.stdAddChar ((p:ZMod M)*u*v) := by
  obtain ⟨x,rfl⟩ := ZMod.intCast_surjective x
  obtain ⟨y,rfl⟩ := ZMod.intCast_surjective y
  obtain ⟨u,rfl⟩ := ZMod.intCast_surjective u
  obtain ⟨v,rfl⟩ := ZMod.intCast_surjective v
  have hp : (p:ℂ)≠0 := by exact_mod_cast NeZero.ne p
  have hM : (M:ℂ)≠0 := by exact_mod_cast NeZero.ne M
  rw [merge_lifts,merge_lifts,←Int.cast_mul,
    show (M:ZMod p)*(x:ZMod p)*(y:ZMod p)=(((M:ℤ)*x*y:ℤ):ZMod p) by push_cast; rfl,
    show (p:ZMod M)*(u:ZMod M)*(v:ZMod M)=(((p:ℤ)*u*v:ℤ):ZMod M) by push_cast; rfl]
  rw [ZMod.stdAddChar_coe,ZMod.stdAddChar_coe,ZMod.stdAddChar_coe]
  push_cast
  let k : ℤ := x*v+u*y
  have e : (2:ℂ)*π*I*((M*x+p*u)*(M*y+p*v))/(p*M) =
      (2*π*I*(M*x*y)/p+2*π*I*(p*u*v)/M) + (k:ℂ)*(2*π*I) := by
    dsimp [k]; push_cast; field_simp; ring
  rw [e,Complex.exp_add,Complex.exp_int_mul_two_pi_mul_I,mul_one,Complex.exp_add]

def expQ (D : ℕ) (j x : ℤ) : ℂ := Complex.exp (π*I*(j:ℂ)*(x:ℂ)^2/D)

lemma expQ_period {D : ℕ} [NeZero D] (hD : Even D) (j x l : ℤ) :
    expQ D j (x+D*l)=expQ D j x := by
  have hD' : (D:ℂ)≠0 := by exact_mod_cast NeZero.ne D
  obtain ⟨k,hk⟩ := hD
  have hk' : (D:ℂ)=(k:ℂ)+k := by exact_mod_cast hk
  let m : ℤ := j*(x*l+k*l^2)
  have e : (π:ℂ)*I*j*((x:ℂ)+D*l)^2/D =
      π*I*j*(x:ℂ)^2/D + (m:ℂ)*(2*π*I) := by
    dsimp [m]; push_cast; field_simp; rw [hk']; ring
  unfold expQ
  push_cast
  rw [e,Complex.exp_add,Complex.exp_int_mul_two_pi_mul_I,mul_one]

lemma phase_lift {D : ℕ} [NeZero D] (hD : Even D) (j x : ℤ) :
    (phase D (x:ZMod D))^j=expQ D j x := by
  let r : ZMod D := x
  have he : ((r.val:ℤ):ZMod D)=(x:ZMod D) := by simp [r]
  obtain ⟨l,hl⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub (r.val:ℤ) x D).mp he
  have he' : x=(r.val:ℤ)+D*l := by omega
  calc
    _ = expQ D j (r.val:ℤ) := by
      change (Complex.exp (π*I*(r.val:ℂ)^2/D))^j = _
      rw [←Complex.exp_int_mul]
      unfold expQ
      push_cast
      congr 1
      ring
    _ = expQ D j x := by conv_rhs => rw [he',expQ_period hD]

lemma translate_trivial {D : ℕ} [NeZero D] (hD : Even D) (j : ℤ) (hj : (2*(D:ℤ))∣j) (r : ZMod D) :
    (phase D r)^j=1 := by
  obtain ⟨x,rfl⟩ := ZMod.intCast_surjective r
  obtain ⟨l,rfl⟩ := hj
  rw [phase_lift hD]
  unfold expQ
  have hp : (D:ℂ)≠0 := by exact_mod_cast NeZero.ne D
  convert Complex.exp_int_mul_two_pi_mul_I (l*x^2) using 2
  push_cast; field_simp

lemma translate_split {p k : ℕ} [NeZero p] [NeZero k] (hc : p.Coprime (2*k)) (j : ℤ)
    (hj : 4*(k:ℤ) ∣ j) (x : ZMod p) (u : ZMod (2*k)) :
    (phase (p*(2*k)) (merge hc (x,u)))^j = ZMod.stdAddChar ((j:ZMod p)*(k:ZMod p)*x^2) := by
  obtain ⟨x,rfl⟩ := ZMod.intCast_surjective x
  obtain ⟨u,rfl⟩ := ZMod.intCast_surjective u
  obtain ⟨l,hl⟩ := hj
  have he : Even (p*(2*k)) := by exact (even_two.mul_right k).mul_left p
  have hp : (p:ℂ)≠0 := by exact_mod_cast NeZero.ne p
  have hk : (k:ℂ)≠0 := by exact_mod_cast NeZero.ne k
  rw [merge_lifts,phase_lift he,
    show (j:ZMod p)*(k:ZMod p)*(x:ZMod p)^2=(((j:ℤ)*(k:ℤ)*x^2:ℤ):ZMod p) by push_cast; rfl,
    ZMod.stdAddChar_coe]
  let m : ℤ := j*x*u+l*p*u^2
  have e : (π:ℂ)*I*j*((2*k:ℂ)*x+p*u)^2/(p*(2*k)) =
      2*π*I*(j*(k:ℂ)*x^2)/p+(m:ℂ)*(2*π*I) := by
    dsimp [m]; rw [hl]; push_cast; field_simp; ring
  unfold expQ
  push_cast
  rw [e,Complex.exp_add,Complex.exp_int_mul_two_pi_mul_I,mul_one]

end
end TunnellPacketCRT
#print axioms TunnellPacketCRT.fourier_split
#print axioms TunnellPacketCRT.translate_split
