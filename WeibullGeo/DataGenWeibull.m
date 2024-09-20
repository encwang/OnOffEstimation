% clear
% clc

% parameter setting %%%%%%
n = 100; % # of edges
alpha = 0.5; % stay prob in "on"
p = 0.7;
K = 10^5+1000; % number of periods observed
aa = [zeros(n,1), ones(n,1)];

aVec = [];
for k = 1:K-1
    aNext = zeros(n,2);
    for nind = 1:n
        if aa(nind,1) == 1
            if (rand < (exp(-(aa(nind,2))^alpha)/exp(-(aa(nind,2)-1)^alpha)))
                aNext(nind,1) = 1; aNext(nind,2) = aa(nind,2) + 1;
            else
                aNext(nind,1) = 0; aNext(nind,2) = 1;
            end
        elseif aa(nind,1) == 0
            if (rand < 1-p)
                aNext(nind,1) = 0; aNext(nind,2) = aa(nind,2) + 1;
            else
                aNext(nind,1) = 1; aNext(nind,2) = 1;
            end
        end
    end
    aVec = [aVec sum(aNext(:,1))];
    aa = aNext;
end

aVec = aVec(1001:end);