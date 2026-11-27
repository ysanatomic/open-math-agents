import TunnellOnePrimeCharacter
import TunnellRamifiedDivision
import TunnellCMChangeBaseField
import TunnellFullScalarAction

/-! The local Kummer character of actual primary division points for a CM curve. -/
namespace TunnellLocalKummerCharacter
open WeierstrassCurve WeierstrassCurve.Affine TunnellCoates TunnellCMTorsionField TunnellGaussianEnd TunnellKummer
open LocalClassFieldTheory LocalFieldTheory LocalFieldTheory.IsNonarchimedeanLocalField
open scoped ValuativeRel Classical
noncomputable section
variable {F K T D N:Type} [Field F] [Field K] [Field T] [Field D] [Field N]
  [CharZero F] [Algebra F ℂ] [Algebra F K] [Algebra F D] [Algebra F N]
  [Algebra K T] [Algebra K D] [Algebra K N] [Algebra T D] [Algebra D N]
  [IsScalarTower F K D] [IsScalarTower F K N] [IsScalarTower K T D] [IsScalarTower K D N]
  [ValuativeRel K] [ValuativeRel T] [ValuativeRel D] [TopologicalSpace T] [TopologicalSpace D]
  [IsNonarchimedeanLocalField T] [IsNonarchimedeanLocalField D]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation T)] [IsIntegralClosure 𝒪[T] 𝒪[K] T]
  [Valuation.HasExtension (ValuativeRel.valuation K) (ValuativeRel.valuation D)] [IsIntegralClosure 𝒪[D] 𝒪[K] D]
  [FiniteDimensional K T] [FiniteDimensional T D] [FiniteDimensional K D] [FiniteDimensional D N]
  [Normal K T] [IsAbelianGalois K D] [IsGalois K N]

variable (n:ℕ) (hn:0<n) [(E (n:F)).IsElliptic] [(E (n:K)).IsElliptic]
  (i:F) (j:K) (hi:i^2= -1) (hj:j^2= -1) (hij:algebraMap F K i=j) (hI:algebraMap F ℂ i=Complex.I)
  {p r:ℕ} [Fact p.Prime] (h₂:p≠2) (hr:r≠0) (a:GaussianInt) (ha:a.norm.natAbs=p) (hnorm:a.re^2+a.im^2=(p:ℤ))
local notation "W" => E (n:K)
local notation "φ" => cm (n:K) j hj (a^r)

include hn hi hij hI h₂ hr ha hnorm in
theorem character (Z:CurvePoints W T) (hZ:cm (n:K) j hj a Z=0) (hz:addOrderOf Z=p)
    (S:CurvePoints W D) (hS:φ S=0) (ho:addOrderOf S=p^r) (hd:Module.finrank K D=(p^r).totient)
    {s t:D} (h:((E (n:K)).baseChange D).toAffine.Nonsingular s t) (eqS:S=.some s t h) (hD:IntermediateField.adjoin K {s,t}=⊤)
    (Q:CurvePoints W N) {x y:N} (hh:((E (n:K)).baseChange N).toAffine.Nonsingular x y) (eqQ:Q=.some x y hh)
    (hN:IntermediateField.adjoin D {x,y}=⊤) (P:CurvePoints W K) (hQ:φ Q=changeBase W P) (hnon:¬IsAbelianGalois K N) :
    ∃ (d:Gal(T/K)) (k:ℕ) (c:(ZMod p)ˣ) (b:Additive Tˣ→+ZMod p),
      orderOf c=p-1 ∧ (k:ZMod p)=c ∧ act W d Z=k • Z ∧
      (∃ u:𝒪[T]ˣ,b (Additive.ofMul (integerUnitsToFieldUnits T u))≠0) ∧
      (∀ u:Nˣ,b (Additive.ofMul (normUnits T D (normUnits D N u)))=0) ∧
      (∀ u:Tˣ,b (Additive.ofMul (Units.map d.toMonoidHom u))=(c:ZMod p)*b (Additive.ofMul u)) := by
  let hp:= (Fact.out:p.Prime)
  have hgen:=TunnellCMChangeBaseField.generates n i j hi hj hij hn hI hp h₂ a ha hnorm r S hS ho
  have hstable (g:Gal(D/K)) : ∃k:ℤ,act W g S=k • S := by
    obtain ⟨k,hk⟩:=AddSubgroup.mem_zmultiples_iff.mp (hgen (act W g S) (by rw [cm_act,hS,map_zero]))
    exact ⟨k,hk.symm⟩
  haveI:NeZero (p^r):=⟨pow_ne_zero _ hp.ne_zero⟩
  obtain ⟨e,he⟩:=TunnellFullScalarAction.torsion_field W S h eqS hD hstable ho hd
  let fi:=Point.map (W':=(W).toAffine) (IsScalarTower.toAlgHom K T D)
  have hZr:φ Z=0 := by
    have hisq (X:CurvePoints W T) : baseI (n:K) j hj (baseI (n:K) j hj X)= -X := by
      haveI:((E (n:K)).baseChange T).IsElliptic:=inferInstanceAs (((E (n:K)).map (algebraMap K T)).IsElliptic)
      exact quarter_sq (base_E _) _ _ X
    rw [show φ Z=(cm (n:K) j hj a)^[r] Z from (TunnellLocalCMCoordDegree.endo_iterate _ hisq a r Z).symm]
    obtain ⟨l,rfl⟩:=Nat.exists_eq_succ_of_ne_zero hr
    rw [Function.iterate_succ_apply,hZ]
    exact Function.iterate_fixed (map_zero _) l
  have hm:fi Z∈AddSubgroup.zmultiples S:=hgen _ (by dsimp [fi]; rw [←cm_map,hZr,map_zero])
  let fs:=Point.map (W':=(W).toAffine) (IsScalarTower.toAlgHom K D N)
  have ht:φ (fs S)=0:=by dsimp [fs]; rw [←cm_map,hS,map_zero]
  have hot:addOrderOf (fs S)=p^r:=(addOrderOf_injective fs (Point.map_injective _) S).trans ho
  have hgN:=TunnellCMChangeBaseField.generates n i j hi hj hij hn hI hp h₂ a ha hnorm r (fs S) ht hot
  have hfix(g:Gal(N/K)):act W g (φ Q)=φ Q := by
    rw [hQ]
    cases P with
    | zero=>rfl
    | some s t h=>exact (Point.some.injEq ..).mpr ⟨g.commutes s,g.commutes t⟩
  exact TunnellOnePrimeCharacter.character W h₂ hr Z S ho hz hm e he φ Q (fun g X=>cm_act _ _ _ _ g X)
    hfix hgN hh eqQ hN hnon

#print axioms character
end
end TunnellLocalKummerCharacter
