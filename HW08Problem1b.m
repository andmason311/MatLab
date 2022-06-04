function dydt = HW08Problem1b(x,y)
dydt = zeros(2,1);
dydt(1) = y(2)*.15;
dydt(2) = y(1);
end