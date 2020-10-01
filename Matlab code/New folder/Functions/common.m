function [vertex,total_r,total_x] = common(u, v, verticies, branches)
    total_r = 0;
    total_x = 0;
    while( u~= v)
        % As long as we did not get to a joined parent of both u
        % and v, take 1 step up the tree.
        if verticies(u).Depth == verticies(v).Depth
            total_r = total_r + branches(verticies(u).Arch).R + branches(verticies(v).Arch).R;
            total_x = total_x + branches(verticies(u).Arch).X + branches(verticies(v).Arch).X;
            v = verticies(v).Perent;
            u = verticies(u).Perent;
        elseif verticies(u).Depth > verticies(v).Depth
            total_r = total_r + branches(verticies(u).Arch).R ;
            total_x = total_x + branches(verticies(u).Arch).X;
            u = verticies(u).Perent;
        elseif verticies(u).Depth < verticies(v).Depth
            total_r = total_r + branches(verticies(v).Arch).R;
            total_x = total_x + branches(verticies(v).Arch).X;
            v = verticies(v).Perent;
        end
    end % end of while
    vertex = u;
end