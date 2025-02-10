%% 电流表和电压表的校准曲线
%   made by GeorgeC6 @GitHub

N = 1:5;
A = 0.2:0.2:1;
A = A.*5;
Ast = [1.05 2.05 3.00 3.95 5.00]; % 测得的电流
Vst = [1.05 2.05 3.05 4 5]; % 测得的电压
deltaI = A - Ast;
deltaU = A - Vst;

hold on
xlabel('电流表示数 / mA')
yyaxis("left")
plot(N,deltaI,'-','LineWidth',1.5)
ylabel('$\Delta I$','Interpreter','latex')
yyaxis("right")
plot(N,deltaU,'-.','LineWidth',1.5)
ylabel('$\Delta U$','Interpreter','latex')
legend('$\Delta I$','$\Delta U$','Interpreter','latex')
title('改装电流表和电压表的校准曲线','FontWeight','bold','FontSize',15)