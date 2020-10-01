clear all; close all; clc; 
% get all feeders 
feedersList = {'LoadDataF','LoadDataH','test_85_radial'};

% extract relevant data 
for ii = 3
    feeder = feedersList{ii};
    if strcmp(feeder,'test_85_radial')
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
    
    VThL = 0.972;
    VThH = 1.05;
    solver
    plotResults;
    
    Low_Voltage  = find(abs(Volt) < VThL); % finds the verices in which there is a low voltage
    High_Voltage = find(abs(Volt) > VThH); % finds the verices in which there is a high voltage
    
    bestCapCombBF
end
