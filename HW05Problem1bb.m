function dydt = HW05Problem1bb(t,y,alpha)
dydt = zeros(2,1);
dydt(1) = y(2)*alpha-1;
dydt(2) = y(1);
end
