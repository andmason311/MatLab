function[P] = Problem2(mu,k1,k2)

% For Part B you should enter Problem1(2.8,0,0)
% For Part C you should enter Problem1(2.8,2,0)
% For Part D you should enter Problem1(2.8,0,2)

if k2 < 0
    P2 = 1;
else
    P1=exp(-mu)*(mu^k1)/factorial(k1);
    P2=exp(-mu)*(mu^k2)/factorial(k2);
end

disp("For part a) I believe that a Poisson Distribution is most appropriate for this example because it deals with a number of events over a time period.");

P=P1*P2;
end