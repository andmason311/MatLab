function y = HW08Problem1e(W,inter,bv,n)
y=zeros(n,1); 
h=(inter(2)-inter(1))/(n+1);
y(1)=bv(1)-2.15*W(1)+W(2);
y(n)=W(n-1)-2.15*W(n)+bv(2);
for i=2:n-1
    y(i)= W(i-1)-2.15*W(n)+bv(2);
end
end