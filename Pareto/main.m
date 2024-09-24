clear
clc

% parameter setting 
n = 100; % # of channels
alpha1 = 3; % stay prob in "on"
alpha2 = 2.5; % stay prob in "off"
K = 10^5 + 500; % number of periods observed, the first 500 observations are discarded. 
% i.e. we assume the process is in stationarity from 501. 

Record = [];
for k = 1:1000
    DataGenZeta
    [M1 M2] = MomentEst1(aVec);
    fun1 = @(x)zeta(x)-(M1/(M1-M2+(1-1/n)*M1^2));
    fun2 = @(y)zeta(y)-((n-M1)/(M1-M2+(1-1/n)*M1^2));
    x0 = 4; 
    y0 = 4;
    x = fsolve(fun1,x0);
    y = fsolve(fun2,y0);   
    Record = [Record;x y];
end


%%%%%%% Plot %%%%%%%
RecordNew = rmoutliers(Record,'median');
NumberOfOutlier = length(Record) - length(RecordNew);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nbins = 30;
figure
h = histogram(RecordNew(:,1),nbins,'Normalization','pdf');
figure
h = histogram(RecordNew(:,2),nbins,'Normalization','pdf','FaceColor','r');
% legend({'$\hat{\alpha}$','$\hat{\beta}$'},'Interpreter','latex','FontSize',16)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MeanOfEstimates = mean(RecordNew);
StdOfEstimates = std(RecordNew);