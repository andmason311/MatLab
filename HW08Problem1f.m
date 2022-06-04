function a = HW08Problem1f(W,inter,bv,n)
a = zeros(n,n);
h= (inter(2)-inter(1))/(n+1);
for i = 1:n
    a(i,i)=-2.15;
end
for i =1:n-1
    a(i,i+1)=1;
    a(i+1,i)=1;
end
end
