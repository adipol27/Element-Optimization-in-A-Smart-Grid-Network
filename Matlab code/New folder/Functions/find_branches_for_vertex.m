function [branch_index] = find_branches_for_vertex(vertex, branches)
    branch_index = [];
    k = 1;
    for i = 1 : size(branches,2)
        if (branches(i).vertex_a == vertex)  || (branches(i).vertex_b == vertex)
            branch_index(k) = i;
            k = k + 1;
        end
    end
end