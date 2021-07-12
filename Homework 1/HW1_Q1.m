clear all;
clc;

% Edge Length = E
% Inradius = r
% Outradius = R
% Surface Area = S
% Volume = V


%% Tetrahedron T Parameters
E_T=1/(sqrt(6)/4);
r_T=E_T*sqrt(6)/12;
R_T=E_T*sqrt(6)/4;
S_T=E_T^2*sqrt(3);
V_T=E_T^3*sqrt(2)/12;

%% Cube C Parameters
E_C=r_T/(sqrt(3)/2);
r_C=E_C*1/2;
R_C=E_C*sqrt(3)/2;
S_C=E_C^2*6;
V_C=E_C^3;

%% Octahedron O Parameters
E_O=r_C/(sqrt(2)/2);
r_O=E_O*sqrt(6)/6;
R_O=E_O*sqrt(2)/2;
S_O=E_O^2*2*sqrt(3);
V_O=E_O^3*sqrt(2)/3;

%% Dodecahedron D Parameters
E_D=r_O/((sqrt(15)+sqrt(3))/4);
r_D=E_D*(sqrt(250+110*sqrt(5)))/20;
R_D=E_D*(sqrt(15)+sqrt(3))/4;
S_D=E_D^2*3*sqrt(25+10*sqrt(5));
V_D=E_D^3*(15+7*sqrt(3))/4;

%% Icosahedron I Parameters
E_I=r_D/(sqrt(10+2*sqrt(5))/4);
r_I=E_I*sqrt(42+18*sqrt(5))/12;
R_I=E_I*sqrt(10+2*sqrt(5))/4;
S_I=E_I^2*5*sqrt(3);
V_I=E_I^3*(15+5*sqrt(3))/12;

%% Table
%heading
fprintf ('Solids            Edge Length    Inradius       Outradius      Surface Area   Volume \n');

%Rows of Data
fprintf('Tetrahedron %14.6f %14.6f %14.6f %14.6f %14.6f\n', E_T, r_T, R_T, S_T, V_T)
fprintf('Cube %21.6f %14.6f %14.6f %14.6f %14.6f\n', E_C, r_C, R_C, S_C, V_C)
fprintf('Octahedron %15.6f %14.6f %14.6f %14.6f %14.6f\n', E_O, r_O, R_O, S_O, V_O)
fprintf('Dodecahedron %13.6f %14.6f %14.6f %14.6f %14.6f\n', E_D, r_D, R_D, S_D, V_D)
fprintf('Icosahedron %14.6f %14.6f %14.6f %14.6f %14.6f\n', E_I, r_I, R_I, S_I, V_I)








