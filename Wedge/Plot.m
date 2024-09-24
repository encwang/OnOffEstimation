load('DataWedge.mat')

nbins = 30;
figure
h = histogram(RecordNew(:,1),nbins,'Normalization','pdf');
xlabel(['$\hat{p}$'],'Interpreter','latex','FontSize',20)
figure
h = histogram(RecordNew(:,2),nbins,'Normalization','pdf','FaceColor','r');
xlabel(['$\hat{q}$'],'Interpreter','latex','FontSize',20)

mean(RecordNew)
std(RecordNew)