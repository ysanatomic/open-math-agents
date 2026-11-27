import TunnellOrientedSplit
import TunnellGaussian

/-! The primary generator of the split prime can be chosen with either prescribed local square root of -1. -/
namespace TunnellCMPrimaryOrientation
open IsLocalRing TunnellPadicDivisionSeries TunnellLocalDivisibility TunnellGaussian
noncomputable section
variable {p:ℕ} [Fact p.Prime]
private theorem choose_factor {S:Type*} [CommRing S] [IsLocalRing S] (i:S) (hi:i^2= -1)
    (hp:p%4=1) (hp₀:(p:S)∈maximalIdeal S) (hJ₂:(p:S)∉maximalIdeal S^2) :
    ∃ π:GaussianInt, π.norm.natAbs=p ∧ π.re^2+π.im^2=(p:ℤ) ∧
      (π.re:S)+(π.im:S)*i∈maximalIdeal S ∧ IsUnit ((π.re:S)-(π.im:S)*i) := by
  obtain ⟨a,b,hab⟩ := Nat.Prime.sq_add_sq (p:=p) (by omega)
  have hsum : (a:ℤ)^2+(b:ℤ)^2=(p:ℤ) := by exact_mod_cast hab
  have hf : ((a:S)+(b:S)*i)*((a:S)-(b:S)*i)=(p:S) := by
    have e : (a:S)^2+(b:S)^2=(p:S) := by simpa using congrArg (fun k:ℕ => (k:S)) hab
    linear_combination e - (b:S)^2*hi
  have hboth : ¬(((a:S)+(b:S)*i)∈maximalIdeal S ∧ (a:S)-(b:S)*i∈maximalIdeal S) := by
    rintro ⟨h₁,h₂⟩
    apply hJ₂
    rw [←hf,pow_two]
    exact Ideal.mul_mem_mul h₁ h₂
  have h₀ := (inferInstance : (maximalIdeal S).IsPrime).mem_or_mem (show ((a:S)+(b:S)*i)*((a:S)-(b:S)*i)∈ maximalIdeal S by rw [hf]; exact hp₀)
  rcases h₀ with h|h
  · let π : GaussianInt := ⟨a,b⟩
    refine ⟨π,?_,hsum,by simpa only [π,Int.cast_natCast] using h,?_⟩
    · have hh : π.norm=(p:ℤ) := by rw [Zsqrtd.norm_def]; change _=_; dsimp [π]; linear_combination hsum
      simp [hh]
    · by_contra h'
      exact hboth ⟨h,by change ¬ IsUnit _; simpa only [π,Int.cast_natCast] using h'⟩
  · let π : GaussianInt := ⟨a,-b⟩
    have hh : π.re^2+π.im^2=(p:ℤ) := by simpa [π] using hsum
    refine ⟨π,?_,hh,?_,?_⟩
    · have hx : π.norm=(p:ℤ) := by rw [Zsqrtd.norm_def]; dsimp [π]; linear_combination hsum
      simp [hx]
    · simpa [π,sub_eq_add_neg] using h
    · by_contra h'; exact hboth ⟨by simpa [π] using h',h⟩

private 

def evaluate {S : Type*} [CommRing S] (i : S) (hi : i^2= -1) : GaussianInt →+* S :=
  Zsqrtd.lift ⟨i,by simpa only [← pow_two,Int.cast_neg,Int.cast_one] using hi⟩

theorem primary_factor (i : IntegerRing p) (hi : i^2= -1) (hp : p%4=1) :
    ∃ q : GaussianInt, Primary q ∧ q.norm.natAbs=p ∧ q.re^2+q.im^2=(p:ℤ) ∧
      (q.re:IntegerRing p)+(q.im:IntegerRing p)*i∈maximalIdeal _ ∧ IsUnit ((q.re:IntegerRing p)-(q.im:IntegerRing p)*i) := by
  let O := IntegerRing p
  obtain ⟨hJ,hJ₂⟩ := base_uniformizer (p:=p)
  have hmem : (p:O)∈maximalIdeal O := by rw [hJ]; exact Ideal.mem_span_singleton_self _
  obtain ⟨a,ha,hn,hm,hu⟩ := choose_factor i hi hp hmem hJ₂
  have e : a.norm=(p:ℤ) := (Int.natAbs_of_nonneg (GaussianInt.norm_nonneg _)).symm.trans (congrArg (fun k : ℕ => (k:ℤ)) ha)
  obtain ⟨q,hpr,hq⟩ := exists_primary_associate a (by rw [e]; omega)
  have eqn := Zsqrtd.norm_eq_of_associated (by decide : (-1:ℤ)≤0) hq
  have hnq : q.re^2+q.im^2=(p:ℤ) := by
    have H := eqn.trans e
    simpa [Zsqrtd.norm,pow_two] using H
  have incl := hq.map (evaluate i hi).toMonoidHom
  have bar := hq.map (evaluate (-i) (by simpa using hi)).toMonoidHom
  have iq : evaluate i hi q∈maximalIdeal O := (maximalIdeal O).mem_of_dvd incl.dvd' hm
  have ia : IsUnit (evaluate (-i) (by simpa using hi) a) := by
    change IsUnit ((a.re:O)+a.im*(-i)); simpa [sub_eq_add_neg] using hu
  have ii : IsUnit (evaluate (-i) (by simpa using hi) q) := (isUnit_of_dvd_unit bar.dvd ia)
  exact ⟨q,hpr,(congrArg Int.natAbs eqn).trans ha,hnq,iq,by simpa [evaluate,sub_eq_add_neg] using ii⟩

end
end TunnellCMPrimaryOrientation
#print axioms TunnellCMPrimaryOrientation.primary_factor
