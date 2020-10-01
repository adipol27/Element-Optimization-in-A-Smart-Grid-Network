clear all;
close all;
clc;
% 
initCase
AlgoritemA
AlgoritemB

solver

abs(Volt)
abs(Branch_current(length(Branch_current),:))
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

%%%%%%%% find low voltage and high voltage  in the system  - 27.5.2018
Low_Voltage  = find(abs(Volt) < VThL); % finds the verices in which there is a low voltage
High_Voltage = find(abs(Volt) > VThH); % finds the verices in which there is a high voltage

% choosing between tap changer and capacitors by user - 27.5.2018

% op = 'cap';%input('please Chhoose operation by tap changer (tc) or Capacitors (cap) : ', 's'); % ask the user if to operate capacitors or LTC
% if strcmp(op,'tc')
%     OLTC;
%     tic;
% elseif strcmp(op,'cap')
%     capop;
%     tic;
% end
% fprintf('The chosen operation is by: %d\n' )

capop;
OLTC;
disp(op)
         
% calculate the current at the slack bus
vertex_a  = zeros(length(branches),1);
sum_slack = 0;
for k = 1:length(branches)
    vertex_a(k) = branches(k).vertex_a;
end

BN = find(vertex_a == 1);
for n = 1:length(BN)
    sum_slack = sum_slack + Branch_current(BN(n));
end

fprintf('The slack bus current is: %.3f\n', abs(sum_slack));

S_slack    = tap_cahnger_voltage * conj(sum_slack);
S_slack_rv = S_slack * baseMVA;
P_slack    = real(S_slack);
P_slack_rv = P_slack * baseMVA;
Q_slack    = imag(S_slack);
Q_slack_rv = Q_slack * baseMVA;

fprintf('The total Power at the Slack bus is:%.3f\n', abs(S_slack));
fprintf('The active power at slack bus is:%.3f\n', P_slack);
fprintf('The reactive power at the slack bus is:%.3f\n', Q_slack);
power_load = zeros(length(verticies),1);

for l = 1:length(verticies)
    power_load(l) = verticies(l).P;
end

sum_load  = sum(power_load);
losses    = P_slack - sum_load;
losses_rv = losses * baseMVA;

fprintf('The losses in the system are:%.4f\n',losses);
disp('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
disp('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
disp('summery of results in real values');
disp('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
disp('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

formatSpecS = 'The total Power at the Slack bus is in real values: %6.1f [VA]\n';
fprintf(formatSpecS,abs(S_slack_rv))
formatSpecP = 'The active power at slack bus is: %6.1f [W]\n';
fprintf(formatSpecP,abs(P_slack_rv))
formatSpecQ = 'The reactive power at slack bus is: %6.1f [VAr]\n';
fprintf(formatSpecQ,abs(Q_slack_rv))
formatSpecL = 'The Total losses in the system in Watts are:: %6.1f [W]\n';
fprintf(formatSpecL,abs(losses_rv))

toc
% % 1.needs to take care of the PV bus
% % 2.need to adjust the alerts and announcment for the case of High voltage
% %3. needs to think about the counter of the LTC in combined high and low
% % voltage cases.
% %change reactive so cos phi will be as wanted
% % add cos phi