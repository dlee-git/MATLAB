function neighbors = neighborBins(Nx, Ny, binNum)
% neighborBins function identifies the neighboring bins of adjecent to a
% specified bin (binNum) based on integer number of bins in both the x- 
% and y-directions.


N = Nx;
M = Ny;
P = binNum;

%Left Wall
if (M > P) && (P > 1)
    neighbors = [P-1, P+1, P+M, P+M-1, P+M+1];
%Bottom Wall
elseif mod(P,M)==0 && (P~=M && P~=M*N)
   neighbors = [P-1, P+M, P+M-1, P-M, P-M-1];
%Right Wall
elseif ((M*N) > P) && ((M*(N-1)+1) < P)
    neighbors = [P-1, P+1, P-M, P-M-1, P-M+1];
%Top Wall
elseif mod(P,M)==1 && (P~=1 && P~=M*(N-1)+1)
    neighbors = [P+1, P-M, P-M+1, P+M, P+M+1];
%Top Left
elseif (P == 1)
    neighbors = [P+1, P+M, P+M+1];
%Top Right
elseif (P == M*(N-1)+1)
    neighbors = [P+1, P-M, P-M+1];
%Bottom Right
elseif (P == M*N)
    neighbors = [P-1, P-M, P-M-1];
%Bottom Left
elseif (P == M)    
    neighbors = [P-1, P+M, P+M-1];
%Middle
else
   neighbors = [P-1, P+1, P+M, P+M-1, P+M+1, P-M, P-M-1, P-M+1];
end
end