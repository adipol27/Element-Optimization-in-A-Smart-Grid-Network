%***********************************************
% *                    Init case                               *
%***********************************************



% Ask the user for the which Bus (Transformer) data?
 
% feeder = input('please enter the Bus Letter (H or F) : ', 's');
feeder = 'F';
% if strcmp(feeder,'H')
%     LoadDataH
% elseif  strcmp(feeder,'F')
     LoadDataF
% end
fprintf('The chosen Bus(Transformer) is: %d\n' )
disp(feeder)
% ask for volt higer and lower limits
VThL = 0.95; %input('set minimum allowed voltage level(in pu): ');
if not(length(VThL))%                                           ADDED 10.5.2018 Yuval
    VThL = 0.9;
end
fprintf('Lower voltage threshold is: %d\n', VThL);
VThH = 1.05;%input('set maximum allowed voltage level(in pu): ');
if not(length(VThH))%                                           ADDED 10.5.2018 Yuval
    VThH = 1.1;
end
fprintf('Lower voltage threshold is: %d\n', VThH);
% Ask the user for the maximum number of iterations
MaxSolverIterations = 150;%input('please set max number of iterations (enter for default) : ');
if not(length(MaxSolverIterations))
    MaxSolverIterations = 2000;
end
fprintf('Maximum number of iterations: %d\n', MaxSolverIterations);

% Ask the user for the maximum allowed delta P,Q
MaxSolverDeltaPQ = 1e-10; %input('please set max allowed delta P,Q (enter for default) : ');
if not(length(MaxSolverDeltaPQ))
    MaxSolverDeltaPQ = 1e-10;
end
fprintf('Maximum allowed delta P,Q: %d\n', MaxSolverDeltaPQ);
% Initialize parameters for backward-forward sweeps
tap_cahnger_voltage = 1; %input('Please set the sluck bus voltage in pu (for default press enter) : ');
if not(length(tap_cahnger_voltage))
    tap_cahnger_voltage = 1;
end
fprintf('Sluck voltage: %d\n', tap_cahnger_voltage);

%load the data
%