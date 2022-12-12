crackData = importdata('crackData.csv');
t = crackData(:,1);
w = crackData(:,2);
n=[1 2 3];

hold on
plot(t,w,'o')
[b1,r1] = myRegression(t,w,n(1));
[b2,r2] = myRegression(t,w,n(2));
[b3,r3] = myRegression(t,w,n(3));
b=[b1 ;b2 ;b3]
r=[r1-.5 r2 r3]
xlabel('time (min)')
ylabel('crack growht (mm)')
legend('CrackData', '1st Order', '2nd Order', '3rd Order')
hold off

r2 = [0.8131, 0.9001, 0.9171];
r = sqrt(r2)
function [b, r] = myRegression(x,y,n)
%% Polynomial Solver
b = polyfit(x,y,n);
b(end) = 0; % set y-intercept to zero
excess = zeros(1,3-n);
b=cat(2,excess,b);
yhat = b(4) + b(3)*x + b(2)*x.^2 + b(1)*x.^3;
ybar = mean(y);
ssreg = sum((yhat-ybar).^2);
sstot = sum((y - ybar).^2);
r = ssreg / sstot;
hold on
plot(x,yhat,'--')
end


