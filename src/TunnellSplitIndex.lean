import TunnellPacketComplement
import TunnellRectangularPacket
import TunnellRamifiedWeyl

/-! Orthogonal p-primary coordinates for the rectangular discriminant group
(A, pM, B, pN). -/
namespace TunnellSplitIndex
open Finset Complex TunnellPacketComplement TunnellPacketCRT TunnellRectangularPacket
open TunnellRamifiedWeyl TunnellRamifiedPlane
noncomputable section

abbrev dims (A H B K : ℕ) : Fin 4 → ℕ := ![A,H,B,K]

lemma dims₀ (A H B K : ℕ) : dims A H B K 0=A := rfl
lemma dims₁ (A H B K : ℕ) : dims A H B K 1=H := rfl
lemma dims₂ (A H B K : ℕ) : dims A H B K 2=B := rfl
lemma dims₃ (A H B K : ℕ) : dims A H B K 3=K := rfl

instance dims_pos {A H B K : ℕ} [NeZero A] [NeZero H] [NeZero B] [NeZero K] (i : Fin 4) :
    NeZero (dims A H B K i) := by fin_cases i <;> assumption

def toIndex (A H B K : ℕ) : Box A H B K ≃ Index (dims A H B K) where
  toFun b := Fin.cons b.1 (Fin.cons b.2.1 (Fin.cons b.2.2.1 (Fin.cons b.2.2.2 (fun i => Fin.elim0 i))))
  invFun r := (r 0,r 1,r 2,r 3)
  left_inv b := rfl
  right_inv r := by funext i; fin_cases i <;> rfl

variable {A M B N p : ℕ} [NeZero A] [NeZero M] [NeZero B] [NeZero N] [Fact p.Prime]
local notation "X" => Box A M B N
local notation "V" => ZMod p × ZMod p
local notation "D" => dims A (p*M) B (p*N)
local notation "ψ" => ZMod.stdAddChar (N:=p)

def pack (hc : p.Coprime M) (hd : p.Coprime N) : X × V ≃ Index D where
  toFun w := toIndex _ _ _ _ (w.1.1,merge hc (w.2.1,w.1.2.1),w.1.2.2.1,merge hd (w.2.2,w.1.2.2.2))
  invFun r :=
    let b := (toIndex _ _ _ _).symm r
    let u := (merge hc).symm b.2.1
    let v := (merge hd).symm b.2.2.2
    ((b.1,u.2,b.2.2.1,v.2),(u.1,v.1))
  left_inv w := by simp
  right_inv r := by
    simp only [Prod.mk.eta,merge,Equiv.apply_symm_apply,Equiv.symm_apply_apply]


lemma pack₀ (hc : p.Coprime M) (hd : p.Coprime N) (x : X) (u : V) : pack hc hd (x,u) 0=x.1 := rfl
lemma pack₁ (hc : p.Coprime M) (hd : p.Coprime N) (x : X) (u : V) : pack hc hd (x,u) 1=merge hc (u.1,x.2.1) := rfl
lemma pack₂ (hc : p.Coprime M) (hd : p.Coprime N) (x : X) (u : V) : pack hc hd (x,u) 2=x.2.2.1 := rfl
lemma pack₃ (hc : p.Coprime M) (hd : p.Coprime N) (x : X) (u : V) : pack hc hd (x,u) 3=merge hd (u.2,x.2.2.2) := rfl

lemma pair_split (hc : p.Coprime M) (hd : p.Coprime N)
    {a t : ZMod p} (ha : (M:ZMod p)=2*a) (hb : (N:ZMod p)= -2*a*t)
    (x y : X) (u v : V) : pair D (pack hc hd (x,u)) (pack hc hd (y,v)) =
    boxChar A M B N p 1 x y*ψ (bil a t u v) := by
  unfold pair
  rw [Fin.prod_univ_four]
  simp only [pack₀,pack₁,pack₂,pack₃,dims₀,dims₁,dims₂,dims₃]
  change ZMod.stdAddChar (x.1*y.1:ZMod A) *
    ZMod.stdAddChar (merge hc (u.1,x.2.1)*merge hc (v.1,y.2.1):ZMod (p*M)) *
    ZMod.stdAddChar (x.2.2.1*y.2.2.1:ZMod B) *
    ZMod.stdAddChar (merge hd (u.2,x.2.2.2)*merge hd (v.2,y.2.2.2):ZMod (p*N))=_
  rw [fourier_split hc u.1 v.1 x.2.1 y.2.1,fourier_split hd u.2 v.2 x.2.2.2 y.2.2.2]
  have e : bil a t u v=(M:ZMod p)*u.1*v.1+N*u.2*v.2 := by rw [ha,hb]; unfold bil; ring
  rw [e,AddChar.map_add_eq_mul]
  simp only [boxChar,tensor,char,Int.cast_one,one_mul]
  ring

lemma diag_split {k l : ℕ} [NeZero k] [NeZero l] (hc : p.Coprime (2*k)) (hd : p.Coprime (2*l))
    (eA : Even A) (eB : Even B) (j : ℤ) (hA : 2*(A:ℤ)∣j) (hB : 2*(B:ℤ)∣j)
    (hk : 4*(k:ℤ)∣j) (hl : 4*(l:ℤ)∣j) {a t : ZMod p}
    (ha : (k:ZMod p)=a) (hb : (l:ZMod p)= -a*t) (x : Box A (2*k) B (2*l)) (u : V) :
    TunnellRectangularPacket.diag (dims A (p*(2*k)) B (p*(2*l))) j (pack hc hd (x,u))=ψ ((j:ZMod p)*form a t u) := by
  unfold TunnellRectangularPacket.diag
  rw [Fin.prod_univ_four]
  simp only [pack₀,pack₁,pack₂,pack₃,dims₀,dims₁,dims₂,dims₃]
  rw [translate_trivial eA j hA,translate_trivial eB j hB,translate_split hc j hk,translate_split hd j hl,
    one_mul,mul_one,←AddChar.map_add_eq_mul,ha,hb]
  congr 1
  unfold form
  ring

end
end TunnellSplitIndex
#print axioms TunnellSplitIndex.pair_split
#print axioms TunnellSplitIndex.diag_split
