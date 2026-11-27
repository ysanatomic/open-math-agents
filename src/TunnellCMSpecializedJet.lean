import TunnellCMIntegralSlope
import TunnellCMFormalNormJet
import TunnellCMLocalEvaluation

/-! Local evaluation and reduction of the very same coefficient-norm function
whose values satisfy the global field-norm distribution. -/
namespace TunnellCMSpecializedJet
open Complex LSG.Weierstrass WeierstrassCurve WeierstrassCurve.Affine IntermediateField
open IsLocalRing IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
open TunnellCoates TunnellKummer TunnellCMLemniscate TunnellCMCritical TunnellCMLSeries
open TunnellCMUnitTrace TunnellCMCriticalCoordinates TunnellCMCriticalIntegers TunnellCMCriticalCoefficients
open TunnellCMEllipticUnit TunnellCMDistribution TunnellCMModelUnit TunnellCMIntegralCoefficients
open TunnellCMIntegralSlope TunnellCMCoefficientNorm TunnellFormalQuarter
open scoped Classical NumberField
noncomputable section
local notation "AlgC" => algebraicClosure ℚ ℂ

lemma coords_eq {M : Type} [Field M] [DecidableEq M] {V V' : WeierstrassCurve M} (e : V=V')
    (P : V.toAffine.Point) : X (Point.equivOfEq e P)=X P ∧ Y (Point.equivOfEq e P)=Y P := by
  subst e; exact ⟨rfl,rfl⟩

lemma y_map {K F M : Type} [Field K] [Field F] [Field M] [Algebra K F] [Algebra K M]
    [DecidableEq F] [DecidableEq M] (V : WeierstrassCurve K) (g : F →ₐ[K] M) (P : CurvePoints V F) :
    Y (Point.map (W':=V.toAffine) g P)=g (Y P) := by
  cases P with
  | zero => exact (map_zero g).symm
  | some => rfl

variable (K : Type) [Field K] [NumberField K] [Algebra K AlgC] [DecidableEq K]
variable (n : ℕ) (hn : 0<n) {F : IntermediateField K AlgC} (D : Data K n hn F) [FiniteDimensional K F]
local notation "W" => E (n:K)
local notation "I₀" => support n hn
local notation "J" => divisionGrid (twistPeriods n hn) (aux n)
local notation "Em" => F →ₐ[K] AlgC
local notation "N" => normalClosure K F AlgC
variable {p : ℕ} [Fact p.Prime]

def embedding {L : Type} [Field L] [Algebra K L] (e : N →ₐ[ℚ] ℚ_[p])
    (f : ℚ_[p] →+* L) (hf : ∀ a : K, f (e (algebraMap K N a))=algebraMap K L a)
    (σ : Em) : F →ₐ[K] L :=
  ⟨f.comp (e.toRingHom.comp (conjugate K σ).toRingHom),fun a => by
    change f (e (conjugate K σ (algebraMap K F a)))=_
    rw [AlgHom.commutes,hf]⟩

lemma embedding_inj {L : Type} [Field L] [Algebra K L] (e : N →ₐ[ℚ] ℚ_[p])
    (f : ℚ_[p] →+* L) (hf : ∀ a : K, f (e (algebraMap K N a))=algebraMap K L a) :
    Function.Injective (embedding K e f hf) := by
  intro σ τ eq
  apply AlgHom.ext; intro a
  exact congrArg Subtype.val (e.injective (f.injective (DFunLike.congr_fun eq a)))

variable {R M : Type} [CommRing R] [IsDedekindDomain R] [Field M] [CharZero M] [Algebra R M]
  [IsFractionRing R M] (v : HeightOneSpectrum R) [DecidableEq (v.adicCompletion M)] [Algebra K (v.adicCompletion M)]
local notation "O" => v.adicCompletionIntegers M
local notation "L" => v.adicCompletion M
local notation "ρ" => Ideal.Quotient.mk ((maximalIdeal O)^2)

theorem expansion (e : N →ₐ[ℚ] ℚ_[p]) (C : Coordinates K n hn D p e)
    (f : ℚ_[p] →+* L) (h : ℤ_[p] →+* O) (hf : ∀ a : K, f (e (algebraMap K N a))=algebraMap K L a)
    (hc : ∀ z : ℤ_[p], (h z:L)=f z)
    [(E ((n:O):L)).IsElliptic] (Z : (E (n:O)).formalGroupLaw.Points) (hZ : (Z ():O)≠0)
    (P : CurvePoints W L) (he : (W).baseChange L=E ((n:O):L)) (hP : Point.equivOfEq he P=toPoint (n:O) Z) :
    ∃ u u₀ : Oˣ, ((u:O):L)=∏ σ : Em, atEmbedding W D.u D.c (fun i : I₀ => weight n i.val) (embedding K e f hf σ) P ∧
      ((u₀:O):L)=∏ σ : Em, atEmbedding W D.u D.c (fun i : I₀ => weight n i.val) (embedding K e f hf σ) 0 ∧
      ρ ((u/u₀:Oˣ):O)=1+ρ (Z ():O)*ρ (h (firstCoefficient K n hn D C)) := by
  let g := embedding K e f hf
  let E' := Point.equivOfEq he
  let U (σ : Em) (i : I₀) := Point.map (W' := (W).toAffine) (g σ) (D.u i)
  let V (σ : Em) (i : I₀) := E' (U σ i)
  have hx (σ : Em) (i : I₀) : (h (C.x σ i):L)=X (V σ i) := by
    rw [hc,C.hx]; exact ((coords_eq he (U σ i)).1.trans (x_map W (g σ) (D.u i))).symm
  have hy (σ : Em) (i : I₀) : (h (C.y σ i):L)=Y (V σ i) := by
    rw [hc,C.hy]; exact ((coords_eq he (U σ i)).2.trans (y_map W (g σ) (D.u i))).symm
  have ha (σ : Em) (j : J) : (h (C.c σ j):L)=g σ (D.c j) := by rw [hc,C.hc]; rfl
  have hnz (σ : Em) (i : I₀) : V σ i≠0 := fun eq => shift_nonzero K n hn D i <|
    (Point.map_injective (g σ)) (E'.injective (eq.trans (map_zero _).symm) |>.trans (map_zero _).symm)
  have hU (σ : Em) (i : I₀) : (E ((n:O):L)).toAffine.Nonsingular (h (C.x σ i):L) (h (C.y σ i):L) := by
    rw [hx,hy]; exact nonsingular _ (hnz σ i)
  let b (σ : Em) (i : I₀) (j : J) := Units.map h.toMonoidHom (C.b σ i j)
  have hb (σ : Em) (i : I₀) (j : J) : (b σ i j:O)=h (C.x σ i)-h (C.c σ j) := by
    change h ((C.b σ i j).val)=_; rw [C.hb,map_sub]
  let w (i : I₀) := weight n i.val
  obtain ⟨u,hu,hjet⟩ := TunnellCMFormalNormJet.norm_jet (n:O) Z hZ (fun σ i => h (C.x σ i))
    (fun σ i => h (C.y σ i)) (fun σ j => h (C.c σ j)) hU b hb w
  have hV (σ : Em) (i : I₀) : Point.some _ _ (hU σ i)=V σ i := by
    rw [←TunnellCMModelUnit.coords (V σ i) (hnz σ i),Point.some.injEq]
    exact ⟨hx σ i,hy σ i⟩
  refine ⟨u,∏ σ, ∏ i, (∏ j, b σ i j)^w i,?_,?_,?_⟩
  · rw [hu]; apply Finset.prod_congr rfl; intro σ _
    apply Finset.prod_congr rfl; intro i _
    apply congrArg (·^w i); apply Finset.prod_congr rfl; intro j _
    rw [hV,ha,←hP]
    exact congrArg (·-g σ (D.c j)) ((coords_eq he (P+U σ i)).1 ▸ by rw [map_add])
  · change ((Units.map (algebraMap O L).toMonoidHom (∏ σ, ∏ i, (∏ j, b σ i j)^w i)):Lˣ).val=_
    simp only [map_prod,map_zpow,Units.coe_prod,Units.val_zpow_eq_zpow_val,Units.coe_map,atEmbedding,zero_add,x_map]
    apply Finset.prod_congr rfl; intro σ _
    apply Finset.prod_congr rfl; intro i _
    apply congrArg (·^w i); apply Finset.prod_congr rfl; intro j _
    rw [hb]
    change algebraMap O L (h (C.x σ i)-h (C.c σ j))=_
    rw [map_sub]; exact congrArg₂ (·-·) ((hx σ i).trans ((coords_eq he (U σ i)).1.trans (x_map W (g σ) (D.u i)))) (ha σ j)
  · rw [hjet]
    simp only [firstCoefficient,map_sum,map_mul,map_intCast,map_ofNat]
    rfl

end
end TunnellCMSpecializedJet
#print axioms TunnellCMSpecializedJet.expansion
