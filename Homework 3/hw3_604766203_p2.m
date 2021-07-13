clear all;
clc;

% Face value of coins
Q=25;
D=10;
N=5;
P=1;

% Define variables used within the for loop
CoinCount = 0;
Sum = 0;

for Simulation = 0:1:99
    Change = Simulation;
    while Change ~= 0
        if Change >= 25
            Change = Change - Q;
            CoinCount = CoinCount +1;
        elseif Change >= 10
            Change = Change - D;
            CoinCount = CoinCount +1;
        elseif Change >= 5
            Change = Change - N;
            CoinCount = CoinCount +1;
        else
            Change = Change - P;
            CoinCount = CoinCount +1;
        end   
    end
    Sum = Sum + CoinCount;
    CoinCount = 0;
end

% Average the sum and print value
Mean_Sum = Sum/100;
fprintf('Average Number of Coins = %.2f\n', Mean_Sum);
