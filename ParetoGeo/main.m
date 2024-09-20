clear
clc

% parameter setting %%%%%%
n = 100; % # of channels
alpha = 4; % stay prob in "on"
C = 2;
p = 0.7;
K = 10500; % number of periods observed

Record = [];
for k = 1:1000
    DataGenZetaGeo
    [M1 M2 M3] = MomentEst(aVec);

    ps = (M1-M2+(1-1/n)*M1^2)/(n-M1);
    fun = @(x)ZetaM(x,M1,M2,M3,n);
    x0 = [3,3];
    [xval fval exitflag] = fsolve(fun,x0);
    Record = [Record; ps xval];
end

RecordNew = rmoutliers(Record,'median');
NumberOfOutlier = length(Record) - length(RecordNew);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nbins = 25;
h = histogram(RecordNew(:,1),nbins,'Normalization','probability');
hold on
h = histogram(RecordNew(:,2),nbins,'Normalization','probability');
h = histogram(RecordNew(:,3),nbins,'Normalization','probability');
legend({'$\hat{p}$','$\hat{C}$','$\hat{\alpha}$'},'Interpreter','latex','FontSize',16)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hatpMean = mean(RecordNew(:,1))
hatCMean = mean(RecordNew(:,2))
hatalphaMean = mean(RecordNew(:,3))
hatpStd = std(RecordNew(:,1))
hatCStd = std(RecordNew(:,2))
hatalphaStd = std(RecordNew(:,3))