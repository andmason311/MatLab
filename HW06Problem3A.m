function yt = HW06Problem3A(~,A)
    
sigma = 15;
r = 199.3;
b = 7/3;
yt = zeros(3, 1);

yt(1) = sigma*(A(2) - A(1));
yt(2) = r*A(1) - A(2) -A(1)*A(3);
yt(3) = A(1)*A(2) - b*A(3);
end
