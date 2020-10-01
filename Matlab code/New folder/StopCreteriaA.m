% calc the Stop creteria

 for i = [verticies.bus_number] 
     if i == slack_bus
         % manually set slack_bus as converged
         deltaP(Solver_iteration,i) = 0;
         deltaQ(Solver_iteration,i) = 0;
     else
         % calculate the total S at vertex i for this iteration
         S(Solver_iteration,i) = volt(Solver_iteration + 1, i)  * (((verticies(i).P - verticies(i).gen_P) + j*verticies(i).Q)  / volt(Solver_iteration,i));
         
         % check and store the difference of the P and Q we calced in the
         % current iteration VS the given P and Q.
         deltaP(Solver_iteration,i) = verticies(i).P - verticies(i).gen_P - real(S(Solver_iteration,i));
         deltaQ(Solver_iteration,i) = verticies(i).Q - imag(S(Solver_iteration,i));
     end
 end
 
 % calc stop creteria for radial tree
 max_P = max(abs(deltaP(Solver_iteration,:)));
 max_Q = max(abs(deltaQ(Solver_iteration,:)));
 
 % calc stop creteria for all the loops
 if length(dP(Solver_iteration,:))
    max_dP = max(abs(dP(Solver_iteration,:)));
 else
     max_dP = 0;
 end
 
 if length(dQ(Solver_iteration,:))
    max_dQ = max(abs(dQ(Solver_iteration,:)));
 else
     max_dQ = 0;
 end
  
 % flag stop = true if all values are samller then the limit permitted
 Stop = max_P <=  MaxSolverDeltaPQ  && max_dP <=  MaxSolverDeltaPQ  && max_Q <=  MaxSolverDeltaPQ && max_dQ <=  MaxSolverDeltaPQ ;
 
 clear max_P
 clear max_Q
 clear max_dP
 clear max_dQ
 clear i