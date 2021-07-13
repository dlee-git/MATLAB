function [y] = advanceRK(y, dt, method)
% advanceRK(y, dt, method). Input old value of y, timestep size, and method
% of calculation. Output new value of y.
% The function applies the Runge Kutta numerical method is used in temporal 
% discretization for the approximate solutions of ordinary differential equations.
% This function outputs new approximation of y from the present value y plus
% the weighted average of increments, where each increment is the product of
% the size of the interval, dt, and an estimated slope specified by function
% f on the right-hand side of the differential equation.



t_half = 2.45;

switch method
    case 1
        c1 = -dt*(log(2)/t_half)*y;
        y = y + c1;
    case 2
        c1 = -dt*(log(2)/t_half)*y;
        c2 = -dt*(log(2)/t_half)*(y + c1/2);
        y = y + c2;
    case 4
        c1 = -dt*(log(2)/t_half)*y;
        c2 = -dt*(log(2)/t_half)*(y + c1/2);
        c3 = -dt*(log(2)/t_half)*(y + c2/2);
        c4 = -dt*(log(2)/t_half)*(y + c3);
        y = y + c1/6 + c2/3 + c3/3 + c4/6;
end
end
