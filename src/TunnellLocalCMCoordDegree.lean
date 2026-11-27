import TunnellLocalTorsionCoords
import TunnellCMTorsionDegree

/-! # Descent of the local primitive elliptic point to the Gaussian division field -/
namespace TunnellLocalCMCoordDegree
open TunnellCoates TunnellKummer TunnellGaussianEnd TunnellCMTorsionField WeierstrassCurve

noncomputable section
variable {F L B:Type} [Field F] [Field L] [Field B] [Algebra F L] [Algebra F B]
    [DecidableEq F] [DecidableEq L] [DecidableEq B]

lemma coord_map (W : WeierstrassCurve F) (e:L→ₐ[F]B) (P:CurvePoints W L) :
    (coordField W P).map e = coordField W (Affine.Point.map (W':=W.toAffine) e P) := by
  cases P with
  | zero => change (⊥:IntermediateField F L).map e=⊥; simp
  | some x y h =>
    change (IntermediateField.adjoin F {x,y}).map e=IntermediateField.adjoin F {e x,e y}
    rw [IntermediateField.adjoin_map,Set.image_insert_eq,Set.image_singleton]

lemma coord_le (W:WeierstrassCurve F) {P:CurvePoints W L} {A:IntermediateField F L}
    (hp:P∈rationalPoints W A) : coordField W P ≤ A := by
  cases P with
  | zero => exact bot_le
  | some x y h =>
    obtain ⟨hx,hy⟩ := (rationalPoints_some W h).mp hp
    apply IntermediateField.adjoin_le_iff.mpr
    rintro z (rfl|hh)
    · exact hx
    · exact (Set.mem_singleton_iff.mp hh) ▸ hy

lemma finite_coord [CharZero F] (n m : ℕ) (hn : 0 < n) (hm : 0 < m)
    (P:CurvePoints (E (n:F)) L) (ht:m • P=0) : FiniteDimensional F (coordField (E (n:F)) P) := by
  classical
  haveI : CharZero L := charZero_of_injective_algebraMap (algebraMap F L).injective
  cases P with
  | zero => exact inferInstanceAs (FiniteDimensional F (⊥:IntermediateField F L))
  | some x y h =>
    have hW : (E (n:F)).baseChange L=(TunnellCMTranscendental.E n).baseChange L := by
      rw [base_E,map_natCast,TunnellCMTranscendental.model]; rfl
    have hx : IsAlgebraic ℚ x := by
      have he : ∃ y, ∃ h' : ((E (n:F)).baseChange L).toAffine.Nonsingular x y, m • Affine.Point.some x y h'=0 := ⟨y,h,ht⟩
      rw [hW] at he
      obtain ⟨_,h',ht'⟩ := he
      exact TunnellLocalTorsionCoords.algebraic_x n m hn hm h' ht'
    have hy : y^2=x^3-(n:L)^2*x := by
      have e := h.1
      rw [base_E,map_natCast] at e
      exact (E_equation _ _ _).mp e
    let B := algebraicClosure F L
    have hx' : x∈B := mem_algebraicClosure_iff.mpr (hx.tower_top F)
    have hy' : IsAlgebraic F y := by
      apply IsAlgebraic.of_pow (n:=2) (by decide)
      rw [hy]
      exact mem_algebraicClosure_iff.mp (B.sub_mem (B.toSubalgebra.pow_mem hx' (3:ℕ)) (B.mul_mem (B.toSubalgebra.pow_mem (B.natCast_mem n) (2:ℕ)) hx'))
    change FiniteDimensional F (IntermediateField.adjoin F {x,y})
    apply IntermediateField.finiteDimensional_adjoin
    rintro z (rfl|h)
    · exact (hx.tower_top F).isIntegral
    · exact (Set.mem_singleton_iff.mp h) ▸ hy'.isIntegral

lemma endo_iterate {G:Type*} [AddCommGroup G] (I:G→+G) (hi:∀x,I (I x)= -x)
    (c:GaussianInt) (r:ℕ) (P:G) :
    (endo I c.re c.im)^[r] P=endo I (c^r).re (c^r).im P := by
  induction r with
  | zero => simp [endo_apply]
  | succ r ih =>
    rw [Function.iterate_succ_apply',ih,pow_succ]
    simp only [endo_apply,Zsqrtd.re_mul,Zsqrtd.im_mul,map_add,map_zsmul,hi]
    module

theorem embeds_division_field [CharZero F] [Algebra F ℂ] (n : ℕ) (hn : 0<n) [(E (n:F)).IsElliptic]
    (i:F) (hi:i^2= -1) (hI:algebraMap F ℂ i=Complex.I) {p : ℕ} (hp:p.Prime)
    (h2:p≠2) {a:GaussianInt} (ha:a.norm.natAbs=p) (r:ℕ)
    (P:CurvePoints (E (n:F)) L) (hk:cm (n:F) i hi (a^r) P=0)
    [FiniteDimensional F (coordField (E (n:F)) P)] :
    ∃ T : CurvePoints (E (n:F)) (algebraicClosure F ℂ),
      cm (n:F) i hi (a^r) T=0 ∧ addOrderOf T=p^r ∧
      IsAbelianGalois F (coordField (E (n:F)) T) ∧
      FiniteDimensional F (coordField (E (n:F)) T) ∧
      Module.finrank F (coordField (E (n:F)) T)≤(p^r).totient ∧
      Nonempty ((coordField (E (n:F)) P) →ₐ[F] (coordField (E (n:F)) T)) := by
  classical
  let W := E (n:F)
  let A := algebraicClosure F ℂ
  let D := coordField W P
  haveI : FiniteDimensional F D := inferInstanceAs (FiniteDimensional F (coordField (E (n:F)) P))
  let e : D→ₐ[F] ℂ := IsAlgClosed.lift
  let f : D→ₐ[F] A := e.codRestrict (algebraicClosure F ℂ).toSubalgebra (fun d =>
    mem_algebraicClosure_iff.mpr ((isAlgebraic_algHom_iff e e.injective).mpr (Algebra.IsAlgebraic.isAlgebraic d)))
  obtain ⟨Q,hQ⟩ := point_rational W P
  change (Affine.Point.map (W':=W.toAffine) D.val) Q=P at hQ
  have he : coordField W Q=⊤ := by
    apply IntermediateField.map_injective D.val
    rw [coord_map,hQ]
    rw [←AlgHom.fieldRange_eq_map,IntermediateField.fieldRange_val]
  let Q' := (Affine.Point.map (W':=W.toAffine) f) Q
  have hkQ : cm (n:F) i hi (a^r) Q=0 := by
    apply Affine.Point.map_injective (W':=W.toAffine) D.val
    rw [cm_map,hQ,hk,map_zero]
  have hk' : cm (n:F) i hi (a^r) Q'=0 := by dsimp [Q']; rw [←cm_map,hkQ,map_zero]
  obtain ⟨T,hT,ho,hgen,hg,hf,hd⟩ := TunnellCMTorsionDegree.split_field n hn i hi hI hp h2 ha r
  obtain ⟨z,hz⟩ := hgen Q' hk'
  have hsub : coordField W Q' ≤ coordField W T := coord_le W (hz ▸ (rationalPoints W _).zsmul_mem (point_rational W T) z)
  have htop : (⊤:IntermediateField F D).map f = coordField W Q' := by rw [←he,coord_map]
  have hfr : f.fieldRange ≤ coordField W T := (by rw [AlgHom.fieldRange_eq_map,htop]; exact hsub)
  exact ⟨T,hT,ho,hg,hf,hd,⟨f.codRestrict _ (fun d => hfr ⟨d,rfl⟩)⟩⟩

#print axioms embeds_division_field
end
end TunnellLocalCMCoordDegree
