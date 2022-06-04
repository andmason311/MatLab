%% Loop to run all 3 alpha values
for j=1:3
    %% Initial Conditions
    T_inf = 0;
    T_0 = 0;
    T_1 = 1;
    alpha = [ .1 1 100];
    h = 1/20;
    Temp1 = zeros(20,21);
    Temp1(1, 1) = 1;
    Temp1(1, 21) = 0;
    %Shooting Method with Central Difference Approximation
    for i = 2:19
        Temp1(i, i-1) = (1/(h^2));
        Temp1(i, i) = -((2/(h^2)) + alpha(j));
        Temp1(i, i+1) = (1/(h^2));
        Temp1(i, 21) = -1;
    end
    Temp1(20, 20) = 1;
    Temp1(20, 21) = 0;
    Tem = rref(Temp1);
    %% Plotting Data
    T = Tem(:, 21);
    x = linspace(0, 1, 20);
    colors=['b','r','y'];    
    plot( x , T , colors(j),'LineWidth',1.5);
    xlabel('{Eta}','FontSize',16);
    ylabel('{Theta}','FontSize',16);
    axis([0 1 0 .15]);
    legend('alpha=.1','alpha=1','alpha=100');
    title('Hot Wire Anemometer Heat Diffusion');
    hold on
end
hold off