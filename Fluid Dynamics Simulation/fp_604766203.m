clear all; close all; clc;

%% User Input
% Initial position of array
% 1 = simple “dam break” simulation
% 2 = rhombus shape with velocity a function of x position
setup = 1;
%Save Movie - true or false (false plots live particle distribution)
saveMovie = false;
% Dimensions of 2D grid
x_max = 1;
y_max = 1;

%% Model
% Model constants
h = 0.025;
dt = 0.001;
t_final = 3;
kappa = 100;
beta = 0.40;
mu = 0.1;
rho_0 = 1000;
mass = 0.4;

% Initialize movie file output
if saveMovie == true
    vidHandle = VideoWriter('SPH Fluid Dynamics', 'MPEG-4');
    
    vidHandle.FrameRate = 60;
    vidHandle.Quality = 100;
    
    open(vidHandle);
end

% Swtich function used to input the initial starting conditions in the
% particle data structure
switch setup
    case 1
        % Number of Particles
        n_particles = 676;
        % Initialize data structures for particles
        particle(1:n_particles) = struct('pos', [], 'vel', [], 'force', [], 'rho', [], 'neigh', []);
        % Initalize position of particles
        n = 0;
        for x = 0.00:0.02:0.5
            for y = 0.00:0.02:0.5
                n = n + 1;
                particle(n).pos = [x, y];
                particle(n).vel = [0, 0];
            end
        end
    case 2
        % Number of Particles
        n_particles = 121;
        % Initialize data structures for particles
        particle(1:n_particles) = struct('pos', [], 'vel', [], 'force', [], 'rho', [], 'neigh', []);
        % Initalize position of particles
        n = 0;
        for b = 0.3:0.02:0.5
            y = b;
            for x = 0.1:0.02:0.3
                n = n + 1;
                y = y + 0.02;
                particle(n).pos = [x, y];
                particle(n).vel = [2, 0.5/(3*x)];
            end
        end
end

% The integer number of bins in both the x- and y-directions
Nx = floor(x_max/h);
Ny = floor(y_max/h);
binCount = Nx*Ny;

% Actual bin dimensions
dx = x_max/Nx;
dy = y_max/Ny;

% Pre-allocate array to store bin number
binNum = zeros(1,n_particles);

% Initialize data structures for bins and identify neighboring bins
bins(1:binCount) = struct('particleID', [], 'adjacentBins', []);
for i = 1:binCount
    bins(i).adjacentBins = neighborBins(Nx, Ny, i);
end

% For all timesteps
for a = 0:dt:t_final
    
    % Assign particles to correct bin & Identify Neighboring Bins
    binNum = binNumAssign(particle, n_particles, Ny, dx, dy, y_max);
    for i = 1:binCount
        % Reset bin particlesIDs and count
        bins(i).particleID = [];
        count = 0;
        for k = 1:n_particles
            if binNum(k) == i
                count = count +1;
                bins(i).particleID(count) = k;
            end
        end
    end
    
    % Reset neighbors from last time step for neighbor identification
    % in the next for loop
    for k = 1:n_particles
        particle(k).neigh = [];
    end
    
    % Neighbor effect (including adjacent bins)
    for i = 1:binCount
        aList = bins(i).particleID;
        if isempty(aList) == 0
            binAdjID = [bins(i).adjacentBins];
            for j = [i, binAdjID]
                bList = bins(j).particleID;
                for l = aList
                    for m = bList
                        dist = sqrt(sum((particle(l).pos - particle(m).pos).^2));
                        if dist < h && l ~= m
                            particle(l).neigh = [particle(l).neigh, m];
                        end
                    end
                end
            end
        end
    end
    
    % Density Calculations
    for o = 1:n_particles
        sumDensity = 0;
        for p = 1:length(particle(o).neigh)
            addDensity = (h^2-(sqrt(sum((particle(o).pos - particle(particle(o).neigh(p)).pos).^2)))^2)^3;
            sumDensity = sumDensity + addDensity;
        end
        particle(o).rho = ((4*mass)/(pi*h^2)) + ((4*mass)/(pi*h^8))*sumDensity;
    end
    
    
    % Force % qk,j = ||xk - xj ||/h
    for r = 1:n_particles
        sumForce = 0;
        forceExternal = [0,-9.81]*particle(r).rho;
        for s = 1:length(particle(r).neigh)
            q = sqrt(sum((particle(r).pos - particle(particle(r).neigh(s)).pos).^2))/h;
            addForce = mass/(pi*h^4*particle(particle(r).neigh(s)).rho)*(1-q)*(15*kappa*(particle(r).rho+particle(particle(r).neigh(s)).rho-2*rho_0)*(1-q)/q*(particle(r).pos-particle(particle(r).neigh(s)).pos)-40*mu*(particle(r).vel-particle(particle(r).neigh(s)).vel));
            sumForce = sumForce + addForce;
        end
        particle(r).force = forceExternal + sumForce;
    end
    
    
    % Convert structure values to array to plot
    [x, y] = StructToVector(particle, n_particles);
    plot(x, y, 'o');
    xlim([0 x_max]);
    ylim([0 y_max]);
    % Draw now in new window or save as movie file
    if saveMovie == true
        writeVideo(vidHandle, getframe(gcf));
    else
        drawnow;
    end
    
    
    % Kinematics
    for u = 1:n_particles
        particle(u).vel = particle(u).vel + dt*particle(u).force/particle(u).rho;
        particle(u).pos = particle(u).pos + dt*particle(u).vel;
        
        % Boundary Conditions
        if particle(u).pos(1) >= x_max
            particle(u).pos(1) = 2*x_max - particle(u).pos(1);
            particle(u).vel(1) = -beta*particle(u).vel(1);
        end
        if particle(u).pos(1) <= 0
            particle(u).pos(1) = -particle(u).pos(1);
            particle(u).vel(1) = -beta*particle(u).vel(1);
        end
        if particle(u).pos(2) >= y_max
            particle(u).pos(2) = 2*y_max - particle(u).pos(2);
            particle(u).vel(2) = -beta*particle(u).vel(2);
        end
        if particle(u).pos(2) <= 0
            particle(u).pos(2) = -particle(u).pos(2);
            particle(u).vel(2) = -beta*particle(u).vel(2);
        end
    end
    
end

if saveMovie == true
    close(vidHandle);
end
