clear all; close all; clc; 
% get all feeders 


% extract relevant data 
feeder = 'test_15_radial'; % LoadDataF / LoadDataH / test_15_radial
if strcmp(feeder,'test_15_radial')
    eval(['data = ' feeder ';']);
    extractFeederData;
else
    eval(feeder);
end

MaxSolverIterations = 2000;
MaxSolverDeltaPQ = 1e-7;
tap_cahnger_voltage = 1; 

AlgoritemA
AlgoritemB

VThL = 0.958; % H,F - 0.95; case15 - 0.96
VThH = 1.05;
solver
plotResults;

Low_Voltage  = find(abs(Volt) < VThL); % finds the verices in which there is a low voltage
High_Voltage = find(abs(Volt) > VThH); % finds the verices in which there is a high voltage

if strcmp(feeder,'test_15_radial')
    bestCapCombBF
elseif (strcmp(feeder,'LoadDataF') || strcmp(feeder,'LoadDataH'))
    bestCapCombBF_H_F
else
    error('Undefined Feeder');
end
