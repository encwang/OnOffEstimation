% clear
% clc

% tic
% parameter setting 
K = 10^5; % number of periods observed

% initial state 
% aa = randi([0 1], 1,n);
N = binornd(n,q/(p+q));
aa = [ones(1,N), zeros(1,n-N)];

aVec = N;
for k = 2:K
    for nind = 1:n
        if aa(nind) == 1
            aa(nind) = (rand<1-p);
        else
            aa(nind) = (rand<q);
        end
    end
    aVec = [aVec sum(aa)];
end