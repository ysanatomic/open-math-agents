import TunnellGluePacket
import TunnellGlueMaximal

/-! Exact finite trace for a family of integral binary-pair overlattices. -/
namespace TunnellIntegralPacket
open TunnellIdealHNF TunnellOddDiscriminant TunnellOddGlueCoordinates TunnellRamifiedLines
open TunnellIdealFormBasis TunnellGluePacket TunnellIdealThetaExpansion TunnellGenusCharacter
noncomputable section
variable {d : ℕ} {I J : Ideal (R (2*d))}
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def value (x : I×J) : ℤ := (valence x.1:ℤ)+4*(valence x.2:ℤ)

lemma chart_value {p : ℕ} [Fact p.Prime] (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥)
    (L : LocalBasis p I) (x : I) : (valence x:ℤ)=quad L.A L.B L.C (L.basis.symm x) := by
  have e := L.norm (L.basis.symm x)
  rw [L.basis.apply_symm_apply,norm_valZ hn h2 hI,mul_comm] at e
  exact mul_left_cancel₀ (show (normI I:ℤ)≠0 by exact_mod_cast (normI_positive (by omega) I hI).ne') e

variable (U : (i : P d) → LocalBasis i.val I) (V : (i : P d) → LocalBasis i.val J)

lemma valid (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥) (hd : Odd d)
    (X : AddSubgroup (I×J)) (hD : ∀ y : I×J, (d:ℤ) • y∈X) (hN : ∀ x∈X, (d:ℤ)^2∣value x)
    {x : I×J} (hx : x∈X) : good U V x := by
  intro i
  have hp := Nat.dvd_of_mem_primeFactors i.property
  have hodd : i.val≠2 := by intro h; rw [h] at hp; exact (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr hp)
  have hu : (2:ZMod i.val)≠0 := by
    intro ee; exact hodd ((Nat.prime_dvd_prime_iff_eq (prime i).out Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 i.val).mp ee))
  have he (z : I×J) := congrArg₂ (fun (a b : ℤ) => a+4*b) (chart_value hn h2 hI (U i) z.1) (chart_value hn h2 hJ (V i) z.2)
  have addD (y : I×J) := dvd_sub (hN (x+(d:ℤ) • y) (X.add_mem hx (hD y))) (hN x hx)
  constructor
  · apply radical_of_values 1 d (by omega) hp (by simpa using hu)
    intro y; have h := addD ((U i).basis y,0)
    change (d:ℤ)^2 ∣ ((valence _ :ℤ)+4*_)-((valence _ :ℤ)+4*_) at h
    change (d:ℤ)^2 ∣ value (x+(d:ℤ) • ((U i).basis y,0))-value x at h
    rw [show value (x+(d:ℤ) • ((U i).basis y,0))=_ from he _,show value x=_ from he x] at h
    simpa [map_add,map_zsmul] using h
  · apply radical_of_values 4 d (by omega) hp (by simpa [show (8:ZMod i.val)=2^3 by norm_num] using pow_ne_zero 3 hu)
    intro y; have h := addD (0,(V i).basis y)
    rw [show value (x+(d:ℤ) • (0,(V i).basis y))=_ from he _,show value x=_ from he x] at h
    simpa only [Prod.fst_add,Prod.snd_add,Prod.smul_fst,Prod.smul_snd,smul_zero,add_zero,map_add,map_zsmul,
      AddEquiv.symm_apply_apply,Nat.cast_ofNat,mul_sub,add_sub_add_left_eq_sub] using h

def parameter (i : P d) := -(4:ZMod i.val)*(V i).A/(U i).A

theorem trace (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥) (hd : Odd d)
    (X : ↥d.divisors → AddSubgroup (I×J)) (hi : Function.Injective X)
    (hD : ∀ a (y : I×J), (d:ℤ) • y∈X a) (hN : ∀ a x, x∈X a → (d:ℤ)^2∣value x)
    (hmax : ∀ a (i : P d), ∃ x∈X a, ¬∃ y : I×J, x=(i.val:ℤ) • y) :
    ∃ r : (i : P d) → ZMod i.val, (∀ i, r i^2=parameter U V i) ∧
      ∃ E : ↥d.divisors ≃ (P d → Bool), ∀ a, (X a).map (packet U V)=linePacket (TunnellAllRamifiedLines.signed r (E a)) := by
  classical
  let S a := (X a).map (packet U V)
  have hgood a x := valid U V hn h2 hI hJ hd (X a) (hD a) (hN a) (x:=x)
  have hin : Function.Injective S := by
    intro a b e; apply hi
    exact le_antisymm (distinguish U V hs (by omega) (dvd_mul_left ..) hI hJ (hgood a) (hgood b) (hD b) e.le)
      (distinguish U V hs (by omega) (dvd_mul_left ..) hI hJ (hgood b) (hgood a) (hD a) e.ge)
  have hpd (i : P d) := (Nat.dvd_of_mem_primeFactors i.property).trans (dvd_mul_left d 2)
  have hxQ a (x : Packet d) (hx : x∈S a) (i : P d) : (x i).1^2=parameter U V i*(x i).2^2 := by
    obtain ⟨z,hz,rfl⟩ := hx
    have hh := hgood a z hz i
    apply square_condition (U i).det (V i).det hn (hpd i) (U i).unit (V i).unit _ _ hh.1 hh.2
    rw [←chart_value hn h2 hI,←chart_value hn h2 hJ]
    exact (pow_dvd_pow_of_dvd (by exact_mod_cast Nat.dvd_of_mem_primeFactors i.property : (i.val:ℤ)∣d) 2).trans (hN a z hz)
  have hnon a (i : P d) : ∃ x∈S a, x i≠0 := by
    obtain ⟨x,hx,hnx⟩ := hmax a i
    refine ⟨_,⟨x,hx,rfl⟩,fun he => hnx ?_⟩
    obtain ⟨u,eu⟩ := (no_coordinate (hpd i) (U i) (hgood a x hx i).1).mp (congrArg Prod.fst he)
    obtain ⟨v,ev⟩ := (no_coordinate (hpd i) (V i) (hgood a x hx i).2).mp (congrArg Prod.snd he)
    exact ⟨(u,v),Prod.ext eu ev⟩
  apply TunnellAllRamifiedLines.exhaustive hs hd (parameter U V) _ S hin hxQ hnon
  intro i
  have hp := Nat.dvd_of_mem_primeFactors i.property
  have hu : (2:ZMod i.val)≠0 := by
    intro e; have eq := (Nat.prime_dvd_prime_iff_eq (prime i).out Nat.prime_two).mp ((ZMod.natCast_eq_zero_iff 2 i.val).mp e)
    rw [eq] at hp; exact (Nat.not_even_iff_odd.mpr hd) (even_iff_two_dvd.mpr hp)
  exact div_ne_zero (mul_ne_zero (neg_ne_zero.mpr (by simpa [show (4:ZMod i.val)=2^2 by norm_num] using pow_ne_zero 2 hu)) (V i).unit) (U i).unit

end
end TunnellIntegralPacket
#print axioms TunnellIntegralPacket.trace

