% --- TSAS Project Initialization ---
clear; clc;

% Load static parameters
run('/data/params.m');

% ACS Matrix Calculations
% J is the mapping from wheel accelerations to body torques
J = IR * Aw; 
% J_plus is the pseudo-inverse for finding required wheel alpha
J_plus = pinv(J);

% Simulation setup
Ts = 5e-05;        % Base sample time
max_alpha = 50;    % Max allowed acceleration

% Controller Gains (Initial values for tuning)
Kp_val = 0.02;     % Proportional gain (tuned in last session)
Ki_val = 0.1;      % Integral gain
Kd_val = 0;        % Derivative gain (currently unused)

disp("TSAS: Initialization complete. J_plus matrix calculated.");