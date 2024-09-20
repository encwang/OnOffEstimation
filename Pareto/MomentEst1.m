function [M1 M2] = MomentEst1(aVec)

aVec = aVec(201:end);

K = length(aVec);
M2Record = [];

for ind = 1:K-1
    y = aVec(ind) * aVec(ind+1);
    M2Record = [M2Record y];
end
M2 = mean(M2Record);

M1 = mean(aVec);

% for ind = 1:2:K-2
%     y = aVec(ind) * aVec(ind+2);
%     M2Record = [M2Record y];
% end
% M2 = mean(M2Record);