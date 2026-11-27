import TunnellOrientedNondivisibility
import TunnellPadicDivisionSeries
import TunnellGaussianDivisionField

/-! # A common oriented Gaussian prime for local torsion and Kummer nondivisibility -/
namespace TunnellOrientedSplit
set_option maxHeartbeats 800000
open IsLocalRing TunnellLocalDivisibility TunnellPadicDivisionSeries TunnellCoates TunnellGaussianEnd
open WeierstrassCurve
variable {p:ℕ} [Fact p.Prime]
local notation "O" => IntegerRing p
local notation "K" => Local p

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

private theorem integral_root (hp:p%4=1) : ∃ i:O, i^2= -1 := by
  obtain ⟨z,hz⟩ := split_padic_root hp
  let e := localIntegralEquiv p
  exact ⟨e.symm z, (map_pow e.symm z 2).symm.trans ((congrArg e.symm hz).trans
    ((map_neg e.symm 1).trans (congrArg Neg.neg (map_one e.symm))))⟩

theorem factor (hp : p%4=1) :
    ∃ (i:O) (π:GaussianInt), i^2= -1 ∧ π.norm.natAbs=p ∧
      π.re^2+π.im^2=(p:ℤ) ∧ (π.re:O)+(π.im:O)*i∈maximalIdeal O ∧ IsUnit ((π.re:O)-(π.im:O)*i) := by
  obtain ⟨i,hi⟩ := integral_root hp
  obtain ⟨hJ,hJ₂⟩ := base_uniformizer (p:=p)
  have hp₀ : (p:O)∈maximalIdeal O := by rw [hJ]; exact Ideal.mem_span_singleton_self _
  obtain ⟨π,h₁,h₂,h₃,h₄⟩ := choose_factor i hi hp hp₀ hJ₂
  exact ⟨i,π,hi,h₁,h₂,h₃,h₄⟩

#print axioms factor
end TunnellOrientedSplit
