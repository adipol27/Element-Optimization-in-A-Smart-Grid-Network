Element Optimization In A Smart Grid Network 
Introduction
Smart grids are electricity grids that can be monitored and controlled from a control center. The ability to monitor the electricity grid helps us to deal with faults and instability of the network and reach the optimal voltage distribution. 
In this project, we developed an algorithm that analyzes the network and optimizes the voltages across a radial electricity network, which can be treated as a “tree” – connected and acyclic graph, concerning a cost function we defined. The network optimization was achieved using a connection of remote-controlled capacitors, connected in parallel to the vertices’ impedance, which improved the network’s efficiency.
Motivation
Nowadays, the connection of capacitors is done only in vertices in which the voltage exceeds the permitted voltage limits. Since there are more capacitors available, our motivation is to reach better results by using all the available capacitors in the networks. This might bring the network to its optimal functionality and the power will be distributed in the best way.
Implementation
We simulated a “Brute Force” algorithm using MATLAB. This algorithm calculates the networks’ characteristics (mainly voltages and currents) using the “Backward-Forward” algorithm (see [2]). It solves the network’s equations numerically, each time with a different capacitor connection configuration, and computes the Root Mean Squared Error (RMSE) with respect to the base voltage of the network (all the data was normalized by the base voltage). 
After the RMSE calculation for all the capacitors configuration is done, the optimal configuration is chosen as the one with the minimal RMSE. 
Results
The Brute force method of optimizing the network yielded better results than the method use in the industry. We checked several feeders and compared the RMSE in each method.
Conclusions
We managed to control the grid’s voltage steady and close to 1 per unit like we wished. This method checks all the combinations of the capacitors locations and yields the best solution but ,nevertheless, its calculation time is growing exponentially with every node. In big networks with many nodes the calculations won’t be possible.

