import TunnellGlueNorms

/-! The quaternionic lattices realize every isotropic line choice for their common binary ideal pair. -/
namespace TunnellGeometricPacket
open TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal TunnellEmbeddedIdeals
open TunnellIdealHNF TunnellPairComponents TunnellSwitchComponents TunnellIdealGluings TunnellBinaryPairModel
open TunnellFrameNorm TunnellIntertwinerTheta TunnellGlueIsometry TunnellGenusCharacter TunnellClassThetaCount TunnellIdealThetaExpansion
open TunnellRamifiedSwitch TunnellFilteredGlue TunnellGlueMaximal TunnellRamifiedClasses TunnellGlueNorms TunnellIntegralPacket
open TunnellIdealFormBasis TunnellRamifiedLines TunnellGluePacket TunnellFramedGlue
noncomputable section

variable {M : Type*} [AddCommGroup M]
def numerator (d : ℕ) (e : M →+ Q) (D : Lattice) : AddSubgroup M :=
  (line (d:Q)*D).toAddSubgroup.comap e
lemma mem_num (d : ℕ) (e : M →+ Q) (D : Lattice) (x : M) :
    x∈numerator d e D ↔ ∃ q∈D, (d:Q)*q=e x := Submodule.mem_span_singleton_mul

lemma range_in (d : ℕ) {e : M →+ Q} {D L : Lattice} (he : e.range.toIntSubmodule=L) (hle : L≤D) (x : M) :
    (d:ℤ) • x∈numerator d e D := by
  rw [mem_num,map_zsmul,zsmul_eq_mul,Int.cast_natCast]
  exact ⟨e x,hle (he ▸ (show e x∈e.range.toIntSubmodule from ⟨x,rfl⟩)),rfl⟩

lemma pairL_le (s t : Triple) : pairL s t≤O := by
  apply sup_le (fun _ h => h.1)
  intro x hx; obtain ⟨y,hy,rfl⟩ := Submodule.mem_span_singleton_mul.mp hx
  simpa only [zsmul_eq_mul,Int.cast_ofNat] using O.smul_mem (2:ℤ) hy.1

lemma recover {d : ℕ} (hd : d≠0) {e : M →+ Q} {D D' K K' L : Lattice} (eL : e.range.toIntSubmodule=L)
    (hK : ∀ q, q∈K ↔ q∈D ∧ (d:Q)*q∈L) (hK' : ∀ q, q∈K' ↔ q∈D' ∧ (d:Q)*q∈L)
    (h : numerator d e D ≤ numerator d e D') : K≤K' := by
  intro q hq; obtain ⟨hx,hy⟩ := (hK _).mp hq
  obtain ⟨x,ex⟩ : ∃ x, e x=(d:Q)*q := by rw [←eL] at hy; exact hy
  obtain ⟨q',hq',eq⟩ := (mem_num _ _ _ _).mp (h ((mem_num _ _ _ _).mpr ⟨q,hx,ex.symm⟩))
  exact (hK' _).mpr ⟨(mul_left_cancel₀ (nat_nonzero hd) (eq.trans ex)) ▸ hq',hy⟩

lemma maximal {d p : ℕ} [Fact p.Prime] (hp : p∣d) (hp2 : p≠2) (hn : Squarefree (2*d)) (hd : 0<d)
    {s t : Triple} (hs : s∈shell (2*d)) (ht : t∈shell (2*d)) {e : M →+ Q} {D L : Lattice} (eL : e.range.toIntSubmodule=L)
    {b c : Q} (hb : b≠0) (hc : c≠0) (hD : D=transport b c O) (hL : L=transport b c (pairL s t)) :
    ∃ x∈numerator d e D, ¬∃ y:M, x=(p:ℤ) • y := by
  obtain ⟨q,hq,ha,h₀⟩ := nonzero hp hp2 hn hd hs ht
  have hq' : action b c q∈D := hD ▸ (action_mem hb hc O q).mpr hq
  have hqL : (d:Q)*action b c q∈L := by rw [hL,action_nat,action_mem hb hc]; exact (admits_mem ..).mp ha
  obtain ⟨x,ex⟩ : ∃ x, e x=(d:Q)*action b c q := by rw [←eL] at hqL; exact hqL
  refine ⟨x,(mem_num _ _ _ _).mpr ⟨_,hq',ex.symm⟩,?_⟩
  rintro ⟨y,rfl⟩
  rw [map_zsmul,zsmul_eq_mul,Int.cast_natCast] at ex
  have hdv : (d:Q)=(p:Q)*((d/p:ℕ):Q) := by rw [←Nat.cast_mul,Nat.mul_div_cancel' hp]
  rw [hdv,mul_assoc] at ex
  have her := mul_left_cancel₀ (nat_nonzero (Fact.out:p.Prime).ne_zero) ex
  have hmem : e y∈L := eL ▸ (show e y∈e.range.toIntSubmodule from ⟨y,rfl⟩)
  rw [her,action_nat,hL,action_mem hb hc] at hmem
  exact h₀ hmem

variable {d : ℕ} {v : Triple} (hv : v∈shell (2*d))
local notation "Ord" => TunnellIdealHNF.R (2*d)
local notation "ι" => TunnellHurwitz.pure
private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

def orders (A B : Ideal Ord) (r : ↥d.divisors) := sandwich hv B (conjugate A) (glue hv r.val)
def gluing (u : Q) (A B C₀ : Ideal Ord) (r : ↥d.divisors) := numerator d (eval hv u (plusI B A) (minusI B A C₀)) (orders hv A B r)

theorem properties (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hodd : Odd d)
    {A B C₀ : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥) (hC : C₀≠⊥)
    {u : Q} (hu : u∈J (-v) v) (hu0 : u≠0) (ec : image hv C₀=line u*J v (-v))
    : let X := gluing hv u A B C₀
      Function.Injective X ∧ (∀ r (y : (plusI B A)×(minusI B A C₀)), (d:ℤ) • y∈X r) ∧
      (∀ r x, x∈X r → (d:ℤ)^2∣value x) ∧ (∀ r (i : P d), ∃ x∈X r, ¬∃ y : (plusI B A)×(minusI B A C₀), x=(i.val:ℤ) • y) := by
  classical
  let e := eval hv u (plusI B A) (minusI B A C₀)
  let L := sandwich hv B (conjugate A) (binary v)
  let D := orders hv A B
  let X := gluing hv u A B C₀
  let K (r : ↥d.divisors) := sandwich hv B (conjugate A) (TunnellFilteredGlue.filt d v (glue hv r.val))
  have h₀ : 0<d := by omega
  have hI : plusI B A≠⊥ := mul_ne_bot (by omega) hB (conj_ne_bot hA)
  have hJ : minusI B A C₀≠⊥ := mul_ne_bot (by omega) (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA)
  have eL : e.range.toIntSubmodule=L := range_eq hv hn h2 (by simpa [pure_neg] using hu.2) hu0 ec B A
  have hK (r : ↥d.divisors) (q : Q) : q∈K r ↔ q∈D r ∧ (d:Q)*q∈L := filtered hv hn h2 hA hB r.val q
  have hi : Function.Injective X := by
    intro a b eq; apply distinct hs hn hodd h2 hv hB (conj_ne_bot hA)
    exact le_antisymm (recover h₀.ne' eL (hK a) (hK b) eq.le) (recover h₀.ne' eL (hK b) (hK a) eq.ge)
  have F (r : ↥d.divisors) : ∃ s∈shell (2*d), ∃ t∈shell (2*d), ∃ b c : Q, b≠0 ∧ c≠0 ∧
      Quaternion.normSq b*Quaternion.normSq c=(normI B:ℚ)*normI A ∧ D r=transport b c O ∧ L=transport b c (pairL s t) := by
    obtain ⟨hr,hd0⟩ := Nat.mem_divisors.mp r.property
    obtain ⟨b,c,hb,hc,hnr,hD,hL⟩ := frames hv hn h2 hA hB (Nat.pos_of_dvd_of_pos hr h₀) (hr.trans (dvd_mul_left ..))
    refine ⟨_,(Finset.mem_filter.mp (rep hv hn h2 (mul_ne_bot (by omega) hA (ram_ne_bot _ r.val))).property).1,
      _,(Finset.mem_filter.mp (rep hv hn h2 (mul_ne_bot (by omega) hB (ram_ne_bot _ r.val))).property).1,b,c,hb,hc,hnr,hD,hL⟩
  refine ⟨hi,?_,?_,?_⟩
  · intro r x; obtain ⟨s,_,t,_,b,c,hb,hc,_,hD,hL⟩ := F r
    apply range_in d eL _ x
    change L≤D r; rw [hL,hD]; exact mul_le_mul_left (mul_le_mul_right (pairL_le s t) _) _
  · intro r x hx; obtain ⟨s,_,t,_,b,c,hb,hc,hNr,hD,_⟩ := F r
    obtain ⟨q,hq,eq⟩ := (mem_num d e (D r) x).mp hx
    obtain ⟨y,hy,rfl⟩ := mem_transport.mp (hD ▸ hq)
    obtain ⟨k,hk⟩ := norm_int hy
    have ee := congrArg Quaternion.normSq eq
    rw [map_mul,act_norm b c _ hNr,hk,eval_norm hv hn h2 hA hB hC hu hu0 ec] at ee
    have eN : Quaternion.normSq (d:Q)=(d:ℚ)^2 := by simpa only [Quaternion.coe_natCast] using Quaternion.normSq_coe (d:ℚ)
    rw [eN] at ee
    have hp : (normI B:ℚ)*normI A≠0 := mul_ne_zero (by exact_mod_cast (normI_positive (by omega) B hB).ne') (by exact_mod_cast (normI_positive (by omega) A hA).ne')
    refine ⟨k,?_⟩
    have h : (value x:ℚ)=(d:ℚ)^2*k := by apply mul_left_cancel₀ hp; linear_combination -ee
    exact_mod_cast h
  · intro r i; obtain ⟨s,hs',t,ht',b,c,hb,hc,_,hD,hL⟩ := F r
    have hp := Nat.dvd_of_mem_primeFactors i.property
    have hp2 : i.val≠2 := by intro he; rw [he] at hp; exact (Nat.not_even_iff_odd.mpr hodd) (even_iff_two_dvd.mpr hp)
    exact maximal hp hp2 hn h₀ hs' ht' eL hb hc hD hL

theorem geometric (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hodd : Odd d)
    {A B C₀ : Ideal Ord} (hA : A≠⊥) (hB : B≠⊥) (hC : C₀≠⊥)
    {u : Q} (hu : u∈J (-v) v) (hu0 : u≠0) (ec : image hv C₀=line u*J v (-v))
    (U : (i : P d) → LocalBasis i.val (plusI B A)) (V : (i : P d) → LocalBasis i.val (minusI B A C₀)) :
    ∃ z : (i : P d) → ZMod i.val, (∀ i, z i^2=parameter U V i) ∧
      ∃ E : ↥d.divisors ≃ (P d → Bool), ∀ r, (gluing hv u A B C₀ r).map (packet U V)=linePacket (TunnellAllRamifiedLines.signed z (E r)) := by
  obtain ⟨hi,hD,hN,hmax⟩ := properties hv hs hn h2 hodd hA hB hC hu hu0 ec
  exact TunnellIntegralPacket.trace U V hs hn h2 (mul_ne_bot (by omega) hB (conj_ne_bot hA))
    (mul_ne_bot (by omega) (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA)) hodd _ hi hD hN hmax

end
end TunnellGeometricPacket
#print axioms TunnellGeometricPacket.geometric

