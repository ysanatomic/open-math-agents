import TunnellCMEllipticNormTower

/-! An embedding of the actual first division field sends its local generator to
the prescribed analytic generator of the norm-compatible global unit sequence. -/
namespace TunnellCMFirstEmbedding
open NumberField WeierstrassCurve WeierstrassCurve.Affine TunnellKummer TunnellCoates
open TunnellCMTorsionField TunnellCMDivisionNorm TunnellCMCoherentPoints TunnellCMCoherentFields
open TunnellCMAlgebraicKernel TunnellCMNormDistribution TunnellCMEllipticNormTower
open scoped Classical NumberField
noncomputable section

theorem orbit {K T B : Type} [Field K] [Field T] [Field B] [DecidableEq T] [DecidableEq B]
    [Algebra K T] [Algebra K B] [FiniteDimensional K T] [Algebra.IsSeparable K T] [IsAlgClosed B]
    (W : WeierstrassCurve K) (φ : CurvePoints W B →+ CurvePoints W B) [Fintype φ.ker]
    (S : CurvePoints W T) (hs : S≠0) (hgen : coordField W S=⊤)
    (h₀ : ∀ e : T →ₐ[K] B, φ (Point.map (W' := W.toAffine) e S)=0)
    (hd : Module.finrank K T=Fintype.card φ.ker-1) (P : CurvePoints W B) (hP : P≠0) (hp : φ P=0) :
    ∃ e : T →ₐ[K] B, Point.map (W' := W.toAffine) e S=P ∧ e.fieldRange=coordField W P := by
  let f (e : T →ₐ[K] B) : {x : φ.ker // x ≠ 0} :=
    ⟨⟨Point.map (W' := W.toAffine) e S,h₀ e⟩,fun eq => hs ((Point.map_injective e)
      ((congrArg Subtype.val eq).trans (map_zero _).symm))⟩
  have hi : Function.Injective f := by
    intro e g eq
    have h : Point.map (W' := W.toAffine) e S=Point.map (W' := W.toAffine) g S := congrArg (fun a => a.val.val) eq
    cases S with
    | zero => exact (hs rfl).elim
    | some x y hh =>
      have eqxy:=Point.some.inj h
      change IntermediateField.adjoin K {x,y}=⊤ at hgen
      ext a
      have ha : a∈IntermediateField.adjoin K {x,y} := hgen ▸ trivial
      induction ha using IntermediateField.adjoin_induction with
      | mem z hz => rcases hz with rfl|hz; exact eqxy.1; obtain rfl:=Set.mem_singleton_iff.mp hz; exact eqxy.2
      | algebraMap => simp
      | add _ _ _ _ e f => simp only [map_add,e,f]
      | mul _ _ _ _ e f => simp only [map_mul,e,f]
      | inv _ _ h => simp only [map_inv₀,h]
  have hc : Fintype.card (T →ₐ[K] B)=Fintype.card {x : φ.ker // x ≠ 0} := by
    rw [AlgHom.card K T B,hd,Fintype.card_subtype_compl,Fintype.card_subtype_eq]
  let t : {x : φ.ker // x ≠ 0} := ⟨⟨P,hp⟩,fun h => hP (congrArg Subtype.val h)⟩
  obtain ⟨e,he⟩ := ((Fintype.bijective_iff_injective_and_card f).mpr ⟨hi,hc⟩).2 t
  have eq : Point.map (W' := W.toAffine) e S=P := congrArg (fun a => a.val.val) he
  refine ⟨e,eq,?_⟩
  rw [←eq,←TunnellLocalCMCoordDegree.coord_map,hgen,AlgHom.fieldRange_eq_map]

local notation "B" => algebraicClosure ℚ ℂ
variable (K : Type) [Field K] [NumberField K] [Algebra K B] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) [(E (n:K)).IsElliptic] (i : K) (hi : i^2= -1)
  (hiC : ((algebraMap K B i:B):ℂ)=Complex.I) {p : ℕ} (hp : p.Prime) (h₂ : p≠2) (q : GaussianInt) (hq : q.norm.natAbs=p)

include hiC h₂ in
theorem prescribed {T : Type} [Field T] [Algebra K T] [FiniteDimensional K T] [DecidableEq T]
    (S : CurvePoints (E (n:K)) T) (hs : cm (n:K) i hi q S=0) (ho : addOrderOf S=p)
    (hgen : coordField (E (n:K)) S=⊤) (hd : Module.finrank K T=p-1) :
    ∃ e : T →ₐ[K] B, Point.map (W' := (E (n:K)).toAffine) e S=primitive K n hn hp q hq 1 ∧
      e.fieldRange=level K n hn hp q hq 1 := by
  letI : IsAlgClosure K B := closed_over K
  letI : IsAlgClosed B := IsAlgClosure.isAlgClosed K
  let φ:=cm (L:=B) (n:K) i hi q
  let v:=kernel_equiv K n hn i hi hiC hp q hq
  have hc : Nat.card φ.ker=p := (Nat.card_congr v).trans (gram_card n hn hp h₂ hq)
  letI : Finite φ.ker := Nat.finite_of_card_ne_zero (hc.trans_ne hp.ne_zero)
  letI : Fintype φ.ker := Fintype.ofFinite _
  have H:=generates K n hn hp q hq i hi hiC h₂ 1
  simp only [pow_one] at H
  have nonzero {A : Type} [AddCommGroup A] (a : A) (e : addOrderOf a=p) : a≠0 := by
    rintro rfl; rw [addOrderOf_zero] at e; exact hp.ne_one e.symm
  apply orbit (E (n:K)) φ S (nonzero _ ho) hgen _ _ _ (nonzero _ H.2.1) H.1
  · intro e; change cm (n:K) i hi q _=0; rw [←cm_map,hs,map_zero]
  · rw [←Nat.card_eq_fintype_card,hc,hd]

end
end TunnellCMFirstEmbedding
#print axioms TunnellCMFirstEmbedding.prescribed
