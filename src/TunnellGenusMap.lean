import TunnellGenusCharacter
import TunnellGenusPrimes
import TunnellRamifiedClasses

/-! The map of proper ideal classes to the independent odd ramified genus characters is surjective. -/
namespace TunnellGenusMap
open TunnellIdealHNF TunnellIdealGenerators TunnellClassThetaCount TunnellToricClass TunnellShell TunnellEmbeddedIdeals
open TunnellProperClassGroup TunnellAmbiguousClass TunnellGenusCharacter TunnellGenusPrimes TunnellIdealThetaExpansion
noncomputable section
variable {n p : ℕ} [hpFact : Fact p.Prime] (hn : Squarefree n) (h2 : n%4=2) {v : Triple} (hv : v∈shell n)

def charClass (c : ProperIdealClass v) : ℤ := charI (p:=p) hn h2 (preimage_ne_bot hn h2 hv c.out)
lemma charClass_cls (hp : p∣n) {I : Ideal (R n)} (hI : I≠⊥) : charClass (p:=p) hn h2 hv (cls hn h2 hv hI)=charI (p:=p) hn h2 hI := by
  apply charI_congr hn h2 hv hp
  let c := cls hn h2 hv hI
  calc _=Quotient.mk (idealSetoid v) c.out := congrArg _ (Subtype.ext (image_preimage hn h2 hv c.out))
       _=_ := Quotient.out_eq _

def charHom (hp : p∣n) : letI := group hn h2 hv
    ProperIdealClass v →* ℤ := by
  letI := group hn h2 hv
  refine { toFun := charClass (p:=p) hn h2 hv, map_one' := ?_, map_mul' := ?_ }
  · have e : (1:ProperIdealClass v)=cls hn h2 hv (nonzero_principal (one_ne_zero : (1:R n)≠0)) := (cls_principal hn h2 hv one_ne_zero (nonzero_principal one_ne_zero)).symm
    rw [e,charClass_cls hn h2 hv hp,charI_principal hn h2 hp one_ne_zero]
  · intro a b
    obtain ⟨A,hA,rfl⟩ := TunnellProperClassGroup.exists_rep hn h2 hv a
    obtain ⟨B,hB,rfl⟩ := TunnellProperClassGroup.exists_rep hn h2 hv b
    change charClass (p:=p) hn h2 hv (mul hn h2 hv _ _)=_
    rw [cls_mul,charClass_cls hn h2 hv hp,charClass_cls hn h2 hv hp,charClass_cls hn h2 hv hp,charI_mul hn h2 hp]

variable {d : ℕ} (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))

def genus : letI := group hn h2 hv
    ProperIdealClass v →* (↥d.primeFactors → ℤˣ) := by
  letI := group hn h2 hv
  letI (p : ↥d.primeFactors) : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩
  exact MonoidHom.pi (fun p : ↥d.primeFactors =>
    (charHom (p:=p.val) hn h2 hv ((Nat.dvd_of_mem_primeFactors p.property).trans (dvd_mul_left d 2))).toHomUnits)

lemma genus_eval {I : Ideal (R (2*d))} (hI : I≠⊥) (p : ↥d.primeFactors) :
    letI : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩
    ((genus hn h2 hv (cls hn h2 hv hI) p:ℤˣ):ℤ)=charI (p:=p.val) hn h2 hI := by
  letI : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩
  exact charClass_cls hn h2 hv ((Nat.dvd_of_mem_primeFactors p.property).trans (dvd_mul_left d 2)) hI

theorem genus_surj (hd : d%4=1) : Function.Surjective (genus hn h2 hv) := by
  intro f
  let s (p : ↥d.primeFactors) : Bool := decide ((f p:ℤ) = -1)
  have hs (p : ↥d.primeFactors) : eps (s p)=(f p:ℤ) := by
    unfold eps s
    rcases Int.eq_one_or_neg_one_of_mul_eq_one (f p).val_inv with h|h <;> rw [h] <;> decide
  obtain ⟨q,u,hq,hq',hu,he,hf⟩ := split_prime hd s
  let S : Data (2*d) := ⟨1,q,u,one_pos,hq.pos,hu,by simpa using he⟩
  let I := ideal S
  let z : I := ⟨(q:R (2*d)),by change (⟨(q:ℤ),0⟩:R (2*d))∈ideal S; simpa only [S,Nat.cast_one,one_mul] using real_basis S⟩
  have hI := ideal_ne_bot S
  have hZ : valence z=q := by
    have e : normI I=q := by rw [normI,quotient_card]; simp [S]
    change ((q:R (2*d))).norm.toNat/normI I=q
    have eq : (q:R (2*d)).norm=(q:ℤ)*q := by change (q:ℤ)*q- -(↑(2*d):ℤ)*0*0=_; ring
    rw [eq,e,←Nat.cast_mul,Int.toNat_natCast,Nat.mul_div_cancel _ hq.pos]
  refine ⟨cls hn h2 hv hI,?_⟩
  funext p; apply Units.ext
  letI : Fact p.val.Prime := ⟨Nat.prime_of_mem_primeFactors p.property⟩
  have hp : p.val∣d := Nat.dvd_of_mem_primeFactors p.property
  have hnp : p.val∣2*d := hp.trans (dvd_mul_left _ _)
  have he : (valence z:ZMod p.val)≠0 := by
    intro hh
    have h := (ZMod.natCast_eq_zero_iff q p.val).mp (by simpa only [hZ] using hh)
    have h' := ((Nat.prime_dvd_prime_iff_eq (Fact.out : p.val.Prime) hq).mp h)
    have e := Nat.le_of_dvd (show 0<d by omega) hp
    omega
  rw [genus_eval,charI_eq hn h2 hnp hI z he,hZ,←hs,←hf]
  rw [←jacobiSym.legendreSym.to_jacobiSym,legendreSym,Int.cast_natCast]

end
end TunnellGenusMap
#print axioms TunnellGenusMap.genus_surj
