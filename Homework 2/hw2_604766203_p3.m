clear all;
clc;

a = input('Coefficient in front of X^3 (a): ');
if a == 0
    error('a cannot be zero')
end
b = input('Coefficient in front of X^2 (b): ');
c = input('Coefficient in front of X (c): ');
d = input('Coefficient Constant (d): ');

% Cubic Function
%q = a*x^3+b*x^2+c*x+d;
% Derivative of Cubic Function
%dq = 3*a*x^2+2*b*x+c;
%Quadratic Equation
A = 3*a;
B = 2*b;
C = c;

r1 = (-B+sqrt(B^2-4*A*C))/(2*A);
r2 = (-B-sqrt(B^2-4*A*C))/(2*A);

qr1 = a*r1^3+b*r1^2+c*r1+d;
qr2 = a*r2^3+b*r2^2+c*r2+d;

% Print
fprintf('a = %10.6f\nb = %10.6f\nc = %10.6f\nd = %10.6f\n\n', a, b, c, d);

if B^2-4*A*C >= 0
    if qr1*qr2 < 0
        fprintf('r1 = %10.6f\nq(r1) = %10.6f\nr2 = %10.6f\nq(r2) = %10.6f\n Function q is simple.\n', r1, qr1, r2, qr2);
    else
        fprintf('r1 = %10.6f\nq(r1) = %10.6f\nr2 = %10.6f\nq(r2) = %10.6f\n Function q is NOT simple.\n', r1, qr1, r2, qr2);
    end
else
    fprintf('Monotone\n')
end


