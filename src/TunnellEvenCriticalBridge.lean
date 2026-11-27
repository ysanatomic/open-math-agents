import TunnellEvenWinding
import TunnellEvenInputEta
import TunnellEvenInputHecke
import TunnellEvenInputShimura
import TunnellEvenRootPeriod
import TunnellEvenTraceReduction
import TunnellCMTraceSlope

/-! The original even congruent-number theorem assembled from the counting
identity, modularity, and vanishing for rational points of infinite order. -/
namespace TunnellEvenOriginal

theorem critical_evaluation : TunnellEvenTraceReduction.H1 := by
  classical
  refine fun n hn L hL hE => ?_
  exact TunnellCMCritical.central_trace n hn L hL (fun s hs =>
    (hE s hs).unique (TunnellCMLSeries.lattice_euler n s (by linarith)))

theorem of_arithmetic_vanishing (arithmetic_vanishing : TunnellEvenTraceReduction.H2) : type_of% @CongruentNumber.Tunnell_even :=
  OMA.R_CongruentNumber_Tunnell_even_R1.main
    (OMA.R_CongruentNumber_Tunnell_even_R1_H1_R1.main
      TunnellEvenInputEta.OMA.solution TunnellEvenInputHecke.OMA.solution)
    (TunnellEvenRankReduction.main TunnellEvenRootPeriod.OMA.solution
      (TunnellEvenTraceReduction.main critical_evaluation arithmetic_vanishing))
    (OMA.R_CongruentNumber_Tunnell_even_R1_H3_R1.main
      TunnellEvenInputShimura.OMA.solution TunnellEvenWinding.central)

end TunnellEvenOriginal
#print axioms TunnellEvenOriginal.of_arithmetic_vanishing
