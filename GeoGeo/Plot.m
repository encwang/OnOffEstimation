 load('GeoGeon100.mat')
 RecordNew = rmoutliers(Record);

nbins = 30;
figure
h = histogram(Record(:,1),nbins,'Normalization','pdf');
xlabel(['$\hat{p}$'],'Interpreter','latex','FontSize',20)
figure
h = histogram(Record(:,2),nbins,'Normalization','pdf','FaceColor','r');
xlabel(['$\hat{q}$'],'Interpreter','latex','FontSize',20)

mean(Record)
std(Record)