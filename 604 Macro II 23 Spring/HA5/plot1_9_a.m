function plot1_9_a(options_,oo_)
    subplot(5,2,1)
    plot(0:options_.irf-1,transpose(oo_.irfs.y_gap_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.002 0])
    yticks(-0.002:0.0005:0)
    yticklabels(-0.2:0.05:0)
    title('Output gap, $\tilde y$', 'interpreter','latex');

    subplot(5,2,2)
    plot(0:options_.irf-1,transpose(oo_.irfs.pi_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.015 0])
    yticks(-0.015:0.005:0)
    yticklabels(-1.5:0.5:0)
    title('Inflation, $\pi$', 'interpreter','latex');
    
    subplot(5,2,3)
    plot(0:options_.irf-1,transpose(oo_.irfs.y_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([0.002 0.008])
    yticks(0.002:0.002:0.008)
    yticklabels(0.2:0.2:0.8)
    title('Output, $y$', 'interpreter','latex');
    
    subplot(5,2,4)
    plot(0:options_.irf-1,transpose(oo_.irfs.n_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.004 0])
    yticks(-0.004:0.001:0)
    yticklabels(-0.4:0.1:0)
    title('Employment, $n$', 'interpreter','latex');
    
    subplot(5,2,5)
    plot(0:options_.irf-1,transpose(oo_.irfs.w_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.008 0])
    yticks(-0.008:0.002:0)
    yticklabels(-0.8:0.2:0)
    title('Real wage, $w$', 'interpreter','latex');
    
    subplot(5,2,6)
    plot(0:options_.irf-1,transpose(oo_.irfs.p_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.03 0])
    yticks(-0.03:0.01:0)
    yticklabels(-3:1:0)
    title('Price level, $p$', 'interpreter','latex');
    
    subplot(5,2,7)
    plot(0:options_.irf-1,transpose(oo_.irfs.i_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.015 0])
    yticks(-0.015:0.005:0)
    yticklabels(-1.5:0.5:0)
    title('Norminal rate, $i$', 'interpreter','latex');
    
    subplot(5,2,8)
    plot(0:options_.irf-1,transpose(oo_.irfs.r_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.004 0])
    yticks(-0.004:0.001:0)
    yticklabels(-0.4:0.1:0)
    title('Real rate, $r$', 'interpreter','latex');
    
    subplot(5,2,9)
    plot(0:options_.irf-1,transpose(oo_.irfs.m_eps_a),'-o','MarkerSize',4,'linewidth',1);
    hold on
    plot([0 options_.irf],[0 0],'-r','linewidth',0.5);
    hold off
    xlim([0 options_.irf]);
    ylim([-0.04 0.02])
    yticks(-0.04:0.02:0.02)
    yticklabels(-4:2:2)
    title('Real money supply, $m$', 'interpreter','latex');
end