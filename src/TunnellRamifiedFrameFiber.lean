import TunnellGeometricPacket
import TunnellComponentFibers

/-! Ramified-divisor frames enumerate the entire fiber of the map to the two binary ideal classes. -/
namespace TunnellRamifiedFrameFiber
open TunnellIdealHNF TunnellToricClass TunnellToric TunnellShell TunnellRamifiedClasses TunnellProperClassGroup
open TunnellPrincipalGenus TunnellSwitchComponents TunnellComponentFibers TunnellBinaryPairModel TunnellClassThetaCount
noncomputable section
variable {G : Type*} [CommGroup G]

def pairMap (C : G) (a : G×G) := (a.2/a.1,C/(a.1*a.2))

def pairFiber (C : G) (a : G×G) :
    (powMonoidHom (α:=G) 2).ker ≃ {b : G×G // pairMap C b=pairMap C a} := by
  let f (k : (powMonoidHom (α:=G) 2).ker) := (a.1*k.val,a.2*k.val)
  have h (k : (powMonoidHom (α:=G) 2).ker) : pairMap C (f k)=pairMap C a := by
    have hh : k.val^2=1 := k.property
    apply Prod.ext
    · change (a.2*k.val)/(a.1*k.val)=a.2/a.1; simp
    · change C/((a.1*k.val)*(a.2*k.val))=C/(a.1*a.2)
      rw [show (a.1*k.val)*(a.2*k.val)=(a.1*a.2)*k.val^2 by rw [pow_two]; ac_rfl,hh,mul_one]
  refine Equiv.ofBijective (fun k => ⟨f k,h k⟩) ⟨?_,?_⟩
  · intro k l e
    exact Subtype.ext (mul_left_cancel (congrArg (fun x : {b : G×G // _} => x.val.1) e))
  · rintro ⟨b,e⟩
    have e₁ := congrArg Prod.fst e; have e₂ := congrArg Prod.snd e
    change b.2/b.1=a.2/a.1 at e₁
    change C/(b.1*b.2)=C/(a.1*a.2) at e₂
    have hb : b.1*b.2=a.1*a.2 := div_right_inj.mp e₂
    let k := b.1/a.1
    have h₁ : a.1*k=b.1 := by simp [k]
    have h₂ : a.2*k=b.2 := by
      change a.2*(b.1/a.1)=b.2
      calc _=(a.2/a.1)*b.1 := by simp only [div_eq_mul_inv]; ac_rfl
           _=_ := by rw [←e₁,div_mul_cancel]
    have hk : k^2=1 := by
      apply mul_left_cancel (a:=a.1*a.2)
      calc (a.1*a.2)*k^2=(a.1*k)*(a.2*k) := by rw [pow_two]; ac_rfl
           _=_ := by rw [h₁,h₂,hb,mul_one]
    exact ⟨⟨k,hk⟩,Subtype.ext (Prod.ext h₁ h₂)⟩

lemma pairFiber_apply (C : G) (a : G×G) (k : (powMonoidHom (α:=G) 2).ker) :
    (pairFiber C a k).val=(a.1*k.val,a.2*k.val) := rfl

variable {d : ℕ} (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))

def ramK (a : ↥d.divisors) : letI := group hn h2 hv
    (powMonoidHom (α:=ProperIdealClass v) 2).ker := by
  letI := group hn h2 hv
  refine ⟨cls hn h2 hv (ram_ne_bot _ a.val),?_⟩
  have ⟨ha,h0⟩ := Nat.mem_divisors.mp a.property
  have h := ram_square hn h2 (Nat.pos_of_dvd_of_pos ha (Nat.pos_of_ne_zero h0)) (ha.trans (dvd_mul_left ..))
  change (cls hn h2 hv (ram_ne_bot _ a.val))^2=1
  rw [pow_two]
  change mul hn h2 hv _ _=one hn h2 hv
  have hne : (a.val:R (2*d))≠0 := Nat.cast_ne_zero.mpr (Nat.pos_of_dvd_of_pos ha (Nat.pos_of_ne_zero h0)).ne'
  rw [cls_mul]; exact (cls_congr hn h2 hv h).trans (cls_principal hn h2 hv hne (by rw [←h]; exact mul_ne_bot (by omega) (ram_ne_bot _ _) (ram_ne_bot _ _)))

def ambigEquiv (hs : Squarefree d) (hd : d%4=1) : letI := group hn h2 hv
    ↥d.divisors ≃ (powMonoidHom (α:=ProperIdealClass v) 2).ker := by
  letI := group hn h2 hv
  classical
  letI := Fintype.ofEquiv ↥(representatives (2*d)) (idealEquiv hn h2 hv).symm
  have ho : Function.Surjective (ramK hn hd h2 hv) := by
    rintro ⟨c,hc⟩; change c^2=1 at hc; rw [pow_two] at hc
    obtain ⟨a,ha,e⟩ := ram_classes_cover hn h2 hv c (eq_inv_of_mul_eq_one_left hc).symm
    exact ⟨⟨a,ha⟩,Subtype.ext e.symm⟩
  have hcard : Fintype.card ↥d.divisors=Fintype.card (powMonoidHom (α:=ProperIdealClass v) 2).ker := by
    rw [Fintype.card_coe,divisor_card hs,←Nat.card_eq_fintype_card,(principal_genus hs hn hd h2 hv).2]
  exact Equiv.ofBijective (ramK hn hd h2 hv) ((Fintype.bijective_iff_surjective_and_card _).mpr ⟨ho,hcard⟩)

def frameEquiv (hs : Squarefree d) (hd : d%4=1) (C : ProperIdealClass v) (a : ProperIdealClass v×ProperIdealClass v) : letI := group hn h2 hv
    ↥d.divisors ≃ {b : ProperIdealClass v×ProperIdealClass v // pairMap C b=pairMap C a} := by
  letI := group hn h2 hv
  exact (ambigEquiv hn h2 hv hs hd).trans (pairFiber C a)

theorem frame_apply (C : ProperIdealClass v) (a : ProperIdealClass v×ProperIdealClass v) (r : ↥d.divisors) : letI := group hn h2 hv
    (frameEquiv hn h2 hv hs hd C a r).val=(a.1*cls hn h2 hv (ram_ne_bot _ r.val),a.2*cls hn h2 hv (ram_ne_bot _ r.val)) := by
  letI := group hn h2 hv; rfl

theorem classes {A B C : Ideal (R (2*d))} (hA : A≠⊥) (hB : B≠⊥) (hC : C≠⊥) : letI := group hn h2 hv
    pairMap (cls hn h2 hv hC) (cls hn h2 hv hA,cls hn h2 hv hB)=
      (cls hn h2 hv (mul_ne_bot (by omega) hB (conj_ne_bot hA)),cls hn h2 hv (mul_ne_bot (by omega) (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA))) := by
  letI := group hn h2 hv
  have hm {I J : Ideal (R (2*d))} (hI : I≠⊥) (hJ : J≠⊥) : cls hn h2 hv hI*cls hn h2 hv hJ=cls hn h2 hv (mul_ne_bot (by omega) hI hJ) := cls_mul hn h2 hv hI hJ
  apply Prod.ext
  · change cls hn h2 hv hB/cls hn h2 hv hA=_
    rw [div_eq_mul_inv,inv_cls,hm]
  · change cls hn h2 hv hC/(cls hn h2 hv hA*cls hn h2 hv hB)=_
    rw [div_eq_mul_inv,mul_inv_rev,inv_cls,inv_cls]
    calc _=(cls hn h2 hv (conj_ne_bot hB)*cls hn h2 hv hC)*cls hn h2 hv (conj_ne_bot hA) := by ac_rfl
         _=_ := by rw [hm,hm]

end
end TunnellRamifiedFrameFiber
#print axioms TunnellRamifiedFrameFiber.frame_apply
#print axioms TunnellRamifiedFrameFiber.classes

