clear
clc
load('GeoGeon100.mat') % This is the data used in the paper
Record = rmoutliers(Record);
% Theoretical values

% Empirical values
pL = mean(Record(:,1));
qL = mean(Record(:,2));
C01V0V1
DeltaPQ

[var(Record(:,1))*K SigmaSquare]
[var(Record(:,2))*K TauSquare]

%%%%%%%
figure
histogram(Record(:,1), 30, 'Normalization', 'pdf');
hold on
x = 0.2975:0.0001:0.3025;
y = normpdf(x,pL,sqrt(SigmaSquare/K));
plot(x,y,'Linewidth',2,'Color','black')
xlabel('$\hat{p}$','Interpreter','latex','FontSize',20)
%%%%%%%
figure
histogram(Record(:,2), 30, 'Normalization', 'pdf','FaceColor','r');
hold on
x = 0.792:0.0001:0.808;
y = normpdf(x,qL,sqrt(TauSquare/K));
plot(x,y,'Linewidth',2,'Color','black')
xlabel('$\hat{q}$','Interpreter','latex','FontSize',20)