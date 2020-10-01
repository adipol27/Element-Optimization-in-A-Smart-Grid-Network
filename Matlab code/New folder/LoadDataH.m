%***********************************************
% *                    Load data Feeder H                               *
%***********************************************
% Read case from an MPC format to local variables

% Input:
% (String) Case - Path to MPC format case file

% Output:
% (Struct) BusTypes - Enum bus types
% (Int) Ub - Voltage base V
% (Int) Sb - Base MVA
% (Int) NumOfVerticies - number of original verticies
% (Int) NumOfBranches - number of original branches
% (Int) slack_bus - Index of the slack bus
% (Array) verticies
% (Array) pv_verticies - Indexes of pv verticies
% (Array) branches

clear verticies
clear branches
clear vertex
clear split_verticies
clear M_1
clear M
clear X
clear R
%%%%%%%    static Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% system  base
baseMVA = 1000000;
BaseKV=13.2;
%% bus data
%	bus_i	type	P      q
bus = [
	1	3 10000 10000   ;
	2	1 10000 10000	;
	3	1 10000 10000	;
    4	1 10000 10000	;
    5	1 10000 10000	;
    6	1 10000 10000	;
    7	2 10000 10000   ;
	8	1 10000 10000	;
	9	1 10000 10000	;
        ];
% bus(:,4) = bus(:,4)/2;
%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
gen = [
	1	0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
   7	5000 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
];
%% branch data
%	fbus	tbus	r	x	
branch = [
	1	2	0.2   0.4	;
    1	9	0.1     0.2		;   
	2	3	0.15	0.3	;
    2	7	0.1	0.2	;   
    3	4	0.2	0.4	;
    3	8	0.2	0.4;
    4	5	0.15 0.3	;   
    5	6	0.1	0.2	;   
    ];


%% capcitor data    %% 27.5.2018 
%  bus  MVAr
cap =[
    4   1*10^-2*1.2; % the 10^-2 is just a factor for the meanwhile sine the powers are not real
    5   1*10^-2*1.2;
    6   1*10^-2*1.2;
    8   1*10^-2*1.2;
    9   1*10^-2*0.6;
    ];
    
%%% transformer data   %%%  1.6.2018
TrMVA=40; % nominal power of the transformer
ek=12.5;  % short circuit impedance in percentage







%mpc = loadcase(Case);
slack_bus = bus( find( bus( :, 2) == 3 ), 1);

NumOfVerticies = size(bus,1);
NumOfBranches = size(branch,1);
BusTypes =  struct('PQ',1, 'PV',2, 'Ref',3, 'Isolated',4);
pv_verticies = [];

for i = 1:NumOfVerticies
    vertex.bus_number = bus(i,1);
    vertex.P = bus(i,3) / baseMVA;
    vertex.Q = bus(i,4) / baseMVA;
    %vertex.visited = false;
    vertex.type = bus(i,2);
   gen_P = 0;
   gen_Q = 0;
   volt = 1;
    if vertex.type == BusTypes.PV
        pv_verticies(end +1) = vertex.bus_number;
        gens =  find(gen(:,1) == vertex.bus_number);
        gen_P = sum( gen(gens, 2)) / baseMVA;
        gen_Q = sum( gen(gens, 3)) / baseMVA;
        volt =gen(gens(1), 6) ;%/ Ub;%dont need to divide. it is already p.u
    end
     vertex.gen_P = gen_P;
     vertex.gen_Q = gen_Q;
     vertex.voltage = volt;
     verticies(vertex.bus_number, : ) = vertex;
     clear vertex;
end
clear gen_P;
clear gen_Q;
clear gens;
clear volt;

for i = 1:NumOfBranches
    branches(i).index = i;
    branches(i).vertex_a = branch(i,1);
    branches(i).vertex_b = branch(i,2);
    branches(i).R = branch(i,3);
    branches(i).X = branch(i,4);
    branches(i).visited = false;
end
clear i;


