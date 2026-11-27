import TunnellGenusMap

/-! The principal genus theorem and exact number of square roots in the relevant quadratic class group. -/
namespace TunnellPrincipalGenus
open TunnellProperClassGroup TunnellGenusMap TunnellRamifiedClasses TunnellToricClass TunnellToric TunnellShell
noncomputable section
variable {d : ℕ} (hsq : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2) {v : Triple} (hv : v∈shell (2*d))

include hsq in
lemma divisor_card : d.divisors.card=2^d.primeFactors.card := by
  rw [Nat.card_divisors hsq.ne_zero]
  calc _=∏ _p∈d.primeFactors, 2 := by
         apply Finset.prod_congr rfl
         intro p hp; rw [Nat.factorization_eq_one_of_squarefree hsq (Nat.prime_of_mem_primeFactors hp) (Nat.dvd_of_mem_primeFactors hp)]
       _=_ := Finset.prod_const _

include hsq in
lemma bound_two_torsion : letI := group hn h2 hv
    Nat.card (powMonoidHom (α:=ProperIdealClass v) 2).ker ≤ 2^d.primeFactors.card := by
  letI := group hn h2 hv
  let P := powMonoidHom (α:=ProperIdealClass v) 2
  letI := Fintype.ofEquiv ↥(representatives (2*d)) (idealEquiv hn h2 hv).symm
  have cover (x : P.ker) : ∃ a : ↥d.divisors, x.val=cls hn h2 hv (ram_ne_bot (2*d) a.val) := by
    have H : x.val*x.val=1 := by simpa only [P,powMonoidHom_apply,pow_two] using MonoidHom.mem_ker.mp x.property
    obtain ⟨a,ha,e⟩ := ram_classes_cover hn h2 hv x.val (eq_inv_of_mul_eq_one_left H).symm
    exact ⟨⟨a,ha⟩,e⟩
  choose f hf using cover
  have hi : Function.Injective f := by intro x y h; exact Subtype.ext ((hf x).trans (h ▸ (hf y).symm))
  exact (Nat.card_le_card_of_injective f hi).trans_eq ((Nat.card_eq_finsetCard _).trans (divisor_card hsq))

lemma units_sq (a : ℤˣ) : a^2=1 := by
  apply Units.ext
  rcases Int.eq_one_or_neg_one_of_mul_eq_one a.val_inv with h|h <;> simp [h]

theorem finite_group_argument {G H : Type*} [CommGroup G] [Group H] [Finite G] [Finite H]
    (Γ : G →* H) (honto : Function.Surjective Γ) (hH : ∀ x:H, x^2=1)
    (hbd : Nat.card (powMonoidHom (α:=G) 2).ker ≤ Nat.card H) :
    (powMonoidHom (α:=G) 2).range=Γ.ker ∧ Nat.card (powMonoidHom (α:=G) 2).ker=Nat.card H := by
  let P := powMonoidHom (α:=G) 2
  have hle : P.range≤Γ.ker := by
    rintro _ ⟨x,rfl⟩
    change Γ (x^2)=1
    rw [map_pow,hH]
  have hΓ : Nat.card Γ.ker*Nat.card H=Nat.card G := by
    have e := Γ.ker.card_mul_index
    rw [Subgroup.index_ker,MonoidHom.range_eq_top.mpr honto,Nat.card_congr (Subgroup.topEquiv.toEquiv)] at e
    exact e
  have hP : Nat.card P.ker*Nat.card P.range=Nat.card G := by rw [←Subgroup.index_ker]; exact P.ker.card_mul_index
  have hcard : Nat.card Γ.ker≤Nat.card P.range := by
    apply le_of_mul_le_mul_right (a:=Nat.card H) _ Nat.card_pos
    rw [hΓ,←hP,mul_comm _ (Nat.card H)]
    exact Nat.mul_le_mul_right _ hbd
  have he : P.range=Γ.ker := SetLike.ext' (Set.eq_of_subset_of_ncard_le hle (by simpa only [←Nat.card_coe_set_eq,SetLike.coe_sort_coe] using hcard))
  refine ⟨he,?_⟩
  rw [he] at hP
  apply Nat.mul_right_cancel (Nat.card_pos (α:=Γ.ker))
  exact hP.trans (hΓ.symm.trans (mul_comm ..))


include hsq hd in
theorem principal_genus : letI := group hn h2 hv
    (powMonoidHom (α:=ProperIdealClass v) 2).range=(genus hn h2 hv).ker ∧
    Nat.card (powMonoidHom (α:=ProperIdealClass v) 2).ker=2^d.primeFactors.card := by
  letI := group hn h2 hv
  letI := Fintype.ofEquiv ↥(representatives (2*d)) (idealEquiv hn h2 hv).symm
  have hH : Nat.card (↥d.primeFactors → ℤˣ)=2^d.primeFactors.card := by
    rw [Nat.card_fun,Nat.card_eq_fintype_card (α:=ℤˣ),Fintype.card_units_int,Nat.card_eq_finsetCard]
  rw [←hH]
  exact finite_group_argument (genus hn h2 hv) (genus_surj hn h2 hv hd) (fun f => funext fun p => units_sq (f p))
    ((bound_two_torsion hsq hn h2 hv).trans_eq hH.symm)

end
end TunnellPrincipalGenus
#print axioms TunnellPrincipalGenus.principal_genus
