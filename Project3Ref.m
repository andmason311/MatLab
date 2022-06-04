function [] = Project3Ref()
%% Loop to run all 3 values of alpha
for j = 1:3
    %% Given Contraints
    T_inf = 0;
    T_0 = [ 1 1 1];
    T_1 = 1;
    alpha = [.1, 1, 100];
    h = 1/20;
    %% Central Difference Approximation
    Temp = zeros(20,21);
    Temp(1, 1) = 1;
    Temp(1, 21) = T_0(j);
    for i = 2:19
        Temp(i, i-1) = (1/h^2);
        Temp(i, i) = (-2/h^2) - alpha(j);
        Temp(i, i+1) = (1/h^2);
        Temp(i, 21) = alpha(j)*T_inf;
    end
    Temp(20, 20) = 1;
    Temp(20, 21) = 1;
    Temp = rref(Temp);
    %% Plotting Temp
    T = -Temp(:, 21);
    x = linspace(0, 10, 20);
    colors=['b','r','y'];
    plot( x , T , colors(j),'LineWidth',1.5);
    xlabel('{Eta}','FontSize',16);
    ylabel('{Theta}','FontSize',16);
    axis([0 10 0 10]);
    legend('alpha=.1','alpha=1','alpha=100');
    title('Hot Wire Animometer Heat Diffusion');
    hold on
    end
hold off
end
