function [M1 M2] = MomentEst(aVec)

% aVec = aVec(200:end);

K = length(aVec);
M2Record = [];

for ind = 1:K-1
    y = aVec(ind) * aVec(ind+1);
    M2Record = [M2Record y];
end

M1 = mean(aVec);
M2 = mean(M2Record);