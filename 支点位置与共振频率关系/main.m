%% 支点位置与共振频率关系曲线
%   made by GeorgeC6 @GitHub

X = []; % 输入位置
Y = []; % 输入频率
R2crit = 0.99;

[R2out,pOrder,pCoeff] = discoverDegree(X,Y,R2crit);

hold on
X_low = X(1)-0.1*(X(end)-X(1));
X_up = X(end)+0.1*(X(end)-X(1));
xlim([X_low X_up])
plot(X,Y,'k.','MarkerSize',10)
plot(X_low:1:X_up,polyval(pCoeff,X_low:1:X_up),'LineWidth',1.5)

xlabel('$x/\mathrm{mm}$','Interpreter','latex','FontSize',15)
ylabel('$f/\mathrm{Hz}$','Interpreter','latex','FontSize',15)
str1 = sprintf('$y = %.3f x^2 %.3f x + %.3f$', pCoeff);
str2 = sprintf('$R^2 = %.4f$', R2out);
text(X(5),Y(3),str1,'Interpreter','latex','FontSize',15)
text(X(5),Y(3)-1,str2,'Interpreter','latex','FontSize',15)
title('支点位置与共振频率关系曲线','FontWeight','bold','FontSize',15)
hold off
fprintf('Degree %d is necessary.\n', pOrder);