function [Total_R, Total_X, Common_Branches] = CommonPath(V1, V2, U1, U2, verticies, branches)
    V_Path = FindPath(V1, V2, verticies);
    U_Path = FindPath(U1, U2, verticies);
    [Common_Branches, order_V, order_U] = intersect(V_Path(1,:), U_Path(1,:));
    Common_Branches(end+1, :) = V_Path(2,order_V) .* U_Path(2,order_U);
    [Total_R, Total_X] = SumCommonPath(Common_Branches, branches);
end

function [Common_Branches] = FindPath(v, u, verticies)
    Common_Branches = zeros(2,0);
    while( u~= v)
        % As long as we did not get to a joined parent of both u and v,
        % take 1 step up the tree.
        if verticies(u).Depth == verticies(v).Depth
            Common_Branches(:, end+1) = [verticies(u).Arch ; -1];
            u = verticies(u).Perent;
            Common_Branches(:, end+1) = [verticies(v).Arch; 1];
            v = verticies(v).Perent;
        elseif verticies(u).Depth > verticies(v).Depth
            Common_Branches(:, end+1) = [verticies(u).Arch; -1];
            u = verticies(u).Perent;
        elseif verticies(u).Depth < verticies(v).Depth
            Common_Branches(:, end+1) = [verticies(v).Arch; 1];
            v = verticies(v).Perent;
        end
    end % end of while
end

function [Total_R, Total_X] = SumCommonPath( Common_Branches, branches)
    Total_R = 0;
    Total_X = 0;
    for b = Common_Branches
        Total_R = Total_R + branches(b(1)).R * b(2);
        Total_X = Total_X + branches(b(1)).X * b(2);
    end
end