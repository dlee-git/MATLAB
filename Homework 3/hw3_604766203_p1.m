clear all;
clc;

% Initial Populations
x_k = 2;
y_k = 2.49;
z_k = 1.5;
t_k = 0;

% Define the time-stepping parameters
dt = 0.001;
tFinal = 12;

% Calculate the integer number of steps required
tSteps = ceil(tFinal/dt);

% Print the Heading and inital values
fprintf('Time        X       Y       Z\n');
fprintf(' %.1f \t %.2f \t %.2f \t %.2f \t \n', t_k, x_k, y_k, z_k);


tic;

% Lotka-Volterra Equation Integration via system of discretized ODE
for k = 1:tSteps
    x_k_1 = x_k + dt*(0.75*x_k*(1-x_k/20)-1.5*x_k*y_k-0.5*x_k*z_k);
    y_k_1 = y_k + dt*(y_k*(1-y_k/25)-0.75*x_k*y_k-1.25*y_k*z_k);
    z_k_1 = z_k + dt*(1.5*z_k*(1-z_k/30)-x_k*z_k-y_k*z_k);
    
    % Print population values to the command window
    if mod(k,500) == 0
        fprintf(' %.1f \t %.2f \t %.2f \t %.2f \t \n', t_k, x_k_1, y_k_1, z_k_1);
    end
    
    % Update the value
    x_k = x_k_1;
    y_k = y_k_1;
    z_k = z_k_1;
    t_k = t_k + dt;
    
end
  
toc;
