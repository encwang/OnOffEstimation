function F = ZetaM(x,M1,M2,M3,n)
C = x(1);
alpha = x(2);
F(1) = MyHarmonic(C,alpha) - (M1/(M1-M2+(1-1/n)*M1^2));
F(2) = (C/(C+1))^alpha -((M1-M2+(1-1/n)*M1^2)/(n-M1) - (M3-M2)/(M1-M2+(1-1/n)*M1^2));