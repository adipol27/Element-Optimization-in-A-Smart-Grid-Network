figure
subplot(2,1,1);
PlotTree(verticies) 
subplot(2,1,2);
xAxis=1:length(Volt);
plot(xAxis,abs(Volt),'-o'); hold on; plot(xAxis,VThH*ones(1,length(Volt)),'r--',xAxis,VThL*ones(1,length(Volt)),'r--');
grid on
title('Voltages at vertices')
xlabel('bus number')
ylabel('Voltage [pu]')

