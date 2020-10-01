function [valid, validation] = ValidateCase(Case)
    % Store case path
    validation.case = Case ;
    
    % Load case
    mpc = loadcase( Case );
    
    % Find reffrence buses
    validation.ref_buses =  mpc.bus(find(mpc.bus(:,2) ==3),1)';
    
    % Find non PQ buses
    validation.pv_buses = mpc.bus(find(mpc.bus(:,2) > 1),1)';
    
    % Find all busses with gens
    validation.gen_buses = mpc.gen(:,1)';
    
    
    validation.multiple_gens_per_bus = length( validation.gen_buses ) ~= length( unique( validation.gen_buses) );
    validation.diff_gen_pv_buses = [ setdiff( validation.gen_buses, validation.pv_buses ) , 
                                                                                   setdiff( validation.pv_buses, validation.gen_buses ) ] ;
    
     gen_voltages_invalid = [];
    for i = 1:length( mpc.gen(:,1) )
        if mpc.gen( i, 6) ~= mpc.bus(find(mpc.bus(:,1) == mpc.gen( i, 1) ), 8)
            gen_voltages_invalid(end+1).gen_index = i;
            gen_voltages_invalid(end).gen_voltage =  mpc.gen( i, 6);
            gen_voltages_invalid(end).bus_index = find(mpc.bus(:,1) == mpc.gen( i, 1) );
            gen_voltages_invalid(end).bus_voltage = mpc.bus(find(mpc.bus(:,1) == mpc.gen( i, 1) ), 8);
        end
    end
    validation.gen_voltage_violations = gen_voltages_invalid;
    validation.valid = (length(validation.ref_buses) == 1) && (length(validation.diff_gen_pv_buses) == 0) && (length(validation.gen_voltage_violations) == 0);
    valid = validation.valid;
end

