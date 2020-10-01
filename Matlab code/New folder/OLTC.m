%%%% OLTC

C = 0.025; % percentage of LTC change
if (isempty(Low_Voltage)) && (isempty(High_Voltage))
    disp('The system is stable');
else
    LTC_Counter = 0; % starting from 0 count up and down depending on the change
    LTC_HLimit  = 3;
    LTC_LLimit  = 3;
    
    % Handle Low-Voltage vertices
    while (~isempty(Low_Voltage)) && (LTC_Counter < LTC_HLimit) && (abs(LTC_Counter) < LTC_LLimit)
        fprintf('There is under voltage at vertice''%d\n',Low_Voltage)
        disp('appling upstage of tap changer')
        tap_cahnger_voltage = tap_cahnger_voltage + C;
        LTC_Counter = LTC_Counter + 1;
        AlgoritemA
        AlgoritemB
        solver
        figure;
        subplot(2,1,1); PlotTree(verticies);
        subplot(2,1,2);
        bus = 1:length(Volt);
        plot(bus,abs(Volt),'b-o',bus,VThL,'r--',bus,VThH,'r--'); grid on
        title('Voltages at vertices');
        xlabel('Bus number [#]');
        ylabel('Voltage [pu]');
        Low_Voltage = find(abs(Volt) < VThL);
    end
    
    % Handle High-Voltage vertices
    while (~isempty(High_Voltage)) && (LTC_Counter < LTC_HLimit) && (abs(LTC_Counter) < LTC_LLimit)
        fprintf('There is Over voltage at vertice''%d\n',High_Voltage)
        disp('appling downstage of tap chnger')
        tap_cahnger_voltage = tap_cahnger_voltage - C;
        LTC_Counter = LTC_Counter - 1;
        AlgoritemA
        AlgoritemB
        solver
        figure; 
        subplot(2,1,1); PlotTree(verticies);
        subplot(2,1,2);
        bus = 1:length(Volt);
        plot(bus,abs(Volt),'b-o',bus,VThL,'r--',bus,VThH,'r--'); grid on;
        title('Voltages at vertices');
        xlabel('Bus number [#]');
        ylabel('Voltage [pu]');
        High_Voltage = find(abs(Volt) > VThH);
    end

    if ~isempty(Low_Voltage)
        fprintf('Tap Changer possition is''%d\n',tap_cahnger_voltage);
        fprintf('There is under voltage at vertice''%d\n',Low_Voltage);
        disp('Tap Changer Could not get to voltage stability');
    else
        disp(' Voltage stability restored');
        fprintf('Tap Changer possition is''%d\n',tap_cahnger_voltage);
    end
end