import TunnellJoinedGeometric

/-! Exact coefficient comparison between a binary-pair overlattice and its Hurwitz norm count. -/
namespace TunnellGeometricCoefficient
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellPairComponents TunnellIdealGluings TunnellBinaryPairModel TunnellFrameNorm
open TunnellGlueIsometry TunnellClassThetaCount TunnellRamifiedSwitch TunnellFilteredGlue TunnellGlueMaximal TunnellRamifiedClasses
open TunnellGlueNorms TunnellIntegralPacket TunnellGeometricPacket TunnellTwoProjection TunnellDyadicGluing
open TunnellBrandt TunnellHurwitzFour TunnellRamifiedTwoOrder TunnellToric
noncomputable section

def HShell (d m : ℕ) (s t : Triple) := {q : Q // q∈O ∧ admits d s t q ∧ Quaternion.normSq q=(m:ℚ)}

lemma geom_card {d m : ℕ} (hm : Odd m) (s t : Triple) : Nat.card (HShell d m s t)=geom d m t s := by
  classical
  let F := (normShell m).filter fun q => admits d s t (hamZ q)
  let f (x : ↥F) : HShell d m s t := ⟨hamZ x.val,⟨x.val,rfl⟩,(Finset.mem_filter.mp x.property).2,
    by rw [norm_ham,(mem_normShell hm _).mp (Finset.mem_filter.mp x.property).1]; simp⟩
  have hI : Function.Injective f := by intro x y e; apply Subtype.ext; exact ham_injective (congrArg Subtype.val e)
  have hS : Function.Surjective f := by
    rintro ⟨q,⟨x,rfl⟩,ha,hN⟩
    rw [norm_ham] at hN
    exact ⟨⟨x,Finset.mem_filter.mpr ⟨(mem_normShell hm x).mpr (by exact_mod_cast hN),ha⟩⟩,rfl⟩
  exact (Nat.card_congr (Equiv.ofBijective f ⟨hI,hS⟩)).symm.trans (Nat.card_eq_finsetCard F)

variable {M : Type*} [AddCommGroup M]
def SubShell (d m : ℕ) (X : AddSubgroup M) (V : M→ℤ) := {x:M // x∈X ∧ V x=(d:ℤ)^2*m}

lemma shell_bij (d m : ℕ) (hd : d≠0) (N : ℚ) (hN : N≠0)
    (e : M→+ Q) (hi : Function.Injective e) (V : M→ℤ) (hn : ∀ x, Quaternion.normSq (e x)=N*(V x:ℚ)) {s t : Triple}
    {D L : Lattice} (eL : e.range.toIntSubmodule=L) {b c : Q} (hb : b≠0) (hc : c≠0)
    (hnr : Quaternion.normSq b*Quaternion.normSq c=N) (hD : D=transport b c O) (hL : L=transport b c (pairL s t)) :
    Nonempty (SubShell d m (numerator d e D) V ≃ HShell d m s t) := by
  classical
  have hd' : (d:ℚ)^2≠0 := pow_ne_zero _ (by exact_mod_cast hd)
  have same {x : M} {q:Q} (eq : (d:Q)*action b c q=e x) : V x=(d:ℤ)^2*m ↔ Quaternion.normSq q=(m:ℚ) := by
    have he := congrArg Quaternion.normSq eq
    have hdQ : Quaternion.normSq (d:Q)=(d:ℚ)^2 := by simpa only [Quaternion.coe_natCast] using Quaternion.normSq_coe (d:ℚ)
    rw [map_mul,act_norm b c _ hnr,hdQ,hn] at he
    have e' : (d:ℚ)^2*Quaternion.normSq q=(V x:ℚ) := by apply mul_left_cancel₀ hN; linear_combination he
    constructor
    · intro h; rw [h] at e'; push_cast at e'; exact mul_left_cancel₀ hd' e'
    · intro h; rw [h] at e'; exact_mod_cast e'.symm
  have F (x : SubShell d m (numerator d e D) V) : ∃ q : HShell d m s t, (d:Q)*action b c q.val=e x.val := by
    obtain ⟨w,hw,ew⟩ := (mem_num d e D x.val).mp x.property.1
    obtain ⟨y,hy,rfl⟩ := mem_transport.mp (hD ▸ hw)
    have hz : (d:Q)*action b c y∈L := ew ▸ (eL ▸ (show e x.val∈e.range.toIntSubmodule from ⟨x.val,rfl⟩))
    rw [hL,action_nat,action_mem hb hc] at hz
    exact ⟨⟨y,hy,(admits_mem ..).mpr hz,(same ew).mp x.property.2⟩,ew⟩
  choose f hf using F
  have fi : Function.Injective f := by
    intro x y he; apply Subtype.ext; apply hi; rw [←hf x,←hf y,he]
  have fs : Function.Surjective f := by
    intro q
    have hq : (d:Q)*action b c q.val∈L := by rw [hL,action_nat,action_mem hb hc]; exact (admits_mem ..).mp q.property.2.1
    obtain ⟨x,ex⟩ : ∃ x, e x=(d:Q)*action b c q.val := by rw [←eL] at hq; exact hq
    have hqD : action b c q.val∈D := hD ▸ (action_mem hb hc O q.val).mpr q.property.1
    let X : SubShell d m (numerator d e D) V := ⟨x,(mem_num d e D x).mpr ⟨_,hqD,ex.symm⟩,(same ex.symm).mpr q.property.2.2⟩
    refine ⟨X,Subtype.ext (action_inj hb hc (mul_left_cancel₀ (nat_nonzero hd) ((hf X).trans ex)))⟩
  exact ⟨Equiv.ofBijective f ⟨fi,fs⟩⟩

theorem coeff {d m : ℕ} (hm : Odd m) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))
    {A B C₀ : Ideal (R (2*d))} (hA : A≠⊥) (hB : B≠⊥) (hC : C₀≠⊥) {u : Q} (hu : u∈J (-v) v) (hu0 : u≠0)
    (ec : image hv C₀=line u*J v (-v)) (r : ↥d.divisors) :
    let hA' := mul_ne_bot (by omega : 0<2*d) hA (ram_ne_bot (2*d) r.val)
    let hB' := mul_ne_bot (by omega : 0<2*d) hB (ram_ne_bot (2*d) r.val)
    Nat.card (SubShell d m (gluing hv u A B C₀ r) value)=geom d m (TunnellGlueIsometry.rep hv hn h2 hB').val (TunnellGlueIsometry.rep hv hn h2 hA').val := by
  classical
  obtain ⟨hr,h₀⟩ := Nat.mem_divisors.mp r.property
  obtain ⟨b,c,hb,hc,hNr,hD,hL⟩ := frames hv hn h2 hA hB (Nat.pos_of_dvd_of_pos hr (by omega)) (hr.trans (dvd_mul_left ..))
  have hi := injective hv hn (by omega) (by simpa [pure_neg] using hu.2) hu0 (plusI B A) (minusI B A C₀)
  have N : (normI B:ℚ)*normI A≠0 := mul_ne_zero (by exact_mod_cast (normI_positive (by omega) B hB).ne') (by exact_mod_cast (normI_positive (by omega) A hA).ne')
  obtain ⟨E⟩ := shell_bij d m (by omega) _ N _ hi _ (eval_norm hv hn h2 hA hB hC hu hu0 ec) (range_eq hv hn h2 (by simpa [pure_neg] using hu.2) hu0 ec B A) hb hc hNr hD hL
  exact (Nat.card_congr E).trans (geom_card hm _ _)

end
end TunnellGeometricCoefficient
#print axioms TunnellGeometricCoefficient.coeff

