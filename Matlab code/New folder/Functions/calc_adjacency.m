function [adj] = calc_adjacency(branches)
    for i = 1 : length(branches)
        adj(branches(i).vertex_a, branches(i).vertex_b) = complex(branches(i).R, branches(i).X);
        adj(branches(i).vertex_b, branches(i).vertex_a) = complex(branches(i).R, branches(i).X);
    end
end