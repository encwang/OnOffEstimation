% clear
% clc

% EX = zeta(alpha1-1)/zeta(alpha1);
% EY = zeta(alpha2-1)/zeta(alpha2);
aa = [zeros(n,1), ones(n,1)];

aVec = 0;
for k = 1:K-1
    aNext = zeros(n,2);
    for nind = 1:n
        if aa(nind,1) == 1
            % if (rand < (1-MyHarmonic(aa(nind,2),alpha2)/zeta(alpha2)))
            if (rand < (aa(nind,2)/(aa(nind,2)+1))^alpha1)
                aNext(nind,1) = 1; aNext(nind,2) = aa(nind,2) + 1;
            else
                aNext(nind,1) = 0; aNext(nind,2) = 1;
            end
        elseif aa(nind,1) == 0
            % if (rand < (1-MyHarmonic(aa(nind,2),alpha2)/zeta(alpha2)))
            if (rand < (aa(nind,2)/(aa(nind,2)+1))^alpha2)
                aNext(nind,1) = 0; aNext(nind,2) = aa(nind,2) + 1;
            else
                aNext(nind,1) = 1; aNext(nind,2) = 1;
            end
        end
    end
    aVec = [aVec sum(aNext(:,1))];
    aa = aNext;
end

aVec = aVec(501:end);