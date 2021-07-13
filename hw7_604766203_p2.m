clear all; close all; clc;

% Initial constants
L = 1;
r_out = 0.013;
r_in = 0.011;
P = 2000;
d = 0.75;
E = 70*10^9;
I = pi/4*(r_out^4-r_in^4);
n = 20;

% Node size
node = L/(n-1);

% Generate matrix A 
A = zeros(n, n);
A(1, 1) = 1;
A(n, n) = 1;
col = 1;

for row = 2:n-1
    A(row, col:(col+2)) = [1, -2, 1];
    col = col + 1;
end


% Generate vector b
b = zeros(n,1);
j = 1;

for k = 0:node:L
    % Determine M(x)
    if k < d
        M_x = (-P*(L-d)*k)/L;
    else
        M_x = (-P*d*(L-k))/L;
    end

    % node = change in x
    b(j) = (node^2*M_x)/(E*I);
    
    % Update j
    j = j + 1;
end

% Calculate y array with correct sign convention
y = -A\b;

% Plot deflection vs position
x = linspace(0, L, n);
plot(x, y, 'o-');
title('Deflection of Bar as Function of Position');
xlabel('Position along the Beam');
ylabel('Deflection');

% Find max y & calculate the error of max displacement
[y_max_calc, index] = min(y);
c = min(d, (L - d));
max_y_position = x(index);
y_max_theo = -(P*c*((L^2) - (c^2))^1.5)/(9*sqrt(3)*E*I*L);
error = abs(y_max_calc - y_max_theo);
fprintf('Maximum calculated displacement: %d\n', y_max_calc);
fprintf('Maximum displacement position: %d\n', max_y_position);
fprintf('Error of max displacement calculation: %d\n', error);