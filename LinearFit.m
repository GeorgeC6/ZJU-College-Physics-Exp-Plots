%% Linear Fit Template
%   made by GeorgeC6 @GitHub

x = [27.3 34.4 39.4 45.0 50.5 57.7 63.8 69.0 74.0 79.1];
y = [4.854 4.975 5.069 5.177 5.277 5.399 5.513 5.612 5.699 5.789];

pCoeff = polyfit(x,y,1); % linear fit
y_avg = mean(y);
dev = sum((y - y_avg).^2);
error = sum((y - polyval(polyfit(x,y,1),x)).^2);
Rsquare = 1 - error/dev;

hold on
plot(x,y,'ko','MarkerFaceColor','k')
plot(x,polyval(pCoeff,x),'LineWidth',1.5)

xlabel('$t/^{\circ}\mathrm{C}$','Interpreter','latex','FontSize',12)
ylabel('$R_x/10^{-3}\Omega$','Interpreter','latex','FontSize',15)
% legend('Data','Polynomial Fit')
str1 = sprintf('$y = %.4f x + %.4f$',pCoeff);
str2 = sprintf('$R^2 = %.4f$',Rsquare);
text(60,y(3),str1,'Interpreter','latex','FontSize',15)
text(60,y(2),str2,'Interpreter','latex','FontSize',15)
title('金属导体的电阻温度系数','FontWeight','bold','FontSize',15)
hold off