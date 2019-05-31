This folder contains the Neuron code to replicate Figure 5b (right column) and Supplementary
Figure 6C (top row) of "Simple Integration of fast excitation, and offset delayed inihbition
computes directional selectivity in Drosophila", Gruntman et al 2018.

In order to execute this code, the NEURON simulation environment (https://neuron.yale.edu/neuron/)
needs to be installed and accessible from the folder containing the enclosed files.

1. Running single position bar flash simulations (Supplementary Figure 6C)
From the folder containing all the code and the morphology file, run the command:
nrngui flash_start.hoc

This will generate a single membrane potential (Vm) trace and a single time stamp vector. The Vm trace contains
the responses from all 11 positions (from -5 to 5, implemented in NEURON as positions 0 to 10)
at all 4 durations (from fast (20ms) to slow (160ms)). An example for parsing and plotting the generated files
is provided in plot_NEURON_data.m (Matlab code).


2. Running moving bar simulations (Figure 5b)
Issue the commands
nrngui -nogui moving_PD_start.hoc
nrngui -nogui moving_ND_start.hoc

This will generate two Vm trace files (for PD and ND) and a single time stamp vector. The Vm traces contain
the responses from all 4 speeds (from fast to slow). The  Matlab code in plot_NEURON_data.m exemplifies
parsing and plotting of the simulation results.

If the flag "zero_inhib" in flash_start.hoc, moving_PD_start.hoc, moving_ND_start.hoc is set to the value 1,
inhibitory synapses are silenced in the simulation (see e.g. Supplementary Figure 8).

If the flag "same_inp" moving_PD_start.hoc, moving_ND_start.hoc is set to the value 1, all synapses are positioned
on the first dendritic section of the simulated T4 neuron (see Figure5d "all inputs - single position")


File list: 

flash_start - 				run this file to simulate single bar flashes at 
							all durations and in all positions. Generates vm_trace_flash.dat
							and time_trace_flash.dat as outputs. 
							
moving_PD_start - 			run this file to movement in the preferred direction along all 
							the positions in all 4 speeds. Generates 'vm_trace_PD' and 
							'time_trace_moving.dat' as outputs. 
							
moving_ND_start - 			run this file to movement in the null direction along all 
							the positions in all 4 speeds. Time trace wasn't given different 
							name since it is identical. 

create_cond_vec - 			NEURON function to generate a conductance vector based on the 
							parameters it receives (used in setting_synapse_parameters) 
							
define_dend_axis - 			generates the relevant axis along which dendritic sections are 
							defined. Position of a section along this axis determines the 
							weight for synapses on this section. 
							
setting_synapse_parameters-	computes time course of conductances and sets parameters for 
							all synapses (E and I) based in their location along the 
							dendritic axis and the parameters given (Gaussian for synaptic 
							weights) 

							done separately for flash and movement, since the conductance 
							vector for flash is shorter (only the flash duration). However, 
							the conductance computation for both scenarios is the same. 
							
setting_x_intervals -		generates intervals along the x_star axis (defined in define_dend_axis) 
							that have the same number of sections in them. In addition, 
							it generates the same number of synapses in each x interval. 
							
							
labeledT4conv_smooth - 		swc file that is imported into NEURON to be used in the simulation

loadMorph - 				loads the swc file into NEURON

parameters - 				parameters used in the model. The numbers in this file are from 
							the first solution cluster (see Supplementary Fig. 6) 
							
plot_NEURON_data - 			example code in Matlab for importing simulation results and 
							plotting them parsed by duration and position (flash) or speed 
							and direction (moving)
														

