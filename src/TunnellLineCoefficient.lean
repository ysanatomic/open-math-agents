import TunnellGeometricCoefficient
import TunnellRamifiedFrameFiber

/-! Exact odd-degree coefficient of the ramified binary-ideal trace. -/
namespace TunnellLineCoefficient
open TunnellIdealHNF TunnellIdealFormBasis TunnellOddGlueCoordinates TunnellRamifiedLines TunnellGluePacket TunnellIntegralPacket
open TunnellGeometricPacket TunnellGeometricCoefficient TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal
open TunnellBinaryPairModel TunnellClassThetaCount TunnellEmbeddedIdeals TunnellRamifiedClasses TunnellGlueIsometry
open TunnellRamifiedFrameFiber TunnellDyadicGluing TunnellToric TunnellProperClassGroup
open scoped Classical
noncomputable section
variable {d : ℕ} {I J : Ideal (R (2*d))}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

variable (U : (i : P d) → LocalBasis i.val I) (V : (i : P d) → LocalBasis i.val J)
def lineShell (m : ℕ) (r : (i : P d) → ZMod i.val) :=
  {x : I×J // good U V x ∧ packet U V x∈linePacket r ∧ value x=(d:ℤ)^2*m}

lemma recovered (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥) (hodd : Odd d)
    (X : AddSubgroup (I×J)) (hD : ∀ y : I×J, (d:ℤ) • y∈X) (hN : ∀ x∈X, (d:ℤ)^2∣value x)
    (r : (i : P d) → ZMod i.val) (he : X.map (packet U V)=linePacket r) (x : I×J) :
    x∈X ↔ good U V x ∧ packet U V x∈linePacket r := by
  have hgood x hx := valid U V hn h2 hI hJ hodd X hD hN (x:=x) hx
  constructor
  · intro hx; exact ⟨hgood x hx,he ▸ (show packet U V x∈X.map (packet U V) from ⟨x,hx,rfl⟩)⟩
  · rintro ⟨hg,hx⟩; rw [←he] at hx
    obtain ⟨y,hy,ey⟩ := hx
    have hδ (i : P d) := (Nat.dvd_of_mem_primeFactors i.property).trans (dvd_mul_left d 2)
    have H (i : P d) := congrFun ey i
    obtain ⟨u,eu⟩ := ideal_dvd hs (by omega) hI (x:=x.1-y.1) (fun i => (no_coordinate (hδ i) (U i) (admissible_sub _ (hg i).1 (hgood y hy i).1)).mp (by rw [map_sub]; exact sub_eq_zero.mpr (congrArg Prod.fst (H i)).symm))
    obtain ⟨v,ev⟩ := ideal_dvd hs (by omega) hJ (x:=x.2-y.2) (fun i => (no_coordinate (hδ i) (V i) (admissible_sub _ (hg i).2 (hgood y hy i).2)).mp (by rw [map_sub]; exact sub_eq_zero.mpr (congrArg Prod.snd (H i)).symm))
    have e : x-y=(d:ℤ) • (u,v) := Prod.ext eu ev
    have hxy : x-y∈X := e ▸ hD (u,v)
    simpa only [sub_add_cancel] using X.add_mem hxy hy

variable {v : Triple} (hv : v∈shell (2*d))

lemma rep_cls (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {I : Ideal (R (2*d))} (hI : I≠⊥) :
    TunnellGlueIsometry.rep hv hn h2 hI=idealEquiv hn h2 hv (cls hn h2 hv hI) := rfl

theorem odd_coefficient {m : ℕ} (hm : Odd m) (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2)
    {A B C₀ : Ideal (R (2*d))} (hA : A≠⊥) (hB : B≠⊥) (hC : C₀≠⊥) {u : Q} (hu : u∈TunnellToricClass.J (-v) v) (hu0 : u≠0)
    (ec : image hv C₀=line u*TunnellToricClass.J v (-v))
    (U : (i : P d) → LocalBasis i.val (plusI B A)) (V : (i : P d) → LocalBasis i.val (minusI B A C₀)) :
    letI := group hn h2 hv
    letI := TunnellFullClassTheta.classFintype hn h2 hv
    let a := (cls hn h2 hv hA,cls hn h2 hv hB)
    let C := cls hn h2 hv hC
    ∃ z : (i : P d) → ZMod i.val, (∀ i, z i^2=parameter U V i) ∧
      ∑ e : P d→Bool, Nat.card (lineShell U V m (TunnellAllRamifiedLines.signed z e)) =
      ∑ q : {b : ProperIdealClass v×ProperIdealClass v // pairMap C b=pairMap C a},
        geom d m (idealEquiv hn h2 hv q.val.2).val (idealEquiv hn h2 hv q.val.1).val := by
  classical
  letI := group hn h2 hv
  letI := TunnellFullClassTheta.classFintype hn h2 hv
  let a := (cls hn h2 hv hA,cls hn h2 hv hB)
  let C := cls hn h2 hv hC
  let X := gluing hv u A B C₀
  have hodd : Odd d := Nat.odd_iff.mpr (by omega)
  obtain ⟨_,hD,hN,_⟩ := properties hv hs hn h2 hodd hA hB hC hu hu0 ec
  obtain ⟨z,hz,E,he⟩ := geometric hv hs hn h2 hodd hA hB hC hu hu0 ec U V
  let F := frameEquiv hn h2 hv hs hd C a
  have hI : plusI B A≠⊥ := mul_ne_bot (by omega) hB (conj_ne_bot hA)
  have hJ : minusI B A C₀≠⊥ := mul_ne_bot (by omega) (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA)
  have hm' (r : ↥d.divisors) := recovered U V hs hn h2 hI hJ hodd (X r) (hD r) (hN r) _ (he r)
  let f (e : P d→Bool) := Nat.card (lineShell U V m (TunnellAllRamifiedLines.signed z e))
  let g (q : {b : ProperIdealClass v×ProperIdealClass v // pairMap C b=pairMap C a}) := geom d m (idealEquiv hn h2 hv q.val.2).val (idealEquiv hn h2 hv q.val.1).val
  refine ⟨z,hz,?_⟩; change ∑ e, f e=∑ q, g q
  rw [←E.sum_comp f,←F.sum_comp g]
  apply Finset.sum_congr rfl; intro r _
  have eq : f (E r)=Nat.card (SubShell d m (X r) value) := by
    apply Nat.card_congr
    apply Equiv.subtypeEquivRight
    intro x; change (good U V x ∧ _ ∧ _) ↔ _ ∧ _
    rw [hm' r x]; exact and_assoc.symm
  rw [eq,show Nat.card (SubShell d m (X r) value)=_ from coeff hm hn h2 hv hA hB hC hu hu0 ec r]
  change _=geom d m (idealEquiv hn h2 hv (F r).val.2).val (idealEquiv hn h2 hv (F r).val.1).val
  have ef := frame_apply hs hn hd h2 hv C a r
  change (F r).val=(cls hn h2 hv hA*cls hn h2 hv (ram_ne_bot _ r.val),cls hn h2 hv hB*cls hn h2 hv (ram_ne_bot _ r.val)) at ef
  have hm {I : Ideal (R (2*d))} (hI : I≠⊥) : cls hn h2 hv hI*cls hn h2 hv (ram_ne_bot _ r.val)=cls hn h2 hv (mul_ne_bot (by omega) hI (ram_ne_bot _ r.val)) := cls_mul hn h2 hv hI (ram_ne_bot _ r.val)
  rw [ef,rep_cls,rep_cls]; dsimp only; rw [hm,hm]

end
end TunnellLineCoefficient
#print axioms TunnellLineCoefficient.odd_coefficient

