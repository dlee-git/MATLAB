function [binNum] = binNumAssign(particle, n_particles, Ny, dx, dy, y_max)
% binNumAssign function calculates and assigns bin numbers to particles
% given particle information stored as data structures. Constants such as
% n_particles, Ny, dx, dy, y_max are needed as well to perform the
% calculations.


% Calculating Bin Number
for k = 1:n_particles
    binNum(k)=(ceil(particle(k).pos(1)/dx)-1)*Ny+ceil((y_max-particle(k).pos(2))/dy);
    if binNum(k) == 0 || particle(k).pos(2) >= y_max
        binNum(k) = binNum(k) + 1;
    end
    if particle(k).pos(1) <= 0
        binNum(k) = binNum(k) + Ny - 1;
    end
    if particle(k).pos(1) == 0 && particle(k).pos(2) == 1
        binNum(k) = 1;
    end
end
end