function [xs] = splitPts(x)
% splitPts(x) Input vector (x). Output vector (xs) function doubles the
% number of points by inserting new points at each midpoint.
% The last digit is calculated by finding the midpoint of first and last
% values of x.


N = length(x);


% Even elements of zs = midpoints
for j = 2:2:2*(N-1)
    xs(j) = mean(x((j/2):(j/2+1)));
end

% Odd elements of zs = x values
for k = 1:2:2*N
    xs(k) = x((k+1)/2);
end


% Wrap Vector
xs(2*N) = (x(1) + x(N))/2;

end
