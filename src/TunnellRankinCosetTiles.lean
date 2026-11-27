import TunnellRankinPeriodization

/-! Integral coset and translation coordinates for the unfolding. -/
namespace TunnellRankinIntegral
open Matrix MatrixGroups ModularGroup CongruenceSubgroup TunnellRankinEisenstein
noncomputable section

lemma t_row (n : ℤ) (g : SL(2,ℤ)) (j : Fin 2) : (T^n*g).val 1 j=g.val 1 j := by
  change ((T^n).val*g.val) 1 j=_
  simp [coe_T_zpow,Matrix.mul_apply,Fin.sum_univ_two]

lemma trans_mat {g : SL(2,ℤ)} (hc : g 1 0=0) (he : g 1 1=1) : g=T^(g 0 1) := by
  have det := g.det_coe
  rw [Matrix.det_fin_two,hc,he] at det
  have ha : g 0 0=1 := by simpa using det
  ext i j
  fin_cases i <;> fin_cases j <;> simp [ha,hc,he,coe_T_zpow,show (1:Fin (0+2))=(1:Fin 2) from rfl]

lemma translation_of_row {g h : SL(2,ℤ)} (eq : ∀ j, g 1 j=h 1 j) : ∃ n : ℤ, g=T^n*h := by
  let m := g*h⁻¹
  have hc : m 1 0=0 := by
    change (g.val*(h⁻¹).val) 1 0=0
    rw [Matrix.mul_apply,Fin.sum_univ_two,SpecialLinearGroup.SL2_inv_expl]
    simp [Matrix.mul_apply,Fin.sum_univ_two,eq]; ring
  have he : m 1 1=1 := by
    have det := h.det_coe
    rw [Matrix.det_fin_two] at det
    change (g.val*(h⁻¹).val) 1 1=1
    rw [Matrix.mul_apply,Fin.sum_univ_two,SpecialLinearGroup.SL2_inv_expl]
    simp [Matrix.mul_apply,Fin.sum_univ_two,eq]; linear_combination det
  exact ⟨m 0 1,by rw [←trans_mat hc he]; simp [m]⟩

def translationRow {L : ℕ} (p : ℤ×Rows L) : Gamma0 L :=
  ⟨T^p.1*(liftRow p.2).val, Gamma0_mem.mpr (by rw [t_row]; exact Gamma0_mem.mp (liftRow p.2).property)⟩

lemma translationRow_row {L : ℕ} (p : ℤ×Rows L) : matrixRow (translationRow p)=p.2 := by
  rw [←liftRow_spec p.2]
  apply Subtype.ext; apply Prod.ext <;> exact t_row _ _ _

lemma translationRow_bijective (L : ℕ) : Function.Bijective (translationRow (L:=L)) := by
  constructor
  · rintro ⟨n,r⟩ ⟨m,t⟩ eq
    have e := congrArg matrixRow eq
    simp only [translationRow_row] at e
    change r=t at e
    subst t
    have eh := congrArg Subtype.val eq
    change T^n*(liftRow r).val=T^m*(liftRow r).val at eh
    have ee := congrArg (fun g : SL(2,ℤ) => g 0 1) (mul_right_cancel eh)
    simp [coe_T_zpow] at ee
    subst m; rfl
  · intro g
    let r := matrixRow g
    have e := liftRow_spec r
    have ej (j : Fin 2) : g.val 1 j=(liftRow r).val 1 j := by
      fin_cases j
      · exact congrArg (fun x : Rows L => x.val.1) e.symm
      · exact congrArg (fun x : Rows L => x.val.2) e.symm
    obtain ⟨n,hn⟩ := translation_of_row ej
    exact ⟨(n,r),Subtype.ext hn.symm⟩

abbrev Cosets (L : ℕ) := SL(2,ℤ) ⧸ Gamma0 L

def rep {L : ℕ} (q : Cosets L) : SL(2,ℤ) := q.out⁻¹

def cosetProd {L : ℕ} (p : Cosets L × Gamma0 L) : SL(2,ℤ) := p.2.val*rep p.1

lemma cosetProd_class {L : ℕ} (q : Cosets L) (g : Gamma0 L) :
    (QuotientGroup.mk (cosetProd (q,g))⁻¹:Cosets L)=q := by
  change QuotientGroup.mk ((g.val*q.out⁻¹)⁻¹)=q
  rw [_root_.mul_inv_rev,inv_inv,QuotientGroup.mk_mul_of_mem _ ((Gamma0 L).inv_mem g.property)]
  exact Quotient.out_eq' _

lemma cosetProd_bijective (L : ℕ) : Function.Bijective (cosetProd (L:=L)) := by
  constructor
  · rintro ⟨q,g⟩ ⟨w,h⟩ eq
    have e := congrArg (fun γ : SL(2,ℤ) => (QuotientGroup.mk γ⁻¹:Cosets L)) eq
    rw [cosetProd_class,cosetProd_class] at e
    subst w
    exact Prod.ext rfl (Subtype.ext (mul_right_cancel eq))
  · intro g
    let q : Cosets L := QuotientGroup.mk g⁻¹
    have he : ((g⁻¹:SL(2,ℤ)):Cosets L)=((q.out:SL(2,ℤ)):Cosets L) := (Quotient.out_eq' q).symm
    have hh := QuotientGroup.eq.mp he
    rw [inv_inv] at hh
    exact ⟨(q,⟨g*q.out,hh⟩),by simp [cosetProd,rep]⟩

def tiles (L : ℕ) : Cosets L × (ℤ × Rows L) ≃ SL(2,ℤ) :=
  (Equiv.prodCongr (Equiv.refl _) (Equiv.ofBijective _ (translationRow_bijective L))).trans
    (Equiv.ofBijective _ (cosetProd_bijective L))

lemma tiles_apply {L : ℕ} (q : Cosets L) (n : ℤ) (r : Rows L) :
    tiles L (q,n,r)=T^n*(liftRow r).val*rep q := rfl
end
end TunnellRankinIntegral
#print axioms TunnellRankinIntegral.tiles
