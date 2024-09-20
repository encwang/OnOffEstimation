clear
clc

Record = [];
for k = 1:1000
    DataGenWeibull
    [M1 M2] = MomentEst(aVec);

    qs = (M1-M2+(1-1/n)*M1^2)/(n-M1);
    fun = @(x)ChiM(x,M1,M2,n);
    x0 = 1;
    [xval fval exitflag] = fsolve(fun,x0);
    Record = [Record; qs xval];
end

RecordNew = rmoutliers(Record,'median');
NumberOfOutlier = length(Record) - length(RecordNew);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nbins = 25;
h = histogram(RecordNew(:,2),nbins,'Normalization','probability');
hold on
h = histogram(RecordNew(:,1),nbins,'Normalization','probability');
legend({'$\hat q$','$\hat{\alpha}$'},'Interpreter','latex','FontSize',26)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%