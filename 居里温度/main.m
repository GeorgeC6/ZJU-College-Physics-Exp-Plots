%% 居里温度
%   made by GeorgeC6 @GitHub

T = [];
U_up = [];
U_down = [];
k_Tup = [];
k_Tdown = [];

% 插值
T_interp = 35:0.5:95;
U_upint = interp1(T,U_up,T_interp,"spline");
U_downint = interp1(T,U_down,T_interp,"spline");
k_Tupint = interp1(T(1:end-1),k_Tup,T_interp,"spline");
k_Tdownint = interp1(T(1:end-1),k_Tdown,T_interp,"spline");

figure(1)
hold on
yyaxis left
plot(T,U_up,'k.','MarkerSize',8)
plot(T_interp,U_upint,'LineStyle','-','LineWidth',1.2)
ylabel('U/mV')
yyaxis right
plot(T,U_down,'k+')
plot(T_interp,U_downint,'LineStyle','-.','LineWidth',1.2)

legend('','U 升温','','U 降温')
xlabel('T/ºC')
hold off

figure(2)
hold on
yyaxis left
plot(T(1:end-1),k_Tup,'k.','MarkerSize',8)
plot(T_interp,k_Tupint,'LineStyle','-','LineWidth',1.2)
ylabel('斜率')
yyaxis right
plot(T(1:end-1),k_Tdown,'k+')
plot(T_interp,k_Tdownint,'LineStyle','-.','LineWidth',1.2)

legend('','k 升温','','k 降温')
xlabel('T/ºC')
hold off