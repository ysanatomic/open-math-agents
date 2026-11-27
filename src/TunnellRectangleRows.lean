import TunnellRectangularLocalTrace
import TunnellRectangularIdeal
import TunnellPlaneDensity

/-! Prime-supported slash traces in the integral residue coordinates of two
quadratic ideal bases. -/
namespace TunnellRectangleRows
open Complex Finset TunnellRankOnePacket TunnellPacketComplement TunnellSplitIndex TunnellPacketCRT
open TunnellLocalizedPacket TunnellRectangularLocalTrace TunnellTraceLifts TunnellRectangularIdeal
open TunnellRamifiedWeyl TunnellRamifiedPlane TunnellLineDensity ModularGroup MatrixGroups ModularForm
open UpperHalfPlane hiding I
open scoped ModularForm
noncomputable section

def raw (D : ℕ) [NeZero D] (r : ℤ) (z : ℍ) : ℂ := packet D (r:ZMod D) z

lemma raw_congr {D H : ℕ} [NeZero D] [NeZero H] (e : D=H) {r s : ℤ} (h : r=s) (z : ℍ) :
    raw D r z=raw H s z := by subst H; subst s; rfl

lemma family_raw {A M B N p : ℕ} [NeZero A] [NeZero M] [NeZero B] [NeZero N] [Fact p.Prime]
    (hc : p.Coprime M) (hd : p.Coprime N) (r s t w : ℤ) (v : ZMod p×ZMod p) (z : ℍ) :
    family hc hd ((r:ZMod A),(s:ZMod M),(t:ZMod B),(w:ZMod N)) v z =
    (raw A r z*raw (p*M) (M*(v.1.val:ℤ)+p*s) z)*
      (raw B t z*raw (p*N) (N*(v.2.val:ℤ)+p*w) z) := by
  rw [family,TunnellRectangularPacket.theta,Fin.prod_univ_four]
  simp only [pack₀,pack₁,pack₂,pack₃,dims₀,dims₁,dims₂,dims₃]
  have h (M : ℕ) (hm : p.Coprime M) (x : ZMod p) (y : ℤ) :
      merge hm (x,(y:ZMod M))=(((M:ℤ)*x.val+p*y:ℤ):ZMod (p*M)) := by
    simpa only [Int.cast_natCast,ZMod.natCast_zmod_val] using merge_lifts hm (x.val:ℤ) y
  change packet A _ (z:ℂ)*packet (p*M) _ (z:ℂ)*packet B _ (z:ℂ)*packet (p*N) _ (z:ℂ)=_
  rw [h _ hc,h _ hd]
  unfold raw
  ring

def row (d a κ : ℕ) [NeZero d] [NeZero a] [NeZero κ] (b i s : ℤ) (z : ℍ) :=
  raw (2*κ*a) (2*κ*b*i) z*raw (2*κ*a*(2*d)) (4*κ*d*i+4*κ*a*s) z

lemma rect_sum {d a κ : ℕ} [NeZero d] [NeZero a] [NeZero κ] (b s : ℤ) (z : ℍ) :
    rect d a κ b s z=∑ i : ZMod a, row d a κ b i.val s z := by
  unfold rect row raw
  apply sum_congr rfl
  intro i _
  congr 2
  ring_nf

variable {p e a c : ℕ} [Fact p.Prime] [NeZero e] [NeZero a] [NeZero c]
local notation "A₀" => (2*1*a)
local notation "B₀" => (2*4*c)
local notation "k₀" => (2*a*e)
local notation "l₀" => (8*c*e)
local notation "V" => ZMod p × ZMod p

def rawOrigin (b i h f j k : ℤ) : Box A₀ (2*k₀) B₀ (2*l₀) :=
  ((2*b*i:ℤ),(4*e*i+4*a*h:ℤ),(8*f*j:ℤ),(16*e*j+16*c*k:ℤ))

lemma rows (hc : p.Coprime (2*k₀)) (hd : p.Coprime (2*l₀)) (b i h f j k : ℤ) (v : V) (z : ℍ) :
    family hc hd (rawOrigin (e:=e) (a:=a) (c:=c) b i h f j k) v z =
      row (p*e) a 1 b i (p*h+e*v.1.val) z * row (p*e) c 4 f j (p*k+e*v.2.val) z := by
  rw [rawOrigin,family_raw]
  unfold row
  congr 1 <;> congr 1 <;> apply raw_congr <;> push_cast <;> ring

end
end TunnellRectangleRows
#print axioms TunnellRectangleRows.rows
