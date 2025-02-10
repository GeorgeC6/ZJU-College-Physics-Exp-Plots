%% 照相法
%   made by GeorgeC6 @GitHub

t = [];
x = [];
y = [];
dx = diff(x);
dy = diff(y);
a = diff(y); % 实则为ddy，不是加速度
R2crit = 0.9; 

[R2out1,pOrder1,pCoeff1] = discoverDegree(t,x,R2crit);
[R2out2,pOrder2,pCoeff2] = discoverDegree(t,y,R2crit);
[R2out3,pOrder3,pCoeff3] = discoverDegree(t(1:end-1),dx,R2crit);
[R2out4,pOrder4,pCoeff4] = discoverDegree(t(1:end-1),dy,R2crit);
pCoeff5 = polyfit(t(1:end-2),a,1); % 加速度波动可能导致过拟合，强制用直线

ax1 = axes('Position', [0.1, 0.55, 0.35, 0.35]);
hold on;
plot(t, x, 'ko','MarkerFaceColor','k','MarkerSize',5);
plot(t,polyval(pCoeff1,t),'r','LineWidth',1.5)
xlim(ax1,'tight')
ax1.XTickLabel = {}; % Hide x tick labels
ylabel('$x /\mathrm{cm}$','Interpreter','latex');
str1 = sprintf('$y = %.3f x + %.3f$',pCoeff1);
text(t(end-6),x(3),str1,'Interpreter','latex','FontSize',12)
title('x-t 图','FontSize',12,'Interpreter','tex')
box(ax1,'on')
grid(ax1,"on")

ax2 = axes('Position', [0.55, 0.55, 0.35, 0.35]);
hold on;
plot(t, y, 'ko','MarkerFaceColor','k','MarkerSize',5);
plot(t,polyval(pCoeff2,t),'r','LineWidth',1.5)
xlim(ax2,'tight')
ax2.XTickLabel = {};
ylabel('$y /\mathrm{cm}$','Interpreter','latex');
str2 = sprintf('$y = %.2f x^2 + %.2f x$ + %.2f',pCoeff2);
text(t(2),30,str2,'Interpreter','latex','FontSize',12)
title('y-t 图','FontSize',12,'Interpreter','tex')
box(ax2,'on')
grid(ax2,"on")

ax3 = axes('Position', [0.1, 0.1, 0.35, 0.35]);
ylim([5 8])
hold on;
plot(t(1:end-1), dx, 'ko','MarkerFaceColor','k','MarkerSize',5);
plot(t(1:end-1),polyval(pCoeff3,t(1:end-1)),'r','LineWidth',1.5)
xlabel('Time (s)');
ylabel('$v_x /\mathrm{cm}\cdot \mathrm{s}^{-1}$','Interpreter','latex');
title('v_x-t 图','FontSize',12,'Interpreter','tex')
str3 = sprintf('$y = %.3f x + %.3f$',pCoeff3);
text(t(end-6),7,str3,'Interpreter','latex','FontSize',12)
box(ax3,'on')
grid(ax3,"on")

ax4 = axes('Position', [0.55, 0.1, 0.35, 0.35]);
hold on;
plot(t(1:end-1), dy, 'ko','MarkerFaceColor','k','MarkerSize',5);
plot(t(1:end-1),polyval(pCoeff4,t(1:end-1)),'r','LineWidth',1.5)
xlabel('Time (s)');
ylabel('$v_y /\mathrm{cm}\cdot \mathrm{s}^{-1}$','Interpreter','latex');
title('v_y-t 图','FontSize',12,'Interpreter','tex')
str4 = sprintf('$y = %.3f x + %.3f$',pCoeff4);
text(t(end-5),dy(3),str4,'Interpreter','latex','FontSize',12)
box(ax4,'on')
grid(ax4,"on")

figure
plot(t(1:end-2),a,'ko','MarkerFaceColor','k','MarkerSize',5)   % Data points
xlim('auto')
ylim([-3 0])
hold on
plot(t(1:end-2),polyval(pCoeff5,t(1:end-2)),'r','LineWidth',1.5)

xlabel('Time (s)');
ylabel('$a/\mathrm{cm}\cdot \mathrm{s}^{-2}$','Interpreter','latex')
dev = sum((a - mean(a)).^2);
error = sum((a - polyval(pCoeff5,t(1:end-2))).^2);
R2out5 = 1 - error/dev;
str5 = sprintf('$y = %.3f x + %.3f$',pCoeff5);
str6 = sprintf('$R^2 = %f$',R2out5);
text(5,-2,str5,'Interpreter','latex','FontSize',15)
text(5,-2.3,str6,'Interpreter','latex','FontSize',15)
title('a_y-t 图','FontWeight','bold','FontSize',15)
hold off