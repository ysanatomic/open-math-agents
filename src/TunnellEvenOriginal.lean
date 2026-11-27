import TunnellEvenCriticalBridge
import TunnellCMRankVanishing

/-! The even case of the necessary direction of Tunnell’s theorem. -/
namespace TunnellEvenOriginal

theorem arithmetic_vanishing : TunnellEvenTraceReduction.H2 := by
  classical
  refine fun n hn hmod hlarge P hP r h => ?_
  exact TunnellCMRankVanishing.trace_zero n hn hlarge hmod P hP r h

theorem tunnell_even : type_of% @CongruentNumber.Tunnell_even :=
  of_arithmetic_vanishing arithmetic_vanishing

end TunnellEvenOriginal
#print axioms TunnellEvenOriginal.tunnell_even
