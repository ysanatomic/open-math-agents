import TunnellSplitIndex
import TunnellPacketOperators

/-! The p-supported weight-two slash transformations of the actual rectangular
theta packet, including the Weyl representative and its local trace. -/
namespace TunnellLocalizedPacket
open Complex Finset TunnellRankOnePacket TunnellRectangularPacket TunnellPacketComplement TunnellSplitIndex
open TunnellPacketOperators TunnellRamifiedPlane TunnellRamifiedWeyl ModularGroup MatrixGroups
open UpperHalfPlane hiding I
open scoped ModularForm ComplexConjugate
noncomputable section
variable {A M B N p : ℕ} [NeZero A] [NeZero M] [NeZero B] [NeZero N] [Fact p.Prime]
local notation "X" => Box A M B N
local notation "V" => ZMod p × ZMod p
local notation "D" => dims A (p*M) B (p*N)
local notation "ψ" => ZMod.stdAddChar (N:=p)

def family (hc : p.Coprime M) (hd : p.Coprime N) (x : X) (v : V) : ℍ→ℂ :=
  theta D (pack hc hd (x,v))

lemma neg_pair_split (hc : p.Coprime M) (hd : p.Coprime N)
    {a t : ZMod p} (ha : (M:ZMod p)=2*a) (hb : (N:ZMod p)= -2*a*t)
    (x y : X) (u v : V) : negPair D (pack hc hd (x,u)) (pack hc hd (y,v)) =
    boxChar A M B N p (-1) x y*ψ (-bil a t u v) := by
  have e := congrArg conj (pair_split hc hd ha hb x y u v)
  rw [map_mul] at e
  rw [negPair]
  simp only [AddChar.map_neg_eq_conj,←map_prod]
  rw [show (∏ i, ZMod.stdAddChar (pack hc hd (x,u) i*pack hc hd (y,v) i))=pair D _ _ from rfl,e]
  congr 1
  simp [boxChar,tensor,char,←AddChar.map_neg_eq_conj,neg_mul]

private lemma sum_rule (hc : p.Coprime M) (hd : p.Coprime N) (K : Index D→Index D→ℂ)
    (L : X→X→ℂ) (Q : V→V→ℂ) (h : ∀ (x y : X) (u v : V),
        K (pack hc hd (x,u)) (pack hc hd (y,v))= L x y*Q u v)
    (hS : ∀ r z, ((theta D r) ∣[(2:ℤ)] S) z=scale D*∑ s, K r s*theta D s z) :
    Law (family hc hd) S (scale D • (left L).comp (plane (matrix Q))) := by
  intro x u z
  rw [family,hS,←(pack hc hd).sum_comp (fun s => K (pack hc hd (x,u)) s*theta D s z),Fintype.sum_prod_type]
  simp only [h,mul_assoc]
  change _ = scale D * (∑ y, L x y • fun v => ∑ w, Q v w*family hc hd y w z) u
  simp only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul,mul_sum,family]

lemma law_plus (hc : p.Coprime M) (hd : p.Coprime N) {a t : ZMod p}
    (ha : (M:ZMod p)=2*a) (hb : (N:ZMod p)= -2*a*t) :
    Law (family (A:=A) (B:=B) hc hd) S (scale D •
      (left (boxChar A M B N p 1)).comp (plane (W a t 1))) := by
  apply sum_rule hc hd (pair D) _ (fun u v => ψ (1*bil a t u v)) _ (theta_S D)
  intro x y u v
  simpa using pair_split hc hd ha hb x y u v

lemma law_minus (hc : p.Coprime M) (hd : p.Coprime N) {a t : ZMod p}
    (ha : (M:ZMod p)=2*a) (hb : (N:ZMod p)= -2*a*t) :
    Law (family (A:=A) (B:=B) hc hd) S (scale D •
      (left (boxChar A M B N p (-1))).comp (plane (W a t (-1)))) := by
  apply sum_rule hc hd (negPair D) _ (fun u v => ψ ((-1)*bil a t u v)) _ (theta_Sminus D)
  intro x y u v
  simpa using neg_pair_split hc hd ha hb x y u v

lemma local_scale : scale D*scale D*((A:ℂ)*(M*(B*N)))=((p:ℂ)^2)⁻¹ := by
  have h := scale_sq D
  rw [←Fintype.card_congr (toIndex A (p*M) B (p*N))] at h
  simp only [Box,Fintype.card_prod,ZMod.card,Nat.cast_mul] at h
  have hp : (p:ℂ)≠0 := by exact_mod_cast (Fact.out : p.Prime).ne_zero
  field_simp
  linear_combination h

variable {k l : ℕ} [NeZero k] [NeZero l]
local notation "D'" => dims A (p*(2*k)) B (p*(2*l))
local notation "X'" => Box A (2*k) B (2*l)

lemma law_T (hc : p.Coprime (2*k)) (hd : p.Coprime (2*l)) (eA : Even A) (eB : Even B)
    (j : ℤ) (hA : 2*(A:ℤ)∣j) (hB : 2*(B:ℤ)∣j) (hk : 4*(k:ℤ)∣j) (hl : 4*(l:ℤ)∣j)
    {a t : ZMod p} (ha : (k:ZMod p)=a) (hb : (l:ZMod p)= -a*t) :
    Law (family (A:=A) (B:=B) hc hd) (T^j) (plane (U a t (j:ZMod p))) := by
  intro x u z
  have he : ∀ i, Even (D' i) := by
    intro i; fin_cases i
    · exact eA
    · exact (even_two.mul_right k).mul_left p
    · exact eB
    · exact (even_two.mul_right l).mul_left p
  rw [family,theta_T D' he,diag_split hc hd eA eB j hA hB hk hl ha hb x u]
  rfl

theorem localized_weyl (hc : p.Coprime (2*k)) (hd : p.Coprime (2*l)) (eA : Even A) (eB : Even B)
    (m : ℤ) (hm : (m:ZMod p)=1)
    (hA : 2*(A:ℤ)∣m) (hB : 2*(B:ℤ)∣m) (hk : 4*(k:ℤ)∣m) (hl : 4*(l:ℤ)∣m)
    {a t : ZMod p} (ha : (k:ZMod p)=a) (hb : (l:ZMod p)= -a*t)
    (x : X') (v : V) (z : ℍ) :
    ((family hc hd x v) ∣[(2:ℤ)] (weylLift m)) z=weyl a t (fun v => family hc hd x v z) v := by
  have ha' : ((2*k:ℕ):ZMod p)=2*a := by push_cast; rw [ha]
  have hb' : ((2*l:ℕ):ZMod p)= -2*a*t := by push_cast; rw [hb]; ring
  apply weyl_slash _ _ _ _ _ _ local_scale _ _ (box_inverse hc hd) _ (law_plus hc hd ha' hb') (law_minus hc hd ha' hb')
  simpa only [Int.cast_neg,hm] using law_T hc hd eA eB (-m) (dvd_neg.mpr hA) (dvd_neg.mpr hB) (dvd_neg.mpr hk) (dvd_neg.mpr hl) ha hb

end
end TunnellLocalizedPacket
#print axioms TunnellLocalizedPacket.localized_weyl
