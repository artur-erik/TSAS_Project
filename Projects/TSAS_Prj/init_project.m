clear; clc;

run('Data/Param.m'); 
run('Data\Quaternions_calculations.m')


Aw_current = Aw; 

% ACS Matrix Calculations
J = IR * Aw_current; 
J_plus = pinv(J);

% Simulation settings
Ts = 5e-05;
max_alpha = 50;

% System Controller Gains
Kp_val = 0.005;     
Ki_val = 0;      
Kd_val = 0.00001;        

% Motors Controller Gains
KpM_val = 0.05;     
KiM_val = 0;      
KdM_val = 0;  

% Low pass filter
w_lp = 2*pi*100

disp("TSAS: Initialization complete.");