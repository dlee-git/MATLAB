clc; clear all; close all;

% Shuffle the Random Numbers
rng('shuffle');

% Inital Conditions
n = 10;
T = 1000;
lambda = 0.005;
c = 1000;
% Count Iteration Number
count = 0;

% Constructing x & y vectors and path
x = rand(1,n);
y = rand(1,n);
path = randperm(n);
pathNew = zeros(1,n);


while T>1
    dist = getPathDistance(x,y,path);
    pathNew = path;
    rand_ind = randperm(n,2);
    % Swap exactly 2 randomly-chosen nodes
    pathNew(rand_ind(1)) = path(rand_ind(2));
    pathNew(rand_ind(2)) = path(rand_ind(1));
    distNew = getPathDistance(x,y,pathNew);
    length_change = distNew - dist;
    p = exp(-c*length_change/T);
    
    
    % Update Length if shorter or better
    if length_change < 0
        path = pathNew;
    elseif p > rand
        path = pathNew;
    end
    
    % Temperature Cool
    T = T*(1-lambda);
    
    
    % Data gathered Iteration & Shortest Path Graph
    count = count +1;
    Length_vec(count) = dist;
    
end

% Update Order of x and y
x = PathUpdate(x, path);
y = PathUpdate(y, path);

% For plotting purposes add another element at the end of array and set it
% equal to the first point
x(n+1) = x(1);
y(n+1) = y(1);
figure(1)
plot(x, y, 'b o-');
xlabel('x');
ylabel('y');

% Plot of shortest path found at each iteration as a function of iteration
% number
figure(2)
iteration = linspace(1, count, count);
plot(iteration, Length_vec, 'r -');
xlabel('Iteration #');
ylabel('Distance of Short Path Found');
