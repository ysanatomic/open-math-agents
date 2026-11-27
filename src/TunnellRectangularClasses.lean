import TunnellUniformBasis

/-! Identification of the rectangular translates with the odd discriminant coordinates of a quadratic ideal. -/
namespace TunnellRectangularClasses
open TunnellIdealHNF TunnellUniformBasis TunnellOddDiscriminant TunnellOddGlueCoordinates TunnellRamifiedLines TunnellGluePacket
open TunnellIntegralPacket
noncomputable section
variable {d : ℕ}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def reduce (i : P d) : ZMod d →+* ZMod i.val := ZMod.castHom (Nat.dvd_of_mem_primeFactors i.property) _

lemma red_ext (hs : Squarefree d) {r s : ZMod d} (h : ∀ i : P d, reduce i r=reduce i s) : r=s := by
  obtain ⟨a,rfl⟩ := ZMod.intCast_surjective r
  obtain ⟨b,rfl⟩ := ZMod.intCast_surjective s
  apply (ZMod.intCast_eq_intCast_iff_dvd_sub a b d).mpr (int_dvd hs fun i => ?_)
  have hi := h i; rw [map_intCast,map_intCast] at hi
  exact (ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp hi

def redEquiv (hs : Squarefree d) : ZMod d ≃ ((i : P d) → ZMod i.val) := by
  apply Equiv.ofBijective (fun s i => reduce i s)
  constructor
  · intro a b h; exact red_ext hs (congrFun h)
  · intro r; obtain ⟨k,hk⟩ := selector r; exact ⟨k,funext fun i => (map_natCast (reduce i) k).trans (hk i)⟩

def selected (a : ℕ) (b : ℤ) (s : ZMod d) (x : ℤ×ℤ) :=
  (x.1:ZMod d)= -(b:ZMod d)*s ∧ (x.2:ZMod d)=(a:ZMod d)*s

lemma selected_iff (hs : Squarefree d) {I : Ideal (R (2*d))} (L : TunnellUniformBasis.Basis d I) (s : ZMod d) (x : I) :
    selected L.a L.b s (L.basis.symm x) ↔ ∀ i : P d, admissible (L.atPrime i) x ∧ coordinate (L.atPrime i) x=reduce i s := by
  let y := L.basis.symm x
  have det (i : P d) : (L.a:ZMod i.val)*(L.c:ZMod i.val)-(L.b:ZMod i.val)^2=0 := by
    have e := congrArg (fun z:ℤ => (z:ZMod i.val)) L.det; push_cast at e; rw [e,(ZMod.natCast_eq_zero_iff _ _).mpr (Nat.dvd_of_mem_primeFactors i.property),mul_zero]
  have unit (i : P d) : (L.a:ZMod i.val)≠0 := by simpa [Basis.atPrime] using (L.atPrime i).unit
  have adm (i : P d) : admissible (L.atPrime i) x ↔ pairing (L.a:ZMod i.val) L.b L.c (redPair y)=0 := by simp [admissible,Basis.atPrime,y]
  have cor (i : P d) : coordinate (L.atPrime i) x=(y.2:ZMod i.val)/(L.a:ZMod i.val) := by simp [coordinate,coord,Basis.atPrime,y]
  constructor
  · rintro ⟨h₁,h₂⟩ i
    have e₁ := congrArg (reduce i) h₁; have e₂ := congrArg (reduce i) h₂
    simp only [map_intCast,map_mul,map_neg,map_natCast] at e₁ e₂
    have e : redPair (p:=i.val) y=(-(L.b:ZMod i.val)*reduce i s,(L.a:ZMod i.val)*reduce i s) := Prod.ext e₁ e₂
    constructor
    · rw [adm]
      exact (radical (unit i) (det i) _).mpr ⟨_,e⟩
    · rw [cor]; change (y.2:ZMod i.val)=_ at e₂; rw [e₂]; field_simp [unit]
  · intro h
    have H (i : P d) : redPair (p:=i.val) y=(-(L.b:ZMod i.val)*reduce i s,(L.a:ZMod i.val)*reduce i s) := by
      have ha := (adm i).mp (h i).1
      obtain ⟨r,hr⟩ := (radical (unit i) (det i) _).mp ha
      have e₂ := congrArg Prod.snd hr; change (y.2:ZMod i.val)=(L.a:ZMod i.val)*r at e₂
      have hc := (h i).2; rw [cor] at hc
      rw [e₂,mul_div_cancel_left₀ _ (unit i)] at hc; rwa [←hc]
    refine ⟨red_ext hs (fun i => ?_),red_ext hs (fun i => ?_)⟩
    · simp only [map_intCast,map_mul,map_neg]; exact congrArg Prod.fst (H i)
    · simp only [map_intCast,map_mul,map_natCast]; exact congrArg Prod.snd (H i)

lemma unique_selected (hs : Squarefree d) {I : Ideal (R (2*d))} (L : TunnellUniformBasis.Basis d I) (x : I) :
    (∀ i : P d, admissible (L.atPrime i) x) →
      ∃! s : ZMod d, selected L.a L.b s (L.basis.symm x) := by
  intro h
  let e := redEquiv hs
  let f (i : P d) := coordinate (L.atPrime i) x
  refine ⟨e.symm f,(selected_iff hs L _ _).mpr (fun i => ⟨h i,(congrFun (e.apply_symm_apply f) i).symm⟩),?_⟩
  intro s hs'
  apply e.injective; rw [e.apply_symm_apply]; funext i
  exact (((selected_iff hs L _ _).mp hs' i).2).symm

end
end TunnellRectangularClasses
#print axioms TunnellRectangularClasses.selected_iff

