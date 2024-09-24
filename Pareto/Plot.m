load('ParParn100.mat')

nbins = 30;
figure
h = histogram(RecordNew(:,1),nbins,'Normalization','pdf');
xlabel(['$\hat{\alpha}$'],'Interpreter','latex','FontSize',20)
figure
h = histogram(RecordNew(:,2),nbins,'Normalization','pdf','FaceColor','r');
xlabel(['$\hat{\beta}$'],'Interpreter','latex','FontSize',20)

mean(RecordNew)
std(RecordNew)