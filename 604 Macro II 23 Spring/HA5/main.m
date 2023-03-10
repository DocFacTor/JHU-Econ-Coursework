% 180.604, Spring 2023
% HA5 II
% Draw graphs
% Qingyuan Fang, 03/2023

% 1.Staggered price
%% - monetary policy shock
clear
dynare Gali_staggered_nu
%% 
plot1_9_nu(options_,oo_)

subplot(5,2,10)
plot(0:options_.irf-1,transpose(oo_.irfs.nu_eps_nu),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([0 0.004])
yticks(0:0.001:0.004)
yticklabels(0:0.1:0.4)
title('Monetary policy shock, $\nu$', 'interpreter','latex');

sgtitle('IRFs to Monetary Policy Shock under Staggered Prices')

saveas(gcf,'staggered_nu.png')

%% - technology shock
clear
dynare Gali_staggered_a
%% 
plot1_9_a(options_,oo_)

subplot(5,2,10)
plot(0:options_.irf-1,transpose(oo_.irfs.a_eps_a),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([0 0.015])
yticks(0:0.005:0.015)
yticklabels(0:0.5:1.5)
title('Technology shock, $a$', 'interpreter','latex');

sgtitle('IRFs to Technology Shock under Staggered Prices')

saveas(gcf,'staggered_a.png')

% 2.Flexible price
%% - monetary policy shock
clear
dynare Gali_flexible_nu
%% 
plot1_9_nu(options_,oo_)

subplot(5,2,6)
plot(0:options_.irf-1,transpose(oo_.irfs.p_eps_nu),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([-0.005 -0.002])
yticks(-0.005:0.001:-0.002)
yticklabels(-0.5:0.1:-0.2)
title('Price level, $p$', 'interpreter','latex');

subplot(5,2,7)
plot(0:options_.irf-1,transpose(oo_.irfs.i_eps_nu),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([-0.015 0])
yticks(-0.015:0.005:0)
yticklabels(-0.15:0.05:0)
title('Norminal rate, $i$', 'interpreter','latex');

subplot(5,2,10)
plot(0:options_.irf-1,transpose(oo_.irfs.nu_eps_nu),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([0 0.004])
yticks(0:0.001:0.004)
yticklabels(0:0.1:0.4)
title('Monetary policy shock, $\nu$', 'interpreter','latex');

sgtitle('IRFs to Monetary Policy Shock under Flexible Prices')

saveas(gcf,'flexible_nu.png')

%% - technology shock
clear
dynare Gali_flexible_a
%% 
plot1_9_a(options_,oo_)

subplot(5,2,5)
plot(0:options_.irf-1,transpose(oo_.irfs.w_eps_a),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([0 0.01])
yticks(0:0.002:0.01)
yticklabels(0:0.2:1)
title('Real wage, $w$', 'interpreter','latex');

subplot(5,2,10)
plot(0:options_.irf-1,transpose(oo_.irfs.a_eps_a),'-o','MarkerSize',4,'linewidth',1);
hold on
plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
hold off
xlim([0 options_.irf]);
ylim([0 0.015])
yticks(0:0.005:0.015)
yticklabels(0:0.5:1.5)
title('Technology shock, $a$', 'interpreter','latex');

sgtitle('IRFs to Technology Shock under Flexible Prices')

saveas(gcf,'flexible_a.png')