import OMAReductions.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1
import Mathlib

/-! Integral tensor units at unramified places have trivial fixed and norm-one quotients. The restricted product of local tensor factors then leaves precisely the norm indices on the unrestricted factors. -/
namespace OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H1_R1
open NumberField IsDedekindDomain
open scoped NumberField TensorProduct Classical
noncomputable section

def H1 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let V:=HeightOneSpectrum (𝓞 D)
   let W:=HeightOneSpectrum (𝓞 N)
   let F(v:V):=v.adicCompletion D
   let o(B:Type)[CommRing B][Algebra D B](v:V)(e:B→F v)(x:B⊗[D]N):=∀(w:W),w.asIdeal.LiesOver v.asIdeal →
    ∀(m:F v→+*w.adicCompletion N)(f:B⊗[D]N→+*w.adicCompletion N),Continuous m →
    (∀d:D,m (algebraMap D _ d)=algebraMap N _ (algebraMap D N d)) →
    (∀a:B,∀b:N,f (a ⊗ₜ[D] b)=m (e a)*algebraMap N _ b) → f x∈w.adicCompletionIntegers N
   let a(B:Type)[CommRing B][Algebra D B](s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=B) (A₁:=B)) s).toMulEquiv
   let t(v:V)(x:(F v⊗[D]N)ˣ):=o (F v) v id x.val ∧ o (F v) v id x.inv
   let n(v:V)(x:(F v⊗[D]N)ˣ):=∏s:G,a (F v) s x
   let b(v:V)(x:(F v⊗[D]N)ˣ):=a (F v) g x/x
   ∀v:V,(∀w:W,w.asIdeal.LiesOver v.asIdeal → w.asIdeal.ramificationIdx (𝓞 D)=1) →
   ∀x:(F v⊗[D]N)ˣ,t v x →
    (b v x=1 → ∃y,t v y ∧ n v y=x) ∧ (n v x=1 → ∃y,t v y ∧ b v y=x)

def H2 : Prop :=
  ∀(D N:Type)[Field D][NumberField D][Field N][NumberField N][Algebra D N]
   [FiniteDimensional D N][IsGalois D N](g:Gal(N/D)),(∀s,s∈Subgroup.zpowers g) →
   let G:=Gal(N/D)
   let V:=HeightOneSpectrum (𝓞 D)
   let W:=HeightOneSpectrum (𝓞 N)
   let F(v:V):=v.adicCompletion D
   let o(B:Type)[CommRing B][Algebra D B](v:V)(e:B→F v)(x:B⊗[D]N):=∀(w:W),w.asIdeal.LiesOver v.asIdeal →
    ∀(m:F v→+*w.adicCompletion N)(f:B⊗[D]N→+*w.adicCompletion N),Continuous m →
    (∀d:D,m (algebraMap D _ d)=algebraMap N _ (algebraMap D N d)) →
    (∀a:B,∀b:N,f (a ⊗ₜ[D] b)=m (e a)*algebraMap N _ b) → f x∈w.adicCompletionIntegers N
   let a(B:Type)[CommRing B][Algebra D B](s:G):=Units.mapEquiv (Algebra.TensorProduct.congr (AlgEquiv.refl (R:=B) (A₁:=B)) s).toMulEquiv
   let t(v:V)(x:(F v⊗[D]N)ˣ):=o (F v) v id x.val ∧ o (F v) v id x.inv
   let n(v:V)(x:(F v⊗[D]N)ˣ):=∏s:G,a (F v) s x
   let b(v:V)(x:(F v⊗[D]N)ˣ):=a (F v) g x/x
   let A:=AdeleRing (𝓞 D) D
   let T:=A⊗[D]N
   let d(P:Type)[Field P][Algebra D P]:=(Units.map (Algebra.norm P (S:=P⊗[D]N))).range.index
   ∀(R:Finset V)(J:Subgroup Tˣ),(∀v:V,v∉R → ∀x:(F v⊗[D]N)ˣ,t v x →
    (b v x=1 → ∃y,t v y ∧ n v y=x) ∧ (n v x=1 → ∃y,t v y ∧ b v y=x)) →
   (∀x:Tˣ,x∈J ↔ ∀v:V,v∉R → o A v (fun a=>a.2 v) x.val ∧ o A v (fun a=>a.2 v) x.inv) →
   ∃ β:MulDistribMulAction G J,letI:=β; (∀s:G,∀x:J,(s•x).val=a A s x.val) ∧
   let b(s:G):J→*J:=MulDistribMulAction.toMonoidEnd G J s
   let n:J→*J:=∏s:G,b s
   let t:=b g / MonoidHom.id J
   t.range.relIndex n.ker=1 ∧ n.range.relIndex t.ker=(∏w:InfinitePlace D,d w.Completion)*∏v:↥R,d (F v.val)

set_option maxHeartbeats 2400000 in
theorem main : H1 → H2 → OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1.H1 := by
  intro unram glue D N _ _ _ _ _ _ _ g gen
  dsimp only
  intro R J hr hJ
  exact glue D N g gen R J (fun v hv=>unram D N g gen v (hr v hv)) hJ

end
end OMA.R_CongruentNumber_Tunnell_even_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H2_R1_H1_R1_H1_R1_H1_R1_H2_R1_H3_R1_H2_R1_H1_R1
