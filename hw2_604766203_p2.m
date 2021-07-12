clear all;
clc;

M=input('Please enter a value for M (# Rows): ');
if     M < 2 || mod(M,1) ~= 0
    error('The value of M must be an integer greater than 1')    
end

N=input('Please enter a value for N (# Columns): ');
if     N < 2 || mod(M,1) ~= 0
    error('The value of N must be an integer greater than 1')    
end

P=input('Please enter a value for P: ');
if     P > (M*N) || P < 1 || mod(M,1) ~= 0
    error('The value of P must be an integer within the M by N matrix')    
end

%% Neighbors
fprintf ('\nCell ID:   %d\n', P);
%Left Wall
if (M > P) && (P > 1)
    fprintf('Neighbors: %d %d %d %d %d \n', P-1, P+1, P+M, P+M-1, P+M+1)
%Bottom Wall
elseif mod(P,M)==0 && (P~=M && P~=M*N)
    fprintf('Neighbors: %d %d %d %d %d \n', P-1, P+M, P+M-1, P-M, P-M-1)
%Right Wall
elseif ((M*N) > P) && ((M*(N-1)+1) < P)
    fprintf('Neighbors: %d %d %d %d %d \n', P-1, P+1, P-M, P-M-1, P-M+1)
%Top Wall
elseif mod(P,M)==1 && (P~=1 && P~=M*(N-1)+1)
    fprintf('Neighbors: %d %d %d %d %d \n',P+1, P-M, P-M+1, P+M, P+M+1)
%Top Left
elseif (P == 1)
    fprintf('Neighbors: %d %d %d \n', P+1, P+M, P+M+1)
%Top Right
elseif (P == M*(N-1)+1)
    fprintf('Neighbors: %d %d %d \n', P+1, P-M, P-M+1)
%Bottom Right
elseif (P == M*N)
    fprintf('Neighbors: %d %d %d \n', P-1, P-M, P-M-1)
%Bottom Left
elseif (P == M)    
    fprintf('Neighbors: %d %d %d \n', P-1, P+M, P+M-1)
%Middle
else
    fprintf('Neighbors: %d %d %d %d %d %d %d %d \n', P-1, P+1, P+M, P+M-1, P+M+1, P-M, P-M-1, P-M+1)
end