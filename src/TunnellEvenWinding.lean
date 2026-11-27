import TunnellSignedTraceSquare
import TunnellWindingBridge
import TunnellPublicSignedSquare

/-! The even-twist central square identity for the level-32 eta product. -/
namespace TunnellEvenWinding

theorem signed_square {d : ℕ} (hs : Squarefree d) (hd : d%4=1) :
    TunnellWindingTrace.signed d hd=TunnellFiniteSymbols.shellPeriod d^2 :=
  TunnellWindingTrace.square_of_evidence hd
    (TunnellWindingTrace.evidence TunnellWindingBridge.bridge hs hd).some
    (TunnellWindingTrace.evidence TunnellWindingBridge.bridge squarefree_one (by decide : 1%4=1)).some
    (TunnellWindingTrace.evidence TunnellWindingBridge.bridge
      (show Squarefree 17 from (by decide : Nat.Prime 17).squarefree) (by decide)).some

theorem public_signed_square : OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1_H2_R1.H1 :=
  TunnellPublicSignedSquare.public_H1 (fun _ hs hd => signed_square hs hd)

theorem central : OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.H2 :=
  TunnellWindingTrace.of_bridge TunnellWindingBridge.bridge

end TunnellEvenWinding
#print axioms TunnellEvenWinding.public_signed_square
#print axioms TunnellEvenWinding.central
