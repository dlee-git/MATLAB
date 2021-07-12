clear all;
clc;

% Parameter Input
x1=input('Enter x-coordinate for Circle 1: ');
y1=input('Enter y-coordinate for Circle 1: ');
r1=input('Enter r-coordinate for Circle 1: ');
x2=input('Enter x-coordinate for Circle 2: ');
y2=input('Enter y-coordinate for Circle 2: ');
r2=input('Enter r-coordinate for Circle 2: ');

% Separation Distance Between the Two Cicles d
d=sqrt((x2-x1)^2+(y2-y1)^2);

% Chord Length c
c=(1/d)*sqrt((-d+r1+r2)*(d-r1+r2)*(d+r1-r2)*(d+r1+r2));

% Area
A=r1^2*acos((d^2+r1^2-r2^2)/(2*d*r1))+r2^2*acos((d^2-r1^2+r2^2)/(2*d*r2))-(d/2)*c;

% Display Result
fprintf(' x1 = %4.2f\n y1 = %4.2f\n r1 = %4.2f\n x2 = %4.2f\n y2 = %4.2f\n r2 = %4.2f\n\n Area = %6.4f\n', x1, y1, r1, x2, y2, r2, A)

