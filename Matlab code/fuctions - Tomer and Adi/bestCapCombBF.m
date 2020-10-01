% This function computes the best capacitors combination in term of
% Minimum Mean Squared Error in Brute-Force method (checking all possible
% capacitor combinations)
tic; 
initVoltages = Volt;
originalVerticies = verticies;

capVal = 100e3/(baseMVA*10^6); % capacitor value 100 kVar normalized by the base voltage
cap = [(1:numel(verticies))' capVal*ones(numel(verticies),1)]; 

Voltages = zeros(1,length(Volt));

% initial compensation - connecting capacitors in low voltage vertices only
for jj = 1:length(Low_Voltage)
    verticies(Low_Voltage(jj)).Q = verticies(Low_Voltage(jj)).Q - cap(Low_Voltage(jj),2);
end

AlgoritemA
AlgoritemB
solver
RMSE = sqrt(1/length(verticies) * sum((abs(Volt) - ones(size(Volt))).^2));
bestCombInit = (abs(initVoltages) < VThL);
bestCombVoltageInit = abs(Volt);
verticesAfterInitComp = verticies;

plotResults
title({'Voltage profile after initial compensation',['RMSE = ' num2str(RMSE) '[V p.u]']}');

availCapsPos = find(~(abs(initVoltages) < VThL));

availCaps = length(availCapsPos);
capCombs   = dec2bin(1:(2^availCaps-1),availCaps) - '0';

for ii = 1:size(capCombs,1)
    disp(['running [' num2str(ii) '/' num2str(size(capCombs,1)) ']']);
%     verticies = verticesAfterInitComp;
    cComb = capCombs(ii,:); %combniation of available (temporarily disconnected) capacitors
    totalComb = abs(initVoltages) < VThL; %combniation of all capacitors
    for jj = 1:availCaps
        verticies(availCapsPos(jj)).Q = verticies(availCapsPos(jj)).Q - cComb(jj)*cap(availCapsPos(jj),2); %update the reactive power 
        if cComb(jj) 
            totalComb(availCapsPos(jj)) = 1;
        end
    end
    AlgoritemA
    AlgoritemB
    solver
    Voltages = Volt;
    rmse = sqrt(1/length(verticies) * sum((abs(Voltages) - ones(size(Voltages))).^2));
    if Solver_iteration > 2000
        break
    end
    if rmse < RMSE
        RMSE = rmse;
        bestComb = totalComb;
        bestCombVoltage = Voltages;
    end
end

computationTime = toc;

% Plot results
figure(); subplot(2,1,2);
plot(abs(initVoltages),'-o'); hold on;
plot(abs(bestCombVoltageInit),'-o');
plot(abs(bestCombVoltage),'-o');
plot(xAxis,VThH*ones(1,length(Volt)),'r--',xAxis,VThL*ones(1,length(Volt)),'r--');
xlabel('Bus number [#]'); ylabel('Voltage [Volt pu]');
grid on;
legend('Before compensation','Best capacitors combination - Low voltage vertices combinations','Best capacitors combination - Entire options');
title({'Voltage Profile - case 15 Radial',['min RMSE = ' num2str(RMSE) ' [Volt p.u]']});
results = [];

% get combination number from results.voltages in which the capacitors are connected only in low voltage vertices
% lowVoltComb = sum((Low_Voltage == cap(:,1)));
% for ii = 1:size(capCombs,1)
%     if all(lowVoltComb == capCombs(ii,:))
%         results.lowVoltComb = ii;
%     end
% end


% [~,idx] = min(results.RMSE);
% figure;
% plot(abs(results.voltages(idx,:))); hold on;
% plot(abs(results.voltages(results.lowVoltComb,:)));
% plot(abs(initVoltages)); 
% plot(ones(size(initVoltages))); 
% plot(VThL,'m--'); 
% plot(VThH,'r--'); grid on;
% xlabel('Bus Number [#]'); ylabel('Voltage [pu]');
% title({'Best capacitors combination - Minimal RMSE',['Feeder ',feeder],['RMSE = ', num2str(results.RMSE(idx)),'[V]'],['Calculation Time = ',num2str(computationTime),'[sec]']});
% legend('Best capacitors combination - Entire options','Best capacitors combination - Low voltage vertices combinations','Before connecting Capacitors','1 pu voltage','Min voltage allowed','Max voltage allowed');
% 
% figure;
% plot(results.RMSE); grid on;
% xlabel('Capacitors Combination Number [#]'); ylabel('RMS Error [V]');
% title({'RMS Error Vs. Capacitors Combination',['Feeder ',feeder]});

figure; % capacitors connectivity graph
subplot(1,2,1); 
stem(cap(:,1),bestCombInit);
title('Capacitors connectivity - Low voltage vertices');
xlabel('Bus number [#]'); ylabel('Connected [0/1]');
xticks(round(cap(:,1)));
subplot(1,2,2); 
stem(cap(:,1),bestComb);
title('Capacitors connectivity - Entire options');
xlabel('Bus number [#]'); ylabel('Connected [0/1]');
xticks(round(cap(:,1)));



% Go back to initial results - without capacitors
verticies = originalVerticies;
AlgoritemA
AlgoritemB
solver



Volt = initVoltages;
verticies = originalVerticies;
clear compensateLowVolt originalVerticies initVoltages compensateLowVolt capsNum capCombs Voltages RMSE computationTime idx ii jj Solver_iteration