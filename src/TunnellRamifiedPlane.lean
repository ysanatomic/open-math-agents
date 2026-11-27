import Mathlib

/-! Finite Weil trace of a quadratic plane at an odd ramified prime. -/
namespace TunnellRamifiedPlane
open Finset ZMod
noncomputable section
variable {p : ℕ} [Fact p.Prime]
local notation "F" => ZMod p
local notation "ψ" => ZMod.stdAddChar (N:=p)
local notation "χ" => MulChar.ringHomComp (quadraticChar F) (Int.castRingHom ℂ)

def form (a t : F) (v : F×F) := a*(v.1^2-t*v.2^2)
def gauss (a t : F) : ℂ := ∑ v : F×F, ψ (form a t v)
def trace (a t : F) (f : F×F → ℂ) : ℂ :=
  f (0,0) + gauss a t / (p:ℂ)^2 * ∑ j : F, ∑ v : F×F, ψ (j*form a t v)*f v

lemma unary (hp : p≠2) {a : F} (ha : a≠0) :
    ∑ x : F, ψ (a*x^2)=χ a * gaussSum χ ψ := by
  classical
  have hc : ringChar F≠2 := by simpa only [ZMod.ringChar_zmod_n] using hp
  let g (y:F) := ψ (a*y)
  calc
    _ = ∑ y : F, ∑ x∈univ.filter (fun x : F => x^2=y),g (x^2) := by
      rw [sum_fiberwise_of_maps_to (fun x _ => mem_univ (x^2))]
    _ = ∑ y : F, (χ y+1)*g y := by
      apply sum_congr rfl
      intro y _
      have e : ∑ x∈univ.filter (fun x : F => x^2=y), g (x^2) = ∑ _x∈univ.filter (fun x : F => x^2=y),g y :=
        sum_congr rfl (fun x hx => congrArg g (mem_filter.mp hx).2)
      rw [e,sum_const,nsmul_eq_mul]
      have h := quadraticChar_card_sqrts hc y
      rw [Set.toFinset_ofPred] at h
      congr 1
      change _=(quadraticChar F y:ℂ)+1
      exact_mod_cast h
    _ = gaussSum χ (AddChar.mulShift ψ a) := by
      simp only [add_mul,sum_add_distrib,one_mul,g]
      have e := AddChar.sum_mulShift a (ZMod.isPrimitive_stdAddChar p)
      simp only [ha,if_false] at e
      have e1 : (∑ y:F, ψ (a*y))=0 := by simpa only [mul_comm a, Nat.cast_zero] using e
      rw [e1,add_zero]
      simp only [gaussSum,AddChar.mulShift_apply,mul_comm a]
    _ = _ := by
      have e := gaussSum_mulShift_eq χ ψ (Units.mk0 a ha)
      rw [((quadraticChar_isQuadratic F).comp (Int.castRingHom ℂ)).inv] at e
      exact e

theorem gauss_eq (hp : p≠2) {a t:F} (ha:a≠0) (ht:t≠0) :
    gauss a t=(p:ℂ)*χ t := by
  classical
  have e : ∀ x y:F, form a t (x,y)=a*x^2+(-a*t)*y^2 := by intros; dsimp [form]; ring
  rw [gauss,Fintype.sum_prod_type]
  simp_rw [e,AddChar.map_add_eq_mul,←mul_sum]
  rw [←sum_mul,unary hp ha,unary hp (mul_ne_zero (neg_ne_zero.mpr ha) ht)]
  have hC : ringChar F≠2 := by simpa only [ZMod.ringChar_zmod_n] using hp
  have hne : χ ≠ 1 := (MulChar.ringHomComp_ne_one_iff (Int.cast_injective (α := ℂ))).mpr (quadraticChar_ne_one hC)
  have hG := gaussSum_sq hne ((quadraticChar_isQuadratic F).comp (Int.castRingHom ℂ)) (ZMod.isPrimitive_stdAddChar p)
  rw [ZMod.card] at hG
  calc
    _ = χ (a*(-a*t)) * gaussSum χ ψ ^ 2 := by rw [map_mul χ a (-a*t)]; ring
    _ = (p:ℂ)*χ ((a^2)*t) := by rw [hG,show a^2*t=a*(-a*t)*(-1) by ring,map_mul χ (a*(-a*t)) (-1)]; ring
    _ = _ := by
      have u : χ (a^2) = 1 := by
        change ((quadraticChar F (a^2) : ℤ) : ℂ) = 1
        rw [quadraticChar_sq_one' ha,Int.cast_one]
      rw [map_mul χ (a^2) t,u,one_mul]

lemma trace_eq (hp : p≠2) {a t:F} (ha:a≠0) (ht:t≠0) (f : F×F → ℂ) :
    trace a t f=f (0,0)+χ t*∑ v ∈ univ.filter (fun v => form a t v=0), f v := by
  classical
  have he : (∑ j : F, ∑ v:F×F, ψ (j*form a t v)*f v)= (p:ℂ)*∑ v∈univ.filter (fun v => form a t v=0),f v := by
    rw [sum_comm,sum_filter,mul_sum]
    apply sum_congr rfl
    intro v _
    rw [←sum_mul,AddChar.sum_mulShift _ (ZMod.isPrimitive_stdAddChar p),ZMod.card]
    split_ifs <;> simp
  rw [trace,he,gauss_eq hp ha ht]
  have hn : (p:ℂ)≠0 := by exact_mod_cast (Fact.out : Nat.Prime p).ne_zero
  field_simp

theorem trace_anisotropic (hp : p≠2) {a t:F} (ha:a≠0) (ht:t≠0) (hs:¬IsSquare t) (f : F×F→ℂ) :
    trace a t f=0 := by
  classical
  have he : univ.filter (fun v:F×F => form a t v=0) = {(0,0)} := by
    ext ⟨x,y⟩
    simp only [mem_filter,mem_univ,true_and,mem_singleton,form,mul_eq_zero,ha,false_or,sub_eq_zero,Prod.mk.injEq]
    constructor
    · intro h
      by_cases hy : y=0
      · exact ⟨by simpa [hy] using h,hy⟩
      · exfalso; apply hs; refine ⟨x/y,?_⟩
        field_simp; linear_combination -h
    · rintro ⟨rfl,rfl⟩; simp
  rw [trace_eq hp ha ht,he,sum_singleton]
  change _+(quadraticChar F t:ℂ)*_=0
  rw [quadraticChar_neg_one_iff_not_isSquare.mpr hs]; simp

lemma filter_line (r : F) (f : F×F→ℂ) :
    (∑ v∈univ.filter (fun v:F×F => v.1=r*v.2),f v)=∑ y:F,f (r*y,y) := by
  classical
  symm
  apply sum_nbij' (fun y => (r*y,y)) Prod.snd
  · simp
  · simp
  · simp
  · intro v hv; exact Prod.ext (mem_filter.mp hv).2.symm rfl
  · simp

theorem trace_split (hp : p≠2) {a r:F} (ha:a≠0) (hr:r≠0) (f : F×F→ℂ) :
    trace a (r^2) f=(∑ y:F, f (r*y,y))+(∑ y:F, f (-r*y,y)) := by
  classical
  rw [trace_eq hp ha (pow_ne_zero _ hr),←filter_line,←filter_line]
  change _+(quadraticChar F (r^2):ℂ)*_=_
  rw [quadraticChar_sq_one' hr,Int.cast_one,one_mul]
  have h0 : f (0,0)=∑ v:F×F, if v=(0,0) then f v else 0 := by simp
  rw [h0,sum_filter,sum_filter,sum_filter,←sum_add_distrib,←sum_add_distrib]
  apply sum_congr rfl
  rintro ⟨x,y⟩ _
  have h : form a (r^2) (x,y)=0 ↔ x=r*y ∨ x= -r*y := by
    rw [form,show (x^2-r^2*y^2)=(x-r*y)*(x- -r*y) by ring,mul_eq_zero,mul_eq_zero]
    simp only [ha,false_or,sub_eq_zero]
  have hi (e : x=r*y) (e' : x= -r*y) : y=0 := by
    have h2 : (2:F)≠0 := by
      change ¬ ((2:ℕ):F)=0
      rw [ZMod.natCast_eq_zero_iff]
      intro h; exact hp ((Nat.prime_dvd_prime_iff_eq (Fact.out:p.Prime) Nat.prime_two).mp h)
    have z : 2*r*y=0 := by linear_combination e'-e
    exact (mul_eq_zero.mp z).resolve_left (mul_ne_zero h2 hr)
  by_cases e : x=r*y <;> by_cases e' : x= -r*y
  · obtain rfl := hi e e'; simp_all
  · have hxy : (x,y)≠(0,0) := by rintro ⟨⟩; simp at e'
    change (if (x,y)=(0,0) then _ else _) + (if form a (r^2) (x,y)=0 then _ else _) = (if x=r*y then _ else _)+(if x= -r*y then _ else _)
    rw [if_neg hxy]
    rw [if_pos (h.mpr (Or.inl e)),if_pos e,if_neg e']; simp
  · have hxy : (x,y)≠(0,0) := by rintro ⟨⟩; simp at e
    change (if (x,y)=(0,0) then _ else _) + (if form a (r^2) (x,y)=0 then _ else _) = (if x=r*y then _ else _)+(if x= -r*y then _ else _)
    rw [if_neg hxy]
    rw [if_pos (h.mpr (Or.inr e')),if_neg e,if_pos e']
  · have hxy : (x,y)≠(0,0) := by rintro ⟨⟩; simp at e
    change (if (x,y)=(0,0) then _ else _) + (if form a (r^2) (x,y)=0 then _ else _) = (if x=r*y then _ else _)+(if x= -r*y then _ else _)
    rw [if_neg hxy]
    rw [if_neg (fun hx => (h.mp hx).elim e e'),if_neg e,if_neg e']

end
end TunnellRamifiedPlane
#print axioms TunnellRamifiedPlane.trace_split
#print axioms TunnellRamifiedPlane.trace_anisotropic
