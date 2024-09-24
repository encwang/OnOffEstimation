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
    DataGenWedge
    NumExp
    [M1 M2] = MomentEst(NumberWedgeRecord);
    rho = sqrt(M1/(3*nchoosek(N,3)));
    c = 3*nchoosek(N,3)*(3*a0*rho^4+3*a1*rho^4+5*a2/3*rho^4)-M2;
    b = 3*nchoosek(N,3)*(4*a2/3*rho^3+2*a3*rho^3);
    a = 3*nchoosek(N,3)*a3*rho^2;
    hatp = 1-(-b+sqrt(b^2-4*a*c))/(2*a);
    hatq = hatp/(1/rho-1);
    Record = [Record; hatp hatq];
end

% load('1.mat');
RecordNew = rmoutliers(Record,'median');
NumberOfOutlier = length(Record) - length(RecordNew);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nbins = 30;
figure
h = histogram(RecordNew(:,1),nbins,'Normalization','pdf');
figure
h = histogram(RecordNew(:,2),nbins,'Normalization','pdf','FaceColor','r');
% nbins = 25;
% h = histogram(RecordNew(:,1),nbins,'Normalization','probability');
% hold on
% h = histogram(RecordNew(:,2),nbins,'Normalization','probability');
% legend({'$\hat{\alpha}_1$','$\hat{\alpha}_2$'},'Interpreter','latex','FontSize',26)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%