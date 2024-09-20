clear
clc
%%%%%%%%%%%%%%%
N = 20;
a0 = nchoosek(N-3,3);
a1 = 3 * nchoosek(N-3,2);
a2 = 3 * nchoosek(N-3,1);
a3 = 1;
%%%%%%%%%%%%%%%
Record = [];
for NumExp = 1:1000
    DataGenTri
    NumExp
    [M1 M2] = MomentEst(NumberTriRecord);

    rho = nthroot(M1/nchoosek(N,3),3);

    a = nchoosek(N,3)*a3*rho^3;
    pp = nchoosek(N,3)*a2*rho^5;
    qq = nchoosek(N,3)*(a0+a1)*rho^6-M2;
    pp = pp/a; qq = qq/a;
    hatp = 1-(nthroot(-qq/2+sqrt(qq^2/4+pp^3/27),3) + nthroot(-qq/2-sqrt(qq^2/4+pp^3/27),3));
    hatq = hatp/(1/rho-1);

    Record = [Record; hatp hatq];
end

% load('1.mat');
RecordNew = rmoutliers(Record,'median');
NumberOfOutlier = length(Record) - length(RecordNew);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nbins = 25;
h = histogram(RecordNew(:,1),nbins,'Normalization','probability');
hold on
h = histogram(RecordNew(:,2),nbins,'Normalization','probability');
legend({'$\hat{\alpha}_1$','$\hat{\alpha}_2$'},'Interpreter','latex','FontSize',16)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%