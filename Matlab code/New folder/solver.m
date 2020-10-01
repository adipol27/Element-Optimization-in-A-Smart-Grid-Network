%***********************************************
% *                         Solver                                 *
%***********************************************

% Input:
% verticies
% branches
% split_verticies
% pv_verticies
% slack_bus

% Output:
% M_1
% M
% X
% R

Max_depth = max([verticies.Depth]);
%%% made a comment on the 9.5.2018 and moved to InitCase
% % Initialize parameters for backward-forward sweeps
% tap_cahnger_voltage = input('Please set the sluck bus voltage in pu (for default press enter) : ');
% if not(length(tap_cahnger_voltage))
%     tap_cahnger_voltage = 1;
% end
% fprintf('Sluck voltage: %d\n', tap_cahnger_voltage);
Solver_iteration = 1;
volt = tap_cahnger_voltage*ones(1, length(verticies));
Stop = false;

while(Solver_iteration <= MaxSolverIterations && not(Stop))
%     DEBUG('Solver Iteration %d / %d: ', Solver_iteration, MaxSolverIterations)
    BackwardForwardSweepA
    BreakPointBalancing
    StopCreteriaA

    Solver_iteration = Solver_iteration + 1;
end
% 
% if Stop
%     fprintf('Solver finished with %d iterations\n', Solver_iteration - 1)
% else
%     fprintf('Solver FAILED\n')
% end

clear Max_depth
% clear Solver_iteration
clear Stop
clear dP dPhase dQ dV deltaP deltaQ
Volt = volt(end,:);
clear volt
