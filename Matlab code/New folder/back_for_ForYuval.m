clear all;
close all;
clc;

initCase
AlgoritemA
AlgoritemB

solver

abs(Volt)
figure
subplot(2,1,1);
PlotTree(verticies) 
subplot(2,1,2);
i=1:1:length(Volt);
VThL=VThL*ones(1,length(Volt));

VThH=VThH*ones(1,length(Volt));
plot(i,abs(Volt),'b-o',i,VThL,'r--',i,VThH,'r--' )
grid on
title('Voltages at vertices')
xlabel('bus number')
ylabel('Voltage [pu]')


