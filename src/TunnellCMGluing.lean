import TunnellIdealTorsor

/-! The two binary components of the quaternionic lattice interconnecting a pair of CM classes. -/
namespace TunnellCMGluing
open TunnellHurwitz TunnellToricClass TunnellShell
local notation "ι" => TunnellHurwitz.pure
abbrev R (v : Triple) := J v v

def anti (v : Triple) : Lattice :=
  LinearMap.ker ((AddMonoidHom.mulLeft (ι v)).toIntLinearMap+(AddMonoidHom.mulRight (ι v)).toIntLinearMap)
lemma mem_anti {v : Triple} {a : Q} : a∈anti v ↔ ι v*a= -(a*ι v) := add_eq_zero_iff_eq_neg

lemma C_anti (v : Triple) : C v*anti v ≤ anti v := by
  apply Submodule.mul_le.mpr; intro a ha b hb; apply mem_anti.mpr
  rw [←mul_assoc,mem_C.mp ha,mul_assoc,mem_anti.mp hb,mul_neg,mul_assoc]
lemma anti_C (v : Triple) : anti v*C v ≤ anti v := by
  apply Submodule.mul_le.mpr; intro a ha b hb; apply mem_anti.mpr
  rw [←mul_assoc,mem_anti.mp ha,neg_mul,mul_assoc,mem_C.mp hb,mul_assoc]

lemma ROR (v : Triple) : R v*O*R v≤O := by
  have hr : R v≤O := fun _ h => h.1
  calc R v*O*R v ≤ O*O*O := mul_le_mul' (mul_le_mul_left hr _) hr
       _ = O := by rw [mul_O,mul_O]

/-- Multiplication by invertible quadratic ideals commutes with the intersection
with either rational quadratic summand of the quaternion algebra. -/
lemma transport {v : Triple} {A A' B B' W : Lattice}
    (hA : A≤C v) (hA' : A'≤C v) (hB : B≤C v) (hB' : B'≤C v)
    (h₁ : A*A'=R v) (h₂ : A'*A=R v) (h₃ : B*B'=R v) (h₄ : B'*B=R v)
    (hLW : C v*W≤W) (hWR : W*C v≤W) :
    A*O*B ⊓ W=A*(O ⊓ W)*B := by
  let D := A*O*B ⊓ W
  have hU (X Y : Lattice) (hX : X≤C v) (hY : Y≤C v) (P : Lattice) (hP : P≤W) : X*P*Y≤W :=
    (mul_le_mul' ((mul_le_mul' hX hP).trans hLW) hY).trans hWR
  have hT : A'*D*B'≤O ⊓ W := by
    refine le_inf ?_ (hU _ _ hA' hB' D inf_le_right)
    calc A'*D*B' ≤ A'*(A*O*B)*B' := mul_le_mul_left (mul_le_mul_right inf_le_left _) _
         _ = (A'*A)*O*(B*B') := by simp only [mul_assoc]
         _ ≤ O := by rw [h₂,h₃]; exact ROR v
  have hR : (1:Lattice)≤R v := Submodule.one_le.mpr (one_J v)
  apply le_antisymm
  · calc D = 1*D*1 := by rw [one_mul,mul_one]
         _ ≤ R v*D*R v := mul_le_mul' (mul_le_mul_left hR _) hR
         _ = A*(A'*D*B')*B := by calc R v*D*R v=(A*A')*D*(B'*B) := congrArg₂ (·*·) (congrArg (·*D) h₁.symm) h₄.symm
                       _=_ := by simp only [mul_assoc]
         _ ≤ A*(O ⊓ W)*B := mul_le_mul_left (mul_le_mul_right hT _) _
  · exact le_inf (mul_le_mul_left (mul_le_mul_right inf_le_left _) _) (hU _ _ hA hB _ inf_le_right)

lemma anti_order (v : Triple) : O ⊓ anti v = J v (-v) := by
  have he : ι (-v)= -ι v := by apply QuaternionAlgebra.ext <;> simp only [Quaternion.re_neg,Quaternion.imI_neg,Quaternion.imJ_neg,Quaternion.imK_neg] <;> simp [TunnellHurwitz.pure]
  ext x
  simp only [Submodule.mem_inf,mem_anti,mem_J,he,neg_mul,neg_eq_iff_eq_neg]

lemma inter_components {v : Triple} {A A' B B' : Lattice}
    (hA : A≤C v) (hA' : A'≤C v) (hB : B≤C v) (hB' : B'≤C v)
    (h₁ : A*A'=R v) (h₂ : A'*A=R v) (h₃ : B*B'=R v) (h₄ : B'*B=R v) (hs : A*R v=A) :
    A*O*B ⊓ C v=A*B ∧ A*O*B ⊓ anti v=A*J v (-v)*B := by
  constructor
  · rw [transport hA hA' hB hB' h₁ h₂ h₃ h₄ (mul_C v) (mul_C v),order_commutant,hs]
  · rw [transport hA hA' hB hB' h₁ h₂ h₃ h₄ (C_anti v) (anti_C v),anti_order]

lemma integral_projectors {n : ℕ} {v : Triple} (hv : v∈shell n) {D : Lattice}
    (hD : R v*D*R v≤D) {x : Q} (hx : x∈D) :
    ∃ l∈D ⊓ C v, ∃ r∈D ⊓ anti v, ((2*n:ℕ):Q)*x=l+r := by
  let V := ι v
  have hV : V∈R v := ⟨pure_mem v,rfl⟩
  have ht : V*x*V∈D := hD (Submodule.mul_mem_mul (Submodule.mul_mem_mul hV hx) hV)
  have hnx : (n:Q)*x∈D := by simpa only [zsmul_eq_mul,Int.cast_natCast] using D.smul_mem (n:ℤ) hx
  have hsq : V*V= -(n:Q) := pure_square hv
  have L : V*(V*x*V)= -((n:Q)*x*V) := by rw [←mul_assoc,←mul_assoc,hsq,neg_mul,neg_mul]
  have R : (V*x*V)*V= -((n:Q)*V*x) := by rw [mul_assoc (V*x),hsq,mul_neg,←Nat.cast_comm n (V*x),←mul_assoc]
  have hl : V*((n:Q)*x)=(n:Q)*V*x := by rw [←mul_assoc,Nat.commute_cast]
  refine ⟨(n:Q)*x-V*x*V,⟨D.sub_mem hnx ht,mem_C.mpr ?_⟩,(n:Q)*x+V*x*V,⟨D.add_mem hnx ht,mem_anti.mpr ?_⟩,?_⟩
  · change V*(_-_) = (_-_)*V; rw [mul_sub,sub_mul,L,R,hl]; abel
  · change V*(_+_) = -(( _+_)*V); rw [mul_add,add_mul,L,R,hl]; abel
  · push_cast; noncomm_ring

#print axioms inter_components
#print axioms integral_projectors
end TunnellCMGluing
