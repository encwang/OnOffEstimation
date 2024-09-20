function y = MyWeibullExp(alpha)

y = 0;
for ind = 1:5000
    y = y + exp(-(ind-1)^alpha);
end