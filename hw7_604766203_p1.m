clear all; close all; clc;
rng('shuffle');

% Size of Board and Number of Generations
x = 200;
y = 150;
gen = 300;

% Pre-allocate Matrix Grid
A = zeros(y, x);


% Initialize game randomly in 2D array
for row = 1:y
    for col = 1:x
        r = rand;
        % 10% probability of live cell
        if r <= 0.1
            A(row, col) = 1;
        else
            A(row, col) = 0;
        end
    end
end


% Plot initial distribution
figure(1)
imagesc(A);
title('Generation 1');

% Count living cells for each generation
living_cells = zeros(1, gen);
living_cells(1) = sum(sum(A));


for k = 2:gen
    % Temporary next generation grid
    A_new = zeros(y, x);
    
    % Fill Matrix A
    for row = 1:y
        for col = 1:x
            % Identify neighbors
            % Define N, S, E, W indices
            N = row - 1;
            S = row + 1;
            E = col + 1;
            W = col - 1;
            
            % Edges and Corners
            if N == 0
                N = y;
            end
            if S > y
                S = 1;
            end
            if E > x
                E = 1;
            end
            if W == 0
                W = x;
            end
            
            % Calculate number of living cells surrounding
            neighbors = A(N,col)+A(S,col)+A(row,W)+A(row,E)+A(N,E)+A(N,W)+A(S,W)+A(S,E);
            
            % Calculate new grid
            if A(row,col) == 1 && (neighbors == 2 || neighbors == 3)
                A_new(row,col) = 1;
            elseif A(row,col) == 0 && neighbors == 3
                A_new(row,col) = 1;
            else
                A_new(row,col) = 0;
            end
        end
    end
    
    % Update matrix A
    A = A_new;
    living_cells(k) = sum(sum(A));
    
    % Plot distribution live until final shown after execution complete
    figure(2)
    drawnow;
    imagesc(A);
    title(['Generation ', num2str(k)]);
end


% Plot number of living cells vs time
time = linspace(1, gen, gen);
figure(3)
plot(time, living_cells);
title('Number of Living Cells as a Function of Time')
xlabel('Time (generations)');
ylabel('Number of Living Cells');