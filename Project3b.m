function dydt = Project3b(t,y,i)
alpha= [.1 1 100];
dydt = zeros(2,1);
dydt(1) = y(2)*alpha(i)-1;
dydt(2) = y(1);
end