clear all; clc; close all;

% Choose set of inital points
x = [0 0 1 1];
y = [0 1 1 0];


% Weight Vector
w = [1 1 1];

%  Plot the initial points
figure(1)
hold on
plot(x, y, 'r o');

% Split Points and Average Points calculated from Functions
xs = splitPts(x);
ys = splitPts(y);
xa = averagePts(xs, w);
ya = averagePts(ys, w);

% Initalize values for convergence test in while loop
dx = xa - xs;
dy = ya - ys;
node = max(sqrt(dx.^2 + dy.^2));

% Count number of iteration
count = 0;


while node >= 0.001 && count < 15
    % Calculate new split and average vectors
    xs = splitPts(x);
    ys = splitPts(y);
    xa = averagePts(xs, w);
    ya = averagePts(ys, w);
    x = xa;
    y = ya;
    
    % Calculate max displacement for convergence test
    dx = xa - xs;
    dy = ya - ys;
    node = max(sqrt(dx.^2 + dy.^2));
    
    count = count +1;
end

% Plot the final points
plot(xs, ys, 'm .');
legend('Inital Points', 'Final Points') 