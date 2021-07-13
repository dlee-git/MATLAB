clear all;
clc;
close all;

% Input "explicit" or "semi-implicit" Calculation Method
Method = 'explicit';


% Define the time-stepping parameters
dt = 0.005;
tFinal = 20;
tSteps = ceil(tFinal/dt)+1;
time = linspace(0, tFinal, tSteps);

% Initialize vector space
theta = zeros (1, tSteps);
vel = zeros(1, tSteps);
acc = zeros(1, tSteps);
EnergyM = zeros(1, tSteps);

% Define Pendulum Parameters
g = 9.81;
L = 1;
theta(1) = pi/3;
vel(1) = 0;
acc(1) = -(g/L)*sin(theta(1));

% Computes via explicit or semi
switch Method
    case 'explicit'
        for k = 1:tSteps-1
            vel(k+1) = vel(k) + dt*(acc(k));
            theta(k+1) = theta(k) + dt*(vel(k));
            acc(k+1) = -(g/L)*sin(theta(k+1));
        end
        
    case 'semi-implicit'
        for k = 1:tSteps-1
            vel(k+1) = vel(k) + dt*(acc(k));
            theta(k+1) = theta(k) + dt*(vel(k+1));
            acc(k+1) = -(g/L)*sin(theta(k+1));
        end
end

% Compute energy where h = L*(1 - cos(theta))
EnergyM = g*(L*(1 - cos(theta))) + 0.5*(L*vel).^2;


%% Plots
% Kinematics
figure(1)
hold on
plot(time, acc, time, vel, time, theta);
xlabel('Time (s)')
legend('Acceleration (rad/s^2)', 'Velocity (rad/s)', 'Position (rad)') 
title('Pendulum over Time')

% Energy
figure(2)
plot(time, EnergyM);
xlabel('Time (s)')
ylabel('Energy (J/kg)')
title('Energy in Pendulum over Time')
