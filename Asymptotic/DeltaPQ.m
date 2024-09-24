p = pL;
q = qL;
gamma0 = 2+(p-q-(p+q)*p)/(n*q);
gamma1 = -(p+q)/(n*q);
SigmaSquare = gamma0^2*v0+2*gamma0*gamma1*c01+gamma1^2*v1
TauSquare = SigmaSquare*q^2/p^2