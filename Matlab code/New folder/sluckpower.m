vertex_a=zeros(length(branches),1)
sum_slack=0
for k=1:1:length(branches)
vertex_a(k)=branches(k).vertex_a
end
BN=find(vertex_a==1)
for n=1:1:length(BN)
sum_slack=sum_slack+Branch_current(BN(n));
end
S_slack=tap_cahnger_voltage*conj(sum_slack);
P_slack=real(S_slack);
Q_slack=imag(S_slack);

fprintf('The total Power at the Slack bus is:''%d\n', abs(S_slack))
fprintf('The active power at slack bus is:''%d\n', P_slack)
fprintf('The reactive power at the slack bus is:''%d\n',Q_slack)
% 1.needs to take care of the PV bus
power_load=zeros(length(verticies),1)
for l=1:1:length(verticies)
power_load(l)=verticies(l).P
end
sum_load=sum(power_load)
losses=P_slack-sum_load