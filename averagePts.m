function [ xa ] = averagePts(xs, w)
% averagePts(xs, w) Input vector (xs) and weight vector (w). Output average (xa)
% moves all nodes into an new position - the average of their neighbors.
% The ends of the xa vector is calculated by wraping the last value of
% xs with the start of the vector.


total = sum(w);
N = length(xs);

%Output error message if sum of w is zero
if total == 0
    error('Combination of weights cannot sum to zero');
end

% Calculate average values for interior of za
for k = 2:(N-1)
    xa(k) = (xs(k-1)*w(1) + xs(k)*w(2) + xs(k+1)*w(3))/total;
end

% Average at endpoints (wraping)
xa(1) = (w(1)*xs(N) + w(2)*xs(1) + w(3)*xs(2))/total;
xa(N) = (w(1)*xs(N - 1) + w(2)*xs(N) + w(3)*xs(1))/total;

end