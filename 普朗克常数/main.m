%% 光电效应
%   光电流随光电管两端电压变化关系
%   made by GeorgeC6 @GitHub

X = []; % 365nm，电压
Y = []; % 365nm，电流
W = []; % 405nm，电压
Z = []; % 405nm，电流
P = []; % 577nm，电压
Q = []; % 577nm，电流

R2crit = 0.995;   % criterion for R2
[R2out1,pOrder1,pCoeff1] = discoverDegree(X,Y,R2crit);
[R2out2,pOrder2,pCoeff2] = discoverDegree(W,Z,R2crit);
[R2out3,pOrder3,pCoeff3] = discoverDegree(P,Q,R2crit);

figure
xlim('auto')
hold on
plot(X,Y,'ko','MarkerFaceColor','k','MarkerSize',4)   % Data points
plot(W,Z,'+','MarkerFaceColor','k','MarkerEdgeColor','k','MarkerSize',6)
plot(P,Q,'x','MarkerFaceColor','k','MarkerEdgeColor','k','MarkerSize',8)

plot(X,polyval(pCoeff1,X),'LineWidth',1.5)   % Fitting Line
plot(W,polyval(pCoeff2,W),'LineWidth',1.5,'LineStyle','--')
plot(P,polyval(pCoeff3,P),'LineWidth',1.5,'LineStyle','-.')

% Styling
xlabel('$U_{AK}/\mathrm{V}$','Interpreter','latex','FontSize',15)
ylabel('$I/\times 10^{-11}\mathrm{A}$','Interpreter','latex','FontSize',15)
legend('365 nm','405 nm','577 nm')
title('光电流随光电管两端电压变化关系图','FontWeight','bold','FontSize',15)
hold off

fprintf('Degree %d,%d,%d is necessary.\n', pOrder1,pOrder2,pOrder3);