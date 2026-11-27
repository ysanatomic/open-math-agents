import TunnellToricLocalSign

/-! The kernel of the dyadic anti-commuting projector is the congruence order ℤ₂[i+j]+4O₂. -/
namespace TunnellRamifiedTwoTable
open TunnellHurwitzFour TunnellToricSign
open scoped Classical
abbrev Z8 := ZMod 8
def V {R : Type*} [CommRing R] (x y z : R) : H R := (-z,x-z,y-z,2*z)
def proj {R : Type*} [CommRing R] (v : H R) (q : H R) : H R := 2 • q+prod (prod v q) v
def four (x : Z8) : Z4 := (x.val:Z4)
def coeff (x : Z8) (k l : ZMod 2) : Z8 := if k=l then 6 else 2

lemma linear_proj {R : Type*} [CommRing R] (s : H R) (a b c d : R) :
    proj s (a,b,c,d)=a • proj s (1,0,0,0)+b • proj s (0,1,0,0)+c • proj s (0,0,1,0)+d • proj s (0,0,0,1) := by
  rcases s with ⟨s,t,u,v⟩
  refine Prod.ext ?_ (Prod.ext ?_ (Prod.ext ?_ ?_))
  all_goals dsimp [proj,prod]; simp only [two_nsmul,smul_eq_mul]; ring

set_option maxRecDepth 10000 in
set_option maxHeartbeats 3000000 in
lemma basis_table : ∀ x : Z8, x.val%2=1 → ∀ k l : ZMod 2,
    let A := proj (V x (x+4*(k.val:Z8)) (4*(l.val:Z8)))
    A (1,0,0,0)=0 ∧ A (0,1,0,0)=(0,2,6,0) ∧ A (0,0,1,0)=(0,6,2,0) ∧
    A (0,0,0,1)=(6,coeff x k l,coeff x k l,4) := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
lemma scalar_table : ∀ (b c d : Z8) (k : ZMod 2),
    ((6*d,2*b+6*c+(if k=0 then 6 else 2)*d,6*b+2*c+(if k=0 then 6 else 2)*d,4*d):H Z8)=0 ↔
    four b=four c ∧ four d=0 := by decide

theorem kernel (q : H Z8) (x : Z8) (hx : x.val%2=1) (k l : ZMod 2) :
    proj (V x (x+4*(k.val:Z8)) (4*(l.val:Z8))) q=0 ↔ four q.2.1=four q.2.2.1 ∧ four q.2.2.2=0 := by
  rcases q with ⟨a,b,c,d⟩
  obtain ⟨h₀,h₁,h₂,h₃⟩ := basis_table x hx k l
  rw [linear_proj,h₀,h₁,h₂,h₃]
  let e : ZMod 2 := if k=l then 0 else 1
  have h : coeff x k l=(if e=0 then 6 else 2) := by by_cases r : k=l <;> simp [e,coeff,r]
  rw [h]
  have he := scalar_table b c d e
  convert he using 2 <;> simp [smul_eq_mul] <;> ring <;> decide

end TunnellRamifiedTwoTable
#print axioms TunnellRamifiedTwoTable.kernel
