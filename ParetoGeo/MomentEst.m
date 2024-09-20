function [M1 M2 M3] = MomentEst(aVec)

% aVec = aVec(200:end);

K = length(aVec);
M2Record = [];
M3Record = [];

for ind = 1:K-2
    y = aVec(ind) * aVec(ind+1);
    y2 = aVec(ind) * aVec(ind+2);
    M2Record = [M2Record y];
    M3Record = [M3Record y2];
end
M2Record = [M2Record aVec(K-1) * aVec(K)];

M1 = mean(aVec);
M2 = mean(M2Record);
M3 = mean(M3Record);