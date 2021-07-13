clear all; clc; close all;

% Print the heading for the error value table
fprintf('  dt \t    RK1 \t  RK2 \t    RK4 \n')

% Define the time-stepping parameters
dt_choice = [1 0.1 0.01];

for i = 1:3

dt = dt_choice(i);
tFinal = 15;
tSteps = ceil(tFinal/dt) +1;

% Initalize Array
time = linspace (0, tFinal, tSteps);
RK1 = zeros (1, tSteps);
RK2 = zeros (1, tSteps);
RK4 = zeros (1, tSteps);

% Inital Values
t_half = 2.45;
y0 = 1;
RK1(1) = y0;
RK2(1) = y0;
RK4(1) = y0;

for k = 1:tSteps-1
    RK1(k+1) = advanceRK(RK1(k), dt, 1);
    RK2(k+1) = advanceRK(RK2(k), dt, 2);
    RK4(k+1) = advanceRK(RK4(k), dt, 4);
end


Actual = y0*exp((-log(2)/t_half)*time);



RK1_error = mean(abs(RK1 - Actual));
RK2_error = mean(abs(RK2 - Actual));
RK4_error = mean(abs(RK4 - Actual));

fprintf('%.2f:  %.2e  %.2e  %.2e \n', dt, RK1_error, RK2_error, RK4_error)

hold on
figure (i)
plot(time, RK1, time, RK2, time, RK4, time, Actual)
legend('RK1', 'RK2', 'RK4', 'Actual') 
xlabel('Time (s)')
ylabel('Amount of 15C Remaining')
title('Carbon-15 Decay')

end
