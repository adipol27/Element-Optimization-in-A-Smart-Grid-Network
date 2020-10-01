% this implements one iteration of the backward-forward sweep

% Backward sweep :
% make sure we have a new lines of branches currents
Branch_current(Solver_iteration, :) = zeros(1,length(branches));

Depth = Max_depth;
while (Depth >=  1)
    for i = [verticies.bus_number]
        if verticies(i).Depth == Depth
            % calc branch current
            vertex = verticies(i);
            Branch_current(Solver_iteration, vertex.Arch)  = Branch_current(Solver_iteration, vertex.Arch)  + conj((vertex.P - vertex.gen_P + j*(vertex.Q - vertex.gen_Q))  / volt(Solver_iteration,i));
            if Depth > 1
                Branch_current(Solver_iteration, verticies(vertex.Perent).Arch) = Branch_current(Solver_iteration, verticies(vertex.Perent).Arch) + Branch_current(Solver_iteration, vertex.Arch);
            end
        end
    end
    Depth = Depth - 1;
end

% Forward sweep :
volt(Solver_iteration + 1, slack_bus)  = volt(Solver_iteration, slack_bus);
while (Depth < Max_depth)
    Depth = Depth + 1;
    for i = [verticies.bus_number]
        if verticies(i).Depth == Depth
            vertex = verticies(i);
            branch = branches(vertex.Arch);
            volt(Solver_iteration + 1, i) = volt(Solver_iteration + 1, vertex.Perent) - (branch.R + j* branch.X) * Branch_current(Solver_iteration, vertex.Arch) ;
        end
    end
end

clear Depth
clear branch
clear vertex
clear i
%clear Branch_current  % 9.5.2018
abs(Branch_current);   %  9.5.2018
