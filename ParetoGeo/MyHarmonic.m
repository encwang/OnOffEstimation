function y = MyHarmonic(C,alpha)
y = 0;
for ind = 1:5000
    y = y + (C/(C+ind-1))^alpha;
end