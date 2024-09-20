function y = ChiM(x,M1,M2,n)

y = M1/(M1-M2+(1-1/n)*M1^2) - MyWeibullExp(x);