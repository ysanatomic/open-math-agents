import Mathlib

/-! The local double cosets of the Hurwitz order at 2 and the order
ℤ[i+j] + 4 O. Coordinates use the integral Hurwitz basis 1, i, j,
u=(1+i+j+ij)/2. -/

namespace TunnellHurwitzFour
open Finset

abbrev H (R : Type*) := R × R × R × R

def prod {R : Type*} [CommRing R] (x y : H R) : H R :=
  let (a,b,c,d) := x
  let (u,v,w,t) := y
  (a*u-b*v-c*w-d*t-b*w+c*v-b*t-d*w,
   a*v+b*u-b*w+c*v+d*v+c*t-d*w,
   a*w+c*u-b*w+c*v-b*t+d*v+c*t,
   a*t+d*u+2*b*w-2*c*v+b*t-d*v-c*t+d*w+d*t)

def nr {R : Type*} [CommRing R] (x : H R) : R :=
  let (a,b,c,d) := x
  a^2+b^2+c^2+d^2+(a+b+c)*d

def ham (x : H ℚ) : Quaternion ℚ :=
  let (a,b,c,d) := x
  ⟨a+d/2,b+d/2,c+d/2,d/2⟩

lemma ham_prod (x y : H ℚ) : ham (prod x y)=ham x * ham y := by
  obtain ⟨a,b,c,d⟩ := x
  obtain ⟨u,v,w,t⟩ := y
  apply QuaternionAlgebra.ext
  · rw [Quaternion.re_mul]; dsimp [ham,prod]; ring
  · rw [Quaternion.imI_mul]; dsimp [ham,prod]; ring
  · rw [Quaternion.imJ_mul]; dsimp [ham,prod]; ring
  · rw [Quaternion.imK_mul]; dsimp [ham,prod]; ring

lemma ham_norm (x : H ℚ) : Quaternion.normSq (ham x) = nr x := by
  rw [Quaternion.normSq_def']; dsimp [ham,nr]; ring

abbrev Z4 := ZMod 4
abbrev H4 := H Z4

def units : Finset H4 := univ.filter (fun x => (nr x).val%2=1)

def lipschitz : Finset H4 :=
  {(1,0,0,0),(-1,0,0,0),(0,1,0,0),(0,-1,0,0),(0,0,1,0),(0,0,-1,0),(-1,-1,-1,2),(1,1,1,-2)}

def globalUnits : Finset H4 :=
  let S : Finset Z4 := {0,-1}
  let T : Finset Z4 := {0,1}
  lipschitz ∪ (S ×ˢ (S ×ˢ (S ×ˢ {1}))) ∪ (T ×ˢ (T ×ˢ (T ×ˢ {-1})))

def orderUnits : Finset H4 := (({1,-1}:Finset Z4) ×ˢ (univ : Finset Z4)).image (fun ab => (ab.1,ab.2,ab.2,0))

def orbit (x : H4) : Finset H4 := (globalUnits ×ˢ orderUnits).image fun ab => prod (prod ab.1 x) ab.2

def e : H4 := (1,0,0,0)
def tau : H4 := (1,0,2,0)

lemma order_units_card : orderUnits.card=8 := by decide
lemma global_units_card : globalUnits.card=24 := by decide
set_option maxRecDepth 10000 in
lemma ambient_units_card : units.card=192 := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
lemma orbit_cards : (orbit e).card=96 ∧ (orbit tau).card=96 := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
lemma two_orbits : orbit e ∪ orbit tau=units ∧ Disjoint (orbit e) (orbit tau) := by decide

def modFour (x : H ℤ) : H4 := (x.1,x.2.1,x.2.2.1,x.2.2.2)

lemma modFour_mul (x y : H ℤ) : modFour (prod x y)=prod (modFour x) (modFour y) := by
  obtain ⟨a,b,c,d⟩ := x
  obtain ⟨q,r,s,t⟩ := y
  simp [modFour,prod]

noncomputable def box : Finset (H ℤ) :=
  let I := Icc (-2:ℤ) 2
  I ×ˢ (I ×ˢ (I ×ˢ I))

lemma norm_one_mem (x : H ℤ) (hx : nr x=1) : x∈box := by
  obtain ⟨a,b,c,d⟩ := x
  change a^2+b^2+c^2+d^2+(a+b+c)*d=1 at hx
  have he : (2*a+d)^2+(2*b+d)^2+(2*c+d)^2+d^2=4 := by linear_combination 4*hx
  have bound (z : ℤ) (h : z^2≤4) : -2≤z ∧ z≤2 := by
    constructor <;> by_contra! hh <;> nlinarith
  have ha := bound (2*a+d) (by nlinarith [sq_nonneg (2*b+d),sq_nonneg (2*c+d),sq_nonneg d])
  have hb := bound (2*b+d) (by nlinarith [sq_nonneg (2*a+d),sq_nonneg (2*c+d),sq_nonneg d])
  have hc := bound (2*c+d) (by nlinarith [sq_nonneg (2*a+d),sq_nonneg (2*b+d),sq_nonneg d])
  have hd := bound d (by nlinarith [sq_nonneg (2*a+d),sq_nonneg (2*b+d),sq_nonneg (2*c+d)])
  simp [box]
  omega

set_option maxRecDepth 10000 in
lemma global_units_image : ((box.filter (fun x => nr x=1)).image modFour)=globalUnits := by decide

lemma global_iff (a : H4) : a∈globalUnits ↔ ∃ x : H ℤ, nr x=1 ∧ modFour x=a := by
  rw [←global_units_image,mem_image]
  exact ⟨fun ⟨v,hv,he⟩ => ⟨v,(mem_filter.mp hv).2,he⟩,
    fun ⟨v,hv,he⟩ => ⟨v,mem_filter.mpr ⟨norm_one_mem v hv,hv⟩,he⟩⟩

def inOrder (x : H ℤ) : Prop := ∃ a b : ℤ, ∃ y : H ℤ, x=(a,b,b,0)+4 • y

lemma order_iff (x : H ℤ) : inOrder x ↔ x.2.1%4=x.2.2.1%4 ∧ x.2.2.2%4=0 := by
  obtain ⟨a,b,c,d⟩ := x
  constructor
  · rintro ⟨r,s,⟨e,f,g,h⟩,he⟩
    simp [Prod.ext_iff] at he
    dsimp only
    omega
  · rintro ⟨he,hd⟩
    dsimp only at he hd
    exact ⟨a,b,(0,0,(c-b)/4,d/4),by simp [Prod.ext_iff]; omega⟩

set_option maxRecDepth 10000 in
lemma order_units_table : ∀ x : H4, x∈orderUnits ↔ x.2.1=x.2.2.1 ∧ x.2.2.2=0 ∧ (nr x).val%2=1 := by
  decide

lemma local_orbits (x : H4) (hx : (nr x).val%2=1) :
    (x∈orbit e ∨ x∈orbit tau) ∧ ¬(x∈orbit e ∧ x∈orbit tau) := by
  have hu : x∈units := mem_filter.mpr ⟨mem_univ _,hx⟩
  rw [←two_orbits.1, mem_union] at hu
  exact ⟨hu,fun ⟨h1,h2⟩ => disjoint_left.mp two_orbits.2 h1 h2⟩

#print axioms local_orbits

end TunnellHurwitzFour
