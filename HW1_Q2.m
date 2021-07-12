clear all;
clc;

% An ellipse with semiaxes a and b is specified by (x/a)^2+(y/b)2=1

a=input('Enter the value for Major Axis a: ');
b=input('Enter the value for Minor Axis b: ');

% Departure from circlehood
h=((a-b)/(a+b))^2;

% Perimeter formulae
P1=pi*(a+b);
P2=pi*sqrt(2*(a^2+b^2));
P3=pi*sqrt(2*(a^2+b^2)-(a-b)^2/2);
P4=pi*(a+b)*(1+h/8)^2;
P5=pi*(a+b)*(1+3*h/(10+sqrt(4-3*h)));
P6=pi*(a+b)*(64-3*h^2)/(64-16*h);
P7=pi*(a+b)*(256-48*h-21*h^2)/(256-112*h+3*h^2);
P8=pi*(a+b)*(3-sqrt(1-h))/2;

fprintf('P1 = %16.12f\nP2 = %16.12f\nP3 = %16.12f\nP4 = %16.12f\nP5 = %16.12f\nP6 = %16.12f\nP7 = %16.12f\nP8 = %16.12f\nh = %16.12f\n', P1, P2, P3, P4, P5, P6, P7, P8, h)