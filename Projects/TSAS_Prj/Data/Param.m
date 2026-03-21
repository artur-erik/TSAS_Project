% --- TSAS Hardware Parameters ---
% Motor parameters
Vmax = 10000;      % Max Voltage
Kt   = 0.49;       % Torque constant
Kb   = 0.5128;     % Back EMF constant
b    = 0.2;        % Viscous friction
R    = 0.7;        % Resistance
L    = 27.2;       % Inductance
Jmotor = 0.0002;   % Rotor inertia

% Device parameters [cite: 19, 20]
I  = 0.1;          % Main body inertia
Ir = 0.001;        % Reaction wheel inertia
IR = Ir + Jmotor;  % Total rotational inertia

% Distribution Matrix
beta_deg  = 45;
gamma_deg = 45;

ca = cosd(beta_deg); sa = sind(beta_deg);
cg = cosd(gamma_deg); sg = sind(gamma_deg);

% Matrix Aw_T
Aw_T = [ cg*ca,  cg*sa,  sg;
        -cg*ca,  cg*sa,  sg;
        -cg*ca, -cg*sa,  sg;
         cg*ca, -cg*sa,  sg ];
Aw = Aw_T';

% input
input = 2