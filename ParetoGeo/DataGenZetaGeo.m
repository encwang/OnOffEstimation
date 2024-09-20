aa = [zeros(n,1), ones(n,1)];

aVec = 0;
for k = 1:K-1
    aNext = zeros(n,2);
    for nind = 1:n
        if aa(nind,1) == 1
            if (rand < ((aa(nind,2)+C-1)^alpha/(aa(nind,2)+C)^alpha))
                aNext(nind,1) = 1; aNext(nind,2) = aa(nind,2) + 1;
            else
                aNext(nind,1) = 0; aNext(nind,2) = 1;
            end
        elseif aa(nind,1) == 0
            if (rand < 1-p)
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