import TunnellTraceChoices

/-! Odd Fourier coefficients of the ramified theta trace, summed over every pair of quadratic classes. -/
namespace TunnellOddTraceHeight
open TunnellIdealHNF TunnellIdealFormBasis TunnellRamifiedLines TunnellIntegralPacket TunnellLineCoefficient
open TunnellTraceChoices TunnellUniformBasis TunnellShell TunnellHurwitz TunnellToricClass TunnellToricLocal
open TunnellBinaryPairModel TunnellClassThetaCount TunnellEmbeddedIdeals TunnellRamifiedFrameFiber TunnellDyadicGluing
open TunnellToric TunnellProperClassGroup TunnellClassThetaExpansion TunnellIntertwinerTheta TunnellGlueIsometry
open scoped Classical UpperHalfPlane
noncomputable section

variable {d : ℕ} {v : Triple} (hs : Squarefree d) (hn : Squarefree (2*d)) (hd : d%4=1) (h2 : (2*d)%4=2) (hv : v∈shell (2*d))
local notation "G" => ProperIdealClass v
local notation "Ord" => TunnellIdealHNF.R (2*d)

structure Data (d : ℕ) where
  I : Ideal (TunnellIdealHNF.R (2*d))
  J : Ideal (TunnellIdealHNF.R (2*d))
  hI : I≠⊥
  hJ : J≠⊥
  U : TunnellUniformBasis.Basis d I
  V : TunnellUniformBasis.Basis d J

include hs hd in
lemma per_class (a : G×G) {C₀ : Ideal Ord} (hC : C₀≠⊥) {u : Q} (hu : u∈J (-v) v) (hu0 : u≠0) (ec : image hv C₀=line u*J v (-v))
    (eC : ∀ i : P d, letI : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩
      ((TunnellGenusMap.genus hn h2 hv (cls hn h2 hv hC) i:ℤˣ):ℤ)=quadraticChar (ZMod i.val) (-1)) :
    letI := group hn h2 hv
    letI := TunnellFullClassTheta.classFintype hn h2 hv
    ∃ D : Data d, (cls hn h2 hv D.hI,cls hn h2 hv D.hJ)=a ∧
      ∀ m : ℕ, Odd m → weight D.U.atPrime D.V.atPrime m=
        ∑ q : {b : G×G // pairMap (cls hn h2 hv hC) b=a},
          geom d m (idealEquiv hn h2 hv q.val.2).val (idealEquiv hn h2 hv q.val.1).val := by
  classical
  letI := group hn h2 hv
  letI := TunnellFullClassTheta.classFintype hn h2 hv
  let C := cls hn h2 hv hC
  by_cases H : ∃ b : G×G, pairMap C b=a
  · obtain ⟨⟨s,t⟩,rfl⟩ := H
    obtain ⟨A,hA,rfl⟩ := TunnellProperClassGroup.exists_rep hn h2 hv s
    obtain ⟨B,hB,rfl⟩ := TunnellProperClassGroup.exists_rep hn h2 hv t
    have hI : plusI B A≠⊥ := mul_ne_bot (by omega) hB (conj_ne_bot hA)
    have hJ : minusI B A C₀≠⊥ := mul_ne_bot (by omega) (mul_ne_bot (by omega) (conj_ne_bot hB) hC) (conj_ne_bot hA)
    obtain ⟨U⟩ := TunnellUniformBasis.exists_basis hn h2 hI
    obtain ⟨V⟩ := TunnellUniformBasis.exists_basis hn h2 hJ
    refine ⟨⟨_,_,hI,hJ,U,V⟩,(classes hn hd h2 hv hA hB hC).symm,?_⟩
    intro m hm
    obtain ⟨z,hz,he⟩ := odd_coefficient hv hm hs hn hd h2 hA hB hC hu hu0 ec U.atPrime V.atPrime
    exact (weight_eq (Nat.odd_iff.mpr (by omega)) U.atPrime V.atPrime m hz).trans he
  · obtain ⟨I,hI,eI⟩ := TunnellProperClassGroup.exists_rep hn h2 hv a.1
    obtain ⟨J,hJ,eJ⟩ := TunnellProperClassGroup.exists_rep hn h2 hv a.2
    obtain ⟨U⟩ := TunnellUniformBasis.exists_basis hn h2 hI
    obtain ⟨V⟩ := TunnellUniformBasis.exists_basis hn h2 hJ
    have hE : IsEmpty (Roots (parameter U.atPrime V.atPrime)) := ⟨fun r => H (by
      obtain ⟨b,hb⟩ := compatible hn h2 hv hs hd eC hI hJ U V ⟨r⟩
      exact ⟨b,hb.trans (Prod.ext eI eJ)⟩)⟩
    have hF : IsEmpty {b : G×G // pairMap C b=a} := ⟨fun x => H ⟨x.val,x.property⟩⟩
    letI := hE; letI := hF
    exact ⟨⟨I,J,hI,hJ,U,V⟩,Prod.ext eI eJ,fun m _ => by change weight U.atPrime V.atPrime m=∑ q : {b : G×G // pairMap C b=a}, _; simp [TunnellTraceChoices.weight]⟩

lemma theta_class {I : Ideal Ord} (hI : I≠⊥) (z : ℂ) :
    thetaI I z=jtheta v (idealEquiv hn h2 hv (cls hn h2 hv hI)).val z := by
  classical
  obtain ⟨a,ha,h0,e⟩ := representative_frame hn h2 hv ⟨image hv I,image_isIdeal hn h2 hv I hI⟩
  exact frame_theta hn h2 hv (Finset.mem_filter.mp (TunnellGlueIsometry.rep hv hn h2 hI).property).1 hI ha h0 e z

include hs hd in
theorem total :
    letI := group hn h2 hv
    letI := TunnellFullClassTheta.classFintype hn h2 hv
    ∃ D : G×G → Data d,
      (∀ z w : ℍ, TunnellFullClassTheta.full hn h2 hv z*TunnellFullClassTheta.full hn h2 hv w=
        ∑ a, thetaI (D a).I z*thetaI (D a).J w) ∧
      ∀ m : ℕ, Odd m →
        (∑ a : G×G, (weight (D a).U.atPrime (D a).V.atPrime m:ℚ)) =
        (Fintype.card ↥(representatives (2*d)):ℚ)^2*(∑ k∈m.divisors,(k:ℚ))+
          (TunnellShell.b d:ℚ)^2*(TunnellQuaternion.etaCoeff m:ℚ) := by
  classical
  letI := group hn h2 hv
  letI := TunnellFullClassTheta.classFintype hn h2 hv
  let E := idealEquiv hn h2 hv
  obtain ⟨C₀,hC,u,hu0,hu,ec,eC⟩ := TunnellReferenceGenus.reference hn hd h2 hv
  choose D hD hcoef using fun a : G×G => per_class hs hn hd h2 hv a hC hu hu0 ec eC
  refine ⟨D,?_,?_⟩
  · intro z w
    have h (a : G×G) : thetaI (D a).I z*thetaI (D a).J w=jtheta v (E a.1).val z*jtheta v (E a.2).val w := by
      rw [theta_class hn h2 hv (D a).hI,theta_class hn h2 hv (D a).hJ]
      have h := hD a; rw [show cls hn h2 hv (D a).hI=a.1 from congrArg Prod.fst h,show cls hn h2 hv (D a).hJ=a.2 from congrArg Prod.snd h]
    simp_rw [h]; rw [full_by_embeddings hn h2 hv z,full_by_embeddings hn h2 hv w,←E.sum_comp (fun s => jtheta v s.val z),
      ←E.sum_comp (fun s => jtheta v s.val w),Fintype.sum_prod_type,Finset.sum_mul]
    simp only [Finset.mul_sum]
  · intro m hm
    let f (a : G×G) := geom d m (E a.2).val (E a.1).val
    let W := pairMap (cls hn h2 hv hC)
    have he : ∑ a : G×G, weight (D a).U.atPrime (D a).V.atPrime m=∑ a : G×G, f a := by
      simp_rw [fun a => hcoef a m hm]
      have H := (Equiv.sigmaFiberEquiv W).sum_comp f
      rw [Fintype.sum_sigma] at H
      exact H
    have eq := congrArg (fun n:ℕ => (n:ℚ)) he
    push_cast at eq
    rw [eq,Fintype.sum_prod_type]
    change (∑ a : G, ∑ b : G, (geom d m (E b).val (E a).val:ℚ))=_
    rw [Finset.sum_comm]
    have h := geom_height d hs hd hm
    rw [←E.sum_comp (fun a => ∑ b : ↥(representatives (2*d)), (geom d m a.val b.val:ℚ))] at h
    refine Eq.trans (Finset.sum_congr rfl fun a _ => E.sum_comp (fun b => (geom d m (E a).val b.val:ℚ))) h

end
end TunnellOddTraceHeight
#print axioms TunnellOddTraceHeight.total

