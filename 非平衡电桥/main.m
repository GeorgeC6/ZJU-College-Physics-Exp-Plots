%% 铜电阻Cu50电阻温度特性曲线
%   made by GeorgeC6 @GitHub

X = []; % 输入你的温度数据
Y = []; % 输入你的电阻数据
R2crit = 0.99;

[R2out,pOrder,pCoeff] = discoverDegree(X,Y,R2crit);

hold on
X_up = X(1)-0.1*(X(end)-X(1));
X_low = X(end)+0.1*(X(end)-X(1));
xlim([X_low X_up])

plot(X,Y,'k.','MarkerSize',12)
plot(X_low:1:X_up,polyval(pCoeff,X_low:1:X_up),'LineWidth',1.5)

xlabel('$t/\mathrm{^{\circ}C}$','Interpreter','latex','FontSize',15)
ylabel('$R_t/\Omega$','Interpreter','latex','FontSize',15)
str1 = sprintf('$y = %.4f x + %.4f$', pCoeff);
str2 = sprintf('$R^2 = %.4f$', R2out);
text(47,60,str1,'Interpreter','latex','FontSize',15)
text(47,59,str2,'Interpreter','latex','FontSize',15)
title('铜电阻Cu50电阻温度特性曲线','FontWeight','bold','FontSize',15)
hold off
fprintf('Degree %d is necessary.\n', pOrder);

% 非平衡电桥测温度系数
t = [];
U = [];

alpha = 4*U ./ (t.*(1300-2*U));