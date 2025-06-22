% Matlab Tutorial by Dr. Michael Okereke

% Pressure Vessels - Matlab Scripting 
% Matlab Tutorial - 24/05/2025

%% Notes
%{ 
Cylindrical Pressure Vessels Analaysis 
Thin Walled cylinder is considered

Objective - Create a MATLAB script for analyss of mechancis of such vessels

Virtual Domain - Measurements/Parameters
 - Diameter, d = 0.2m
 - Cylinder thickness, t = 0.005m 
 - Internal Pressure, Pi = 10 e6

Material Properties - 
 - Young's Modulus, E = 210 e9
 - Poisson Ratio, v = 0.33

Tangential Stress, 
 - sig_t = (P * r)/ t
Axial Stress,
 - sig_a = (P*r) / (2*t)

Radial Stress,
 - sig_r = -P

Tangetial Strain,
 - eps_t = (sig_t - v*sig_a)/(E)

Extension of radius,
 - Er = (P*r^2 *(2-v)) / 2*E*t

Maximum Shear Stress,
 - tao_max = P*r / 2*t

        Notation:
                - P = Pressure
                - r = Radius
                - t = Thickness



--------Script Development Flow Chart - The Algorithim---------------


Input Parameters ( Input Section)
 - Internal Pressure, Pi
 - Cylinder Thickness, t
 - Cylinder Diameter, d
 - Young Modulus, E
 - Poisson ratio, v


Computing Engine  (Computational Analysis Section)

 - Implementation of Equations to calculate model outputs

Outputs (Output Section)
 - Stress terms
 - Strain term
 - Displacement term

%}

%% Input Section - 
%       Geometry - 

PVData.d = 400e-3;     % variable naming technique, PVData.d = Pressure Vessel Data. diameter
                        % unit - meters,m
PVData.r = PVData.d/2;    % radius,r unit = m

PVData.t = 5e-3;         % thickness


% Material Properties

PVData.E = 210e9;      % Young Modulus
PVData.v  = 0.33;      % Poisson Ratio

% Pressure
PVData.P = 10e6;

%% Computational Analysis Section

PVData.sig_t =(PVData.P * PVData.r)/ PVData.t;

PVData.sig_a = (PVData.P*PVData.r) / (2*PVData.t);

PVData.sig_r = -PVData.P;

PVData.eps_t = (PVData.sig_t - PVData.v*PVData.sig_a)/(PVData.E);

PVData.Er = (PVData.P*PVData.r^2 *(2-PVData.v)) / (2*PVData.E*PVData.t);

PVData.tao_max = PVData.P*PVData.r / 2*PVData.t;


%% Output/ Display Section

% Store/Save Data
save("Pressure_Vessels_Matlab_Scripting_Tutorial", "PVData")

%Display Results on Command Window

disp("Parameters from analysis")

disp(PVData)
