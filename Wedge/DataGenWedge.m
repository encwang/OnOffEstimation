% clear
% clc

%%%%%% parameter setting %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% N = 6; % # of vertices
n = N*(N-1)/2;
p = 0.3; % stay prob in "on"
q = 0.8; % stay prob in "off"
K = 10^4; % number of periods observed

% Adjacent matrix
A = zeros(N,N);
for iind = 1:N-1
    for jind = iind+1:N
        A(iind,jind) = (unifrnd(0,1) < q/(p+q));
        A(jind,iind) = A(iind,jind);
    end 
end
B = A^2;
NumberWedge = (sum(sum(B))-trace(B))/2;
NumberWedgeRecord = NumberWedge;

for k = 1:K-1
    for iind = 1:N-1
        for jind = iind+1:N
            if A(iind,jind) == 1
                if (unifrnd(0,1) < p)
                    A(iind,jind) = 0;
                    A(jind,iind) = A(iind,jind);
                end
            elseif A(iind,jind) == 0
                if (unifrnd(0,1) < q)
                    A(iind,jind) = 1;
                    A(jind,iind) = A(iind,jind);
                end
            end
        end 
    end
    B = A^2;
    NumberWedge = (sum(sum(B))-trace(B))/2;
    NumberWedgeRecord = [NumberWedgeRecord NumberWedge];
end