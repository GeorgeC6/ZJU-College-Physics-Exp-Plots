function [R2out,pOrder,pCoeff] = discoverDegree(x,y,R2crit)
%   Find the smallest degree of polynomials necessary for a given R2
%   criterion.
%   made by GeorgeC6 @GitHub

n = -1;
Rsquare = 0;

y_avg = mean(y);
dev = sum((y - y_avg).^2);

while Rsquare < R2crit
    n = n + 1;
    error = sum((y - polyval(polyfit(x,y,n),x)).^2);
    Rsquare = 1 - error/dev;
end

R2out = Rsquare;
pOrder = n;
pCoeff = polyfit(x,y,n);

end