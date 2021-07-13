clear all; close all; clc;

% Shuffle
rng('default');

% Initial Variables
x_max = 1;
y_max = 1;
h = 0.25;
N = 20;

% Initalize Vectors
x = x_max*rand(1, N);
y = y_max*rand(1, N);

% The integer number of bins in both the x- and y-directions
Nx = floor(x_max/h);
Ny = floor(y_max/h);
binCount = Nx*Ny;

% Actual bin dimensions
dx = x_max/Nx;
dy = y_max/Ny;

% Pre-allocate array to store bin number
binNum = zeros(1,N);

% Calculating Bin Number
for k = 1:N
    binNum(k)=(ceil(x(k)/dx)-1)*Ny+ceil((y_max-y(k))/dy);
end

% Calculating bin averages
binAvgX = zeros(1,binCount);
binAvgY = zeros(1,binCount);

% Bin has be N columns since there could be N particles all in the same bin
binId = zeros(binCount, N);

for i = 1:binCount
    sumX = 0;
    sumY = 0;
    count = 0;
    for k = 1:N
        if binNum(k) == i
            sumX = sumX + x(k);
            sumY = sumY + y(k);
            count = count +1;
            binId(i,count) = k;
        end
    end
    binAvgX(i) = sumX/count;
    binAvgY(i) = sumY/count;
end

figure(1)
hold on
plot(x,y, 'x')
plot(binAvgX,binAvgY, 'o')
grid on
xticks(0:dx:x_max)
yticks(0:dy:y_max)
title('Spatial Hashing of 2D Grid');
xlabel('X Position');
ylabel('Y Position');
legend('Particle Location', 'Average Position in Each Bin'); 

for rows = 1:binCount
    fprintf('Bin %i: ', rows);
    for columns = 1:N
        if binId(rows,columns) ~= 0
            fprintf('%i ', binId(rows,columns))
        end
    end
    if sum(binId(rows,:)) == 0
        fprintf('[]', binId(rows,columns))
    end
    fprintf('\n')
end

