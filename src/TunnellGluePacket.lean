import TunnellIdealFormBasis
import TunnellAllRamifiedLines

/-! Reduction of the integral binary components to their ramified discriminant coordinates. -/
namespace TunnellGluePacket
open TunnellIdealHNF TunnellIdealFormBasis TunnellOddDiscriminant TunnellOddGlueCoordinates TunnellRamifiedLines
noncomputable section
variable {n d : ℕ} {p : ℕ} [Fact p.Prime] {I J : Ideal (R n)}

def coordinate (L : LocalBasis p I) : I →+ ZMod p where
  toFun x := coord L.A (L.basis.symm x)
  map_zero' := by simp [coord]
  map_add' x y := by simp [coord,add_div]

def admissible (L : LocalBasis p I) (x : I) :=
  pairing (L.A:ZMod p) L.B L.C (redPair (L.basis.symm x))=0

lemma red_zero (x : ℤ×ℤ) : redPair (p:=p) x=0 ↔ ∃ y : ℤ×ℤ, x=(p:ℤ) • y := by
  constructor
  · intro h
    obtain ⟨u,hu⟩ := (ZMod.intCast_zmod_eq_zero_iff_dvd x.1 p).mp (congrArg Prod.fst h)
    obtain ⟨v,hv⟩ := (ZMod.intCast_zmod_eq_zero_iff_dvd x.2 p).mp (congrArg Prod.snd h)
    exact ⟨(u,v),Prod.ext hu hv⟩
  · rintro ⟨⟨u,v⟩,rfl⟩; apply Prod.ext <;> simp [redPair,zsmul_eq_mul]

lemma no_coordinate (hp : p∣n) (L : LocalBasis p I) {x : I} (hx : admissible L x) :
    coordinate L x=0 ↔ ∃ y : I, x=(p:ℤ) • y := by
  have hr : (L.A:ZMod p)*(L.C:ZMod p)-(L.B:ZMod p)^2=0 := by
    have e := congrArg (fun x:ℤ => (x:ZMod p)) L.det; push_cast at e; rw [e]; exact (ZMod.natCast_eq_zero_iff _ _).mpr hp
  obtain ⟨r,er⟩ := (radical L.unit hr _).mp hx
  have e : coordinate L x=r := by
    change ((L.basis.symm x).2:ZMod p)/(L.A:ZMod p)=r
    have H := congrArg Prod.snd er
    change ((L.basis.symm x).2:ZMod p)=(L.A:ZMod p)*r at H
    rw [H]; field_simp [L.unit]
  constructor
  · intro he
    rw [←e,he] at er
    obtain ⟨y,hy⟩ := (red_zero (p:=p) _).mp (by change redPair (p:=p) (L.basis.symm x)=(0,0); simpa using er)
    exact ⟨L.basis y,by rw [←map_zsmul,←hy,L.basis.apply_symm_apply]⟩
  · rintro ⟨y,rfl⟩; rw [map_zsmul,zsmul_eq_mul,Int.cast_natCast,ZMod.natCast_self,zero_mul]

lemma admissible_sub (L : LocalBasis p I) {x y : I} (hx : admissible L x) (hy : admissible L y) : admissible L (x-y) := by
  apply Prod.ext
  · have ex := congrArg Prod.fst hx; have ey := congrArg Prod.fst hy
    change _=0; unfold pairing redPair; rw [map_sub]; simp only [Prod.fst_sub,Prod.snd_sub,Int.cast_sub]
    change (L.A:ZMod p)*(_-_)+(L.B:ZMod p)*(_-_)=0
    change (L.A:ZMod p)*_+(L.B:ZMod p)*_=0 at ex ey; dsimp only [redPair] at ex ey; linear_combination ex - ey
  · have ex := congrArg Prod.snd hx; have ey := congrArg Prod.snd hy
    change _=0; unfold pairing redPair; rw [map_sub]; simp only [Prod.fst_sub,Prod.snd_sub,Int.cast_sub]
    change (L.B:ZMod p)*(_-_)+(L.C:ZMod p)*(_-_)=0
    change (L.B:ZMod p)*_+(L.C:ZMod p)*_=0 at ex ey; dsimp only [redPair] at ex ey; linear_combination ex - ey

private instance prime (i : P d) : Fact i.val.Prime := ⟨Nat.prime_of_mem_primeFactors i.property⟩

lemma int_dvd (hs : Squarefree d) {z : ℤ} (h : ∀ i : P d, (i.val:ℤ)∣z) : (d:ℤ)∣z := by
  rw [←Nat.prod_primeFactors_of_squarefree hs,Nat.cast_prod]
  apply Finset.prod_dvd_of_coprime
  · intro p hp q hq hpq
    exact ((Nat.coprime_primes (Nat.prime_of_mem_primeFactors hp) (Nat.prime_of_mem_primeFactors hq)).mpr hpq).isCoprime
  · intro p hp; exact h ⟨p,hp⟩

lemma ideal_dvd (hs : Squarefree d) (hn : 0<n) (hI : I≠⊥) {x : I} (h : ∀ i : P d, ∃ y : I, x=(i.val:ℤ) • y) :
    ∃ y : I, x=(d:ℤ) • y := by
  obtain ⟨s,rfl⟩ := normal_form hn hI
  let E := basis s
  have H (i : P d) : ∃ y : ℤ×ℤ, E.symm x=(i.val:ℤ) • y := by
    obtain ⟨y,hy⟩ := h i
    exact ⟨E.symm y,by rw [hy,map_zsmul]⟩
  obtain ⟨u,hu⟩ := int_dvd hs (z:=(E.symm x).1) (fun i => by obtain ⟨y,hy⟩ := H i; exact ⟨y.1,congrArg Prod.fst hy⟩)
  obtain ⟨v,hv⟩ := int_dvd hs (z:=(E.symm x).2) (fun i => by obtain ⟨y,hy⟩ := H i; exact ⟨y.2,congrArg Prod.snd hy⟩)
  have he : E.symm x=(d:ℤ) • (u,v) := Prod.ext hu hv
  exact ⟨E (u,v),by rw [←map_zsmul,←he,E.apply_symm_apply]⟩

variable (U : (i : P d) → LocalBasis i.val I) (V : (i : P d) → LocalBasis i.val J)
def packet : (I×J) →+ Packet d where
  toFun x i := (coordinate (U i) x.1,coordinate (V i) x.2)
  map_zero' := by funext i; simp
  map_add' x y := by funext i; simp

def good (x : I×J) := ∀ i : P d, admissible (U i) x.1 ∧ admissible (V i) x.2

theorem distinguish (hs : Squarefree d) (hn : 0<n) (hd : d∣n) (hI : I≠⊥) (hJ : J≠⊥) {S T : AddSubgroup (I×J)}
    (hS : ∀ x∈S, good U V x) (hT : ∀ x∈T, good U V x) (hD : ∀ y:I×J, (d:ℤ) • y∈T)
    (he : S.map (packet U V)≤T.map (packet U V)) : S≤T := by
  intro x hx
  obtain ⟨y,hy,ey⟩ := he (show packet U V x∈S.map (packet U V) from ⟨x,hx,rfl⟩)
  have H (i : P d) := congrFun ey i
  have hδ (i : P d) := (Nat.dvd_of_mem_primeFactors i.property).trans hd
  have h₁ := ideal_dvd hs hn hI (x:=x.1-y.1) (fun i => (no_coordinate (hδ i) (U i) (admissible_sub _ (hS x hx i).1 (hT y hy i).1)).mp (by rw [map_sub]; exact sub_eq_zero.mpr (congrArg Prod.fst (H i)).symm))
  have h₂ := ideal_dvd hs hn hJ (x:=x.2-y.2) (fun i => (no_coordinate (hδ i) (V i) (admissible_sub _ (hS x hx i).2 (hT y hy i).2)).mp (by rw [map_sub]; exact sub_eq_zero.mpr (congrArg Prod.snd (H i)).symm))
  obtain ⟨u,eu⟩ := h₁; obtain ⟨v,ev⟩ := h₂
  have e : x-y=(d:ℤ) • (u,v) := Prod.ext eu ev
  have hxy : x-y∈T := e ▸ hD (u,v)
  simpa only [sub_add_cancel] using T.add_mem hxy hy

end
end TunnellGluePacket
#print axioms TunnellGluePacket.distinguish

