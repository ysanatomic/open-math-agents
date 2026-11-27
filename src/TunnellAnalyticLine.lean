import TunnellLineIntegral

/-! Analytic sum of the rectangular translates on one family of discriminant lines. -/
namespace TunnellAnalyticLine
open TunnellIdealHNF TunnellUniformBasis TunnellRamifiedLines TunnellGluePacket TunnellIntegralPacket
open TunnellRectangularClasses TunnellRectangularNumerator TunnellIdealThetaExpansion TunnellIdealFormBasis TunnellTraceChoices
open TunnellRectangularIdeal TunnellLineIntegral
open scoped Classical
noncomputable section
variable {d : ℕ} {I J : Ideal (R (2*d))}

def theta [NeZero d] (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : (i : P d) → ZMod i.val) (z : ℂ) :=
  letI : NeZero U.a := ⟨U.pos.ne'⟩
  letI : NeZero V.a := ⟨V.pos.ne'⟩
  ∑ w : ZMod d×ZMod d, if aligned r w then rect d U.a 1 U.b w.1.val z*rect d V.a 4 V.b w.2.val z else 0

def trace [NeZero d] (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (z : ℂ) :=
  ∑ r : Roots (parameter U.atPrime V.atPrime), theta U V r.val z

def elem (z : ℂ) (x : I×J) := Complex.exp (2*Real.pi*Complex.I*z*(value x:ℂ)/(d:ℂ)^2)

lemma product_value (x : I×J) (z : ℂ) : elementTerm 1 z x.1*elementTerm 4 z x.2=elem z x := by
  unfold elementTerm elem value
  rw [←Complex.exp_add]
  congr 1; push_cast; ring

def condition (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : (i : P d) → ZMod i.val) (x : I×J) :=
  good U.atPrime V.atPrime x ∧ packet U.atPrime V.atPrime x∈linePacket r

private lemma product_sum {X Y : Type*} {f : X→ℂ} {g : Y→ℂ} {x y : ℂ} (hf : HasSum f x) (hg : HasSum g y) :
    HasSum (fun z:X×Y => f z.1*g z.2) (x*y) := hf.mul hg (summable_mul_of_summable_norm hf.summable.norm hg.summable.norm)

theorem line_sum [NeZero d] (hs : Squarefree d) (hn : Squarefree (2*d)) (h2 : (2*d)%4=2) (hI : I≠⊥) (hJ : J≠⊥)
    (U : TunnellUniformBasis.Basis d I) (V : TunnellUniformBasis.Basis d J) (r : (i : P d) → ZMod i.val) {z : ℂ} (hz : 0<z.im) :
    HasSum (fun x : I×J => if condition U V r x then elem z x else 0) (theta U V r z) := by
  classical
  letI : NeZero U.a := ⟨U.pos.ne'⟩
  letI : NeZero V.a := ⟨V.pos.ne'⟩
  let f (w : ZMod d×ZMod d) (x : I×J) := if aligned r w ∧ selected U.a U.b w.1 (U.basis.symm x.1) ∧ selected V.a V.b w.2 (V.basis.symm x.2) then elem z x else 0
  have HH (w : ZMod d×ZMod d) : HasSum (f w) (if aligned r w then rect d U.a 1 U.b w.1.val z*rect d V.a 4 V.b w.2.val z else 0) := by
    by_cases h : aligned r w
    · rw [if_pos h]
      have hU := coset hn h2 hI U 1 w.1 hz
      have hV := coset hn h2 hJ V 4 w.2 hz
      apply (product_sum hU hV).congr_fun
      intro x
      by_cases H : selected U.a U.b w.1 (U.basis.symm x.1) <;> by_cases H' : selected V.a V.b w.2 (V.basis.symm x.2) <;> simp [f,h,H,H',product_value]
    · simpa only [f,h,false_and,ite_false] using (hasSum_zero (β:=I×J) (α:=ℂ))
  apply (hasSum_sum (s:=Finset.univ) (fun w _ => HH w)).congr_fun
  intro x
  let w := (canonical hs U x.1,canonical hs V x.2)
  have ha : aligned r w ↔ packet U.atPrime V.atPrime x∈linePacket r := by
    change (∀ i, reduce i (canonical hs U x.1)=r i*reduce i (canonical hs V x.2)) ↔ ∀ i, coordinate (U.atPrime i) x.1=r i*coordinate (V.atPrime i) x.2
    simp_rw [can_apply]
  rw [Finset.sum_eq_single w]
  · by_cases h : condition U V r x
    · have h₁ := (selected_can hs U x.1 w.1).mpr ⟨rfl,fun i => (h.1 i).1⟩
      have h₂ := (selected_can hs V x.2 w.2).mpr ⟨rfl,fun i => (h.1 i).2⟩
      simp [f,h,ha.mpr h.2,h₁,h₂]
    · have he : ¬(aligned r w ∧ selected U.a U.b w.1 (U.basis.symm x.1) ∧ selected V.a V.b w.2 (V.basis.symm x.2)) := by
        rintro ⟨ha',hU,hV⟩; apply h; exact ⟨fun i => ⟨((selected_can hs U _ _).mp hU).2 i,((selected_can hs V _ _).mp hV).2 i⟩,ha.mp ha'⟩
      simp [f,h,he]
  · intro t _ ht; apply if_neg
    rintro ⟨_,hU,hV⟩; exact ht (Prod.ext ((selected_can hs U _ _).mp hU).1 ((selected_can hs V _ _).mp hV).1)
  · simp

end
end TunnellAnalyticLine
#print axioms TunnellAnalyticLine.line_sum

