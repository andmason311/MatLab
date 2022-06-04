function[]= Project3a()
%% Loop to run all different alpha values
for i=1:3
    %% Initial Constraints
    cGuess=[11 1.1 0.011];
    %% Shooting Method
    TINY = 1e-10;
    rspan = [TINY,1000];
    y0 = [0, cGuess(i)]; 
    options = odeset('RelTol',1e-6);
    [t,y] = ode45(@Project3b,rspan,y0,options,i);
    cCalc = y(end,1);
    Ans = zeros(1,3);
    Ans(i)=cCalc;
    %% Plotting Data
    colors=['b','r','y'];
    plot(t,y(:,1),colors(i),'LineWidth',1.5);
    xlabel('{Eta}','FontSize',16);
    ylabel('{Theta}','FontSize',16);
    axis([0 1000 0 1000])
    legend('alpha=.1','alpha=1','alpha=100');
    title('Hot Wire Animometer Heat Diffusion')
    hold on
end
%% Calculated Solutions
hold off
fprintf('Answer for alpha .1, 1, and 100 were %d, %d, and %d ',Ans(1), Ans(2), Ans(3));
end



