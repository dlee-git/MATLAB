function [x, y] = StructToVector(particle, n_particles)
% StructToVector converts the position vector stored in data structures
% into x and y arrays.


% Pre-allocate array to store x and y vectors
x = zeros(1,n_particles);
y = zeros(1,n_particles);

% Saving particle position information into arrays
for k = 1:n_particles
    x(k) = particle(k).pos(1);
    y(k) = particle(k).pos(2);
end
end