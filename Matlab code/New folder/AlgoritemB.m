%***********************************************
% *                    Algoritm B                             *
%***********************************************
% Calculate branches Sensitivity matrix M

% Input:
% verticies
% branches
% split_verticies
% pv_verticies
% slack_bus

% Output:
% M_1
% M
% X
% R

% This runs the B algorithem as defined in the artical
All_loop_verticies =  [split_verticies, pv_verticies];
X = [];
R = [];
Row_idx = 1;
for Loop_1 = All_loop_verticies
    Col_idx = Row_idx;
    for Loop_2 =  All_loop_verticies(Row_idx:end)
        V1 = Loop_1;
        if verticies(V1).type == BusTypes.PV
            V2 = V1;
            V1 = slack_bus;
        else
            V2 = verticies(V1).original_vertex;
        end
        U1 = Loop_2;
        if verticies(U1).type == BusTypes.PV
            U2 = U1;
            U1 = slack_bus;
        else
            U2 = verticies(U1).original_vertex;
        end
        [Total_R, Total_X, Common_Branches] = CommonPath(V1, V2, U1, U2, verticies, branches);
        
        X(Row_idx, Col_idx) = Total_X;
        X(Col_idx, Row_idx) = Total_X;
        R(Row_idx, Col_idx) = Total_R;
        R(Col_idx, Row_idx) = Total_R;
        Col_idx = Col_idx + 1;
    end
    Row_idx = Row_idx + 1;
end
M = [X R(:, 1:length(split_verticies)) ; -R(1:length(split_verticies), :) X(1:length(split_verticies), 1:length(split_verticies))];
M_1 = M^-1;
clear All_loop_verticies;
clear Row_idx;
clear Col_idx;
clear V1;
clear V2;
clear U1;
clear U2;
clear Loop_1;
clear Loop_2;
clear Total_R;
clear Total_X;
clear Common_Branches;


% fprintf('Algoritem "B" Calculated\n');

