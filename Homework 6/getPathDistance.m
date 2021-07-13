function dist_total = getPathDistance(x, y, path)
% getPathDistance input vectors x,y, and path output dist_total value.
% The function adds all the length of the path in the order determined by
% the path input of the x and y positions of each node. 


n = length(path);
dist_total = 0;

for i=1:n-1
    dx = x(path(i+1)) - x(path(i));
    dy = y(path(i+1)) - y(path(i));
    dist = sqrt(dx^2 + dy^2);
    dist_total = dist_total + dist;
end

% Wrapping the first point to the last point
dx = x(path(n)) - x(path(1));
dy = y(path(n)) - y(path(1));
dist = sqrt(dx^2 + dy^2);
dist_total = dist_total + dist;

end
