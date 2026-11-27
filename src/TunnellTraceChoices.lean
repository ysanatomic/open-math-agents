import TunnellLineCoefficient
import TunnellUniformBasis

/-! Summing all ramified roots gives zero on the missing genera and the exact frame count on the principal genus. -/
namespace TunnellTraceChoices
open TunnellIdealHNF TunnellIdealFormBasis TunnellRamifiedLines TunnellGluePacket TunnellIntegralPacket TunnellLineCoefficient
open TunnellAllRamifiedLines TunnellUniformBasis TunnellGeometricPacket TunnellGeometricCoefficient TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal
open TunnellBinaryPairModel TunnellClassThetaCount TunnellEmbeddedIdeals TunnellRamifiedClasses TunnellGlueIsometry
open TunnellRamifiedFrameFiber TunnellDyadicGluing TunnellToric TunnellProperClassGroup TunnellGenusMap TunnellPrincipalGenus
open scoped Classical
noncomputable section
variable {d : ℕ}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def Roots (t : (i : P d) → ZMod i.val) := {z : (i : P d) → ZMod i.val // ∀ i, z i^2=t i}
instance root_fintype (t : (i : P d) → ZMod i.val) : Fintype (Roots t) := inferInstanceAs (Fintype (Subtype _))

def signs (hd : Odd d) (t : (i : P d) → ZMod i.val) (ht : ∀ i, t i≠0) {z : (i : P d) → ZMod i.val} (hz : ∀ i, z i^2=t i) :
    (P d → Bool) ≃ Roots t := by
  classical
  let f (e : P d→Bool) : Roots t := ⟨signed z e,by intro i; dsimp [signed]; split <;> simp [hz]⟩
  have hne (i : P d) : -(z i)≠z i := by
    intro he
    have hh : (2:ZMod i.val)*z i=0 := by rw [two_mul,add_eq_zero_iff_eq_neg]; exact he.symm
    rcases mul_eq_zero.mp hh with h|h
    · have e := (Nat.prime_dvd_prime_iff_eq (prime i).out Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff _ _).mp h)
      have H := Nat.dvd_of_mem_primeFactors i.property; rw [e] at H; exact (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr H)
    · apply ht i; rw [←hz i,h,zero_pow (by decide)]
  apply Equiv.ofBijective f
  constructor
  · intro a b he; funext i
    have h := congrArg (fun w : Roots t => w.val i) he
    change (if a i then -(z i) else z i)=(if b i then -(z i) else z i) at h
    have hh := hne i
    cases ha : a i <;> cases hb : b i <;> simp [ha,hb] at h ⊢ <;> first | exact hh h | exact hh h.symm
  · intro w
    let e (i : P d) := decide (w.val i≠z i)
    refine ⟨e,Subtype.ext (funext fun i => ?_)⟩
    have H := sq_eq_sq_iff_eq_or_eq_neg.mp ((w.property i).trans (hz i).symm)
    rcases H with H|H <;> simp [f,signed,e,H,hne i]

variable {I J : Ideal (R (2*d))}
def weight (U : (i : P d) → LocalBasis i.val I) (V : (i : P d) → LocalBasis i.val J) (m : ℕ) :=
  ∑ r : Roots (parameter U V), Nat.card (lineShell U V m r.val)

lemma weight_eq (hd : Odd d) (U : (i : P d) → LocalBasis i.val I) (V : (i : P d) → LocalBasis i.val J)
    (m : ℕ) {z : (i : P d) → ZMod i.val} (hz : ∀ i, z i^2=parameter U V i) :
    weight U V m=∑ e:P d→Bool, Nat.card (lineShell U V m (signed z e)) := by
  have ht (i : P d) : parameter U V i≠0 := by
    have hu : (2:ZMod i.val)≠0 := by
      intro h; have e := (Nat.prime_dvd_prime_iff_eq (prime i).out Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff _ _).mp h)
      have H := Nat.dvd_of_mem_primeFactors i.property; rw [e] at H; exact (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr H)
    exact div_ne_zero (mul_ne_zero (neg_ne_zero.mpr (by simpa only [show (4:ZMod i.val)=2^2 by norm_num] using pow_ne_zero 2 hu)) (V i).unit) (U i).unit
  exact ((signs hd _ ht hz).sum_comp (fun r => Nat.card (lineShell U V m r.val))).symm

lemma inv_sign (u : ℤˣ) : u⁻¹=u := by apply inv_eq_of_mul_eq_one_right; simpa only [←pow_two] using units_sq u

variable (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))

lemma compatible (hs : Squarefree d) (hd : d%4=1) {C : ProperIdealClass v}
    (eC : ∀ i : P d, ((genus hn h2 hv C i:ℤˣ):ℤ)=quadraticChar (ZMod i.val) (-1))
    (hI : I≠⊥) (hJ : J≠⊥) (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) :
    letI := group hn h2 hv
    Nonempty (Roots (parameter U.atPrime V.atPrime)) → ∃ a : ProperIdealClass v×ProperIdealClass v,
      pairMap C a=(cls hn h2 hv hI,cls hn h2 hv hJ) := by
  letI := group hn h2 hv
  let s := cls hn h2 hv hI; let t := cls hn h2 hv hJ
  let Γ := genus hn h2 hv
  rintro ⟨r⟩
  have hγ : Γ (C/(s*t))=1 := by
    funext i; apply Units.ext
    have hp := Nat.dvd_of_mem_primeFactors i.property
    have hodd : i.val≠2 := by intro e; rw [e] at hp; omega
    let A := ((U.atPrime i).A:ZMod i.val); let D := ((V.atPrime i).A:ZMod i.val)
    have pp := TunnellOddDiscriminant.plane_parameter hn (hp.trans (dvd_mul_left d 2)) hodd (U.atPrime i).unit (V.atPrime i).unit
    have ec := pp.2.2.1
    change quadraticChar (ZMod i.val) (parameter U.atPrime V.atPrime i)=_ at ec
    have hr : IsSquare (parameter U.atPrime V.atPrime i) := ⟨r.val i,by rw [←r.property i,pow_two]⟩
    have et : quadraticChar (ZMod i.val) (parameter U.atPrime V.atPrime i)=1 := (quadraticChar_one_iff_isSquare pp.2.1).mpr hr
    rw [et] at ec
    have hU := TunnellUniformBasis.character hn h2 hI U i; have hV := TunnellUniformBasis.character hn h2 hJ V i
    have hU' : ((Γ s i:ℤˣ):ℤ)=quadraticChar (ZMod i.val) ((U.atPrime i).A:ZMod i.val) := (genus_eval hn h2 hv hI i).trans (by simpa [TunnellUniformBasis.Basis.atPrime] using hU)
    have hV' : ((Γ t i:ℤˣ):ℤ)=quadraticChar (ZMod i.val) ((V.atPrime i).A:ZMod i.val) := (genus_eval hn h2 hv hJ i).trans (by simpa [TunnellUniformBasis.Basis.atPrime] using hV)
    rw [←eC i,←hU',←hV'] at ec
    change ((Γ (C/(s*t)) i:ℤˣ):ℤ)=1
    rw [map_div,map_mul,Pi.div_apply,Pi.mul_apply,div_eq_mul_inv,inv_sign,Units.val_mul,Units.val_mul]; linear_combination -ec
  have he : C/(s*t)∈(powMonoidHom (α:=ProperIdealClass v) 2).range := (principal_genus hs hn hd h2 hv).1 ▸ hγ
  obtain ⟨a,ha⟩ := he; change a^2=C/(s*t) at ha
  refine ⟨(a,s*a),Prod.ext ?_ ?_⟩
  · change s*a/a=s; simp
  · change C/(a*(s*a))=t
    apply (div_eq_iff_eq_mul).mpr
    calc C=(C/(s*t))*(s*t) := (div_mul_cancel ..).symm
         _=t*(a*(s*a)) := by rw [←ha,pow_two]; ac_rfl

end
end TunnellTraceChoices
#print axioms TunnellTraceChoices.compatible

