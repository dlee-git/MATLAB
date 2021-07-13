clear all;
clc;

% Save dna sequence in the workspace
load('chr1_sect.mat');

% Nitrogenous Bases & Length of sequence
N = length(dna);
A = 1;
C = 2;
G = 3;
T = 4;

% Initialize the variables used in for loop
Length = 0;
Endpoint = 0;
Startpoint = 0;
ProteinCount = 0;
count_TAG = 0;
count_TGA = 0;
count_TAA = 0;

% Create vector space
array = zeros(1, N);

for K = 1:3:N-2
    % Start codon
    if Startpoint == 0
        if dna(K) == A && dna(K+1) == T && dna(K+2) == G
            Startpoint = K;
        end
    else
        % stop codon
        if dna(K) == T
            if dna(K+1) == A && dna(K+2) == A
                Endpoint = K;
                count_TAA = count_TAA + 1;
            elseif dna(K+1) == A && dna(K+2) == G
                Endpoint = K;
                count_TAG = count_TAG + 1;
            elseif dna(K+1) == G && dna(K+2) == A
                Endpoint = K;
                count_TGA = count_TGA + 1;
            end
        end
    end
    
    if Startpoint < Endpoint
        Length = Endpoint - Startpoint + 3;
        ProteinCount = ProteinCount +1;
        
        array(ProteinCount) = Length;
        
        Startpoint = 0;
        Endpoint = 0;
    end
end

% DNA analysis
array = array(1:ProteinCount);
average = mean(array);
maximum = max(array);
minimum = min(array);
percent_exon = (sum(array)/N)*100;

% Print on command window
fprintf('Total Protein-Coding Segments: %d\n',ProteinCount);
fprintf('Average Length: %.2f\n',average);
fprintf('Maximum Length: %d\n',maximum);
fprintf('Minimum Length: %d\n',minimum);
