import TunnellCMDivisor

/-! An elliptic meromorphic function with trivial divisor is constant at every regular point. -/
namespace TunnellCMMeromorphicPeriod
open Complex Filter Set
open scoped Topology

theorem constant (L : PeriodPair) (f : ℂ→ℂ) (hf : Meromorphic f)
    (hord : ∀ z, meromorphicOrderAt f z=0) (per : ∀ z (t : L.lattice), f (z+t)=f z) :
    ∃ c:ℂ, c≠0 ∧ ∀ z, AnalyticAt ℂ f z → f z=c := by
  let g := toMeromorphicNFOn f Set.univ
  have hM : MeromorphicOn f Set.univ := fun z _ => hf z
  have hG (z : ℂ) : MeromorphicNFAt g z := meromorphicNFOn_toMeromorphicNFOn f Set.univ (Set.mem_univ z)
  have ho (z : ℂ) : meromorphicOrderAt g z=0 :=
    (meromorphicOrderAt_toMeromorphicNFOn hM (Set.mem_univ _)).trans (hord z)
  have ha (z : ℂ) : AnalyticAt ℂ g z := (hG z).meromorphicOrderAt_nonneg_iff_analyticAt.mp (le_of_eq (ho z).symm)
  have hne (z : ℂ) : g z≠0 := (hG z).meromorphicOrderAt_eq_zero_iff.mp (ho z)
  have hgf (z : ℂ) : g =ᶠ[𝓝[≠] z] f := hM.toMeromorphicNFOn_eq_self_on_nhdsNE (Set.mem_univ z)
  have eqv {z : ℂ} (hf' : AnalyticAt ℂ f z) : g z=f z :=
    tendsto_nhds_unique_of_eventuallyEq (ha z).continuousAt.continuousWithinAt hf'.continuousAt.continuousWithinAt (hgf z)
  have hper (z : ℂ) (t : L.lattice) : g (z+t)=g z := by
    let shift (w : ℂ) := w+t
    have hs : Tendsto shift (𝓝[≠] z) (𝓝[≠] (z+t)) := by
      apply tendsto_nhdsWithin_iff.mpr
      refine ⟨((continuous_id.add continuous_const).continuousAt : ContinuousAt shift z).continuousWithinAt,?_⟩
      filter_upwards [self_mem_nhdsWithin] with w hw
      exact fun e => hw ((add_left_inj _).mp e)
    have e : (g ∘ shift) =ᶠ[𝓝[≠] z] g := by
      filter_upwards [(hgf (z+t)).comp_tendsto hs,hgf z] with w h1 h2
      exact h1.trans ((per w t).trans h2.symm)
    exact tendsto_nhds_unique_of_eventuallyEq (((ha (z+t)).continuousAt.tendsto.mono_left nhdsWithin_le_nhds).comp hs)
      (ha z).continuousAt.continuousWithinAt e
  have hd : Differentiable ℂ g := fun z => (ha z).differentiableAt
  have hb := (IsZLattice.isCompact_range_of_periodic L.lattice _ hd.continuous (fun z w hw => hper z ⟨w,hw⟩)).isBounded
  exact ⟨g 0,hne 0,fun z hz => (eqv hz).symm.trans (hd.apply_eq_apply_of_bounded hb z 0)⟩

end TunnellCMMeromorphicPeriod
#print axioms TunnellCMMeromorphicPeriod.constant
