% --- TSAS Project Initialization ---
clear; clc;

% Load hardware parameters (Vmax, R, L, Kt, IR, etc.)
run('Data/Param.m'); 

% Testing Mode: 1 for Single Motor (1D), 0 for Full System (4 Motors)
TEST_1D_MODE = 1; 

if TEST_1D_MODE
    % Configuration for 1D test
    Aw_current = 1;
    fprintf('TSAS: 1D Test Mode Active.\n');
else
    % Configuration for full 3D system
    Aw_current = Aw; 
    fprintf('TSAS: Full System Mode Active.\n');
end

% ACS Matrix Calculations based on Eq. 61
J = IR * Aw_current; 
J_plus = pinv(J);

% Simulation settings
Ts = 5e-05;        % Must match Solver fixed-step size
max_alpha = 50;    % Reference acceleration limit

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