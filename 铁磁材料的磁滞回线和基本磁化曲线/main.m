%% 磁滞回线
%   made by GeorgeC6 @GitHub

% μ-H 曲线（样品2）

U = []; % 设置的电压值（对绘图没作用）
U_1pp = []; % 接示波器X轴
U_2pp = []; % 接示波器Y轴

% 参数
N = 150;
L2 = 6*10^-2;
S2 = 8*10^-5;
L1 = 0.130;
S1 = 1.24*10^-4;
R1 = 2.5;
R2 = 10^4;
C = 3*10^-6;

H2 = N/(L2*R1*2*sqrt(2)) .* U_1pp;
B2 = C*R2/(N*S2*2*sqrt(2)) .* U_2pp;
mu = B2 ./ H2;

figure
hold on
yyaxis left
plot(H2,B2,'k.','MarkerSize',10)
plot(H2,B2,'LineWidth',1.5,'LineStyle','-')
ylabel('$B_m / \mathrm{T}$','Interpreter','latex')
yyaxis right
plot(H2,mu,'k.','MarkerSize',10)
plot(H2,mu,'LineWidth',1.5,'LineStyle','-')
ylabel('$\mu / \mathrm{N \cdot A^{-2}}$','Interpreter','latex')
xlabel('$H_m / \mathrm{A \cdot m^{-1}}$','Interpreter','latex')
legend('','磁感应强度','','磁化率')
title('样品 2 的 \mu - H 曲线','FontSize',12,'FontWeight','bold')
box on
hold off


% 磁滞回线（样品1）

% 输入：按逆时针的顺序，从左下角的样本点绕一圈，列表首尾是同一个点（要重复才能闭合）
U_pp(1,:) = [];
U_pp(2,:) = [];

H1 = N/(L1*R1*2*sqrt(2)) .* U_pp(1,:);
B1 = C*R2/(N*S1*2*sqrt(2)) .* U_pp(2,:);

% 插值（画折线的话可略过）
B1_bottom = B1(1:17); % "17"是右上角数据点对应的索引，需按实际数据修改（下同）
B1_top = B1(17:end);
% 上下支分开插值（可尝试不同的插值方式）
B1_bottom_interp = interp1(H1(1:17),B1_bottom,linspace(H1(1),H1(17),100),"pchip");
B1_top_interp = interp1(H1(17:end),B1_top,linspace(H1(17),H1(end),100),"pchip");
B1_interp = [B1_bottom_interp,B1_top_interp]; % 合并
H1_interp = [linspace(H1(1),H1(17),100),linspace(H1(17),H1(end),100)]; % X轴线性插值，合并

figure
hold on
plot(H1,B1,'k.','MarkerSize',10)
plot(H1_interp,B1_interp,'LineWidth',1.5)
xlabel('$H / \mathrm{A \cdot m^{-1}}$','Interpreter','latex')
ylabel('$B / \mathrm{T}$','Interpreter','latex')
title('样品 1 的磁滞回线','FontSize',12,'FontWeight','bold')
grid on
box on
hold off
xlim([1.1*H1(1) 1.1*H1(17)])
ylim([1.1*B1(1) 1.1*B1(17)])

abs(trapz(H1,B1)) % 计算围成区域的面积