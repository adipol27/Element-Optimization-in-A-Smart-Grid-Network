%***********************************************
% *                    Algoritm A                             *
%***********************************************
% Takes a Semi-meshed network and breaks the loops until a tree like network
% is achived

% Input:
% verticies
% branches
% slack_bus
% NumOfBranches

% Output:
% verticies (modified)
% branches (modified)
% split_verticies


% This runs the A algorithem as defined in the artical
if not(exist('split_verticies')) 
    split_verticies = [];
end
Visited_verticies = zeros(1, length([verticies.bus_number]));
Visited_branches = zeros(1, NumOfBranches);
verticies(slack_bus).Arch = NumOfBranches+1;
verticies(slack_bus).Depth = 0;
verticies(slack_bus).Perent = 0;
Visited_verticies(slack_bus) = true;

Verticies_to_visit = [slack_bus];
Visit_pointer = 0;
while sum(Visited_branches) < NumOfBranches
    % Take new vertex to check its branches
    Visit_pointer = Visit_pointer + 1;
    Vertex = Verticies_to_visit(Visit_pointer);
    
    % Finds all the branches connected to current vertex 
    % and store branches indexes in br
    Vertex_branches = find_branches_for_vertex(Vertex, branches);
    
    % Loop thought all the current vertex branches
    for k = (Vertex_branches(:))'
        if Visited_branches(k)
            % If we already traveled though the branch
            % there is nothing to do with it, simply get the next branch.
            continue
        end
        % Mark the branch as visited
        Visited_branches(k) = true;
        % Find the vertex (other then the current vertex) on this branch
        if branches(k).vertex_a == Vertex
            Other_vertex = branches(k).vertex_b;
        else
            Other_vertex = branches(k).vertex_a;
        end

        % Check if the other vertex has already been visited,
        % if so, we found a loop and break it.
        if Visited_verticies(Other_vertex)
            % Create a "new" vertex (splitted from the other vertex)
            verticies(end+1).P = 0;
            verticies(end).Q = 0;
            verticies(end).type = BusTypes.PQ;
            verticies(end).gen_P = 0;
            verticies(end).gen_Q = 0;
            verticies(end).bus_number = length(verticies);
            % Store the original vertex this "new" vertex was plitted from
            verticies(end).original_vertex = Other_vertex;
            Visited_verticies(end+1) = false;
            % Change the Branch to point to the "new" vertex.
            branches(k).vertex_a = Vertex;
            branches(k).vertex_b = length(verticies);
            % set other vertex to be the "new" vertex for more processing
            Other_vertex = length(verticies);
            split_verticies(end + 1) = Other_vertex;
        end
        
        % Set Arch, Depth & Perent for the other vertex and mark it as
        % visited.
        verticies(Other_vertex).Arch = k;
        verticies(Other_vertex).Depth = verticies(Vertex).Depth +1;
        verticies(Other_vertex).Perent = Vertex;
        Visited_verticies(Other_vertex) = true;
        
        % Store the other vertex to check its branches
        Verticies_to_visit(end +1) = Other_vertex;
    end
    % Go to check branches for the next vertex
end
% clear temporary variables of algoritem A
clear Visit_pointer;
clear Vertex;
clear Vertex_branches;
clear Verticies_to_visit;
clear Other_vertex;
clear k;
clear Visited_branches;
clear Visited_verticies;

% print some info ...
% if length(split_verticies) > 0
%     fprintf('Algoritem "A" found %d loops\n', length(split_verticies));
%     loops = [ [verticies(split_verticies).original_vertex] ;[verticies(split_verticies).bus_number] ];
%     %DEBUG('%d -> %d\n', loops);
%     clear loops
% else
%     fprintf('Algoritem A found no loops\n');
% end
 