% break point balancing
dV =[];
dPhase= [];
i =  1;
for v = split_verticies
    vertex = verticies(v);
    V1 = volt(Solver_iteration+1, vertex.bus_number) ;
    V2 = volt(Solver_iteration+1, vertex.original_vertex);
    dV(i) = abs(V1) - abs(V2);
    phases = unwrap( [ angle(V1), angle(V2) ] );
    dPhase(i) = phases(1) - phases(2);
    i = i + 1;
end

for v = pv_verticies
    vertex = verticies(v);
    V1 = volt(Solver_iteration+1, vertex.bus_number) ;
    V2 = vertex.voltage;
    dV(i) = abs(V1) - abs(V2);
    %phases = unwrap( [ angle(V1), angle(V2) ] );
    %dPhase(i) = phases(1) - phases(2);
    i = i + 1;
end



res = M^-1 * [dV' ; dPhase'];
dQ(Solver_iteration,:) = res(1:length(dV));
dP(Solver_iteration,:) = res(end +1 - length(dPhase):end);

% move delta Q, P to the split verticies
i = 1;
for vertex = split_verticies
    verticies(vertex).Q = verticies(vertex).Q + 0.5*dQ(Solver_iteration,i);
    verticies(vertex).P = verticies(vertex).P + 0.5*dP(Solver_iteration,i);
    vertex = verticies(vertex).original_vertex;
    verticies(vertex).Q = verticies(vertex).Q - 0.5*dQ(Solver_iteration,i);
    verticies(vertex).P = verticies(vertex).P - 0.5*dP(Solver_iteration,i);
    i = i + 1;
end

for vertex = pv_verticies
    verticies(vertex).Q = verticies(vertex).Q + 0.5 * dQ(Solver_iteration,i);
    i = i + 1;
end

clear i
clear res
clear vertex
clear V1
clear V2
clear phases
clear v

