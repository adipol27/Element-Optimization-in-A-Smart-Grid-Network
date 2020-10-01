%%%%%%% capop 29.5.2018 changed on 1.6.2018

%%%%%%connect capacitors in the vertiices where low voltage threshold was
%%%%%%                           reached
%cap_pos=zeros(size(Low_Voltage)) % initializing a vector with a length of the amount of points where low voltage was calculated
%
% for k=1:1:length(Low_Voltage)
% cap_pos(k)=find(cap(:,1)==Low_Voltage(k))% put the verices number in which low voltage was detected
% 
% verticies(Low_Voltage(k)).Q=verticies(Low_Voltage(k)).Q-cap(cap_pos(k),2) %update the reactive power at the verticies where the capacitors are connected
% 
% end


bestCapCombBF

capmat=Low_Voltage==cap(:,1);% ommits a matrix with capacitor possitions
[cappos,col]=find(capmat); % define in cappos the possitions of the capacitors
for j=1:1:length(cappos)
    verticies(Low_Voltage(j)).Q=verticies(Low_Voltage(j)).Q-cap(cappos(j),2); %update the reactive power at the verticies where the capacitors are connected
end
clear j
AlgoritemA
AlgoritemB
solver
figure
subplot(2,1,1);
PlotTree(verticies) 
subplot(2,1,2);
i=1:1:length(Volt);
plot(i,abs(Volt),'b-o',i,VThL,'r--',i,VThH,'r--' )
grid on
title('Voltages at verticeswith capacitors connected')
xlabel('bus number')
ylabel('Voltage [pu]')
High_Voltage=find(abs(Volt)>VThH);