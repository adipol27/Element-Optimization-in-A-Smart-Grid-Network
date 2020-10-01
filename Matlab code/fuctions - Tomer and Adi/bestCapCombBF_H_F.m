tic; 
initVoltages = Volt;
originalVerticies = verticies;

if (strcmp(feeder,'LoadDataF') || strcmp(feeder,'LoadDataH'))
    for kk = 1:2
        if kk == 1
            compVertices = Low_Voltage;
            capmat     = (compVertices == cap(:,1));
            [cappos,~] = find(capmat);
            
            Voltages = zeros(1,length(Volt));

            % initial compensation - connecting capacitors in low voltage
            % vertices only
            for jj = 1:length(cappos)
                verticies(compVertices(jj)).Q = verticies(compVertices(jj)).Q - cap(cappos(jj),2);
            end
            AlgoritemA
            AlgoritemB
            solver
            RMSE = sqrt(1/length(verticies) * sum((abs(Volt) - ones(size(Volt))).^2));
            temp = zeros(1,length(Volt)); temp(round(cap(cappos,1))) = 1;
            bestComb = and((abs(initVoltages) < VThL),temp);
            bestCombVoltageInit = abs(Volt);
        else
            compVertices = cap(:,1);
            availCaps    = zeros(1,length(Volt));
            availCaps(round(cap(:,1))) = 1;
            availCapsNum = length(compVertices);
            capCombs     = dec2bin(1:(2^availCapsNum-1),availCapsNum) - '0';
            
            for ii = 1:size(capCombs,1)
                verticies = originalVerticies;
                Volt = initVoltages;
                disp(['running [' num2str(ii) '/' num2str(size(capCombs,1)) ']']);
                cComb = capCombs(ii,:); %combniation of available (temporarily disconnected) capacitors
                totalComb = and((abs(initVoltages) < VThL),availCaps); %combniation of all capacitors
                for jj = 1:availCapsNum
                    verticies(compVertices(jj)).Q = verticies(compVertices(jj)).Q - cComb(jj)*cap(jj,2); %update the reactive power 
                    if cComb(jj) 
                        totalComb(compVertices(jj)) = 1;
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
                    bestCombCapVerts = cComb;
                    bestComb = totalComb;
                    bestCombVoltage = Voltages;
                end
            end
        end
    end
end

% Plot results
figure(); xAxis = 1:length(Volt);
subplot(2,1,1); PlotTree(verticies);
subplot(2,1,2); plot(xAxis,abs(initVoltages),'-o'); hold on;
plot(xAxis,abs(bestCombVoltageInit),'-o');
plot(xAxis,abs(bestCombVoltage),'-o');  
plot(xAxis,VThH*ones(1,length(Volt)),'r--',xAxis,VThL*ones(1,length(Volt)),'r--');
legend('Before compensation','Best capacitors combination - Low voltage vertices combinations','Best capacitors combination - Entire options')
if strcmp(feeder,'LoadDataH')
    t = 'Voltage profile - Feeder H';
else
    t = 'Voltage profile - Feeder F';
end
plotTitle = [{t},{['min RMSE = ' num2str(RMSE)]}]; 
title(plotTitle);
xlabel('Bus number [#]'); ylabel('Voltage [Volt pu]');
grid on;

figure();
subplot(1,2,1); 
stem(temp);
title('Capacitors connectivity - Low voltage vertices');
xticks(round(cap(:,1)));
xlabel('Bus number [#]'); ylabel('Connected [0/1]');
subplot(1,2,2); 
stem(bestComb);
title('Capacitors connectivity - Entire options');
xticks(round(cap(:,1)));
xlabel('Bus number [#]'); ylabel('Connected [0/1]');
