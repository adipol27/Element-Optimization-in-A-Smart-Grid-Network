baseMVA = data.baseMVA;
bus     = data.bus(:,1:4);
gen     = data.gen;
branch  = data.branch(:,1:4);

slack_bus      = find(bus(:,2) == 3);
NumOfVerticies = size(bus,1);
NumOfBranches  = size(branch,1);
BusTypes       =  struct('PQ',1, 'PV',2, 'Ref',3, 'Isolated',4);
pv_verticies   = [];

for jj = 1:NumOfVerticies
    vertex.bus_number = bus(jj,1);
    vertex.P = bus(jj,3)/baseMVA;
    vertex.Q = bus(jj,4)/baseMVA;
    vertex.type = bus(jj,2);
    gen_P = 0;
    gen_Q = 0;
    volt = 1;
    if vertex.type == BusTypes.PV
        pv_verticies(end +1) = vertex.bus_number;
        gens  =  find(gen(:,1) == vertex.bus_number);
        gen_P = sum( gen(gens, 2))/baseMVA;
        gen_Q = sum( gen(gens, 3))/baseMVA;
        volt  = gen(gens(1),6);%/ Ub;%dont need to divide. it is already p.u
    end
    vertex.gen_P   = gen_P;
    vertex.gen_Q   = gen_Q;
    vertex.voltage = volt;
    verticies(vertex.bus_number,:) = vertex;
    clear vertex;
end
clear gen_P;
clear gen_Q;
clear gens;
clear volt;

for jj = 1:NumOfBranches
    branches(jj).index = jj;
    branches(jj).vertex_a = branch(jj,1);
    branches(jj).vertex_b = branch(jj,2);
    branches(jj).R = branch(jj,3);
    branches(jj).X = branch(jj,4);
    branches(jj).visited = false;
end
clear jj;