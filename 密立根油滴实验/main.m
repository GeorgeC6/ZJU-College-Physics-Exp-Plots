%% 密立根油滴实验
%   made by GeorgeC6 @GitHub

U = []; % 电压数据
t = []; % 时间数据

rho = 981; g = 9.79; yita = 1.82*10^-5; l = 1.5*10^-3;
b = 6.17*10^-6; p = 76; d = 5*10^-3;
v = l ./ t;
r = sqrt(9*yita.*v/(2*rho*g));

q = 18*pi*d ./ sqrt(2*rho*g) .* (yita*l ./ (t.*(1+b./(p.*r)))).^1.5 ./ U;
e_std = 1.602176565*10^-19;

function [ne,n] = Findne(q,e_std)
% Find n s.t. ne is nearest to q

qtemp = repmat(1:100,size(q,2),1) .* e_std;
qtemp = abs(repmat(q',1,100) - qtemp);
[ne,n] = min(qtemp,[],2);
end

[ne,n] = Findne(q,e_std);

e_measure = q ./ n';
e_avg = mean(e_measure);

figure
xlim('auto')

baseline_e = repmat(e_std,1,size(q,2));
mean_e = repmat(e_avg,1,size(q,2));

hold on
plot(e_measure,'k.','MarkerSize',8)
plot(baseline_e,'LineStyle','--','LineWidth',0.5)
plot(mean_e,'LineStyle','-.','LineWidth',1.5)
xlabel('实验次数')
ylabel('$q$/C','Interpreter','latex')
legend('数据点','标准值','实验平均值')
for i = 1:length(e_measure)
    str = sprintf('$\\frac{q}{%d}$',n(i));
    text(i+0.1,e_measure(i),str,"FontSize",14,'Interpreter','latex')
end
title('密立根油滴实验','FontWeight','bold','FontSize',15)
hold off