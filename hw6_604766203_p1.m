clc; clear all; close all;

% Shuffle the Random Numbers
rng('shuffle');

% Number of Trials
trials = 10000;

% Initize vectors for number of people it took to have shared birthday likely.
Req_People = zeros(1,trials);

for i=1:trials
    % Reset the BD vector, index, and match condition
    BD = [];
    index = 1;
    match = 0;
    % Initalize the first BD value before the while loop
    BD(index) = randi([1 365]);
    
    % Repeats until match is found
    while match == 0
        index = index +1;
        BD(index) = randi([1 365]);
        
        for j= 1:index-1
            % Separation less than 7 days
            if abs(BD(index) - BD(j)) < 7 || abs(BD(index) - BD(j)) > 358
                match = 1;
                Req_People(i) = index;
            end
        end
    end
end

Median_Req_People = median(Req_People);

fprintf('Median Number of People = %.2i \n', Median_Req_People);

%Plot graph
histogram(Req_People);
title('Number of People in a Group for Every Simulation')
xlabel('# People in group');
ylabel('Number of trials');