clear
clc

% parameters setting, n is the total number of edges
n = 100; p = 0.3; q = 0.8;

Record = [];
Record1 = []; % for asymptotic analysis

for ind = 1:5000
    DataGen
    [m1,m2] = MomentEst(aVec);
    % Record1 = [Record1; m1 m2]; % for asymptotic analysis
    hatp = (m1-m2+(1-1/n)*m1^2)/(m1);
    hatq = (m1-m2+(1-1/n)*m1^2)/(n-m1);
    Record = [Record; hatp hatq];
end


% Asymptotic analysis
% t1 = (Record1(:,1));
% t2 = (Record1(:,2));
% sv0 = var(t1)*K;
% sv1 = var(t2)*K;
% sc01 = (mean(t1.*t2)-mean(t1)*mean(t2))*K;