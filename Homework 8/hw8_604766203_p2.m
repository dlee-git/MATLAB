clear all; close all; clc;

% Domain & Initial calculation conditions
Rightend = 1.43;
Leftend = 1.71;
increments = 0.01;
delta = 0;
fEvalMax = 200;

% X array
n_columns = 1+floor((Leftend - Rightend)/0.01);
x = linspace(Rightend, Leftend, n_columns);

% Create a handle for the function & Y array
f =@(x) 816*(x.^3) - 3835*(x.^2) + 6000*x - 3125;
y = f(x);


for k = 1:n_columns
    % Call on Newton Iteration function
    [xc, fEvals] = Newton(f, x(k), delta, fEvalMax);
    % Print out results
    fprintf('x0 = %.2f, evals = %i, xc = %.6f \n', x(k), fEvals, xc);
end


% Scatter plot of function
plot(x, y, 'o-');
