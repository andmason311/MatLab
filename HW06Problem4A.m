function yt = HW06Problem4A(~,T)
    k = 5;
    c = 0.25;
    L = 4;
    Tb = 42;
    x = L/25;
    yt = zeros(6, 1);
    
    yt(1) = 0;
    yt(6) = 0;
    
    for i = 2:5
        yt(i) = c*((T(i-1) - 2*T(i) + T(i+1))/(x^2))+k;
    end
end
