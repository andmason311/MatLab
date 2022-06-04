function dydt = Project3b(y)
dydt = zeros(2,1);
dydt(1) = y(2)*alpha-1;
dydt(2) = y(1);
end