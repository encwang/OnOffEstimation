load('ParGeon100.mat')

nbins = 30;
figure
h = histogram(RecordNew(:,1),nbins,'Normalization','pdf');
xlabel(['$\hat{q}$'],'Interpreter','latex','FontSize',20)
figure
h = histogram(RecordNew(:,2),nbins,'Normalization','pdf','FaceColor','r');
hold on
h = histogram(RecordNew(:,3),nbins,'Normalization','pdf','FaceColor','y');
legend({'$\hat{C}$','$\hat{\alpha}$'},'Interpreter','latex','FontSize',20)

mean(RecordNew)
std(RecordNew)