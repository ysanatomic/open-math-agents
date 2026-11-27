import TunnellRectangleRows

/-! A single prime trace of the product of two arbitrary translated quadratic
ideal theta series, in the same coordinates as the geometric line-family trace. -/
namespace TunnellRectangleTrace
open Complex Finset TunnellRectangleRows TunnellRectangularIdeal TunnellRectangularLocalTrace
open TunnellLocalizedPacket TunnellTraceLifts TunnellLineDensity ModularForm ModularGroup MatrixGroups
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section

def piece (d a c : ℕ) [NeZero d] [NeZero a] [NeZero c] (b f : ℤ) (s : ℤ×ℤ) (z : ℍ) :=
  rect d a 1 b s.1 z*rect d c 4 f s.2 z

def oneRow (d a c : ℕ) [NeZero d] [NeZero a] [NeZero c] (b f i j : ℤ) (s : ℤ×ℤ) (z : ℍ) :=
  row d a 1 b i s.1 z*row d c 4 f j s.2 z

lemma piece_rows (d a c : ℕ) [NeZero d] [NeZero a] [NeZero c] (b f : ℤ) (s : ℤ×ℤ) :
    piece d a c b f s=∑ q : ZMod a×ZMod c,oneRow d a c b f q.1.val q.2.val s := by
  funext z
  simp only [piece,rect_sum,oneRow,Finset.sum_apply,Fintype.sum_prod_type,sum_mul,mul_sum]
  rw [sum_comm]

variable {p e a c : ℕ} [Fact p.Prime] [NeZero e] [NeZero a] [NeZero c]
local notation "V" => ZMod p × ZMod p
def shift (e : ℕ) (v : ZMod p×ZMod p) : ℤ×ℤ := (e*v.1.val,e*v.2.val)

variable (hc : p.Coprime (2*(2*a*e))) (hd : p.Coprime (2*(8*c*e))) (m : ℤ) (hm : (m:ZMod p)=1)
    (hA : 2*((2*1*a:ℕ):ℤ)∣m) (hB : 2*((2*4*c:ℕ):ℤ)∣m) (hk : 4*((2*a*e:ℕ):ℤ)∣m) (hl : 4*((8*c*e:ℕ):ℤ)∣m)
    {α t : ZMod p} (ha : ((2*a*e:ℕ):ZMod p)=α) (hb : ((8*c*e:ℕ):ZMod p)= -α*t)
    (hp : p≠2) (hα : α≠0) (ht : t≠0)

include hc hd m hm hA hB hk hl ha hb hp hα ht in
lemma row_trace (b f i j : ℤ) (s : ℤ×ℤ) (hx : (p:ℤ)∣s.1) (hy : (p:ℤ)∣s.2) :
    (∑ ξ : Option (ZMod p), (oneRow (p*e) a c b f i j s) ∣[(2:ℤ)] localRep m ξ) =
      ∑ u : V,(density t u:ℂ) • oneRow (p*e) a c b f i j (s+shift e u) := by
  let h : ℤ := Classical.choose hx
  let k : ℤ := Classical.choose hy
  have hh : s.1=(p:ℤ)*h := Classical.choose_spec hx
  have hk' : s.2=(p:ℤ)*k := Classical.choose_spec hy
  let x := rawOrigin (e:=e) (a:=a) (c:=c) b i h f j k
  have P (u : V) : family hc hd x u=oneRow (p*e) a c b f i j (s+shift e u) := by
    funext z
    simpa only [x,oneRow,shift,Prod.fst_add,Prod.snd_add,hh,hk',Int.natCast_mul] using rows hc hd b i h f j k u z
  have z0 : shift e (0:V)=(0:ℤ×ℤ) := by ext <;> simp [shift]
  have Z : family hc hd x 0=oneRow (p*e) a c b f i j s := by simpa only [z0,add_zero] using P 0
  rw [←Z]
  funext z
  simp only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul]
  rw [local_trace hc hd (((even_two.mul_right _).mul_right a)) (((even_two.mul_right _).mul_right c)) m hm hA hB hk hl ha hb hp hα ht,
    roots_sum hp hα ht]
  simp only [P]

include hc hd m hm hA hB hk hl ha hb hp hα ht in
theorem piece_trace (b f : ℤ) (s : ℤ×ℤ) (hx : (p:ℤ)∣s.1) (hy : (p:ℤ)∣s.2) :
    (∑ ξ : Option (ZMod p), (piece (p*e) a c b f s) ∣[(2:ℤ)] localRep m ξ) =
      ∑ u : V,(density t u:ℂ) • piece (p*e) a c b f (s+shift e u) := by
  simp only [piece_rows,SlashAction.sum_slash,Finset.smul_sum]
  rw [sum_comm]
  simp_rw [row_trace hc hd m hm hA hB hk hl ha hb hp hα ht _ _ _ _ s hx hy]
  rw [sum_comm]

lemma rect_period {d a κ : ℕ} [NeZero d] [NeZero a] [NeZero κ] (b : ℤ) {r s : ℤ}
    (h : (r:ZMod d)=(s:ZMod d)) (z : ℂ) : rect d a κ b r z=rect d a κ b s z := by
  obtain ⟨j,hj⟩ := (ZMod.intCast_eq_intCast_iff_dvd_sub r s d).mp h
  unfold rect
  apply sum_congr rfl
  intro i _
  apply congrArg (fun y : ZMod (2*κ*a*(2*d)) =>
    TunnellRankOnePacket.packet (2*κ*a) ((2*(κ:ℤ)*b*i.val:ℤ):ZMod (2*κ*a)) z *
      TunnellRankOnePacket.packet (2*κ*a*(2*d)) y z)
  apply (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mpr
  refine ⟨j,?_⟩
  push_cast
  linear_combination 4*(κ:ℤ)*a*hj

end
end TunnellRectangleTrace
#print axioms TunnellRectangleTrace.piece_trace
#print axioms TunnellRectangleTrace.rect_period
